# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2017-08-29 02:18
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('crm', '0014_delete_wdzj_info'),
    ]

    operations = [
        migrations.CreateModel(
            name='WDZJ_Info',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, null=True, verbose_name='日期')),
                ('platName', models.CharField(max_length=32, verbose_name='平台名称')),
                ('amount', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='成交量(万元)')),
                ('incomeRate', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='平均预期收益率(%)')),
                ('loanPeriod', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='平均借款期限(月)')),
                ('regCapital', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='注册资本(万元)')),
                ('fullloanTime', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='满标用时(分)')),
                ('stayStillOfTotal', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='待还余额(万元)')),
                ('netInflowOfThirty', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='资金净流入(万元)')),
                ('timeOperation', models.IntegerField(verbose_name='运营时间(月)')),
                ('bidderNum', models.IntegerField(verbose_name='投资人数(人)')),
                ('borrowerNum', models.IntegerField(verbose_name='借款人数(人)')),
                ('totalLoanNum', models.IntegerField(verbose_name='借款标数(个)')),
                ('top10DueInProportion', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='前十大土豪待收金额占比(%)')),
                ('avgBidMoney', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='人均投资金额(万元)')),
                ('top10StayStillProportion', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='前十大借款人待还金额占比(%)')),
                ('avgBorrowMoney', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='人均借款金额(万元)')),
                ('developZhishu', models.IntegerField(verbose_name='发展指数排名')),
            ],
        ),
    ]
