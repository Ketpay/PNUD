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

class View_all_ao_access(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=ao_access.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"puntaje":dato[i].puntaje
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_ao_need(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=ao_need.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"zona":dato[i].zona,
				"puntaje":dato[i].puntaje
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_base_metas_estado_tendencia(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=base_metas_estado_tendencia.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"meta":dato[i].meta,
				"submeta":dato[i].submeta,
				"capa_datos":dato[i].capa_datos,
				"codigo_idso":dato[i].codigo_idso,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)


class View_all_base_puntos_referencia(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=base_puntos_referencia.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"meta":dato[i].meta,
				"submeta":dato[i].submeta,
				"descripccion_punto_referencia":dato[i].descripccion_punto_referencia
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)


class View_all_cw_chemical_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=cw_chemical_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_cw_nutrient_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=cw_nutrient_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_cw_pathogen_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=cw_pathogen_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_cw_trash_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=cw_trash_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_eco_status(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=eco_status.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"puntaje":dato[i].puntaje,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_eco_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=eco_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"actividad_economica":dato[i].actividad_economica,
				"puntaje":dato[i].puntaje,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_fis_b_bmsy(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=fis_b_bmsy.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"nombre_de_especies":dato[i].nombre_de_especies,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_fis_meancatch(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=fis_meancatch.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"tipo":dato[i].tipo,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_hab_mangrove_extent(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=hab_mangrove_extent.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
			 
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_hab_mangrove_health(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=hab_mangrove_health.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"balneario":dato[i].balneario,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_hab_mangrove_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=hab_mangrove_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"balneario":dato[i].balneario,
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_hab_saltmarsh_extent(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=hab_saltmarsh_extent.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)


class View_all_hab_saltmarsh_health(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=hab_saltmarsh_health.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_hab_saltmarsh_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=hab_saltmarsh_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_le_sector_weight(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=le_sector_weight.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"sector":dato[i].sector,
				"puntaje":dato[i].puntaje,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_liv_status(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=liv_status.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				 
				"puntaje":dato[i].puntaje,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_liv_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=liv_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				 
				"puntaje":dato[i].puntaje,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_spp_status(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=spp_status.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				 
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_spp_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=spp_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				 
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_spp_trend(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=spp_trend.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				 
				"valor":dato[i].valor,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_tr_sustainability(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=tr_sustainability.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				 
				"puntaje":dato[i].puntaje,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_all_tr_visit_sq_pct_tourism(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def get(self, request, *args, **kwargs):
		try:

			dato=tr_visit_sq_pct_tourism.objects.all()
			response={
			"value":"success",
			"message":"-"
			}
			lista=[]
			for i in range(len(dato)):
				dic={
				"anio":dato[i].anio,
				"balneario":dato[i].balneario,
				"puntaje":dato[i].puntaje,
				}
				lista.append(dic)
			response["datos"]=lista



			return Response(response,status=status.HTTP_201_CREATED)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)