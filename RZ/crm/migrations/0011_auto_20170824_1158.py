# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2017-08-24 03:58
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('crm', '0010_assetinfo_inviteinof_kefuinof_operateinfo_tginfo'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='InviteInof',
            new_name='InviteInfo',
        ),
        migrations.RenameModel(
            old_name='KeFuInof',
            new_name='KeFuInfo',
        ),
    ]
