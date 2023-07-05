from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from pharmacy_calc.models import UserProfile, Client, Pharmacist, Courier, Medicament, Recipe, Order, OrderItem, OrderStatus

# Удаляем все объекты из каждой модели
class Command(BaseCommand):
    help = 'Deletes all data from the DB'

    def handle(self, *args, **options):
        User.objects.all().delete()
        OrderStatus.objects.all().delete()
        UserProfile.objects.all().delete()
        Client.objects.all().delete()
        Pharmacist.objects.all().delete()
        Courier.objects.all().delete()
        Medicament.objects.all().delete()
        Recipe.objects.all().delete()
        Order.objects.all().delete()
        OrderItem.objects.all().delete()
        self.stdout.write(self.style.SUCCESS('Successfully deleted all data'))
