from django.contrib import admin
from .models import UserProfile, Client, Pharmacist, Courier, Medicament, Recipe, OrderStatus, Order, OrderItem

# Register your models here.
admin.site.register(UserProfile)
admin.site.register(Client)
admin.site.register(Pharmacist)
admin.site.register(Courier)
admin.site.register(Medicament)
admin.site.register(Recipe)
admin.site.register(OrderStatus)
admin.site.register(Order)
admin.site.register(OrderItem)
