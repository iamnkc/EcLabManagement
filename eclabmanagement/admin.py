from __future__ import unicode_literals
from django.contrib import admin
from .models import Student,component_detail,component,issue_detail,packet,due,pre_order,review,requestcomp,cart

admin.site.register(Student)		
admin.site.register(component_detail)
admin.site.register(component)
admin.site.register(issue_detail)
admin.site.register(packet)
admin.site.register(due)
admin.site.register(pre_order)
admin.site.register(review)
admin.site.register(requestcomp)
admin.site.register(cart)
