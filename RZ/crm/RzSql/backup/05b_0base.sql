insert into 05b_0base(`bid`,`status`,`curstate`,`stoptrans`,`diya_type`,`cid`,`uid` ,`aid`,`name` ,`flag` ,`account`,`account_diya` ,`account_diyafanhuan`,`account_zjf`,`bid_bzj`,`borrow_style` ,
`borrow_period`,`pflag`,`borrow_apr`,`borrow_webapr`,`borrow_contents`,`borrow_valid_time`,`borrower_apr`,`tender_account_min` ,`tender_account_max`,`limit_money`,`repay_each_time`,`cash_status`,`verify_userid`,
`verify_remark`,`reverify_userid`,`reverify_remark` ,`verify_username`,`reverify_username`,`days`,`time_h`,`is_xudai`,`repay_account`,`borrow_yongtu`,`repay_account_capital`,`repay_account_interest`,`repay_account_other`,
`verify_time`,`reverify_time`,`borrow_jiangli`,`tend_jiangli_type`,`app_jiangli`,`uid_add`,`uname_add`,`uid_zj`,`uname_zj`,`money_zj`,`dj_type`,`dj_sq`,`lxglf`,`note`,`is_old`,`imeis`,`bnum` ,`yewuyuan` ,`yewuid`,
`classify`,`bnumht`,`isapp` ,`doflag`,`workflow_step` ,`infonum`,`min_period`,`useruid`,`isAssign` , `border`,`hetong_tpl_id`,`pre_track_warning`,`sent_ancun`,`save_ancun`, `border_web` ,`tender_account_d` ,
`repay_interest_plus`,`thhtbh`,`esc_status`
) select `bid`,`status`,`curstate`,`stoptrans`,`diya_type`,`cid`,`uid` ,`aid`,`name` ,`flag` ,`account`,`account_diya` ,`account_diyafanhuan`,`account_zjf`,`bid_bzj`,`borrow_style` ,
`borrow_period`,`pflag`,`borrow_apr`,`borrow_webapr`,`borrow_contents`,`borrow_valid_time`,`borrower_apr`,`tender_account_min` ,`tender_account_max`,`limit_money`,`repay_each_time`,`cash_status`,`verify_userid`,
`verify_remark`,`reverify_userid`,`reverify_remark` ,`verify_username`,`reverify_username`,`days`,`time_h`,`is_xudai`,`repay_account`,`borrow_yongtu`,`repay_account_capital`,`repay_account_interest`,`repay_account_other`,
`verify_time`,`reverify_time`,`borrow_jiangli`,`tend_jiangli_type`,`app_jiangli`,`uid_add`,`uname_add`,`uid_zj`,`uname_zj`,`money_zj`,`dj_type`,`dj_sq`,`lxglf`,`note`,`is_old`,`imeis`,`bnum` ,`yewuyuan` ,`yewuid`,
`classify`,`bnumht`,`isapp` ,`doflag`,`workflow_step` ,`infonum`,`min_period`,`useruid`,`isAssign` , `border`,`hetong_tpl_id`,`pre_track_warning`,`sent_ancun`,`save_ancun`, `border_web` ,`tender_account_d` ,
`repay_interest_plus`,`thhtbh`,`esc_status` from wd.05b_0base
where time_h > DATE_FORMAT(DATE_SUB(curdate(),INTERVAL 1 DAY),"%Y-%m-%d 23:30:00") and time_h <= DATE_FORMAT(curdate(),"%Y-%m-%d 23:30:00");
