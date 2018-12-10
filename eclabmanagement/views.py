from django.shortcuts import render
from .models import Student,component_detail,component,due,issue_detail,packet,pre_order,review,requestcomp,cart

# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse		
import datetime
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
import requests 
import json
#from .forms import UserForm
from django.contrib.auth.models import User
from django.db.models import Max


#@login_required(login_url='/')
def signin(request):                                                  #function for user authentication
    #return render(request,'eclabmanagement/student/login.html')
    print(request.user.is_authenticated)
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

@login_required(login_url='/')
def logout_view(request):                                           #function for logout
    logout(request)
    return redirect('/')

@login_required(login_url='/')
def index(request):                                                 #for student homepage
    return render(request,'eclabmanagement/student/index.html')

@login_required(login_url='/')
def cart(request):
    return render(request,'eclabmanagement/student/cart.html')
    
@login_required(login_url='/')
def requestcomponent(request):
    if(request.method == 'POST'):
        comp_name = request.POST['comp_name']
        if(comp_name == ''):
            return render(request,'eclabmanagement/student/requestcomponent.html',{'error':'No empty fields Please !!'})
        li = comp_name.split(' ')
        comp_name = '_'.join(li)
        price = request.POST['price']
        quantity = request.POST['quantity']
        req = requestcomp()
        req.name_of_comp = comp_name
        req.price = price
        req.quantity = quantity
        req.approval_status = 'not_approved'
        print(request.user)
        req.roll_no = Student.objects.get(roll_no = request.user)
        req.on_date = datetime.date.today().strftime('%Y-%m-%d')
        req.save()
        return redirect('/studenthome')
    return render(request,'eclabmanagement/student/requestcomponent.html')

@login_required(login_url='/')
def studentprofile(request):
    roll_no = request.user
    print(roll_no)
    #student_obj = Student.objects.get()
    student_obj = Student.objects.filter(roll_no = roll_no)
    
    issued_obj = issue_detail.objects.filter(roll_no = student_obj)
    context = {'student_obj':student_obj,'issued_obj':issued_obj}
    return render(request,'eclabmanagement/student/student-profile.html',context)

@login_required(login_url='/')
@staff_member_required(login_url='/index')
@login_required(login_url='/')
def searchresult(request):                                      #search algorithm
    if(request.method == 'POST'):
        input = request.POST['input']
        if(input==''):
            return redirect('/adminhome')
        input = input.lower()
        comp_obj = component_detail.objects.filter(type_of_comp__contains = input)
    context = {'comp_obj':comp_obj,'input':input}
    return render(request,'eclabmanagement/admin/searchresult.html',context)

"""@staff_member_required(login_url='/index')
@login_required(login_url='/')
def issuedcompdet(request):
	return render(request,'eclabmanagement/admin/issuedcompdet.html')
"""
@login_required(login_url='/')
@staff_member_required(login_url='/index')
@login_required(login_url='/')
def issuedcompdet(request):                                 #to show all the users who have taken components
    issued_obj = issue_detail.objects.all()                 #along with the fine amount if any
    lis = []
    count = 0
    today = datetime.date.today()

    for each_detail in issued_obj:
        allowed = each_detail.no_of_days
        issued = each_detail.issue_date
        completed = today - issued
        n_of_days = completed.days
        return_date = issued + datetime.timedelta(days=int(allowed))
        if(n_of_days > allowed):
            due = (n_of_days - allowed)*(each_detail.fine_p_day)
        else:
            due = 0
        lis.append([])
        number = each_detail.roll_no_id
        temp = Student.objects.get(roll_no=number)
        p_id = each_detail.packet_id
        if(each_detail.returned_date):
            dat = each_detail.returned_date
        else:
            dat = 'not returned'
        lis[count].append(count+1)
        lis[count].append(temp.first_name)
        lis[count].append(p_id)
        lis[count].append(each_detail.issue_date)
        lis[count].append(return_date)
        lis[count].append(dat)
        lis[count].append(due)
        
        count = count + 1
    context = { 'all_details' : lis }
    return render(request,'eclabmanagement/admin/issuedcompdet.html',context)

@login_required(login_url='/')
@staff_member_required(login_url='/index')
@login_required(login_url='/')
def addcomp(request):                               #function for adding the components
    if(request.method == 'POST'):					#taking input from the form
        comp_name = request.POST['comp_name']
        temp = comp_name.split(' ')
        comp_name = '_'.join(temp)
        comp_type = request.POST['comp_type']
        temp = comp_type.split(' ')
        comp_type = '_'.join(temp)
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
                    comp_obj.status = 'not_issued'
                    comp_obj.save()
            else:
                comp_det_obj.level = False
                comp_det_obj.save()
                comp_obj = component()
                comp_obj.comp_id = comp_det_obj
                comp_obj.status = 'not_issued'
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
                    comp_obj.status = 'not_issued'
                    comp_obj.save()
        return redirect('/adminhome')
    all = component_detail.objects.all()
    li = []
    li1 = []
    for x in all :
        if x.type_of_comp not in li:
            li.append(x.type_of_comp)
        if x.comp_name not in li1:
            li1.append(x.comp_name)
    return render(request,'eclabmanagement/admin/addcomponent.html',{'li':li,'li1':li1})

@login_required(login_url='/')
@staff_member_required(login_url='/index')
#@login_required(login_url='/')
def issuedcompdet(request):                                 #to show all the users who have taken components
    issued_obj = issue_detail.objects.all()                 #along with the fine amount if any
    lis = []
    count = 0
    today = datetime.date.today()

    for each_detail in issued_obj:
        allowed = each_detail.no_of_days
        issued = each_detail.issue_date
        completed = today - issued
        n_of_days = completed.days
        return_date = issued + datetime.timedelta(days=int(allowed))
        if(n_of_days > allowed):
            due = (n_of_days - allowed)*(each_detail.fine_p_day)
        else:
            due = 0
        lis.append([])
        number = each_detail.roll_no_id
        temp = Student.objects.get(roll_no=number)
        p_id = each_detail.packet_id
        if(each_detail.returned_date):
            dat = each_detail.returned_date
        else:
            dat = 'not returned'
        lis[count].append(count+1)
        lis[count].append(temp.first_name)
        lis[count].append(p_id)
        lis[count].append(each_detail.issue_date)
        lis[count].append(return_date)
        lis[count].append(dat)
        lis[count].append(due)
        
        count = count + 1
    context = { 'all_details' : lis }
    return render(request,'eclabmanagement/admin/issuedcompdet.html',context)

@login_required(login_url='/')
def comptypelist(request,x):
    comp_obj = component_detail.objects.filter(type_of_comp=x)
    return render(request,'eclabmanagement/admin/comptypelist.html',{'comp_obj':comp_obj})

@login_required(login_url='/')
@staff_member_required(login_url='/index')
#@login_required(login_url='/')
def comptypelist(request,x):
    comp_obj = component_detail.objects.filter(type_of_comp=x)
    return render(request,'eclabmanagement/admin/comptypelist.html',{'comp_obj':comp_obj})

@login_required(login_url='/')
@staff_member_required(login_url='/index')
#@login_required(login_url='/')
def compdescription(request):
    return render(request,'eclabmanagement/admin/compdescription.html')

@login_required(login_url='/')
@staff_member_required(login_url='/index')
@login_required(login_url='/')
def adminhome(request):
    try:
        obj = requestcomp.objects.all()[len(requestcomp.objects.all())-3 : len(requestcomp.objects.all())]
    except:
        obj = {}
    try:
        obj1 = component_detail.objects.get(count = 0)
    except:
        obj1 = {}
    return render(request,'eclabmanagement/admin/index.html',{'obj':obj,'obj1':obj1})


#This function returns all the details of packet with id given
@login_required(login_url='/')
@staff_member_required(login_url='/index')
#@login_required(login_url='/')
def adminhome(request):
    try:
        obj = requestcomp.objects.all()[len(requestcomp.objects.all())-3 : len(requestcomp.objects.all())]
    except:
        obj = {}
    try:
        obj1 = component_detail.objects.get(count = 0)
    except:
        obj1 = {}
    return render(request,'eclabmanagement/admin/index.html',{'obj':obj,'obj1':obj1})


#This function returns all the details of packet with id given
@login_required(login_url='/')
@staff_member_required(login_url='/index')
#@login_required(login_url='/')
def packetdetails(request):
    if(request.method == "POST"):
        packet_id = request.POST['packet_id']
        if(packet_id == ''):
            return render(request,'eclabmanagement/admin/packetIDsearch.html',{"error":"Give Packet ID"})
        comp = packet.objects.filter(packet_id=packet_id)
        issue = issue_detail.objects.filter(packet_id = packet_id)
        if len(comp) == 0 or len(issue) == 0:
            return render(request,'eclabmanagement/admin/packetIDsearch.html',{"error":"Give correct Packet ID"})
        issue = issue[0]
        student_roll_no = issue.roll_no.roll_no
        student_name =issue.roll_no.first_name + issue.roll_no.last_name
        issue_date =  datetime.datetime.strptime(str(issue.issue_date),"%Y-%m-%d")
        return_date = issue_date + datetime.timedelta(days= int(issue.no_of_days))
        print(return_date)
        return_date = return_date.strftime('%Y-%m-%d')
        component_list = []
        j = 1
        for i in comp:
            if i.uniq_id.status == "issued":
            #print(i.uniq_id.comp_id.comp_name,i.uniq_id.comp_id.type_of_comp,i.count,issue.issue_date,i.uniq_id)
                component_list.append({"index":j,'name':i.uniq_id.comp_id.comp_name,"type":i.uniq_id.comp_id.type_of_comp,"count":i.count,"date":str(issue.issue_date),"uniq_id":i.uniq_id.uniq_id})
                j = j+1
        #print(component_list)
        if len(component_list) == 0 :
            return render(request,'eclabmanagement/admin/packetIDsearch.html',{"error":"packet is already returned"})
        context = {"return_date":return_date,"name":student_name,"roll_no":student_roll_no,"packet_id":packet_id,"component_list":component_list}
        print(context)
        return render(request,'eclabmanagement/admin/packetdetails.html',context)
    else:
        return render(request,'eclabmanagement/admin/packetIDsearch.html')



@login_required(login_url='/')
@staff_member_required(login_url='/index')
@login_required(login_url='/')
def returncomponent(request):
    return render(request,'eclabmanagement/admin/packetIDsearch.html')

def componenttype(request):                         #function to show all the components
    comp_obj = component_detail.objects.all()       #list wise according to the component types
    li = []
    for obj in comp_obj:
        if(obj.type_of_comp not in li):
            li.append(obj.type_of_comp)
    return render(request,'eclabmanagement/admin/componenttypes.html',{'li':li})

def search(request):                                #search function for admin page
    if(request.method == 'POST'):
        input = request.POST['input']
        if(input==''):
            return redirect('/studenthome')
        input = input.lower()
        comp_obj = component_detail.objects.filter(type_of_comp__contains = input)
    return render(request,'eclabmanagement/student/searchresult.html',{'comp_obj':comp_obj,'input':input})

#this functions update issue packet table
@login_required(login_url='/')
@staff_member_required(login_url='/index')

def update_return(request):
    if(request.method == "POST"):
        packet_id = int(request.POST["packet_id"])
        try:
            packet_id = request.POST["all_submit"]
            print(request.POST['packet_id'])
            packet_id = int(request.POST['packet_id'])
            comp = packet.objects.filter(packet_id = packet_id)
            for i in comp:
                child = i.uniq_id
                parent = i.uniq_id.comp_id
                child.status = "not_issued"
                parent.count = parent.count + i.count
                child.save()
                parent.save()
            issue = issue_detail.objects.filter(packet_id = packet_id)[0]
            issue.returned_date = datetime.date.today().strftime('%Y-%m-%d')
            issue.save()
        except:
            avoid = ["csrfmiddlewaretoken","packet_id"]
            for i in request.POST:
                if i not in avoid:
                    comp = component.objects.filter(uniq_id = i)[0]
                    comp.status = "not_issued"
                    comp.save()
    return redirect('/returncomponent')



@staff_member_required(login_url='/index')
@login_required(login_url='/')
def issuecomponent(request):
    al = component_detail.objects.all()
    num = Student.objects.all()
    if(request.method == "POST"):
        roll_no = request.POST["roll_no"]
        no_of_days = 20
        user = Student.objects.filter(roll_no = roll_no)
        x = len(request.POST) - 2
        x = int(x /2)
        for i in range(1,x+1):
            type = "component"+str(i)
            quantity = "quantity" + str(i)
            print(request.POST[type],request.POST[quantity])
        if len(user) :
            issue = issue_detail()
            issue.roll_no = user[0]
            date = datetime.date.today().strftime('%Y-%m-%d')
            issue.issue_date = date
            issue.no_of_days = no_of_days
            issue.fine_p_day = 2
            issue.save()
            x = len(request.POST) - 2
            x = int(x /2)
            for i in range(1,x+1):
                type = "component"+str(i)
                quantity = "quantity" + str(i)
                print(request.POST[type],request.POST[quantity])
                component_det = component_detail.objects.filter(comp_name = request.POST[type])[0]
                print(component_det,issue.packet_id)
                component_det.count = component_det.count - int(request.POST[quantity])
                component_det.save()
                component_avail = component.objects.filter(comp_id = component_det.comp_id,status = "not_issued" )
                print
                component_avail = component_avail[:int(request.POST[quantity])]
                print(component_avail)
                for comp in component_avail:
                    pack = packet()
                    pack.packet_id = issue
                    pack.uniq_id = comp
                    if component_det.level == True:
                        pack.count = 1
                    else:
                        pack.count = int(request.POST[quantity])
                    comp.status = "issued"
                    comp.save()
                    pack.save()
            issue.save()
    return render(request,'eclabmanagement/admin/issueComponent.html',{'li':al,'nos':num})

@login_required(login_url='/')
@staff_member_required(login_url='/index')
def notification(request):
    obj = requestcomp.objects.all()
    return render(request,'eclabmanagement/admin/notif.html',{'obj':obj})

def test(request):                                                                                                          
    return render(request,'eclabmanagement/test.html')



def showcomps(request,y):
    if( y != '1'):
        print('------------------  ',type(y),'----------------------------')
        
        if(y[-1] == 'R'):
            print(y)
            comp_obj= component_detail.objects.order_by(y[:-1]).reverse()
        else:
            comp_obj= component_detail.objects.order_by(y)
        #comp_obj = component_detail.objects.order_by(y)
        lis = []
        count = 0
        for each_obj in comp_obj:
            lis.append([])
            lis[count].append(each_obj.comp_id)
            lis[count].append(each_obj.comp_name)
            lis[count].append(each_obj.count)
            lis[count].append(each_obj.cost)
            lis[count].append(each_obj.type_of_comp)
            count = count + 1
        context = { 'all_details' : lis}
    else:
        #print(y)
        comp_obj = component_detail.objects.all()
        lis = []
        count = 0
        for each_obj in comp_obj:
            lis.append([])
            lis[count].append(each_obj.comp_id)
            lis[count].append(each_obj.comp_name)
            lis[count].append(each_obj.count)
            lis[count].append(each_obj.cost)
            lis[count].append(each_obj.type_of_comp)
            count = count + 1
        print(lis)
        context = { 'all_details' : lis}
    return render(request,'eclabmanagement/admin/showcomps.html',context)



def studenthome(request,token):                                                                                             
    res = requests.post(url='https://serene-wildwood-35121.herokuapp.com/oauth/getDetails', data={'token': token,'secret': '4ff02dad567db841837dd7ff3afa1e2d46caca443c824751febcd46b67ee3eb5700432e6123d544feb28e3ae6958fe02eaa6722a4b9f393767c2c493ef48af20'})
    res = json.loads(res.content.decode('utf-8'))
    email = res['student'][0]['Student_Email']
    rollno = res['student'][0]['Student_ID']
    rollno = 'S' + str(rollno)

    if(User.objects.filter(username=rollno).exists()):
        #return render(request,'eclabmanagement/student/index.html')
        user = authenticate(username=rollno, password='5412417')
        print(user,rollno,'5412417')
        if user is not None:
            if user.is_active:
                login(request,user)
                print(request.user)
                return redirect('/studenthome')
            else:
                return render(request, 'eclabmanagement/student/login.html', {'status': 'Your account has been disabled'})
    else:
        student_obj = Student()
        student_obj.roll_no = rollno
        student_obj.first_name = res['student'][0]['Student_First_Name']
        student_obj.last_name = res['student'][0]['Student_Last_name']
        student_obj.middle_name = res['student'][0]['Student_Middle_Name']
        student_obj.regis_year = 2016
        student_obj.gender = res['student'][0]['Student_Gender']
        student_obj.curr_year = res['student'][0]['Student_Cur_YearofStudy']
        student_obj.regis_deg = res['student'][0]['Student_Registered_Degree']
        student_obj.regis_deg_duration = res['student'][0]['Student_Registered_Degree_Duration']
        student_obj.curr_sem = res['student'][0]['Student_Cur_Sem']
        student_obj.blood_grp = res['student'][0]['Student_Blood_Group']
        student_obj.email = res['student'][0]['Student_Email']
        student_obj.phone = res['student'][0]['Student_Mobile']
        
        user = User.objects.create_user(username=rollno,email=res['student'][0]['Student_Email'],password='5412417')
        user.save()

        user_id_obj = user
        #user_id = user_id_obj['user_id']
        print(user_id_obj)
        print('-----------------------------------------------')
        
        student_obj.user = user_id_obj
        student_obj.save()

        #
        user = authenticate(username=rollno, password='5412417')
        print(user,rollno,'5412417')
        #print(user,username,password)
        if user is not None:
            if user.is_active:
                login(request,user)
                return redirect('/studenthome')
            else:
                return render(request, 'eclabmanagement/student/login.html', {'status': 'Your account has been disabled'})

    print(email)
    if email:
        return render(request,'eclabmanagement/student/index.html')
