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
from mainapp.models import *
from django.core.mail import EmailMessage
from cryptography.fernet import Fernet, MultiFernet
# from django.views.decorators.cache import cache_control

# Create your views here.
# @cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_home (request):
    ob = User_Register.objects.get(user_email=request.session["email"])
    context={
        'ob':ob
    }
    return render (request, './user/user-home.html', context=context)

# @cache_control(no_cache=True, must_revalidate=True, no_store=True)
def search_location (request):
    ob = User_Register.objects.values_list("user_email", flat=True)
    login = User_Register.objects.get(user_email=request.session["email"])
    context={
        'login' :login
    }
    
    if request.method == "POST" :
        key = str(Fernet.generate_key(), 'utf-8')
        
        crypter = Fernet(key)

        demo = request.POST['latt'].encode()
        
        latt = str(crypter.encrypt(demo), 'utf-8')
        

        obj = request.POST['long'].encode()
        longt = str(crypter.encrypt(obj), 'utf-8')
       

        whom = request.POST['whom']
        
        con = str(request.POST['content']).encode()
        content = str(crypter.encrypt(con), 'utf-8')
        

        msg = request.POST['msg'].encode()
        message = str(crypter.encrypt(msg), 'utf-8')
      

        send = Send_msg.objects.create(latt=latt, longt=longt,whom=whom, content=content,message=message, key=key)
        send.save()
        messages.success(request, "Message sent")
        bo = User_Register.objects.get(user_email=whom)
        b = User_Register.objects.get(user_email=request.session["email"])
        me = b.user_name
        name = bo.user_name
        email = EmailMessage('Subject',f'Hello {name},\nYour Firend {me} send a message \nHere Your Key: {key}', to=[ whom ])
        email.send()

    return render (request, './user/search-location.html', {'view' : ob, 'obj' : login})

# @cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_search (request):
    login = User_Register.objects.get(user_email=request.session["email"])
    context={
        'login' :login
    }
    if request.method == "POST" :
        try:
            ob = User_Register.objects.get(user_email=request.POST['email'])
            context={
                'ob':ob
            }
        except:
            messages.error(request, "No Records")
    return render (request, './user/user-search.html', context=context)

# @cache_control(no_cache=True, must_revalidate=True, no_store=True)
def notification (request):
    login = User_Register.objects.get(user_email=request.session["email"])
    
    obj = Send_msg.objects.filter(whom=request.session["email"], accept="Accepted")
    return render (request, './user/notification.html', {'view' : obj, 'ob':login})

# @cache_control(no_cache=True, must_revalidate=True, no_store=True)
def dami(request):
    return render(request, './user/dami.html')

# @cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view (request, id):
    obj = Send_msg.objects.get(assign_id=id)
    login = User_Register.objects.get(user_email=request.session["email"])
    context={
        'login' :login
    }
    
    k = bytes(obj.key, 'utf-8')
    ke = Fernet(k)
    la = bytes(obj.latt, 'utf-8')
    lo = bytes(obj.longt, 'utf-8')
    wh = obj.whom
    con = bytes (obj.content, 'utf-8')
    msg = bytes (obj.message, 'utf-8')
    
    
    if request.method == "POST" :
        lock = request.POST['key']
        l = bytes(lock, 'utf-8')
        if k == l :
            demo = ke.decrypt(la).decode()
            demo1 = ke.decrypt(lo).decode()
            demo2 = wh
            demo3 = ke.decrypt(con).decode()
            demo4 = ke.decrypt(msg).decode()
            context = {
                'demo' : demo,
                'demo1' : demo1,
                'demo2' : demo2,
                'demo3' : demo3,
                'demo4' : demo4
            }
            
        else :
            messages.error(request, "incorrect Key")
    return render(request, './user/view.html', context=context)


# @cache_control(no_cache=True, must_revalidate=True, no_store=True)
def logout(request):
    
    return redirect("user")



def server_home(request):
    return render(request, './location-server/server-home.html')



def new_request(request):
    obj = Send_msg.objects.all()
    context = {
        'obj':obj
    }
    return render(request, './location-server/location-based-server.html', context=context)

def accept(request, id) : 
    accept = get_object_or_404(Send_msg, assign_id=id)
    accept.accept = 'Accepted'
    accept.save(update_fields = ['accept'])
    accept.save()
    
    return redirect("new_request")


def user_details(request):
    obj = User_Register.objects.all()
    context = {
        'obj':obj
    }
    return render (request, './location-server/user-details.html', context=context)