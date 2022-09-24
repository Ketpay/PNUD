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
 
class Metas_all(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=base_metas_estado_tendencia.objects.order_by().values('meta').distinct()
 
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
			 
				dic={
				"name":dato[i]["meta"],
				"value":i,
 
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_200_OK)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)


class Buscar_submetas(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:

			dato=base_metas_estado_tendencia.objects.order_by().values('meta').distinct()
			lista=[]
			n=0
			for i in range(len(dato)):
				grupo={
				 
				"label":dato[i]["meta"],
				}
				dato_2=base_metas_estado_tendencia.objects.filter(meta=dato[i]["meta"])
				lista_aux=[]
				lista_aux2=[]
				none_act=False
				for y in range(len(dato_2)):
					if dato_2[y].submeta != None:
						if dato_2[y].submeta not in lista_aux:
							

							lista_aux.append(dato_2[y].submeta)

							lista_aux2.append({ "value": n, "label": dato_2[y].submeta})
							n=n+1
					else:
						none_act=True
				if none_act==True:
					lista_aux2.append({ "value": n, "label":dato[i]["meta"]})
					n=n+1
				

				grupo["options"]=lista_aux2

				lista.append(grupo)

 


			return Response(lista,status=status.HTTP_200_OK)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

 

class Buscar_capas(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
			valor=request.data.get("dato")
			dato=base_metas_estado_tendencia.objects.filter(submeta=valor)
			n=0
			if len(dato)!= 0 : 
				lista=[]
				for i in range(len(dato)):
					n=n-1
					grupo={ "value": n, "label":dato[i].capa_datos}
					lista.append(grupo)

			else :
				dato=base_metas_estado_tendencia.objects.filter(meta=valor)
				lista=[]
				for i in range(len(dato)):
					n=n-1
					grupo={ "value": n, "label":dato[i].capa_datos}
					lista.append(grupo)



			return Response(lista,status=status.HTTP_200_OK)

		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

 
class Buscar_data(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
			valor=request.data.get("dato")
			# print(valor)
			dato=base_metas_estado_tendencia.objects.filter(capa_datos=valor)
			dato=eval(dato[0].codigo_idso)
			all_datos=dato.objects.all().order_by('anio')
			fields=[f.name for f in dato._meta.get_fields()]
			fields2 = [name.capitalize() for name in fields]
			barra=0
			if len(fields)>3:
				barra=1
			response={
			"col":len(fields),
			"row":len(all_datos),
			"fields":fields2,
			"barra":barra,
			}
	 
			lista_aux=[]
			for i in range(len(fields)):
	 
				field=fields[i]
				datos=list(all_datos.values(field))
				lista_aux2=[]
				# print(datos)
				for y in range(len(datos)):
					dic=list(datos[y].values())
					# print(dic)
					lista_aux2.append(dic[0])
				# print(lista_aux2)

				 
				lista_aux.append(lista_aux2)

	 

			response["datos"]=list(zip(*lista_aux))



		 

			return Response(response,status=status.HTTP_200_OK)

		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)
		

class Meta_grafico(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
			valor=request.data.get("dato")
			dato=base_metas_estado_tendencia.objects.filter(capa_datos=valor)
			dato=eval(dato[0].codigo_idso)
			all_datos=dato.objects.all().order_by('anio')
			fields=[f.name for f in dato._meta.get_fields()]
				 
			lista_fechas=[]
			val=[]
			tipo=""
			for i in range(len(all_datos)) :
				lista_fechas.append(all_datos[i].anio)
				if "valor" in fields:
					val.append(all_datos[i].valor)
					tipo="Valor"
				else:
					val.append(all_datos[i].puntaje)
					tipo="Puntaje"

			response={
			"value": "Correcto",
			"fecha":lista_fechas,
			"valores":val,
			"tipo":tipo,

		}

			

			return Response(response,status=status.HTTP_200_OK)

		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)


class Meta_grafico_barras(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
			dif=["anio",'puntaje',"id","valor"]
		 
			valor=request.data.get("dato")
			dato=base_metas_estado_tendencia.objects.filter(capa_datos=valor)
			dato=eval(dato[0].codigo_idso)
			all_datos=dato.objects.all().order_by('anio')

			anios=dato.objects.order_by().values('anio').distinct()
			 
			fields=[f.name for f in dato._meta.get_fields()]
			encabezados=[]
			 
			for i in range(len(fields)):
				 
				if (fields[i] not in dif) ==True:
					encabezados.append(fields[i])
		 
			 
			years=[]
			for i in range(len(anios)):
				fecha=list(anios[i].values())
				years.append(str(fecha[0]))
			

			filtro=dato.objects.values(encabezados[0]).distinct()
			filtro_val=[]
			for i in range(len(filtro)):
				val=list(filtro[i].values())
				filtro_val.append(str(val[0]))
			# print(filtro_val)



			lista_data=[]
			for y in range(len(filtro_val)):
				label=filtro_val[y]
				lista_val=[]

				for i in range(len(years)):
					dato=all_datos.filter(anio=years[i]) 
					field_name = encabezados[0]
					field_name_icontains = field_name + '__icontains'
					dato=dato.filter(**{field_name_icontains: label})[0]
					if "puntaje" in fields:
						lista_val.append(dato.puntaje)
					else:
						lista_val.append(dato.valor)
				r = lambda: random.randint(0,255)
				colores='#%02X%02X%02X' % (r(),r(),r())
				datasets= {
	            "label": label,
	            "data": lista_val,
	            "backgroundColor": colores,
	          	},
			 



				lista_data.append(datasets[0])
			print(lista_data)

			response={
					"value": "Correcto",
					"fecha": years,
					"datasets": lista_data
					 
					}

		

			return Response(response,status=status.HTTP_200_OK)

		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)




