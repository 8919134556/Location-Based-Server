from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views 

urlpatterns = [
    path('', views.home, name='home'),
    path('proxy-server', views.proxy_server, name='proxy_server'),
    
    path('registrtion', views.registrtion, name='registrtion'),
    path('user', views.user, name='user'),
    
    
    path('password_reset',views.password_reset,name='password_reset'),
    path('password_reset/done/',auth_views.PasswordResetDoneView.as_view(template_name="resetpws/password-reset-done.html"),name='password_reset_done'),
    path('password_reset_confirm',views.password_reset_confirm, name='password_reset_confirm'),
    path('password_reset_complete/done/',auth_views.PasswordResetCompleteView.as_view(template_name="resetpws/password-reset-complete.html"),name='password_reset_complete')
    
    
]