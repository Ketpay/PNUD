# Generated by Django 4.1.1 on 2022-10-20 16:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('db_pnud', '0005_mar_sustainability_score'),
    ]

    operations = [
        migrations.AddField(
            model_name='liv_trend',
            name='zona',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
