# 注册详情
SELECT count(DISTINCT(a.uid)) zhu_r
from 01u_0info a
LEFT JOIN (SELECT uid from 01u_0info where mobile like "JM%") b on a.uid = b.uid      # 机密借款人注册
where a.uid_kefu not in (145854,73170,73195,73721,112103,244848,276009,304525,1,181135,757996,910859)
and a.uid not in (740,181,827,1008,1444,1451,1435,1452,6420,7127,11336,11350,11353,11871,12135,5528,18710,19104,19103,27632,6094,12668,14288)
and b.uid is null  # 剔除机密借款人
and DATE(a.time_h) = DATE_SUB(CURDATE(),INTERVAL 1 DAY)
;