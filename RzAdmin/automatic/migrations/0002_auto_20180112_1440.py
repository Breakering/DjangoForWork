# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-12 14:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('automatic', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sqlusage',
            name='name',
            field=models.CharField(max_length=64, verbose_name='SQL记录用途'),
        ),
    ]
