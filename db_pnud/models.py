from django.db import models


class ao_access(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'ao_access'
		verbose_name_plural = 'ao_access'	
	
	def __str__(self):
		return f'{self.anio}'

class ao_need(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	zona=models.CharField(max_length=255, blank=True, null=True)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'ao_need'
		verbose_name_plural = 'ao_need'	
	
	def __str__(self):
		return f'{self.anio}'


class base_metas_estado_tendencia(models.Model):

	meta=models.CharField(max_length=255, blank=True, null=True)
	submeta=models.CharField(max_length=255, blank=True, null=True)
	capa_datos=models.CharField(max_length=255, blank=True, null=True)
	codigo_idso=models.CharField(max_length=255, blank=True, null=True)

 
	class Meta:
		verbose_name = 'base_metas_estado_tendencia'
		verbose_name_plural = 'base_metas_estado_tendencia'	
	
	def __str__(self):
		return f'{self.id} {self.meta}'


class base_puntos_referencia(models.Model):

	meta=models.CharField(max_length=255, blank=True, null=True)
	submeta=models.CharField(max_length=255, blank=True, null=True)
	descripccion_punto_referencia=models.CharField(max_length=255, blank=True, null=True)
 

 
	class Meta:
		verbose_name = 'base_puntos_referencia'
		verbose_name_plural = 'base_puntos_referencia'	
	
	def __str__(self):
		return f'{self.id} {self.meta}'


class cw_chemical_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'cw_chemical_trend'
		verbose_name_plural = 'cw_chemical_trend'	
	
	def __str__(self):
		return f'{self.anio}'

class cw_nutrient_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'cw_nutrient_trend'
		verbose_name_plural = 'cw_nutrient_trend'	
	
	def __str__(self):
		return f'{self.anio}'


class cw_pathogen_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'cw_pathogen_trend'
		verbose_name_plural = 'cw_pathogen_trend'	
	
	def __str__(self):
		return f'{self.anio}'

class cw_trash_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'cw_trash_trend'
		verbose_name_plural = 'cw_trash_trend'	
	
	def __str__(self):
		return f'{self.anio}'


class eco_status(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'eco_status'
		verbose_name_plural = 'eco_status'	
	
	def __str__(self):
		return f'{self.anio}'

class eco_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	actividad_economica=models.CharField(max_length=255, blank=True, null=True)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'eco_trend'
		verbose_name_plural = 'eco_trend'	
	
	def __str__(self):
		return f'{self.anio}'

class fis_b_bmsy(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	nombre_de_especies=models.CharField(max_length=255, blank=True, null=True)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'fis_b_bmsy'
		verbose_name_plural = 'fis_b_bmsy'	
	
	def __str__(self):
		return f'{self.anio}'

class fis_meancatch(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	tipo=models.CharField(max_length=255, blank=True, null=True)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'fis_meancatch'
		verbose_name_plural = 'fis_meancatch'	
	
	def __str__(self):
		return f'{self.anio} {self.tipo}'

class hab_mangrove_extent(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'hab_mangrove_extent'
		verbose_name_plural = 'hab_mangrove_extent'	
	
	def __str__(self):
		return f'{self.anio}'

class hab_mangrove_health(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	balneario=models.CharField(max_length=255, blank=True, null=True)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'hab_mangrove_health'
		verbose_name_plural = 'hab_mangrove_health'	
	
	def __str__(self):
		return f'{self.anio} {self.balneario}'

class hab_mangrove_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	balneario=models.CharField(max_length=255, blank=True, null=True)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'hab_mangrove_trend'
		verbose_name_plural = 'hab_mangrove_trend'	
	
	def __str__(self):
		return f'{self.anio} {self.balneario}'

class hab_saltmarsh_extent(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'hab_saltmarsh_extent'
		verbose_name_plural = 'hab_saltmarsh_extent'	
	
	def __str__(self):
		return f'{self.anio}'

class hab_saltmarsh_health(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'hab_saltmarsh_health'
		verbose_name_plural = 'hab_saltmarsh_health'	
	
	def __str__(self):
		return f'{self.anio}'

class hab_saltmarsh_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'hab_saltmarsh_trend'
		verbose_name_plural = 'hab_saltmarsh_trend'	
	
	def __str__(self):
		return f'{self.anio}'

class le_sector_weight(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	sector=models.CharField(max_length=255, blank=True, null=True)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'le_sector_weight'
		verbose_name_plural = 'le_sector_weight'	
	
	def __str__(self):
		return f'{self.anio} {self.sector}'


class liv_status(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'liv_status'
		verbose_name_plural = 'liv_status'	
	
	def __str__(self):
		return f'{self.anio}'

class liv_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'liv_trend'
		verbose_name_plural = 'liv_trend'	
	
	def __str__(self):
		return f'{self.anio}'

class spp_status(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'spp_status'
		verbose_name_plural = 'spp_status'	
	
	def __str__(self):
		return f'{self.anio}'

class spp_trend(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0, )
	valor=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'spp_trend'
		verbose_name_plural = 'spp_trend'	
	
	def __str__(self):
		return f'{self.anio}'

class tr_sustainability(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'tr_sustainability'
		verbose_name_plural = 'tr_sustainability'	
	
	def __str__(self):
		return f'{self.anio}'

class tr_visit_sq_pct_tourism(models.Model):

	anio=models.PositiveIntegerField(blank=True, null=True, default=0)
	balneario=models.CharField(max_length=255, blank=True, null=True)
	puntaje=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'tr_visit_sq_pct_tourism'
		verbose_name_plural = 'tr_visit_sq_pct_tourism'	
	
	def __str__(self):
		return f'{self.anio}'


#------------------------------------------------------------

class Indicadores_empleo(models.Model):

	year=models.PositiveIntegerField(blank=True, null=True, default=0)
	departamento=models.CharField(max_length=255, blank=True, null=True)
	porcent_agri_pes=models.FloatField(blank=True, null=True, default=0)
	porcent_hot_rest=models.FloatField(blank=True, null=True, default=0)
	porcent_trans_comuni=models.FloatField(blank=True, null=True, default=0)
 
	class Meta:
		verbose_name = 'Indicadores_empleo'
		verbose_name_plural = 'Indicadores_empleo'	
	
	def __str__(self):
		return f'{self.year} - {self.departamento}'

class Indicadores_ingreso(models.Model):

	year=models.PositiveIntegerField(blank=True, null=True, default=0)
	departamento=models.CharField(max_length=255, blank=True, null=True)
	ingre_prom_men=models.FloatField(blank=True, null=True, default=0)
 
 
	class Meta:
		verbose_name = 'Indicadores_empleo'
		verbose_name_plural = 'Indicadores_empleo'	
	
	def __str__(self):
		return f'{self.year} - {self.departamento}'


class Mar_harvest_tonnes(models.Model):

	year=models.PositiveIntegerField(blank=True, null=True, default=0)
	zona=models.CharField(max_length=255, blank=True, null=True)
	valor=models.FloatField(blank=True, null=True, default=0)
 
 
	class Meta:
		verbose_name = 'Mar_harvest_tonnes'
		verbose_name_plural = 'Mar_harvest_tonnes'	
	
	def __str__(self):
		return f'{self.year} - {self.zona}'


class Mar_sustainability_score(models.Model):

	year=models.PositiveIntegerField(blank=True, null=True, default=0)
	zona=models.CharField(max_length=255, blank=True, null=True)
	valor=models.FloatField(blank=True, null=True, default=0)
 
 
	class Meta:
		verbose_name = 'Mar_sustainability_score'
		verbose_name_plural = 'Mar_sustainability_score'	
	
	def __str__(self):
		return f'{self.year} - {self.zona}'