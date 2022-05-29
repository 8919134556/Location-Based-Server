from django.db import models
from datetime import datetime
# Create your models here.
class Send_msg(models.Model):
    assign_id = models.AutoField(primary_key=True)

    latt = models.CharField(verbose_name='Latt', db_column="latt", max_length=500,  blank=False,
                                  null=False)
    longt = models.CharField(verbose_name='Longt', db_column="longt", max_length=500, blank=False,
                                  null=False)
    whom= models.CharField(verbose_name='Whom', db_column="whom", max_length=50, blank=False,
                                  null=False)
    content= models.TextField(verbose_name='Content', db_column="content", max_length=500, blank=False,
                                  null=True)
    message= models.TextField(verbose_name='Message', db_column="message", max_length=500, blank=False,
                                  null=True)
    key = models.CharField(verbose_name='Key', db_column="key", max_length=500, blank=False,
                                  null=True)
    accept= models.CharField(verbose_name='Accept', db_column="accept", max_length=50, blank=False,
                                  null=True)
    
    datetime_created = models.DateTimeField(default=datetime.now)
    
    class Meta:
        db_table='Send_msg'