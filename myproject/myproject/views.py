#from django.http import HttpResponse
from django.shortcuts import render  # type: ignore
def homepage(request):
    #return HttpResponse("Xin chào Django")
    return render(request, 'home.html')
