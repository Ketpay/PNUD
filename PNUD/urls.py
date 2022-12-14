"""PNUD URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from rest_web.views_all import *
from rest_web.metas import *
from rest_web.actualizar import *
from rest_web.vistas import *
from rest_web.inicio import *
from rest_web.login import *
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
   openapi.Info(
      title="PNUD Doc.",
      default_version='V1.0.0',
      description="API Rest del PNUD",
      # terms_of_service="https://www.google.com/policies/terms/",
      # contact=openapi.Contact(email="contact@snippets.local"),
      license=openapi.License(name="MIT License"),
   ),
   public=True,
   permission_classes=[permissions.AllowAny],
)

urlpatterns = [
    path('admin/', admin.site.urls),
###################################################################
# ---------------------------WEB-----------------------------------
###################################################################
    path('',login ),
    path('inicio/',index ),
    path('metas/',metas ),
    path('actualizar/',actualizar ),
#############################-Views_all-###########################
    path('view/all/ao_access/',View_all_ao_access.as_view()),
    path('view/all/ao_need/',View_all_ao_need.as_view()),
    path('view/all/bmet/',View_all_base_metas_estado_tendencia.as_view()),
    path('view/all/bpr/',View_all_base_puntos_referencia.as_view()),
    path('view/all/cw_chemical_trend/',View_all_cw_chemical_trend.as_view()),
    path('view/all/cw_nutrient_trend/',View_all_cw_nutrient_trend.as_view()),
    path('view/all/cw_pathogen_trend/',View_all_cw_pathogen_trend.as_view()),
    path('view/all/cw_trash_trend/',View_all_cw_trash_trend.as_view()),
    path('view/all/eco_status/',View_all_eco_status.as_view()),
    path('view/all/eco_trend/',View_all_eco_trend.as_view()),
    path('view/all/fis_b_bmsy/',View_all_fis_b_bmsy.as_view()),
    path('view/all/fis_meancatch/',View_all_fis_meancatch.as_view()),
    path('view/all/hab_mangrove_extent/',View_all_hab_mangrove_extent.as_view()),
    path('view/all/hab_mangrove_health/',View_all_hab_mangrove_health.as_view()),
    path('view/all/hab_mangrove_trend/',View_all_hab_mangrove_trend.as_view()),
    path('view/all/hab_saltmarsh_extent/',View_all_hab_saltmarsh_extent.as_view()),
    path('view/all/hab_saltmarsh_health/',View_all_hab_saltmarsh_health.as_view()),
    path('view/all/hab_saltmarsh_trend/',View_all_hab_saltmarsh_trend.as_view()),
    path('view/all/le_sector_weight/',View_all_le_sector_weight.as_view()),
    path('view/all/liv_status/',View_all_liv_status.as_view()),
    path('view/all/liv_trend/',View_all_liv_trend.as_view()),
    path('view/all/spp_status/',View_all_spp_status.as_view()),
    path('view/all/spp_trend/',View_all_spp_trend.as_view()),
    path('view/all/tr_sustainability/',View_all_tr_sustainability.as_view()),
    path('view/all/tr_visit_sq_pct_tourism/',View_all_tr_visit_sq_pct_tourism.as_view()),
#############################-Login-###########################
    path('login/',LoginToken.as_view()),
#############################-Metas-###########################
    path('metas/view/all/',Metas_all.as_view()),
    path('metas/buscar/submetas/',Buscar_submetas.as_view()),
    path('metas/buscar/capas/',Buscar_capas.as_view()),
    path('metas/view/',Buscar_data.as_view()),
    path('metas/grafico/',Meta_grafico.as_view()),
    path('metas/grafico/barras/',Meta_grafico_barras.as_view()),
#############################-Actualizar-###########################
    path('actualizar/add/form_1/',Agregar_data_formulario_1.as_view()),
    path('actualizar/add/form_2/',Agregar_data_formulario_2.as_view()),
    path('actualizar/add/archivos/',Agregar_data_formulario_csv.as_view()),
#############################-Inicio-###############################
    path('inicio/objetivos/',Inicio_objetivos.as_view()),
    path('inicio/objetivos/view/',View_objetivos.as_view()),
    path('inicio/dimensiones/view/',View_dimensiones.as_view()),




#############################-Documentacion-###############################
    path('docs', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('rdocs', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
 
]
