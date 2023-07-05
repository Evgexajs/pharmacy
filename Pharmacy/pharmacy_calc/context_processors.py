from django.contrib.auth import get_user_model
from .models import Client, Courier, Pharmacist

def user_type(request):
    user = request.user
    if user.is_authenticated:
        try:
            client = Client.objects.get(user=user)
            if client:
                user_type = 'client'
        except Client.DoesNotExist:
            try:
                courier = Courier.objects.get(user=user)
                if courier:
                    user_type = 'courier'
            except Courier.DoesNotExist:
                try:
                    pharmacist = Pharmacist.objects.get(user=user)
                    if pharmacist:
                        user_type = 'pharmacist'
                except Pharmacist.DoesNotExist:
                    user_type = 'unknown'
    else:
        user_type = 'anonymous'

    return {'user_type': user_type}

def profile(request):
    user = request.user
    if user.is_authenticated:
        profile = user.profile.first()
    else:
        profile = 'anonymous'

    return {'profile': profile}