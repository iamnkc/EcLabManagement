from django.shortcuts import render
from .models import Student,component_detail,component,due,issue_detail,packet,pre_order,review,request,cart

# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse		
import time
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_exempt

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

def addcomp(request):
    if(request.method == 'POST'):						  
        comp_name = request.POST['comp_name']
        comp_type = request.POST['comp_type']
        quantity = request.POST['quantity']
        quantity = int(quantity)
        cost = request.POST['cost']
        cost = int(cost)
        try:
            level=request.POST['level']
        except KeyError:
            level="0"
        comp_det_same = component_detail.objects.filter(comp_name=comp_name)
        if(len(comp_det_same) < 1):
            comp_det_obj = component_detail()
            comp_det_obj.comp_name = comp_name
            comp_det_obj.type_of_comp = comp_type
            comp_det_obj.count = int(quantity)
            comp_det_obj.cost = cost
            if(level == '1'):
                comp_det_obj.level = True
                comp_det_obj.save()
                for i in range(0,int(quantity)):
                    comp_obj = component()
                    comp_obj.comp_id = comp_det_obj
                    comp_obj.status = 'notissued'
                    comp_obj.save()
            else:
                comp_det_obj.level = False
                comp_det_obj.save()
                comp_obj = component()
                comp_obj.comp_id = comp_det_obj
                comp_obj.status = 'notissued'
                comp_obj.save()        
        else:
            obj = comp_det_same[0]
            obj.count = obj.count + int(quantity)
            obj.cost = int(cost)
            obj.save()
            if(obj.level == True):
                for i in range(0,int(quantity)):
                    comp_obj = component()
                    comp_obj.comp_id = obj
                    comp_obj.status = 'notissued'
                    comp_obj.save()
        return redirect('/index')
    return render(request,'eclabmanagement/admin/addcomponent.html')

def comptypelist(request):
    return render(request,'eclabmanagement/admin/comptypelist.html')

def compdescription(request):
    return render(request,'eclabmanagement/admin/compdescription.html')

def adminhome(request):
    return render(request,'eclabmanagement/admin/index.html')