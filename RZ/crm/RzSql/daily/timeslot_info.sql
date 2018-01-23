# 各时间段投资人数详情
SELECT sj.shijian timeslot,case when sx.renshu is null then 0 else sx.renshu end tz_r
from
(
	SELECT DATE_FORMAT(aa.create_time,"%H") shijian
	from rz_borrow.rz_borrow_tender aa
	GROUP BY DATE_FORMAT(aa.create_time,"%H")
) sj
LEFT JOIN
(
	SELECT DATE_FORMAT(a.time_h,"%H") shijian,count(DISTINCT(a.uid)) renshu
	from
	(
			SELECT user_id uid,create_time time_h,money account
			from rz_borrow.rz_borrow_tender
			where borrow_id <> 10000 and `status` in (0,1,2,3,4,5,6,11) and deleted = 0  # 记录没被删除
			and create_time >= "{qdate}"
			and create_time < DATE_ADD("{qdate}",INTERVAL 1 day)
			UNION ALL
			SELECT user_id,add_time,real_amount
			from new_wd.borrow_tender
			where status = 1
			and add_time >= "{qdate}"
			and add_time < DATE_ADD("{qdate}",INTERVAL 1 day)
			UNION ALL
			SELECT a3.user_id,a3.create_time,a3.real_amount
			from new_wd.rz_borrow_tender a3
			where a3.`status` = 1
			and a3.create_time >= "{qdate}"
			and a3.create_time < DATE_ADD("{qdate}",INTERVAL 1 day)
	) a
	GROUP BY DATE_FORMAT(a.time_h,"%H")
) sx
on sj.shijian=sx.shijian
;
