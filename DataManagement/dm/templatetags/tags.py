#! /usr/bin/env python
# -*- coding: utf-8 -*-
# __author__ = "Breakering"
# Date: 2017/11/14
from datetime import date
from django.utils.timezone import datetime, timedelta
from django import template
from django.utils.safestring import mark_safe

register = template.Library()


def get_condition_str(condition_dict):
    """拼接过滤条件"""
    condition_str = ""
    for k, v in condition_dict.items():
        condition_str += "&%s=%s" % (k, v)
    return condition_str


@register.simple_tag
def get_all_condition_str(condition_dict, order_by_dict, search_content):
    """拼接所有条件"""
    all_condition_str = "o=%s&_q=%s" % (order_by_dict.get("current_order_by_key", ""), search_content)
    condition_str = get_condition_str(condition_dict)
    return all_condition_str + condition_str


@register.simple_tag
def get_table_thead(admin_class, column):
    """获取表头的中文名称"""
    return admin_class.model._meta.get_field(column).verbose_name


@register.simple_tag
def get_head_name(admin_class, order_by_dict, condition_dict, search_content=""):
    """获取表头"""
    th_ele = ""
    condition_str = get_condition_str(condition_dict)
    for field in admin_class.list_display:
        if field in order_by_dict:
            order_by_key = order_by_dict.get(field)
            if order_by_key.startswith("-"):
                sort_icon = '''<i class="fa fa-sort-up" aria-hidden="true"></i>'''
            else:
                sort_icon = '''<i class="fa fa-sort-desc" aria-hidden="true"></i>'''
        else:
            order_by_key = field
            sort_icon = ''
        th_ele += '<th><a href="?o=%s%s&_q=%s">%s</a> %s</th>' % (
            order_by_key,
            condition_str,
            search_content,
            admin_class.model._meta.get_field(field).verbose_name,
            sort_icon
        )
    return mark_safe(th_ele)


@register.simple_tag
def get_table_rows(obj, admin_class):
    """获取表中的每行"""
    td_ele = ""
    unadd_url = True
    for field in admin_class.list_display:
        field_obj = obj._meta.get_field(field)  # 获取字段对象
        if field_obj.choices:
            column_data = getattr(obj, "get_%s_display" % field)()
        else:
            column_data = getattr(obj, field)
        if isinstance(column_data, datetime):
            column_data = column_data.strftime("%Y-%m-%d %H:%M:%S")
        if isinstance(column_data, date):
            column_data = column_data.strftime("%Y-%m-%d")
        if unadd_url:
            auto_field_data = getattr(obj, admin_class.model._meta.auto_field.name)
            td_ele += '<td><a href="/dm/edit_sql/%s/">%s</a></td>' % (auto_field_data, column_data)
            unadd_url = False  # 加上了URL
        else:
            td_ele += '<td>%s</td>' % column_data
    return mark_safe(td_ele)


@register.simple_tag
def get_page_ele(query_sets, condition_dict=None, order_by_dict=None, search_content=""):
    """生成想要显示的分页标签"""
    page_ele = ""  # 要返回的分页HTML
    condition_str = ""  # 过滤条件
    current_order_by_key = ""  # 排序条件
    if condition_dict:
        condition_str = get_condition_str(condition_dict)
    if order_by_dict:
        current_order_by_key = order_by_dict.get("current_order_by_key", "")
    # 上一页
    if query_sets.has_previous():
        page_ele += '''<li><a href="?page=%s%s&o=%s&_q=%s">«</a></li>''' % (
            query_sets.previous_page_number(), condition_str, current_order_by_key, search_content
        )
    else:
        page_ele += '''<li><a href="#">«</a></li>'''
    # 显示的页数
    for loop_num in query_sets.paginator.page_range:
        if loop_num < 3 or loop_num > query_sets.paginator.num_pages - 2 or abs(
                        loop_num - query_sets.number) < 2:  # 最前2页和最后两页以及当前页及当前页前后两页
            actived = ""
            if loop_num == query_sets.number:
                actived = "active"
            page_ele += '''<li class="%s"><a href="?page=%s%s&o=%s&_q=%s">%s</a></li>''' % (
                actived, loop_num, condition_str, current_order_by_key, search_content, loop_num
            )
        elif abs(loop_num - query_sets.number) == 2:
            page_ele += '''<li><a>...</a></li>'''
    # 下一页
    if query_sets.has_next():
        page_ele += '''<li><a href="?page=%s%s&o=%s&_q=%s">»</a></li>''' % (
            query_sets.next_page_number(), condition_str, current_order_by_key, search_content
        )
    else:
        page_ele += '''<li><a href="#">»</a></li>'''
    return mark_safe(page_ele)


@register.simple_tag
def get_condition_ele(filter_field, admin_class, condition_dict):
    """生成过滤select"""
    condition_ele = '''<select class="form-control" name={filter_field}>'''
    field_obj = admin_class.model._meta.get_field(filter_field)
    if type(field_obj).__name__ in ["DateTimeField", "DateField"]:
        filter_field = "%s__gte" % filter_field
        today = datetime.now().date()
        choices = [
            ('', '---------'),
            (today, '今天'),
            (today - timedelta(days=1), '昨天至今天'),
            (today - timedelta(days=7), '近7天'),
            (today.replace(day=1), '本月'),
            (today - timedelta(days=30), '近30天'),
            (today - timedelta(days=90), '近90天'),
            (today.replace(month=1, day=1), '本年'),
            (today - timedelta(days=180), '近180天'),
            (today - timedelta(days=365), '近365天'),
        ]
    else:
        choices = field_obj.get_choices()  # 过滤选项
    for choices_data in choices:
        selected = ""
        if condition_dict.get(filter_field) == str(choices_data[0]):
            selected = "selected"
        condition_ele += '''<option value="%s" %s>%s</option>''' % (choices_data[0], selected, choices_data[1])
    condition_ele += '''</select>'''
    condition_ele = condition_ele.format(filter_field=filter_field)
    return mark_safe(condition_ele)


@register.simple_tag
def check_detail_get_table_rows(request, item):
    """查看详细页面的表中的每行"""
    '''
    {% for v in item.values %}
        <td style="white-space:nowrap">{{ v }}</td>
    {% endfor %}
    '''
    td_ele = ""
    detaile_jurisdiction = ["数据组", "管理员"]  # 有详细信息查看权限的角色
    user_roles_list = [i[0] for i in list(request.user.userprofile.roles.values_list("name")) if
                       i[0] in detaile_jurisdiction]
    for k, v in item.items():
        if isinstance(v, datetime):
            v = datetime.strftime(v, "%Y-%m-%d %H:%M:%S")
        if isinstance(v, date):
            v = date.strftime(v, "%Y-%m-%d")
        # print([i[0] for i in list(request.user.userprofile.roles.values_list("name"))])
        if len(user_roles_list) == 0:
            if k in ["姓名", "uname", "用户名", "un"]:
                v = "%s%s" % (v[:1], "*" * len(v[1:]))
            if k in ["手机", "手机号", "mobile"]:
                v = "%s%s%s" % (v[0:3], "****", v[7:])
            if k in ["身份证"]:
                v = "%s%s%s" % (v[0:5], "*" * 9, v[14:])
        td_ele += '<td style="white-space:nowrap">%s</td>' % v
    return mark_safe(td_ele)


@register.simple_tag
def check_detail_get_table_head(query_sets, condition_dict, order_by_dict, search_content):
    """查看详细页面的表头"""
    '''
    {% for k in query_sets.0.keys %}
        <th style="white-space:nowrap">{{ k }}</th>
    {% endfor %}
    '''
    th_ele = ""
    condition_str = get_condition_str(condition_dict)
    for k in query_sets[0].keys():
        if k in order_by_dict:
            order_by_key = order_by_dict.get(k)
            if order_by_key.startswith("-"):
                sort_icon = '''<i class="fa fa-sort-up" aria-hidden="true"></i>'''
            else:
                sort_icon = '''<i class="fa fa-sort-desc" aria-hidden="true"></i>'''
        else:
            order_by_key = k
            sort_icon = ""
        th_ele += '<th style="white-space:nowrap"><a href="?o=%s%s&_q=%s">%s</a>%s</th>' % (
            order_by_key, condition_str, search_content, k, sort_icon
        )
    return mark_safe(th_ele)
