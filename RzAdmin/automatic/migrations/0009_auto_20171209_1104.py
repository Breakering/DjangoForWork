# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-12-09 03:04
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('automatic', '0008_auto_20171209_1103'),
    ]

    operations = [
        migrations.RenameField(
            model_name='sqlrecord',
            old_name='func',
            new_name='funcs',
        ),
    ]
