# 用户在贷
SELECT a.uid,sum(a.recover_account) recover_account
from
(
		# 没债转的在贷
		SELECT a.user_id uid,a.repayment_amount recover_account
		from rz_borrow.rz_borrow_collection a
		INNER JOIN rz_borrow.rz_borrow b on a.borrow_id=b.id
		where b.full_time != "0000-00-00 00:00:00"
		and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day)
		and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day)
		and a.status in (0,1,2) and a.deleted = 0  # 记录没被删除
		and a.bond_capital = 0 and a.bond_interest = 0  # 剔除债转的
		UNION ALL
		# 债转换了个人的在贷
		SELECT a.user_id uid,a.collection_amount recover_account
		from rz_borrow.rz_bond_collection a
		INNER JOIN rz_borrow.rz_borrow b on a.borrow_id=b.id
		where b.full_time != "0000-00-00 00:00:00"
		and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day)
		and a.collection_time >= DATE_ADD("{qdate}",INTERVAL 1 day)
		and a.status in (0,1) and a.deleted = 0  # 记录没被删除
		and a.bond_capital = 0 and a.bond_interest = 0  # 剔除再债转的
		UNION ALL
		SELECT  a.user_id,a.repayment_amount
		from
		(
				SELECT a.* from new_wd.rz_borrow_collection_0 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day)  UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_1 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_2 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_3 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_4 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_5 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_6 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_7 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_8 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_9 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_10 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_11 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_12 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_13 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_14 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_15 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_16 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_17 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_18 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_19 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_20 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_21 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_22 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_23 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_24 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_25 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_26 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_27 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_28 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_29 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_30 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day) UNION ALL
				SELECT a.* from new_wd.rz_borrow_collection_31 a INNER JOIN new_wd.rz_borrow_big b on a.big_borrow_id=b.id where a.`status` in (0,1,66) and b.full_time < DATE_ADD("{qdate}",INTERVAL 1 day) and b.full_time != "0000-00-00 00:00:00" and a.repayment_time >= DATE_ADD("{qdate}",INTERVAL 1 day)
		) a
) a
GROUP BY a.uid
;
