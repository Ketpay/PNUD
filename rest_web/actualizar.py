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
 
class Agregar_data_formulario_1(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
		 
			anio = request.data.get("anio")
			valor=  request.data.get("dato")
			nombre=  request.data.get("nombre")
			dato=base_metas_estado_tendencia.objects.filter(capa_datos=nombre)

			dato=eval(dato[0].codigo_idso)
			fields=[f.name for f in dato._meta.get_fields()]
			if "puntaje" in fields:
				dato.objects.create(anio=anio,puntaje=valor)
			else:
				dato.objects.create(anio=anio,valor=valor)
			response={
						"value": "Correcto",		 
						}

			return Response(response,status=status.HTTP_200_OK)

		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response )


class Agregar_data_formulario_2(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
		 
			anio = request.data.get("anio")
			valor=  request.data.get("dato1")
			valor2=  request.data.get("dato2")
			nombre=  request.data.get("nombre")
			dato=base_metas_estado_tendencia.objects.filter(capa_datos=nombre)

			dato=eval(dato[0].codigo_idso)
			fields=[f.name for f in dato._meta.get_fields()]


			if "zona" in fields:
				if "puntaje" in fields:
					dato.objects.create(anio=anio,zona=valor,puntaje=valor2)
				else:
					dato.objects.create(anio=anio,zona=valor,valor=valor2)

			elif "actividad_economica" in fields:
				if "puntaje" in fields:
					dato.objects.create(anio=anio,actividad_economica=valor,puntaje=valor2)
				else:
					dato.objects.create(anio=anio,actividad_economica=valor,valor=valor2)

			elif "nombre_de_especies" in fields:
				if "puntaje" in fields:
					dato.objects.create(anio=anio,nombre_de_especies=valor,puntaje=valor2)
				else:
					dato.objects.create(anio=anio,nombre_de_especies=valor,valor=valor2)

			elif "tipo" in fields:
				if "puntaje" in fields:
					dato.objects.create(anio=anio,tipo=valor,puntaje=valor2)
				else:
					dato.objects.create(anio=anio,tipo=valor,valor=valor2)

			elif "balneario" in fields:
				if "puntaje" in fields:
					dato.objects.create(anio=anio,balneario=valor,puntaje=valor2)
				else:
					dato.objects.create(anio=anio,balneario=valor,valor=valor2)

			elif "sector" in fields:
				if "puntaje" in fields:
					dato.objects.create(anio=anio,sector=valor,puntaje=valor2)
				else:
					dato.objects.create(anio=anio,sector=valor,valor=valor2)

			else:
				pass

			response={
						"value": "Correcto",		 
						}

			return Response(response,status=status.HTTP_200_OK)

		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response )