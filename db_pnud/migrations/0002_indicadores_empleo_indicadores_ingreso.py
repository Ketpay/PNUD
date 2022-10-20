# Generated by Django 4.1.1 on 2022-10-11 09:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('db_pnud', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Indicadores_empleo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.PositiveIntegerField(blank=True, default=0, null=True)),
                ('departamento', models.CharField(blank=True, max_length=255, null=True)),
                ('porcent_agri_pes', models.FloatField(blank=True, default=0, null=True)),
                ('porcent_hot_rest', models.FloatField(blank=True, default=0, null=True)),
                ('porcent_trans_comuni', models.FloatField(blank=True, default=0, null=True)),
            ],
            options={
                'verbose_name': 'Indicadores_empleo',
                'verbose_name_plural': 'Indicadores_empleo',
            },
        ),
        migrations.CreateModel(
            name='Indicadores_ingreso',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.PositiveIntegerField(blank=True, default=0, null=True)),
                ('departamento', models.CharField(blank=True, max_length=255, null=True)),
                ('ingre_prom_men', models.FloatField(blank=True, default=0, null=True)),
            ],
            options={
                'verbose_name': 'Indicadores_empleo',
                'verbose_name_plural': 'Indicadores_empleo',
            },
        ),
    ]
