from django.urls import path # type: ignore
from . import views

app_name = 'maps'

urlpatterns = [
    path('', views.trangchu, name='trangchu'),
    path('phim/', views.phim, name='phim'),
    path('phim/<int:id>/', views.phim_detail, name='phim_detail'),
   path('co-ban/', views.simplemap, name='co-ban'),  # Trang bản đồ
   path('rap/<int:id>/', views.rap, name='rap')
]



