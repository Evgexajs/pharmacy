from django.contrib.auth.base_user import BaseUserManager

class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, username=None, email=None, phone=None,\
                     password=None, **extra_fields):
        """
        Создание и сохранение пользователя с получением почты и пароля
        """
        if not username:
            if not email and not phone:
                raise ValueError('The given email/phone must be set')
            
        if email:
            email = self.normalize_email(email)

            if not username:
                username=email

            user = self.model(
                email=email,
                username=username,
                **extra_fields
            )

        if phone:
            if not username:
                username = phone

            user = self.model(
                phone=phone,
                username=username,
                **extra_fields
            )

        # является ли пользователь суперпользователем
        if extra_fields.get('is_superuser'):
            user = self.model(
                username=username,
                **extra_fields
            )

        user.set_password(password)
        user.save(using=self._db)

    def create_user(self, username, email, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(username=username, email=email, password=password, **extra_fields)
    
    def create_superuser(self, username, password, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        
        return self._create_user(
            username=username,
            password=password,
            **extra_fields
        )