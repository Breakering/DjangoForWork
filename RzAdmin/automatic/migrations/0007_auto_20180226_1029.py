# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-02-26 10:29
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('automatic', '0006_usersearchlog'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='userprofile',
            options={'permissions': (('can_access_search_table_list', '可以访问数据查询功能页面'), ('can_access_table_search_detail', '可以访问详细查询页面并查询数据'), ('can_search_channel_name', '可以查询渠道名称'), ('can_download_excel', '可以下载EXCEL'), ('can_access_user_center', '可以访问用户中心'), ('can_access_download_check', '可以访问下载审核页面'), ('can_post_download_check', '可以提交下载审核'), ('can_delete_download_record', '可以删除下载纪录'), ('can_upload_file', '可以上传审核图片'), ('can_change_avatar', '可以修改用户头像'), ('can_access_automatic_index', '可以访问自动化后台首页'), ('can_access_kind_admin_userprofile_table', '可以通过kind_admin插件访问账户表'), ('can_access_kind_admin_userprofile_table_change', '可以通过kind_admin插件访问账户表信息修改页'), ('can_change_kind_admin_userprofile_table', '可以通过kind_admin插件修改账户表信息'), ('can_access_kind_admin_table_index', '可以通过kind_admin插件访问APP库即展示所有注册的model'), ('can_access_kind_admin_all_table_objs', '可以访问kind_admin插件下注册的所有table'), ('can_change_or_do_action_kind_admin_all_table_objs', '可以对kind_admin注册的所有table进行行内编辑和action操作'), ('can_access_kind_admin_all_table_change', '可以访问kind_admin注册的所有table修改页面'), ('can_change_kind_admin_all_table_detail', '可以修改kind_admin注册的所有table信息'), ('can_access_change_password', '可以访问密码修改页'), ('can_change_own_password', '可以修改自己账号的密码'), ('can_change_all_user_password', '可以修改所有人的账号密码'), ('can_access_kind_admin_table_delete', '可以访问kind_admin插件下注册的所有table的删除页面'), ('can_delete_kind_admin_table_detail', '可以删除kind_admin插件下注册的所有table信息'), ('can_access_kind_admin_table_add', '可以访问kind_admin插件下注册的所有table的添加页面'), ('can_add_kind_admin_table_detail', '可以添加kind_admin插件下注册的所有table信息'), ('can_access_kind_admin_download_record', '可以访问用户提交下载记录页面'), ('can_change_or_do_action_kind_admin_download_record', '可以对用户提交下载记录页面进行行内编辑和action操作'), ('can_access_kind_admin_download_record_detail', '可以访问用户具体的下载信息'), ('can_change_kind_admin_download_record_detail', '可以修改用户具体的下载信息'), ('can_access_kind_admin_download_record_delete', '可以访问删除用户下载信息页面'), ('can_delete_kind_admin_download_record', '可以删除用户下载信息'), ('can_access_kind_admin_sqlrecord_add', '可以访问添加SQL记录页面'), ('can_add_kind_admin_sqlrecord', '可以添加SQL记录'), ('can_access_kind_admin_sqlrecord', '可以访问查看所有SQL记录页面'), ('can_change_or_do_action_kind_admin_sqlrecord', '可以对查看所有SQL记录页面进行行内编辑和action操作'), ('can_access_kind_admin_sqlrecord_change', '可以访问SQL记录修改页面'), ('can_change_kind_admin_sqlrecord', '可以修改SQL记录'), ('can_access_kind_admin_usersearchlog', '可以访问用户查询记录页面')), 'verbose_name_plural': '账户表'},
        ),
    ]
