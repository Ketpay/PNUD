from django.utils.timezone import now
from django.utils import timezone
from db_pnud.models import *
from rest_framework.authtoken.models import Token
from datetime import timedelta
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

varAnio = 'year'
varTendencia = 'trend'
varRegionID = 'rgn_id'
varDepartamento = 'DEPARTAMENTO'
varIndicador = 'INDICADOR'

qAnios = 5

puerto = 'PIURA'

listRegion = [1, 2]

listIndEmpleo = ['Porcentaje de ocupación en Agricultura y Pesca',
                 'Porcentaje ocupación en Hoteles y restaurantes',
                 'Porcentaje ocupación en Transporte y Comunicaciones']

listIndIngreso = ['Ingreso promedio mensual proveniente del trabajo']

listPuertos = ['AREQUIPA', 'CALLAO', 'ICA', 'LA LIBERTAD', 'LAMBAYEQUE', 'MOQUEGUA', 'PIURA',
               'PROVINCIA DE LIMA', 'REGIÓN LIMA', 'TACNA', 'TUMBES', 'ÁNCASH']

def Token_expired(token):
	time=now().date()
 
	key=Token.objects.filter(key=token).last()
	expired=key.created+timedelta(days=1)

	if time>=expired.date():
		val=True
		key.delete()
	else:
		val=False
	return val


def liv_trend_f(data):

	try:
		dfIndicadoresEmpleo = pd.read_excel(data.get("file_1"))
		filtro = dfIndicadoresEmpleo[varIndicador].isin(listIndEmpleo)
		listAnios = [c for c in dfIndicadoresEmpleo.columns if ( len(str(c)) == 4 ) & ( str(c)[:2] in ('19', '20'))]
		dfIndicadoresEmpleo = dfIndicadoresEmpleo.loc[filtro, [varIndicador, varDepartamento] + listAnios]\
		.reset_index(drop = True).replace('-', np.nan).dropna(axis = 1)
		listAnios = [c for c in dfIndicadoresEmpleo.columns if ( len(str(c)) == 4 ) & ( str(c)[:2] in ('19', '20'))]

		dfIndicadoresEmpleo = dfIndicadoresEmpleo.melt(id_vars=[varDepartamento, varIndicador], value_vars=listAnios, var_name=varAnio)\
		.pivot_table(index=[varDepartamento, varAnio], columns = varIndicador, values = 'value').dropna().reset_index()
		dfIndicadoresEmpleo[varAnio] = dfIndicadoresEmpleo[varAnio].astype(str)

		rows=dfIndicadoresEmpleo.shape[0]
		Indicadores_empleo.objects.all().delete()
		for i in range(rows):
			Indicadores_empleo.objects.create(
				year=dfIndicadoresEmpleo["year"][i],
				departamento=dfIndicadoresEmpleo["DEPARTAMENTO"][i],
				porcent_agri_pes=dfIndicadoresEmpleo["Porcentaje de ocupación en Agricultura y Pesca"][i],
				porcent_hot_rest=dfIndicadoresEmpleo["Porcentaje ocupación en Hoteles y restaurantes"][i],
				porcent_trans_comuni= dfIndicadoresEmpleo["Porcentaje ocupación en Transporte y Comunicaciones"][i]
				)
		dfIndicadoresIngreso = pd.read_excel(data.get("file_2"))
		filtro = dfIndicadoresIngreso[varIndicador].isin(listIndIngreso)
		listAnios = [c for c in dfIndicadoresIngreso.columns if ( len(str(c)) == 4 ) & ( str(c)[:2] in ('19', '20'))]
		dfIndicadoresIngreso = dfIndicadoresIngreso.loc[filtro, [varIndicador, varDepartamento] + listAnios]\
		.reset_index(drop = True).replace('-', np.nan).dropna(axis = 1)
		listAnios = [c for c in dfIndicadoresIngreso.columns if ( len(str(c)) == 4 ) & ( str(c)[:2] in ('19', '20'))]
		dfIndicadoresIngreso = dfIndicadoresIngreso.melt(id_vars=[varDepartamento, varIndicador], value_vars=listAnios, var_name=varAnio)\
		.pivot_table(index=[varDepartamento, varAnio], columns = varIndicador, values = 'value').dropna().reset_index()
		dfIndicadoresIngreso[varAnio] = dfIndicadoresIngreso[varAnio].astype(str)

		rows=dfIndicadoresIngreso.shape[0]
		Indicadores_ingreso.objects.all().delete()
		for i in range(rows):
			Indicadores_ingreso.objects.create(
				year=dfIndicadoresIngreso["year"][i],
				departamento=dfIndicadoresIngreso["DEPARTAMENTO"][i],
				ingre_prom_men=dfIndicadoresIngreso["Ingreso promedio mensual proveniente del trabajo"][i],
				 )


		filtro = dfIndicadoresEmpleo[varDepartamento].isin(listPuertos)
		dfIndEmpleoTendencia = dfIndicadoresEmpleo.loc[filtro].reset_index(drop = True)
		dfIndEmpleoTendencia[varAnio + '_5y'] = dfIndEmpleoTendencia.groupby(varDepartamento).shift(qAnios - 1)[varAnio]
		filtroNulo = dfIndEmpleoTendencia[varAnio + '_5y'].notnull()
		listAnios = dfIndEmpleoTendencia.loc[filtroNulo, varAnio + '_5y'].unique()
		 
		for p in listPuertos:
		 
			filtroPuerto = ( dfIndEmpleoTendencia[varDepartamento] == p )
			for ind in listIndEmpleo:
			 
				for anio in listAnios:
			 
					anioFin = str(int(anio) + int(qAnios) - 1)
					 
					filtro = filtroPuerto & ( dfIndEmpleoTendencia[varAnio + '_5y'] == anio )
					filtroMeses = filtroPuerto & ( dfIndEmpleoTendencia[varAnio].between(anio, anioFin) )
					dfIndEmpleoTendencia.loc[filtro, ind + ' Pendiente'] = linregress(dfIndEmpleoTendencia.loc[filtroMeses, varAnio].astype(int), 
					dfIndEmpleoTendencia.loc[filtroMeses, ind])[0]
		dfIndEmpleoTendencia = dfIndEmpleoTendencia.drop(columns = listIndEmpleo).rename(columns = {c + ' Pendiente':c for c in listIndEmpleo})\
		.loc[filtroNulo, [varDepartamento, varAnio] + listIndEmpleo].reset_index(drop = True)


		filtro = dfIndicadoresEmpleo[varDepartamento] == puerto
		dfIndEmpleo = dfIndicadoresEmpleo.loc[filtro].reset_index(drop=True)
		dfIndEmpleo[varAnio + '_5y'] = dfIndEmpleo[varAnio].shift(qAnios - 1)
		 
		filtroNulo = dfIndEmpleo[varAnio + '_5y'].notnull()
		for ind in listIndEmpleo:
		 
			for anio in dfIndEmpleo.loc[filtroNulo, varAnio + '_5y'].unique():
			 
				filtro = dfIndEmpleo[varAnio + '_5y'] == anio
				anioFin = dfIndEmpleo.loc[filtro, varAnio].values[0]
				 
				filtroMeses = dfIndEmpleo[varAnio].between(anio, anioFin)
				 
				dfIndEmpleo.loc[filtro, ind + ' Prom'] = dfIndEmpleo.loc[filtroMeses, ind].mean()
		dfIndEmpleo = dfIndEmpleo.drop(columns = listIndEmpleo).rename(columns = {c + ' Prom':c for c in listIndEmpleo})\
		.loc[filtroNulo, [varDepartamento, varAnio] + listIndEmpleo].reset_index(drop = True)

		filtro = dfIndEmpleoTendencia[varDepartamento] != puerto
		dfIndEmpleoTendMax = dfIndEmpleoTendencia.loc[filtro].groupby(varAnio, as_index = False).agg({c:'max' for c in listIndEmpleo})

		filtro = dfIndEmpleoTendencia[varDepartamento] == puerto
		dfPendiente = dfIndEmpleoTendencia.loc[filtro].merge(dfIndEmpleoTendMax, on = varAnio, how = 'inner')
		for ind in listIndEmpleo:
		 
			dfPendiente[ind] = (( dfPendiente[ind + '_x']  - dfPendiente[ind + '_y'] ) / dfPendiente[ind + '_y']).clip(-1, 1)
		dfPendiente.drop(columns = [c + '_x' for c in listIndEmpleo] + [c + '_y' for c in listIndEmpleo], inplace=True)

		dfFinalEmpleo = dfIndEmpleo.merge(dfPendiente, on = [varAnio, varDepartamento], how = 'inner')
		for ind in listIndEmpleo:
			dfFinalEmpleo[ind] = dfFinalEmpleo[ind + '_x'] * dfFinalEmpleo[ind + '_y']
		dfFinalEmpleo[varTendencia] = dfFinalEmpleo[listIndEmpleo].sum(axis = 1) / dfFinalEmpleo[[c + '_x' for c in listIndEmpleo]].sum(axis = 1)
		dfFinalEmpleo.drop(columns = [c + '_x' for c in listIndEmpleo] + [c + '_y' for c in listIndEmpleo] + listIndEmpleo, inplace=True)

		filtro = dfIndicadoresIngreso[varDepartamento].isin(listPuertos)
		dfIndIngresoTendencia = dfIndicadoresIngreso.loc[filtro].reset_index(drop = True)
		dfIndIngresoTendencia[varAnio + '_5y'] = dfIndIngresoTendencia.groupby(varDepartamento).shift(qAnios - 1)[varAnio]
		filtroNulo = dfIndIngresoTendencia[varAnio + '_5y'].notnull()
		listAnios = dfIndIngresoTendencia.loc[filtroNulo, varAnio + '_5y'].unique()
		#print(listAnios)
		for p in listPuertos:
		 
			filtroPuerto = ( dfIndIngresoTendencia[varDepartamento] == p )
			for ind in listIndIngreso:
		   
				for anio in listAnios:
		            # Generando los anios
					anioFin = str(int(anio) + int(qAnios) - 1)

					filtro = filtroPuerto & ( dfIndIngresoTendencia[varAnio + '_5y'] == anio )
					filtroMeses = filtroPuerto & ( dfIndIngresoTendencia[varAnio].between(anio, anioFin) )
					dfIndIngresoTendencia.loc[filtro, ind + ' Pendiente'] = linregress(dfIndIngresoTendencia.loc[filtroMeses, varAnio].astype(int), 
		                                                                              dfIndIngresoTendencia.loc[filtroMeses, ind])[0]
		dfIndIngresoTendencia = dfIndIngresoTendencia.drop(columns = listIndIngreso).rename(columns = {c + ' Pendiente':c for c in listIndIngreso})\
			.loc[filtroNulo, [varDepartamento, varAnio] + listIndIngreso].reset_index(drop = True)


		filtro = dfIndIngresoTendencia[varDepartamento] != puerto
		dfIndIngresoTendMax = dfIndIngresoTendencia.loc[filtro].groupby(varAnio, as_index = False).agg({c:'max' for c in listIndIngreso})


		filtro = dfIndIngresoTendencia[varDepartamento] == puerto
		dfFinalIngreso = dfIndIngresoTendencia.loc[filtro].merge(dfIndIngresoTendMax, on = varAnio, how = 'inner')
		ind = listIndIngreso[0]
		dfFinalIngreso[varTendencia] = dfFinalIngreso[ind + '_x'] / dfFinalIngreso[ind + '_y']
		dfFinalIngreso.drop(columns = [c + '_x' for c in listIndIngreso] + [c + '_y' for c in listIndIngreso], inplace=True)

		dfPreFinal = dfFinalEmpleo.merge(dfFinalIngreso, on = [varDepartamento, varAnio], how = 'inner')
		dfPreFinal[varTendencia] = dfPreFinal[[varTendencia + '_x', varTendencia + '_y']].mean(axis = 1)
		dfPreFinal.drop(columns = [varTendencia + '_x', varTendencia + '_y'], inplace=True)
	 
		rows=dfPreFinal.shape[0]
		liv_trend.objects.all().delete()
		for i in range(rows):
			val=round(dfPreFinal["trend"][i],4)
			liv_trend.objects.create(
				anio=dfPreFinal["year"][i],
				zona="Vice",
				puntaje=val,
				 )
		for i in range(rows):
			val=round(dfPreFinal["trend"][i],4)
			liv_trend.objects.create(
				anio=dfPreFinal["year"][i],
				zona="Sechura",
				puntaje=val,
				 )
		val=True
	except:
		val=False

	return val
def ao_acces_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'ao_access_gl2020')
		rows=df.shape[0]
		ao_access.objects.all().delete()
		for i in range(rows-1):
			ao_access.objects.create(
				anio=df["year"][i],
				puntaje=df["value"][i],
			 )
		val=True
	except:
		val=False

	return val

def ao_need_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'PobrezaDistrital')
		rows=df.shape[0]
	 
		lista=[]
		ao_need.objects.all().delete()
		for i in range(rows):
			if df.iloc[15,i+2] in lista :
				 
				break
			else:
				lista.append(df.iloc[15,i+2])
				ao_need.objects.create(
				anio=df.iloc[15,i+2],
				zona="Nacional",
				puntaje=df.iloc[16,i+2],
			 	)
				ao_need.objects.create(
				anio=df.iloc[15,i+2],
				zona="Sechura",
				puntaje=df.iloc[18,i+2],
			 	)
				ao_need.objects.create(
				anio=df.iloc[15,i+2],
				zona="Vice",
				puntaje=df.iloc[22,i+2],
			 	)
		 
		val=True
	except:
		val=False

	return val

def fis_b_bmsy_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'Figura')
		rows=df.shape[0]

		fis_b_bmsy.objects.all().delete()
		lista=[]
		for i in range(rows):

			fis_b_bmsy.objects.create(
				anio=df["year"][i],
				nombre_de_especies=df["stock_id"][i],
				valor=df["bbmsy"][i],
			 )
		val=True
	except:
		val=False

	return val

def fis_meancatch_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'Desembarques_BSP')
		rows=df.shape[0]
		col=df.shape[1]
		df = df.fillna('N/D') 
		fis_meancatch.objects.all().delete()
		for i in range(21):
		 
			peces=0
			invertebrados=0
			for y in range(111):
			 
			 	
				if df.iloc[y+1,9+i] !="N/D" :
					val= df.iloc[y+1,9+i]
					if type(val)==str:
						val=val. replace(",", ".", 1)
					if df.iloc[y+1,1]=="PECES":
						peces=peces+float(val)

					else:
						invertebrados=invertebrados+float(val)
		 
			fis_meancatch.objects.create(
			anio=int(df.iloc[0,9+i]),
			tipo="Peces",
			valor=round(peces,2),
			)
			fis_meancatch.objects.create(
			anio=int(df.iloc[0,9+i]),
			tipo='Invertebrados',
			valor=round(invertebrados,2)
			)
		val=True
	except:
		val=False

	return val



def mar_harvest_tonnes_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'mar_harvest_tonnes_bsp2020')
		 
		rows=df.shape[0]
		Mar_harvest_tonnes.objects.all().delete()
		lista=[]
		for i in range(rows):
			if df["rgn_id"][i]==1:
				val="Sechura"
			else:
				val="Vice"
			Mar_harvest_tonnes.objects.create(
				anio=df["year"][i],
				zona=val,
				valor=df["tonnes"][i],
			 	)
		val=True
	except:
		val=False

	return val

def mar_sustainability_score_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'mar_sustainability_score_bsp')
		 
		rows=df.shape[0]
		Mar_sustainability_score.objects.all().delete()
		lista=[]
		for i in range(rows):
			if df["rgn_id"][i]==1:
				val="Sechura"
			else:
				val="Vice"
			Mar_harvest_tonnes.objects.create(
				anio=df["year"][i],
				zona=val,
				valor=df["sust_coeff"][i],
			 	)
		val=True
	except:
		val=False

	return val



def tr_sustainability_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'Figuras')
		 
		col=df.shape[1]
		 
		tr_sustainability.objects.all().delete()

		for i in range(1,col):

			Mar_harvest_tonnes.objects.create(
				anio=df.iloc[18,i],
				puntaje=df.iloc[19,i]
			 	)
		val=True
	except:
		val=False

	return val



def tr_visit_sq_pct_tourism_f(data):
	try:
		df = pd.read_excel(data.get("file_1"),'tr_visit_sq_pct_tourism_bsp2020')
	 
		rows=df.shape[0]
		tr_visit_sq_pct_tourism.objects.all().delete()
		 
		for i in range(rows):
			if df["rgn_id"][i]==1:
				val="Sechura"
			else:
				val="Vice"
			tr_visit_sq_pct_tourism.objects.create(
				anio=df["year"][i],
				zona=val,
				valor=df["Ep"][i],
			 	)
		val=True
	except:
		val=False

	return val