from django.urls import path
from .views import quote_list

urlpatterns = [
    path('quotes/', quote_list),
]
