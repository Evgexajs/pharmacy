from django.shortcuts import render
from .models import Order, Medicament, Client, UserProfile

# авторизация +
from .views_module.auth import login_view, logout_view, register_view
# клиент +
from .views_module.client import client_orders, client_order_detail
# работа с заказами - для клиента
from .views_module.order import add_to_order, order, delete_to_order, update_to_order, reciepe, add_address
# для фармацевта
from .views_module.pharmacist import pharmacist_orders, pharmacist_order_approve, pharmacist_order_items, pharmacist_order_cancel
# для курьера
from .views_module.courier import courier_orders, courier_order_paid, courier_order_detail, courier_reciepe, courier_order_cancel, courier_order_approve

def home(request):
    """
    Основная страница со списком медикаментов,
    Если пользователь авторизован, то может здесь добавить медикаменты к заказу
    """
    medicaments = Medicament.objects.all()
    order = None
    
    if request.user.is_authenticated and Client.objects.filter(user=request.user).exists():
        client = Client.objects.get(user=request.user)
        order = Order.objects.filter(client=client, status=None).first()
    
    context = {'medicaments': medicaments, 'order': order}
    return render(request, 'pharmacy/medicaments/home.html', context)
