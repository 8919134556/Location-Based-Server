# Generated by Django 3.2.8 on 2022-05-23 07:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0002_auto_20220523_1254'),
    ]

    operations = [
        migrations.AlterField(
            model_name='send_msg',
            name='latt',
            field=models.CharField(db_column='latt', max_length=100, verbose_name='Latt'),
        ),
        migrations.AlterField(
            model_name='send_msg',
            name='longt',
            field=models.CharField(db_column='longt', max_length=100, verbose_name='Longt'),
        ),
    ]
