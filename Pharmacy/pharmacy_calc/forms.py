from django import forms
from .models import Order, OrderItem


from django import forms
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class EmailAuthenticationForm(AuthenticationForm):
    username = forms.EmailField(label='Email')

class EmailUserCreationForm(UserCreationForm):
    email = forms.EmailField(required=True)
    fio = forms.CharField(max_length=50, required=True, label='ФИО')
    phone = forms.CharField(max_length=50, required=True, label='Номер телефона')

    class Meta:
        model = User
        fields = ("email",)

    def save(self, commit=True):
        email = self.cleaned_data["email"]
        
        # Проверка наличия пользователя с указанным email
        if User.objects.filter(email=email).exists():
            self.add_error('email', "Пользователь с таким email уже существует")
            raise forms.ValidationError("Пользователь с таким email уже существует")
        
        user = super().save(commit=False)
        user.username = email  # Используем email как имя пользователя
        user.email = email
        if commit:
            user.save()
        return user
