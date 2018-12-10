from django.urls import path,re_path

from . import views

urlpatterns = [
    path(r'studenthome/',views.index,name='index'),
    path(r'signout/', views.logout_view, name='signout'),
    #path(r'', views.signin, name='signin'),
    path(r'adminsignin/', views.signin, name='adminsignin'),
    path(r'', views.test, name='signin'),
    re_path(r'auth/callback/(?P<token>.+)/$',views.studenthome,name='studenthome'),
    path(r'cart/',views.cart,name='cart'),
    path(r'adminhome/',views.adminhome,name='adminhome'),
    path(r'issuecomponent/',views.issuecomponent,name='issuecomponent'),
    #path(r'studentprofile/',views.studentprofile,name='studentprofile'),
    path(r'searchresult/',views.searchresult,name='searchresult'),
    path(r'issuedcompdet/',views.issuedcompdet,name='issuedcompdet'),
    path(r'addcomp/',views.addcomp,name='addcomp'),
    path(r'comptypelist/<slug:x>/',views.comptypelist,name='comptypelist'),

    path(r'showcomps/<slug:y>/',views.showcomps,name='showcomps'),

    path(r'compdescription/',views.compdescription,name='compdescription'),
    path(r'packetdetails/',views.packetdetails,name='packetdetails'),
    path(r'returncomponent/',views.returncomponent,name='returncomponent'),
    path(r'componenttype/',views.componenttype,name='componenttype'),
    path(r'requestcomponent/',views.requestcomponent,name='requestcomponent'),
    path(r'studentprofile/',views.studentprofile,name='studentprofile'),
    path(r'search/',views.search,name='search'),
    path(r'update_return/',views.update_return,name='update_return'),
    path(r'notification/',views.notification,name='notification'),
    #path(r'issue_component/',views.issue_component,name='issue_component')
]
