# 充值并投资
SELECT sum(t2.account) cz_tz
from
(
  SELECT t1.uid,case when t1.money <= t1.account then t1.money else t1.account end account
  from
  (
    SELECT a.uid,a.money,ifnull(t.account,0) account
    from
    (
        SELECT a.user_id uid,sum(a.money) money
        from rz_account.rz_account_recharge a
        INNER JOIN rz_user.rz_user_base_info b on a.user_id = b.user_id
        where b.customer_user_id not in (145854,73170,73195,73721,112103,244848,276009,304525,1,181135,757996,910859)
        and a.user_id not in (740,181,827,1008,1444,1451,1435,1452,6420,7127,11336,11350,11353,11871,12135,5528,18710,19104,19103,27632,6094,12668,14288)
        and a.status = 1  # 充值成功
        and a.deleted = 0  # 记录没被删除
        and a.create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day)
        and a.create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day)
        GROUP BY a.user_id
    ) a
    LEFT JOIN
    (
        SELECT a.uid,sum(a.account) account
        from
        (
          SELECT user_id uid,create_time time_h,real_amount account
          from rz_borrow.rz_borrow_tender
          where borrow_id != 10000 and `status` in (0,1,2,3,4,5,6) and deleted = 0  # 记录没被删除
          and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day)
          and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day)
          UNION ALL
          SELECT user_id,add_time,real_amount
          from new_wd.borrow_tender
          where status = 1
          and add_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day)
          and add_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day)
          UNION ALL
          SELECT a3.user_id,a3.create_time,a3.real_amount from (
                (SELECT * FROM new_wd.rz_borrow_tender_0 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_1 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_2 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_3 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_4 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_5 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_6 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_7 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_8 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_9 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_10 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_11 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_12 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_13 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_14 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_15 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_16 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_17 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_18 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_19 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_20 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_21 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_22 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_23 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_24 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_25 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_26 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_27 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_28 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_29 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_30 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))  union all
                (SELECT * FROM new_wd.rz_borrow_tender_31 where `status` = 1 and create_time >=  DATE_SUB(CURDATE(),INTERVAL 1 day) and create_time < DATE_ADD(DATE_SUB(CURDATE(),INTERVAL 1 day),INTERVAL 1 day))
              ) a3
        ) a
        GROUP BY a.uid
     ) t on a.uid = t.uid
  ) t1
) t2