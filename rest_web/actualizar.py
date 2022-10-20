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
import numpy as np
import pandas as pd
from scipy.stats import linregress
from .utils import *
from drf_yasg.utils import swagger_auto_schema 
from django.utils.decorators import method_decorator
from drf_yasg import openapi



@method_decorator(name='post', decorator=swagger_auto_schema( 
                     request_body=openapi.Schema(
                         type=openapi.TYPE_OBJECT,
                         required=['anio','dato', 'nombre'],
                         properties={
                            'anio': openapi.Schema(type=openapi.TYPE_NUMBER),
                            'dato': openapi.Schema(type=openapi.TYPE_STRING),
                            'nombre': openapi.Schema(type=openapi.TYPE_STRING)
                        	 },
                     ),
                     operation_description='Actualizar formulartio con 3 variables')
)
 

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

@method_decorator(name='post', decorator=swagger_auto_schema( 
                     request_body=openapi.Schema(
                         type=openapi.TYPE_OBJECT,
                         required=['anio','dato1','dato2', 'nombre'],
                         properties={
                            'anio': openapi.Schema(type=openapi.TYPE_NUMBER),
                            'dato1': openapi.Schema(type=openapi.TYPE_STRING),
                            'dato2': openapi.Schema(type=openapi.TYPE_STRING),
                            'nombre': openapi.Schema(type=openapi.TYPE_STRING)
                        	 },
                     ),
                     operation_description='Actualizar formulartio con 4 variables')
)
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
				response={
						"value": "fail",		 
						}

				return Response(response,status=status.HTTP_400_BAD_REQUEST)

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



class Agregar_data_formulario_csv(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		# try:
		data=request.data
		# print(data)
		# print(data.get("nombre"))
		
		if data.get("nombre")=="Puntuaciones de las tendencias  de  los  medios de vida":
			val=liv_trend_f(data)
			
		elif data.get("nombre")=='Oportunidad de pesca artesanal':
			val=ao_acces_f(data)
		elif data.get("nombre")=='Necesidad  económica  de la pesca artesanal':
			val=ao_need_f(data)
		elif data.get("nombre")=='Estimaciones de B / Bmsy':
			val=fis_b_bmsy_f(data)
		elif data.get("nombre")=='Datos de captura pesquera':
			val=fis_meancatch_f(data)
		elif data.get("nombre")=='Cosecha de maricultura':
			val=mar_harvest_tonnes_f(data)
		elif data.get("nombre")=='Puntuación de sostenibilidad de la maricultura':
			val=mar_sustainability_score_f(data)
		elif data.get("nombre")=='Índice de sostenibilidad turística':
			val=tr_sustainability_f(data)
		elif data.get("nombre")=='Cantidad  y  calidad  de la visita turística ponderada':
			val=tr_visit_sq_pct_tourism_f(data)
		else:
			val=False
		
	 
		if val==True:
			response={
						"value": "Correcto",		 
						}

			return Response(response,status=status.HTTP_200_OK)
		else:
			response={
						"value": "fail",		 
						}

			return Response(response,status=status.HTTP_202_ACCEPTED)

		# except:
		# 	response={
		# 	"value":"fail",
		# 	"message":"Error to send data"
		# 	}
		# 	return Response(response )

