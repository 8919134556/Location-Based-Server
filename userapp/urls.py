from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views 

urlpatterns = [
    path('user-home', views.user_home, name = 'user_home'),
    path('search-location', views.search_location, name = 'search_location'),
    path('user-search', views.user_search, name = 'user_search'),
    path('notification', views.notification, name = 'notification'),
    path('dami', views.dami, name='dami'),
    path('view/<int:id>', views.view, name='view'),
    path('logout', views.logout, name='logout'),
    path('new-request', views.new_request, name='new_request'),
    path('server_home', views.server_home, name='server_home'),
    path('user_details', views.user_details, name='user_details'),
    path('accept/<int:id>', views.accept, name='accept'),
    

   
]