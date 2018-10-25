from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse


def login(request):
    return render(request,'eclabmanagement/student/login.html')

def index(request):
    return render(request,'eclabmanagement/student/index.html')
def cart(request):
    return render(request,'eclabmanagement/student/cart.html')

def searchresult(request):
    num = 3
    li = []
    for i in range(num):
    	li.append(i)
    context = {'list':li}
    return render(request,'eclabmanagement/admin/searchresult.html',context)

def issuedcompdet(request):
	return render(request,'eclabmanagement/admin/issuedcompdet.html')