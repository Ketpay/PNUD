from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from rest_framework import generics
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework import status
from django.contrib.auth.hashers import make_password, check_password
from db_pnud.models import *
import random
 
class Inicio_objetivos(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:

			dato=ao_need.objects.order_by().values('zona').distinct()
			lista=[]
		 
			
			for i in range(len(dato)):
			 
				dic={
				"label":dato[i]["zona"],
				"value":i,
 
				}
				lista.append(dic)
 



			return Response(lista,status=status.HTTP_200_OK)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

 

