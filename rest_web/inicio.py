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
import csv
import os
from pathlib import Path
BASE_DIR = Path(__file__).resolve().parent.parent
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

 

class View_objetivos(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
			region=request.data.get("region")
		 
			 

			dire=os.path.join(BASE_DIR,'archivo\\scores.csv')
			df=pd.read_csv(dire, sep=',')
		 
			
			filtered_df = df.loc[(df['region_id'] == region)]
			print(filtered_df)
			filtered_df = filtered_df.loc[(df['dimension'] == 'score')]

			goal=list(filtered_df["goal"])
			 
			score=list(filtered_df["score"])
			response= {
					"goal":goal,
					"score":score ,
				}

			return Response(response,status=status.HTTP_200_OK)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)

class View_dimensiones(APIView):

	authentication_classes = [authentication.TokenAuthentication]
	permission_classes = [permissions.IsAuthenticated]
	def post(self, request, *args, **kwargs):
		try:
			region=request.data.get("region")
			dimension=request.data.get("dimension")
			 
			 

			dire=os.path.join(BASE_DIR,'archivo\\scores.csv')
			df=pd.read_csv(dire, sep=',')
			 
			filtered_df = df.loc[(df['region_id'] == region)]
			
			filtered_df = filtered_df.loc[(df['goal'] == dimension)].fillna(0)
	 
			dimension=list(filtered_df["dimension"])
			ind=dimension.index("score")
			dimension.pop(ind)
			score=list(filtered_df["score"])
			score.pop(ind)
		 
			dimension = [name.capitalize() for name in dimension]
			response= {
					"dimension":dimension,
					"score":score ,
				}

			return Response(response,status=status.HTTP_200_OK)
	
		except:
			response={
			"value":"fail",
			"message":"Error to send data"
			}
			return Response(response,status=status.HTTP_400_BAD_REQUEST)