# Create your views here.
from django.http import HttpResponse

def index(request):
    """returns hello world"""
    return HttpResponse('hello world')

def detail(request, greeting):
    """docstring for detail"""
    return HttpResponse('hello ' + greeting)