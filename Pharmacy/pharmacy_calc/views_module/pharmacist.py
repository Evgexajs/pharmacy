
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from ..models import Order, OrderItem, Pharmacist, OrderStatus

@login_required
def pharmacist_orders(request):
    pharmacist = Pharmacist.objects.get(user=request.user)
    orders = Order.objects.filter(pharmacist=pharmacist)
    context = {'orders': orders}
    return render(request, 'pharmacy/pharmacist/orders.html', context)


@login_required
def pharmacist_order_cancel(request, pk):
    order = get_object_or_404(Order, id=pk)
    order.status = OrderStatus.objects.get(status_code='C')
    order.save()
    pharmacist = Pharmacist.objects.get(user=request.user)
    pharmacist.is_free = True
    pharmacist.save()
    courier = order.courier
    courier.is_free = True
    courier.save()
    return redirect('home')

@login_required
def pharmacist_order_items(request, pk):
    order = get_object_or_404(Order, id=pk)
    pharmacist = Pharmacist.objects.get(user=request.user)


    order_items = OrderItem.objects.filter(order=order)
    context = {'order_items': order_items, 'order': order}
    return render(request, 'pharmacy/pharmacist/order_items.html', context)

@login_required
def pharmacist_order_approve(request, pk):
    error_message = None
    order = get_object_or_404(Order, id=pk)
    all_approved = None

    if order.order_items.filter(recipe__isnull=False).exists():
        # Если у order_item есть рецепты, проверяем, все ли они проверены
        if order.order_items.filter(recipe__isnull=False, recipe_approve=True).count() == order.order_items.filter(recipe__isnull=False).count():
            # Все рецепты проверены
            all_approved = True
        else:
            # Не все рецепты проверены
            all_approved = False
    else:
        # У order_item нет рецептов
        all_approved = True
    
    if not all_approved:
        error_message = "Не проверен рецепт для некоторых медикаментов"
        order_items = OrderItem.objects.filter(order=order)
        context = {'order_items': order_items, 'order': order, 'error_message': error_message}
        return render(request, 'pharmacy/pharmacist/order_items.html', context)
    else:
        order.status = OrderStatus.objects.get(status_code='P')
        order.save()
        
        pharmacist = Pharmacist.objects.get(user=request.user)
        pharmacist.is_free = True
        pharmacist.save()
        return redirect('pharmacist_orders')


# @login_required
# def pharmacist_reciepe(request, pk):
#     orderItem = get_object_or_404(OrderItem, id=pk)
#     recipe = orderItem.recipe

#     if request.method == 'POST':
#         order_item = OrderItem.objects.filter(recipe=recipe).first()
#         order_item.recipe_approve = True
#         order_item.save()
#         return redirect('pharmacist_order_items', pk=order_item.order.pk)

#     context = {'recipe': recipe, 'order_item': orderItem}
#     return render(request, 'pharmacy/pharmacist/reciepe.html', context)
