from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from ..models import Order, OrderItem, Medicament, Pharmacist, Courier, OrderStatus, UserProfile, Recipe, Client
from django.http import JsonResponse
import requests

@login_required
def add_to_order(request, pk):
    """
    Эта функция добавляет медикамент в заказ
    """
    client = Client.objects.get(user=request.user)
    order = Order.objects.filter(client=client, status=None).first()

    medicament = get_object_or_404(Medicament, id=pk)

    if order:
        OrderItem.objects.create(
            order=order,
            medicament=medicament,
            quantity=1
        )
    else:
        order_new = Order.objects.create(client=client)
        OrderItem.objects.create(
            order=order_new,
            medicament=medicament,
            quantity=1
        )
        order_new.save()

    return redirect('home')

@login_required
def delete_to_order(request, pk):
    order_item = get_object_or_404(OrderItem, id=pk)
    order_item.delete()
    return redirect('order')


@login_required
def update_to_order(request):
    if request.method == 'POST':
        order_item_id = request.POST.get('order_item_id')
        quantity = request.POST.get('quantity')

        try:
            order_item = OrderItem.objects.get(id=order_item_id)
            order_item.quantity = quantity
            order_item.save()
            return JsonResponse({'success': True})
        except OrderItem.DoesNotExist:
            return JsonResponse({'success': False, 'message': 'Order item not found.'})
    
    return JsonResponse({'success': False, 'message': 'Invalid request method.'})

def chech_recipe(order_item):
    if order_item.medicament.recipe_required == True:
        # ТУТ ПРОВЕРКА РЕЦЕПТА ЧЕРЕЗ РЕЕСТР РЕЦЕПТОВ
        order_item.recipe_approve = True
        order_item.save()
    pass

@login_required
def order(request):
    error_message = None
    client = Client.objects.get(user=request.user)
    order = Order.objects.filter(client=client, status=None).first()
    order_items = None
    if order:
        order_items = OrderItem.objects.filter(order=order)
        order_items_with_required_recipe = order_items.filter(medicament__recipe_required=True)
        missing_recipe_items = order_items_with_required_recipe.exclude(recipe__isnull=False)
        if request.method == 'POST':
            if order.delivery_address == None:
                error_message = "Укажите адрес доставки!"
            elif missing_recipe_items:
                error_message = "Не указан рецепт для некоторых медикаментов"
            else:
                pharmacist = Pharmacist.objects.filter(is_free=True).first()
                courier = Courier.objects.filter(is_free=True).first()
                order.pharmacist = pharmacist
                order.courier = courier
                order.status= OrderStatus.objects.get(status_code='B')
                order.save()
                pharmacist.is_free = False
                courier.is_free = False
                pharmacist.save()
                courier.save()
                for item in order_items:
                    chech_recipe(item)
                    medicament = item.medicament
                    medicament.amount_in_stock = medicament.amount_in_stock - item.quantity
                    medicament.save()
                return redirect('client_orders')

    context = {'order_items': order_items, 'order': order, 'error_message': error_message}
    return render(request, 'pharmacy/order/order.html', context)


@login_required
def reciepe(request, pk):
    orderItem = get_object_or_404(OrderItem, id=pk)
    medicament = orderItem.medicament
    client = Client.objects.get(user=request.user)

    if request.method == 'POST':
        dosage=request.POST['dosage']
        duration=request.POST['duration']
        code=request.POST['code']
        expiration_date=request.POST['expiration_date']
        recipe = Recipe.objects.create(client=client, medicament=medicament, dosage=dosage, duration=duration, code=code, expiration_date=expiration_date)
                
        orderItem.recipe = recipe
        orderItem.save()
        return redirect('order')

    context = {'medicament': medicament}
    return render(request, 'pharmacy/reciepe/reciepe.html', context)

def add_address(request):
    if request.method == 'POST':
        id = request.POST.get('order')

        order = Order.objects.get(id=id)
        order.delivery_address = request.POST.get('address')
        order.save()
        return JsonResponse({'success': True})
    else:
        return JsonResponse({'success': False})