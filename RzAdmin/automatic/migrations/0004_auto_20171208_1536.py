# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-12-08 07:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('automatic', '0003_userprofile_themes'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='themes',
            field=models.CharField(choices=[('type-a/theme-coffee.min.css', 'A类coffee色'), ('type-a/theme-dark.min.css', 'A类dark'), ('type-a/theme-dust.min.css', 'A类dust'), ('type-a/theme-light.min.css', 'A类light'), ('type-a/theme-lime.min.css', 'A类lime'), ('type-a/theme-mint.min.css', 'A类mint'), ('type-a/theme-navy.min.css', 'A类navy'), ('type-a/theme-ocean.min.css', 'A类ocean'), ('type-a/theme-prickly-pear.min.css', 'A类prickly-pear'), ('type-a/theme-purple.min.css', 'A类purple'), ('type-a/theme-well-red.min.css', 'A类well-red'), ('type-a/theme-yellow.min.css', 'A类yellow')], default='A类coffee色', max_length=64, verbose_name='主题'),
        ),
    ]