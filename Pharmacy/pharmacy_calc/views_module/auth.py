from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from ..models import UserProfile, Client

# формы
from ..forms import EmailAuthenticationForm, EmailUserCreationForm
from django import forms

def register_view(request):
    if request.method == 'POST':
        form = EmailUserCreationForm(request.POST)
        if form.is_valid():
            try:
                user = form.save()  # Создание пользователя
                fio = form.cleaned_data['fio']  # Получение введенного ФИО из формы
                email = form.cleaned_data['email']  # Получение введенного email из формы
                password = form.cleaned_data['password1']  # Получение введенного пароля из формы
                phone = form.cleaned_data['phone']  # Получение введенного пароля из формы

                # Создание записи в модели UserProfile
                user_profile = Client.objects.create(
                    user=user,
                    FIO=fio,
                    email=email,
                    password=password,
                    phone=phone
                )

                return redirect('login')  # Перенаправление на страницу входа после успешной регистрации
            except forms.ValidationError as e:
                form.add_error(None, e)
    else:
        form = EmailUserCreationForm()
    
    error_message = None
    if form.errors:
        error_message = "Пожалуйста, исправьте следующие ошибки:"
    
    return render(request, 'pharmacy/auth/registration.html', {'form': form, 'error_message': error_message})

def login_view(request):
    error_message = None
    if request.method == 'POST':
        form = EmailAuthenticationForm(request, request.POST)
        if form.is_valid():
            email = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(request, username=email, password=password)
            if user is not None:
                login(request, user)
                return redirect('home')
            else:
                error_message = "Неверный email или пароль"
    else:
        form = EmailAuthenticationForm(request)

    if form.errors:
        error_message = "Пожалуйста, исправьте следующие ошибки:"
    
    return render(request, 'pharmacy/auth/login.html',  {'form': form, 'error_message': error_message})
    

def logout_view(request):
    logout(request)
    return redirect('login')