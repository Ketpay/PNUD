from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from rest_framework import status
from django.contrib.auth.hashers import check_password
from django.utils.timezone import now
from django.utils import timezone
from django.contrib.auth.models import User
from db_pnud.models import *
from .utils import *
from django.db import models
 
 
class LoginToken(ObtainAuthToken):

	def post(self, request, *args, **kwargs):
		try:
			usuario=request.data.get("usuario")
			password=request.data.get("password")
			datos=User.objects.filter(username=usuario).last()

			if password=="":
				response={
				"value":"error",
				"mensaje":"password vacia"
				}
				return Response(response,status=status.HTTP_400_BAD_REQUEST)

			elif datos==None:
				response={
				"value":"error",
				"mensaje":"usuario no existe"
				}
				return Response(response,status=status.HTTP_400_BAD_REQUEST)
			
			elif check_password(password, datos.password):

				my_token=Token.objects.get(user_id=datos.id)
				response={
				"value":"correcto",
				"token":my_token.key,
				"nombre":usuario.capitalize(),

				}
	 
				return Response(response,status=status.HTTP_200_OK)

			else:
				response={
					"value":"error",
					"mensaje":"password incorrecta"
					}

				return Response(response,status=status.HTTP_400_BAD_REQUEST)

		except:
			response={
				"value":"error",
				"mensaje":"fallo"
				}

		return Response(response,status=status.HTTP_500_INTERNAL_SERVER_ERROR)
 