from django.urls import path

from . import views

urlpatterns = [
    path(r'', views.login, name='login'),
    path(r'index/',views.index,name='index'),
    path(r'cart/',views.cart,name='cart'),
    path(r'searchresult/',views.searchresult,name='searchresult'),
    path(r'issuedcompdet/',views.issuedcompdet,name='issuedcompdet'),
    path(r'addcomp/',views.addcomp,name='addcomp'),
    path(r'comptypelist/',views.comptypelist,name='comptypelist'),
    path(r'compdescription/',views.compdescription,name='compdescription'),
]
