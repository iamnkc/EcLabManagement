from django.shortcuts import render
from .models import Student,component_detail,component,due,issue_detail,packet,pre_order,review,request,cart

# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse		
import time
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_exempt
from django.template import loader
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import redirect
from django.contrib.auth import authenticate,login,logout
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
import datetime

#@login_required(login_url='/')
def signin(request):
    #return render(request,'eclabmanagement/student/login.html')
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        print(user,username,password)
        if user is not None:
            if user.is_active:
                login(request,user)
                if(user.is_staff):
                    return redirect('/adminhome')
                else:
                    return redirect('/studenthome')
            else:
                return render(request, 'eclabmanagement/student/login.html', {'status': 'Your account has been disabled'})
        else:
            return render(request, 'eclabmanagement/student/login.html', {'status': 'Invalid credentials'})
    return render(request, 'eclabmanagement/student/login.html')	

#@login_required(login_url='/')
def logout_view(request):
    logout(request)
    return redirect('/')

@login_required(login_url='/')
def index(request):
    return render(request,'eclabmanagement/student/index.html')

@login_required(login_url='/')
def cart(request):
    return render(request,'eclabmanagement/student/cart.html')
    
@login_required(login_url='/')
def requestcomponent(request):
    return render(request,'eclabmanagement/student/requestcomponent.html')

@login_required(login_url='/')
def studentprofile(request):
    return render(request,'eclabmanagement/student/student-profile.html')

    
@staff_member_required(login_url='/index')
@login_required(login_url='/')
def searchresult(request):
    if(request.method == 'POST'):
        input = request.POST['input']
        input = input.lower()
        comp_obj = component_detail.objects.filter(type_of_comp__contains = input)
    context = {'comp_obj':comp_obj}
    return render(request,'eclabmanagement/admin/searchresult.html',context)

"""@staff_member_required(login_url='/index')
@login_required(login_url='/')
def issuedcompdet(request):
	return render(request,'eclabmanagement/admin/issuedcompdet.html')
"""
@staff_member_required(login_url='/index')
@login_required(login_url='/')
def issuedcompdet(request):
    issued_obj = issue_detail.objects.all()
    lis = []
    count = 0 
    today = datetime.date.today()

    for each_detail in issued_obj:
        allowed = each_detail.no_of_days
        issued = each_detail.issue_date
        completed = today - issued
        n_of_days = completed.days
        if(n_of_days > allowed):
            due = (n_ofdays - allowed)*(each_detail.fine_p_day)
        else:
            due = 0
        lis.append([])
        number = each_detail.roll_no_id
        temp = Student.objects.get(roll_no=number)
        p_id = each_detail.packet_id
        lis[count].append(count+1)
        lis[count].append(temp.first_name)
        lis[count].append(p_id)
        lis[count].append(due)
        count = count + 1
    context = { 'all_details' : lis }
    return render(request,'eclabmanagement/admin/issuedcompdet.html',context)

@staff_member_required(login_url='/index')
@login_required(login_url='/')
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
        return redirect('/studenthome')
    return render(request,'eclabmanagement/admin/addcomponent.html')

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def comptypelist(request,x):
    comp_obj = component_detail.objects.filter(type_of_comp=x)
    return render(request,'eclabmanagement/admin/comptypelist.html',{'comp_obj':comp_obj})

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def compdescription(request):
    return render(request,'eclabmanagement/admin/compdescription.html')

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def adminhome(request):
    return render(request,'eclabmanagement/admin/index.html')


@staff_member_required(login_url='/index')
@login_required(login_url='/')
def issuecomponent(request):
    return render(request,'eclabmanagement/admin/issuecomponent.html')



@staff_member_required(login_url='/index')
@login_required(login_url='/')
def packetdetails(request):
    return render(request,'eclabmanagement/admin/packetdetails.html')

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def returncomponent(request):
    return render(request,'eclabmanagement/admin/packetIDsearch.html')

def componenttype(request):
    comp_obj = component_detail.objects.all()
    li = []
    for obj in comp_obj:
        if(obj.type_of_comp not in li):
            li.append(obj.type_of_comp)
    return render(request,'eclabmanagement/admin/componenttypes.html',{'li':li})

def search(request):
    if(request.method == 'POST'):
        input = request.POST['input']
        input = input.lower()
        comp_obj = component_detail.objects.filter(type_of_comp__contains = input)
    return render(request,'eclabmanagement/student/searchresult.html',{'comp_obj':comp_obj})