from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from rest_framework import generics
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework import status
from django.contrib.auth.hashers import make_password, check_password
from db_npud.models import *
import random
 
class Agregar_data_formulario_1(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
	 
		

			return Response(response,status=status.HTTP_200_OK)

		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)