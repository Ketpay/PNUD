# Generated by Django 4.1.1 on 2022-10-12 14:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('db_pnud', '0004_rename_tipo_mar_harvest_tonnes_zona'),
    ]

    operations = [
        migrations.CreateModel(
            name='Mar_sustainability_score',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.PositiveIntegerField(blank=True, default=0, null=True)),
                ('zona', models.CharField(blank=True, max_length=255, null=True)),
                ('valor', models.FloatField(blank=True, default=0, null=True)),
            ],
            options={
                'verbose_name': 'Mar_sustainability_score',
                'verbose_name_plural': 'Mar_sustainability_score',
            },
        ),
    ]
