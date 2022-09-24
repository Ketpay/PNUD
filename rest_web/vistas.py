from django.shortcuts import render

# Create your views here.
 

def index(request):
	return render(request, "index.html")

def metas(request):
	return render(request, "index.html")

def actualizar(request):
	return render(request, "index.html")