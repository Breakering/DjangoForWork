insert into borrow_tender select * from new_wd.borrow_tender
where add_time > DATE_FORMAT(DATE_SUB(curdate(),INTERVAL 1 DAY),"%Y-%m-%d 23:30:00") and create_time <= DATE_FORMAT(curdate(),"%Y-%m-%d 23:30:00");
