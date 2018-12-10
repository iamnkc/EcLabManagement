from django.db import models
import datetime 
import uuid
from django.contrib.auth.models import User

# Create your models here.
class Student(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	roll_no=models.CharField(max_length=15,primary_key=True,default = "s20160010")
	first_name=models.CharField(max_length=50,default="first_name")
	middle_name=models.CharField(max_length=50,blank=True,default="middle_name")
	last_name=models.CharField(max_length=50,default="last_name")
	regis_year=models.IntegerField(default='2016')
	gender=models.CharField(max_length=1,default = "M")
	curr_year=models.IntegerField(default=3)
	regis_deg=models.CharField(max_length=20,default='B.Tech')
	regis_deg_dur=models.IntegerField(default=3)
	curr_sem=models.IntegerField(default=5)
	blood_grp=models.CharField(max_length=20,default='B-')
	email=models.EmailField(default='example@iiits.in')
	phone=models.CharField(max_length=12,default = "123456789")

class component_detail(models.Model):
	comp_id = models.AutoField(primary_key=True)
	comp_name = models.CharField(max_length=200)
	count = models.IntegerField()
	type_of_comp = models.CharField(max_length=200)
	level = models.BooleanField(default=False)
	cost = models.IntegerField()

class component(models.Model):
	comp_id = models.ForeignKey(component_detail,on_delete=models.CASCADE)
	uniq_id = models.CharField(max_length=40,primary_key=True,unique=True, default=uuid.uuid4)
	status = models.CharField(max_length=200)

class issue_detail(models.Model):
	roll_no = models.ForeignKey(Student,on_delete=models.CASCADE)
	packet_id = models.AutoField(primary_key=True)
	issue_date = models.DateField(("Date"), default=datetime.date.today)
	returned_date = models.DateField(("Date"),null=True,blank=True)
	no_of_days = models.IntegerField()
	fine_p_day = models.IntegerField()

class packet(models.Model):
	packet_id = models.ForeignKey(issue_detail,on_delete=models.CASCADE)
	uniq_id = models.ForeignKey(component,on_delete=models.CASCADE)
	count = models.IntegerField()

class due(models.Model):
	roll_no = models.ForeignKey(Student,on_delete=models.CASCADE)
	packet_id = models.ForeignKey(packet,on_delete=models.CASCADE)
	comp_id = models.ForeignKey(component_detail,on_delete=models.CASCADE)
	count = models.IntegerField()
	status = models.CharField(max_length=200)

class pre_order(models.Model):
	roll_no = models.ForeignKey(Student,on_delete=models.CASCADE)
	comp_id = models.ForeignKey(component_detail,on_delete=models.CASCADE)
	status = models.CharField(max_length=200)
	issued_packet_id = models.CharField(max_length=20)

class review(models.Model):
	comp_id = models.ForeignKey(component_detail,on_delete=models.CASCADE)
	avg_rating = models.FloatField()
	no_of_reviews = models.IntegerField()

class requestcomp(models.Model):
	roll_no = models.ForeignKey(Student,on_delete=models.CASCADE)
	name_of_comp = models.CharField(max_length=200)
	quantity = models.IntegerField()
	price = models.IntegerField()
	approval_status = models.CharField(max_length=200)
	on_date = models.DateField(("Date"),null=True,blank=True)

class cart(models.Model):
	roll_no = models.ForeignKey(Student,on_delete=models.CASCADE)
	comp_id = models.ForeignKey(component_detail,on_delete=models.CASCADE)
	quantity = models.IntegerField()