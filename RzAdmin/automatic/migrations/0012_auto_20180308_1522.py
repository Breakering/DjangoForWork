# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-03-08 15:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('automatic', '0011_auto_20180308_1102'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sqlrecord',
            name='nick_name',
            field=models.CharField(blank=True, max_length=128, null=True, unique=True, verbose_name='sql昵称'),
        ),
    ]