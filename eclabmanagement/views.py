from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse


def login(request):
    return render(request,'eclabmanagement/login.html')

def index(request):
    return render(request,'eclabmanagement/index.html')
def cart(request):
    return render(request,'eclabmanagement/cart.html')