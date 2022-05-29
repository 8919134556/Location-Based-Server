from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect, get_object_or_404,reverse
from django.http import HttpResponse
from django.contrib import messages
from django.conf import settings
from django.template import loader
# Create your views here.
from django.shortcuts import render
from . import views
from .models import *
from django.core.mail import EmailMessage
from django.views.decorators.cache import cache_control



# Create your views here.
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def home(request):
    return render (request, './main/index.html')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def proxy_server(request):
    if request.method == "POST":
        admin_email = request.POST.get('email')
        admin_pws = request.POST.get ('pass')
        if admin_email =='lbs' and admin_pws =='lbs':
            messages.success(request, "welcome")
            return redirect('server_home')
            
        else:
            messages.error(request, "bad credential Please Register")
            return redirect('proxy_server')
    return render (request, './main/proxy-server.html')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def registrtion (request):
    if request.method == "POST" :
        fname = request.POST['fname']
        lname = request.POST['lname']
        gender = request.POST['inlineRadioOptions']
        country = request.POST['country']
        state = request.POST['state'] 
        city = request.POST['city']
        dob = request.POST['dob']
        addres = request.POST['addres']
        pincode = request.POST['pincode']
        phone = request.POST['phone']
        email = request.POST['email']
        password = request.POST['password']
        try:
            
            if  User_Register.objects.filter(user_phone=phone).exists():
                messages.error (request, "Phone Number alredy exist")
            elif  User_Register.objects.filter(user_email=email).exists():
                messages.error (request, "Email alredy exist")
            else:
                reg_details = User_Register.objects.create(user_name=fname,user_lastname=lname,user_phone=phone,gender=gender,country=country,state=state,city=city,date_of_birth=dob,addres=addres,pincode=pincode,user_email=email,user_pwd=password)
                reg_details.save()
                messages.success(request, "Resgistration successfully Done")
                return redirect("user") 
           
        except:
            pass
             
    return render (request, './main/Registartion-form.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            login = User_Register.objects.get(user_email=email,user_pwd=password)
            request.session["email"]=login.user_email
            messages.success(request, "Welcome")
            return redirect ("user_home")
        except:
            messages.error(request, "bad credential Please Register")
            return redirect("user")
    return render (request, './main/login.html')





def password_reset(request):
    if request.method == "POST":
        gmail = request.POST['email']
        dict = gmail
        email = EmailMessage('Subject', 'http://127.0.0.1:8000/mainapp/password_reset_confirm', to=[ dict ])
        email.send()
        return redirect ('password_reset/done/')
    return render (request, "./resetpws/password-reset.html") 

def password_reset_confirm(request):
    
    if request.method == "POST":
        user_email = request.POST.get('user_email')
        user_pwd = request.POST.get('user_pwd')

        user = get_object_or_404(User_Register, user_email = user_email)
        user.user_pwd = user_pwd
        user.save(update_fields=["user_pwd","user_email"])
        user.save()
        messages.success(request, "your password has been successfully changed")
        return redirect("user")
    return render (request, "./resetpws/password-reset-confirm.html")