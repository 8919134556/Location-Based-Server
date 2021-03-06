# Generated by Django 3.2.8 on 2022-05-23 06:06

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User_Register',
            fields=[
                ('assign_id', models.AutoField(primary_key=True, serialize=False)),
                ('user_name', models.CharField(db_column='user_name', max_length=50, verbose_name='User_Name')),
                ('user_lastname', models.CharField(db_column='user_lastname', max_length=50, verbose_name='User_Lastname')),
                ('gender', models.CharField(db_column='gender', max_length=50, verbose_name='Gender')),
                ('country', models.CharField(db_column='country', max_length=50, verbose_name='Country')),
                ('state', models.CharField(db_column='state', max_length=50, verbose_name='State')),
                ('city', models.CharField(db_column='city', max_length=50, verbose_name='City')),
                ('date_of_birth', models.DateField(db_column='date_of_birth', verbose_name='Date_Of_Birth')),
                ('addres', models.CharField(db_column='addres', max_length=50, verbose_name='Addres')),
                ('pincode', models.CharField(db_column='pincode', max_length=50, verbose_name='Pincode')),
                ('user_phone', models.BigIntegerField(db_column='user_phone', verbose_name='User_Phone')),
                ('user_email', models.EmailField(blank=True, db_column='user_email', max_length=100, null=True, verbose_name='User_Email')),
                ('user_pwd', models.CharField(db_column='user_pwd', max_length=100, verbose_name='User_Password')),
                ('datetime_created', models.DateTimeField(default=datetime.datetime.now)),
            ],
            options={
                'db_table': 'User_Register',
            },
        ),
    ]
