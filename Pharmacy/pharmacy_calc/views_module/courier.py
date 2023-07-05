from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
import xml.etree.ElementTree as ET
from ..models import Order, OrderItem, Courier, OrderStatus
import requests

@login_required
def courier_orders(request):
    courier = Courier.objects.get(user=request.user)
    orders = Order.objects.filter(courier=courier)
    context = {'orders': orders}
    return render(request, 'pharmacy/courier/orders.html', context)


@login_required
def courier_order_cancel(request, pk):
    order = get_object_or_404(Order, id=pk)
    order.status = OrderStatus.objects.get(status_code='C')
    order.save()
    courier = Courier.objects.get(user=request.user)
    courier.is_free = True
    courier.save()
    return redirect('home')

@login_required
def courier_order_paid(request, pk):
    order = get_object_or_404(Order, id=pk)
    order.is_paid = True
    order.save()

    return redirect('courier_order_detail', pk=order.pk)

@login_required
def courier_order_approve(request, pk):
    order = get_object_or_404(Order, id=pk)

    error_message = None
    if order.is_paid == False:
        return redirect('courier_order_detail', pk=order.pk)
    else:
        order.status = OrderStatus.objects.get(status_code='D')
        order.save()
        
        courier = Courier.objects.get(user=request.user)
        courier.is_free = True
        courier.save()
        return redirect('courier_orders')

@login_required
def courier_order_detail(request, pk):
    order = get_object_or_404(Order, id=pk)
    courier = Courier.objects.get(user=request.user)


    market_location = '65.48648178577425, 57.15869642362087' # дефолтная аптека
    address = order.delivery_address.split('кв.')[0]

    api_key_yandex = 'ced99f88-8cd0-4dbe-8351-9ec902625048'
    url = 'https://geocode-maps.yandex.ru/1.x/'
    params = {
        'apikey': api_key_yandex,
        'geocode': address,
    }
    response = requests.get(url, params=params)
    # # Проверяем, что ответ успешный и есть координаты
    longitude = None
    latitude = None
    if response.status_code == 200:
        xml_data = response.text
        root = ET.fromstring(xml_data)
        pos_element = root.find('.//{http://www.opengis.net/gml}pos')
        if pos_element is not None:
            pos = pos_element.text.split()
            longitude, latitude = pos


    api_key_time = "5b3ce3597851110001cf6248d21810ee5ec647d693a38ab49c1e8c9b"  # замените на свой API ключ
    url = f"https://api.openrouteservice.org/v2/directions/driving-car?api_key={api_key_time}&start={market_location}&end={longitude},+{latitude}"
    response = requests.get(url)
    # context = {"error": response.status_code}
    route_time = response
    if response.status_code == 200:
        data = response.json()
        route_time = data["features"][0]["properties"]["segments"][0]["duration"]
        route_time = round(route_time/60, 0) + 3


    order_items = OrderItem.objects.filter(order=order)
    context = {'order_items': order_items, 'order': order, 'client': order.client, 'route_time': route_time, 'market_location': market_location, 'delivery_location': [longitude, latitude]}
    return render(request, 'pharmacy/courier/order_detail.html', context)


@login_required
def courier_reciepe(request, pk):
    order_item = get_object_or_404(OrderItem, id=pk)
    context = {'order_item': order_item}
    return render(request, 'pharmacy/courier/reciepe.html', context)