from django.urls import path
from . import views

urlpatterns = [
    # path('', views.base, name='base'),
    path('', views.home, name='home'),

    # авторизация
    path('login/', views.login_view, name='login'),
    path('registration/', views.register_view, name='registration'),
    path('logout/', views.logout_view, name='logout'),


    path('add_to_order/<int:pk>/', views.add_to_order, name='add_to_order'),
    path('delete_to_order/<int:pk>/', views.delete_to_order, name='delete_to_order'),
    path('update_to_order/', views.update_to_order, name='update_to_order'),
    path('order/', views.order, name='order'),
    path('reciepe/<int:pk>/', views.reciepe, name='reciepe'),
    
    path('client_orders/', views.client_orders, name='client_orders'),
    path('client_order_detail/<int:pk>/', views.client_order_detail, name='client_order_detail'),

    path('pharmacist_orders/', views.pharmacist_orders, name='pharmacist_orders'),
    path('pharmacist_order_items/<int:pk>/', views.pharmacist_order_items, name='pharmacist_order_items'),
    path('pharmacist_order_approve/<int:pk>/', views.pharmacist_order_approve, name='pharmacist_order_approve'),
    # path('pharmacist_reciepe/<int:pk>/', views.pharmacist_reciepe, name='pharmacist_reciepe'),
    path('pharmacist_order_cancel/<int:pk>/', views.pharmacist_order_cancel, name='pharmacist_order_cancel'),

    path('courier_orders/', views.courier_orders, name='courier_orders'),
    path('courier_order_detail/<int:pk>/', views.courier_order_detail, name='courier_order_detail'),
    path('courier_order_approve/<int:pk>/', views.courier_order_approve, name='courier_order_approve'),
    path('courier_order_paid/<int:pk>/', views.courier_order_paid, name='courier_order_paid'),
    path('courier_reciepe/<int:pk>/', views.courier_reciepe, name='courier_reciepe'),
    path('courier_order_cancel/<int:pk>/', views.courier_order_cancel, name='courier_order_cancel'),

    path('add_address/', views.add_address, name='add_address'),
]
