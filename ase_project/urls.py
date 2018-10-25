from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('eclabmanagement/', include('eclabmanagement.urls')),
    path('admin/', admin.site.urls),
]