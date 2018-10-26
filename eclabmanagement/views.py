from django.shortcuts import render
from django.template import loader
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import redirect
from django.contrib.auth import authenticate,login,logout
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required

#@login_required(login_url='/')
def signin(request):
    #return render(request,'eclabmanagement/student/login.html')
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        print(user,username,password)
        if(user.is_staff):
            print('worked successfully')
        else:
            print('!error')
        if user is not None:
            if user.is_active:
                login(request,user)
                flag=1
                return redirect('/index')
            else:
                return render(request, 'eclabmanagement/student/login.html', {'status': 'Your account has been disabled'})
        else:
            return render(request, 'eclabmanagement/student/login.html', {'status': 'Invalid credentials'})
    return render(request, 'eclabmanagement/student/login.html')	

#@login_required(login_url='/')
def logout_view(request):
    logout(request)
    return redirect('/signin.html/')

@login_required(login_url='/')
def index(request):
    return render(request,'eclabmanagement/student/index.html')

@login_required(login_url='/')
def cart(request):
    return render(request,'eclabmanagement/student/cart.html')

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def searchresult(request):
    num = 3
    li = []
    for i in range(num):
    	li.append(i)
    context = {'list':li}
    return render(request,'eclabmanagement/admin/searchresult.html',context)

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def issuedcompdet(request):
	return render(request,'eclabmanagement/admin/issuedcompdet.html')

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def addcomp(request):
    #template = loader.get_template('eclabmanagement/admin/addcomponent.html')
    context = { 'test': 'hai surya'}
    #return HttpResponse(template.render(context, request))
    return render(request,'eclabmanagement/admin/addcomponent.html',context)

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def comptypelist(request):
    return render(request,'eclabmanagement/admin/comptypelist.html')

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def compdescription(request):
    return render(request,'eclabmanagement/admin/compdescription.html')

@staff_member_required(login_url='/index')
@login_required(login_url='/')
def packetdetails(request):
    return render(request,'eclabmanagement/admin/packetdetails.html')
