from decimal import Decimal
from django.contrib.auth.models import User
from datetime import datetime
from django.db import models
from .managers import UserManager

# Create your models here.
class UserProfile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='profile')
    FIO = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    password  = models.CharField(max_length=50)
    phone  = models.CharField(max_length=20)

    def __str__(self):
        return self.FIO

class Client(UserProfile):
    pass

class Pharmacist(UserProfile):
    is_free = models.BooleanField(default=True) # свободен ли

    def __str__(self):
        return self.FIO

class Courier(UserProfile):
    is_free = models.BooleanField(default=True) # свободен ли

    def __str__(self):
        return self.FIO
    


class Medicament(models.Model):
    name = models.CharField(max_length=255) # название медикамента
    recipe_required = models.BooleanField() # требуется ли рецепт
    manufacturer_address = models.CharField(max_length=255) # адрес производителя
    indications_for_use = models.TextField() # показания к применению
    method_of_application = models.TextField() # способ применения
    side_effects = models.TextField() # побочные эффекты
    interaction_with_other_medicines = models.TextField() # взаимодействие с другими медикаментами
    shelf_life = models.CharField(max_length=50) # срок годности
    date_of_manufacture = models.DateField() # дата производства
    composition = models.TextField() # состав
    amount_in_stock = models.PositiveIntegerField() # количество медикамента на складе
    price = models.DecimalField(max_digits=10, decimal_places=2) # стоимость медикамента
    contraindications = models.TextField() # список противопоказаний

    def __str__(self):
        return self.name

class Recipe(models.Model):
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    medicament = models.ForeignKey(Medicament, on_delete=models.CASCADE)
    dosage = models.CharField(max_length=50)
    duration = models.PositiveIntegerField()
    code = models.CharField(max_length=50)
    expiration_date = models.DateField()

    def __str__(self):
        return f"{self.client.FIO} - {self.medicament.name} - {self.dosage}"

class OrderStatus(models.Model):
    STATUS_CHOICES = (
        ('B', 'Обрабатывается'), #Build
        ('P', 'Доставляетсяя'), #Proccess
        ('D', 'Доставлен'), #Deliveried
        ('C', 'Отменен'), #Cancel
    )
    status_code = models.CharField(max_length=1, unique=True)
    status_name = models.CharField(max_length=255)

    def __str__(self):
        return self.status_name

class Order(models.Model):
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    delivery_address = models.CharField(max_length=255, null=True, default=None)
    pharmacist = models.ForeignKey(Pharmacist, on_delete=models.CASCADE, null=True, default=None)
    courier = models.ForeignKey(Courier, on_delete=models.CASCADE, null=True, default=None)
    date_created = models.DateTimeField(default=datetime.now)
    status = models.ForeignKey(OrderStatus, on_delete=models.CASCADE, null=True, default=None)
    total_price = models.DecimalField(max_digits=10, decimal_places=2, null=True, default=0)
    is_paid = models.BooleanField(default=False)  # Поле, определяющее, оплачен ли заказ

    def __str__(self):
        return f"Заказ №{self.id} от {self.date_created.strftime('%d.%m.%Y')}"
    
    def update_total_price(self):
        if self.pk:
            self.total_price = sum(order_item.total_price for order_item in self.order_items.all())

    def save(self, *args, **kwargs):
        self.update_total_price()
        super().save(*args, **kwargs)

class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='order_items')
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE, null=True, blank=True)
    recipe_approve = models.BooleanField(null=True, blank=True)# проверен ли
    medicament = models.ForeignKey(Medicament, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    total_price = models.DecimalField(max_digits=10, decimal_places=2, null=True)

    def __str__(self):
        return f"Заказ {self.order.id} - {self.medicament.name} ({self.quantity} шт.)"
    
    def save(self, *args, **kwargs):
        self.total_price = self.medicament.price * Decimal(self.quantity)
        super().save(*args, **kwargs)
        self.order.update_total_price()