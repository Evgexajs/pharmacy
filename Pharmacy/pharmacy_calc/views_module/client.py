from django.shortcuts import render, redirect, get_object_or_404
from ..models import Order, OrderItem, Medicament, Recipe, Client
from django.views import View
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView
import requests

import xml.etree.ElementTree as ET

@login_required
def client_orders(request):
    client = Client.objects.get(user=request.user)
    orders = Order.objects.filter(client=client)
    context = {'orders': orders}
    return render(request, 'pharmacy/client/orders.html', context)


@login_required
def client_order_detail(request, pk):
    order = get_object_or_404(Order, id=pk)
    client = Client.objects.get(user=request.user)

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
    context = {'order_items': order_items, 'order': order, 'courier': order.courier, 'route_time': route_time, 'market_location': market_location, 'delivery_location': [longitude, latitude]}
    return render(request, 'pharmacy/client/order_detail.html', context)