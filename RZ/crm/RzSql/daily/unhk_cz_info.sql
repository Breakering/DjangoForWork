# 非回款充值
SELECT ifnull(sum(a.money),0) unhk_cz
from rz_account.rz_account_recharge a
INNER JOIN rz_user.rz_user_base_info b on a.user_id = b.user_id
INNER JOIN rz_user.rz_user c on a.user_id = c.uid
LEFT JOIN
(
	SELECT a.user_id,min(a.create_time) min_recharge_time
	from rz_account.rz_account_recharge a
	where a.status = 1
	and a.deleted = 0
	GROUP BY a.user_id
) c on a.user_id = c.user_id
LEFT JOIN
(
			SELECT a1.user_id uid
			from rz_borrow.rz_borrow_collection a1
			where a1.borrow_id <> 10000 and a1.status in (0,1,2) and a1.deleted = 0  # 记录没被删除
			and a1.bond_capital = 0 and a1.bond_interest = 0
			and a1.repayment_time >= "{qdate}"
			and a1.repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day)
			UNION
			SELECT a1.user_id uid
			from rz_borrow.rz_bond_collection a1
			where a1.borrow_id <> 10000 and a1.status in (0,1) and a1.deleted = 0  # 记录没被删除
			and a1.bond_capital = 0 and a1.bond_interest = 0
			and a1.collection_time >= "{qdate}"
			and a1.collection_time < DATE_ADD("{qdate}",INTERVAL 1 day)
			UNION
			SELECT r.user_id uid
			from new_wd.borrow_collection r
			LEFT JOIN new_wd.borrow t1 on r.borrow_id = t1.id
			where r.`status` in (0,1,66)
			and DATE_ADD(t1.review_time,INTERVAL t1.time_limit DAY ) >= "{qdate}"
			and DATE_ADD(t1.review_time,INTERVAL t1.time_limit DAY ) < DATE_ADD("{qdate}",INTERVAL 1 day)
			and r.real_total > 0
			UNION
			SELECT a3.user_id uid
			from (
						SELECT * from new_wd.rz_borrow_collection_0 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_1 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_2 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_3 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_4 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_5 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_6 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_7 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_8 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_9 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_10 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_11 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_12 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_13 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_14 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_15 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_16 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_17 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_18 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_19 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_20 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_21 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_22 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_23 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_24 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_25 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_26 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_27 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_28 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_29 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_30 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
						SELECT * from new_wd.rz_borrow_collection_31 where status in (0,1,66) and repayment_time >=  "{qdate}" and repayment_time < DATE_ADD("{qdate}",INTERVAL 1 day)
							) a3
) d on a.user_id = d.uid
where a.status = 1  # 充值成功
and a.deleted = 0  # 记录没被删除
and c.user_type in (1,3) # 投资人
and d.uid is null # 没回款
and DATE(a.create_time) != DATE(c.min_recharge_time)
and a.create_time >=  "{qdate}"
and a.create_time < DATE_ADD("{qdate}",INTERVAL 1 day)
;