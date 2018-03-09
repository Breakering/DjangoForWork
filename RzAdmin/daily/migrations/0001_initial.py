# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-03-07 15:04
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AssetInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, verbose_name='日期')),
                ('term', models.CharField(max_length=32, null=True, verbose_name='期限类型')),
                ('tz_r', models.IntegerField(null=True, verbose_name='投资人数')),
                ('tz_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='投资金额')),
                ('mb_ys', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='满标用时')),
                ('asset_type', models.CharField(default='所有', max_length=32, null=True, verbose_name='资产类型')),
            ],
            options={
                'verbose_name': '日报资产数据',
                'verbose_name_plural': '日报资产数据',
            },
        ),
        migrations.CreateModel(
            name='BaseInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, unique=True, verbose_name='日期')),
                ('zhu_r', models.IntegerField(null=True, verbose_name='注册人数')),
                ('sm_r', models.IntegerField(null=True, verbose_name='实名人数')),
                ('sc_r', models.IntegerField(null=True, verbose_name='首充人数')),
                ('xztz_r', models.IntegerField(null=True, verbose_name='新增投资人数')),
                ('xztz_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='新增投资金额')),
                ('cz_r', models.IntegerField(null=True, verbose_name='充值人数')),
                ('cz_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='充值金额')),
                ('tx_r', models.IntegerField(null=True, verbose_name='提现人数')),
                ('tx_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='提现金额')),
                ('tz_r', models.IntegerField(null=True, verbose_name='投资人数')),
                ('tz_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='投资金额')),
                ('tz_b', models.IntegerField(null=True, verbose_name='投资笔数')),
                ('tz_dl_r', models.IntegerField(null=True, verbose_name='投资登录人数')),
                ('hk_r', models.IntegerField(null=True, verbose_name='回款人数')),
                ('hk_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='回款金额')),
                ('zg_j', models.DecimalField(decimal_places=2, max_digits=30, null=True, verbose_name='站岗金额')),
                ('zg_r', models.IntegerField(null=True, verbose_name='站岗人数')),
                ('zd_r', models.IntegerField(null=True, verbose_name='在贷人数')),
                ('zd_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='在贷金额')),
                ('xt_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='续投金额')),
                ('cz_tz', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='充值并投资')),
            ],
            options={
                'verbose_name': '基础数据',
                'verbose_name_plural': '基础数据',
            },
        ),
        migrations.CreateModel(
            name='CollectClassify',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, verbose_name='日期')),
                ('term', models.CharField(max_length=32, null=True, verbose_name='待收分类')),
                ('collect_r', models.IntegerField(null=True, verbose_name='待收人数')),
                ('collect_j', models.DecimalField(decimal_places=2, max_digits=30, null=True, verbose_name='待收金额')),
                ('collect_type', models.CharField(default='所有', max_length=32, null=True, verbose_name='待收类型')),
            ],
            options={
                'verbose_name': '日报待收分类数据',
                'verbose_name_plural': '日报待收分类数据',
            },
        ),
        migrations.CreateModel(
            name='GeDuanInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, verbose_name='日期')),
                ('geduan', models.CharField(max_length=32, null=True, verbose_name='各端类型')),
                ('recover', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='各端已还')),
                ('recover_withdraw', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='各端回款并提现')),
                ('account', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='各端投资')),
                ('xztz_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='各端新增投资')),
                ('withdraw', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='各端提现金额')),
            ],
            options={
                'verbose_name': '各端数据',
                'verbose_name_plural': '各端数据',
            },
        ),
        migrations.CreateModel(
            name='InviteInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, unique=True, verbose_name='日期')),
                ('invite_r', models.IntegerField(null=True, verbose_name='邀请人数')),
                ('invited_r', models.IntegerField(null=True, verbose_name='被邀请人数')),
                ('invited_st_r', models.IntegerField(null=True, verbose_name='被邀请首投人数')),
                ('invited_st_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='被邀请首投金额')),
                ('cash_f', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='现金奖励发放金额')),
                ('cash_l', models.DecimalField(decimal_places=2, default=0, max_digits=10, null=True, verbose_name='现金奖励领取金额')),
                ('hb_f', models.DecimalField(decimal_places=2, default=0, max_digits=10, null=True, verbose_name='邀请红包发放金额')),
                ('hb_s', models.DecimalField(decimal_places=2, default=0, max_digits=10, null=True, verbose_name='邀请红包使用金额')),
            ],
            options={
                'verbose_name': '邀请数据',
                'verbose_name_plural': '邀请数据',
            },
        ),
        migrations.CreateModel(
            name='LossRate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, verbose_name='日期')),
                ('kefuname', models.CharField(max_length=64, null=True, verbose_name='客服姓名')),
                ('loss_num', models.IntegerField(null=True, verbose_name='流失用户')),
                ('exist_num', models.IntegerField(null=True, verbose_name='在投用户')),
                ('day_invest', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='当日投资金额')),
                ('month_withdraw', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='当月提现金额')),
                ('month_invest', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='当月投资金额')),
                ('recall_num', models.IntegerField(null=True, verbose_name='当月召回人数')),
            ],
            options={
                'verbose_name': 'VIP客服流失率数据',
                'verbose_name_plural': 'VIP客服流失率数据',
            },
        ),
        migrations.CreateModel(
            name='OperateInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, unique=True, verbose_name='日期')),
                ('xz_cz', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='新增充值')),
                ('hk_cz', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='回款并充值')),
                ('unhk_cz', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='非回款充值')),
                ('zj_ft_lv', models.DecimalField(decimal_places=4, max_digits=10, null=True, verbose_name='资金复投率')),
                ('rs_ft_lv', models.DecimalField(decimal_places=4, max_digits=10, null=True, verbose_name='人数复投率')),
            ],
            options={
                'verbose_name': '运营数据',
                'verbose_name_plural': '运营数据',
            },
        ),
        migrations.CreateModel(
            name='OtherInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, unique=True, verbose_name='日期')),
                ('cz_fee', models.DecimalField(decimal_places=2, default=0, max_digits=20, verbose_name='充值手续费')),
                ('short_tz_r', models.IntegerField(null=True, verbose_name='30天以内短标交易人数')),
                ('short_tz_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='30天以内短标交易金额')),
                ('short_zd_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='30天以内短标待还总额')),
                ('Rplan_account', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='R计划投资金额')),
                ('Rplan_recover_account', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='R计划在贷金额')),
                ('g_tz_j', models.DecimalField(decimal_places=2, default=0, max_digits=20, null=True, verbose_name='供应链金融投资金额')),
                ('x_tz_j', models.DecimalField(decimal_places=2, default=0, max_digits=20, null=True, verbose_name='消费金融投资金额')),
                ('Rplan_xt', models.DecimalField(decimal_places=2, default=0, max_digits=20, null=True, verbose_name='R计划续投金额')),
                ('unRplan_xt_hk_j', models.DecimalField(decimal_places=2, default=0, max_digits=20, null=True, verbose_name='非R计划自动续投金额')),
            ],
            options={
                'verbose_name': '其他数据',
                'verbose_name_plural': '其他数据',
            },
        ),
        migrations.CreateModel(
            name='ReCasting',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, verbose_name='日期')),
                ('kefuname', models.CharField(max_length=64, null=True, verbose_name='客服姓名')),
                ('ft_r', models.IntegerField(null=True, verbose_name='首投后复投人数')),
                ('st_r', models.IntegerField(null=True, verbose_name='首投人数')),
                ('ft_lv', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='复投率')),
                ('ft_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='复投金额')),
                ('day_t_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='当日投资金额')),
                ('month_t_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='当月投资金额')),
                ('one_month_ft_r', models.IntegerField(null=True, verbose_name='本月首投后复投人数')),
                ('one_month_st_r', models.IntegerField(null=True, verbose_name='本月首投人数')),
                ('one_month_ft_lv', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='本月首投用户复投率')),
                ('one_month_ft_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='本月首投用户复投金额')),
                ('two_month_ft_r', models.IntegerField(null=True, verbose_name='前两月首投后复投人数')),
                ('two_month_st_r', models.IntegerField(null=True, verbose_name='前两月首投人数')),
                ('two_month_ft_lv', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='前两月首投用户复投率')),
                ('two_month_ft_j', models.DecimalField(decimal_places=2, max_digits=20, null=True, verbose_name='前两月首投用户复投金额')),
            ],
            options={
                'verbose_name': '专属客服复投数据',
                'verbose_name_plural': '专属客服复投数据',
            },
        ),
        migrations.CreateModel(
            name='TgInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, unique=True, verbose_name='日期')),
                ('tg_zhu_r', models.IntegerField(null=True, verbose_name='推广注册人数')),
                ('tg_sm_r', models.IntegerField(null=True, verbose_name='推广实名人数')),
                ('tg_sc_r', models.IntegerField(null=True, verbose_name='推广首充人数')),
                ('tg_xztz_r', models.IntegerField(null=True, verbose_name='推广新增人数')),
                ('tg_xztz_j', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='推广新增金额')),
                ('tg_cost', models.DecimalField(decimal_places=2, default=0, max_digits=10, null=True, verbose_name='推广花费')),
            ],
            options={
                'verbose_name': '推广数据',
                'verbose_name_plural': '推广数据',
            },
        ),
        migrations.CreateModel(
            name='TimeSlot',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, verbose_name='日期')),
                ('timeslot', models.IntegerField(null=True, verbose_name='时间段')),
                ('tz_r', models.IntegerField(null=True, verbose_name='投资人数')),
            ],
            options={
                'verbose_name': '各时间段数据',
                'verbose_name_plural': '各时间段数据',
            },
        ),
        migrations.CreateModel(
            name='WDTY_Info',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, null=True, verbose_name='日期')),
                ('name', models.CharField(max_length=32, null=True, verbose_name='平台名称')),
                ('total', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平台成交额(万)')),
                ('rate', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平台综合利率(%)')),
                ('pnum', models.IntegerField(null=True, verbose_name='平台投资人数(人)')),
                ('cycle', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平台借款周期(月)')),
                ('p1num', models.IntegerField(null=True, verbose_name='平台借款人(人)')),
                ('fuload', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平台满标速度(分钟)')),
                ('alltotal', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平台累计贷款余额(万)')),
                ('capital', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平台资金净流入(万)')),
            ],
            options={
                'verbose_name': '网贷天眼数据信息',
                'verbose_name_plural': '网贷天眼数据信息',
            },
        ),
        migrations.CreateModel(
            name='WDZJ_Info',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, null=True, verbose_name='日期')),
                ('platName', models.CharField(max_length=32, null=True, verbose_name='平台名称')),
                ('amount', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='成交量(万元)')),
                ('incomeRate', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平均预期收益率(%)')),
                ('loanPeriod', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='平均借款期限(月)')),
                ('regCapital', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='注册资本(万元)')),
                ('fullloanTime', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='满标用时(分)')),
                ('stayStillOfTotal', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='待还余额(万元)')),
                ('netInflowOfThirty', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='资金净流入(万元)')),
                ('timeOperation', models.IntegerField(null=True, verbose_name='运营时间(月)')),
                ('bidderNum', models.IntegerField(null=True, verbose_name='投资人数(人)')),
                ('borrowerNum', models.IntegerField(null=True, verbose_name='借款人数(人)')),
                ('totalLoanNum', models.IntegerField(null=True, verbose_name='借款标数(个)')),
                ('top10DueInProportion', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='前十大土豪待收金额占比(%)')),
                ('avgBidMoney', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='人均投资金额(万元)')),
                ('top10StayStillProportion', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='前十大借款人待还金额占比(%)')),
                ('avgBorrowMoney', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='人均借款金额(万元)')),
                ('developZhishu', models.IntegerField(null=True, verbose_name='发展指数排名')),
            ],
            options={
                'verbose_name': '网贷之家数据信息',
                'verbose_name_plural': '网贷之家数据信息',
            },
        ),
        migrations.CreateModel(
            name='WithdrawClassify',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qdate', models.DateField(db_index=True, verbose_name='日期')),
                ('term', models.CharField(max_length=32, null=True, verbose_name='提现分类')),
                ('tx_r', models.IntegerField(null=True, verbose_name='提现人数')),
                ('tx_j', models.DecimalField(decimal_places=2, max_digits=30, null=True, verbose_name='提现金额')),
                ('withdraw_type', models.CharField(default='所有', max_length=32, null=True, verbose_name='提现类型')),
            ],
            options={
                'verbose_name': '日报提现分类数据',
                'verbose_name_plural': '日报提现分类数据',
            },
        ),
        migrations.AlterUniqueTogether(
            name='withdrawclassify',
            unique_together=set([('qdate', 'term')]),
        ),
        migrations.AlterUniqueTogether(
            name='wdzj_info',
            unique_together=set([('qdate', 'platName')]),
        ),
        migrations.AlterUniqueTogether(
            name='wdty_info',
            unique_together=set([('qdate', 'name')]),
        ),
        migrations.AlterUniqueTogether(
            name='timeslot',
            unique_together=set([('qdate', 'timeslot')]),
        ),
        migrations.AlterUniqueTogether(
            name='recasting',
            unique_together=set([('qdate', 'kefuname')]),
        ),
        migrations.AlterUniqueTogether(
            name='lossrate',
            unique_together=set([('qdate', 'kefuname')]),
        ),
        migrations.AlterUniqueTogether(
            name='geduaninfo',
            unique_together=set([('qdate', 'geduan')]),
        ),
        migrations.AlterUniqueTogether(
            name='collectclassify',
            unique_together=set([('qdate', 'term')]),
        ),
        migrations.AlterUniqueTogether(
            name='assetinfo',
            unique_together=set([('qdate', 'term', 'asset_type')]),
        ),
    ]