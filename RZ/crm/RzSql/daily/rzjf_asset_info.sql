SELECT a.qdate,a.term,sum(a.tz_r) tz_r,sum(a.tz_j) tz_j,AVG(a.mb_ys) mb_ys
from
(
SELECT qdate,case when term < 10 then "A:1-10天"
when term >= 10 and term < 30 then "B:10-30天"
when term >= 30 and term < 60 then "C:30-60天"
when term >= 60 and term < 90 then "D:60-90天"
when term >= 90 and term < 180 then "E:90-180天"
else "F:180天及以上"
end term,tz_r,tz_j,mb_ys
from rzjf_asset_info
where unix_timestamp(qdate) >= unix_timestamp("{qdate}") - {section} * 86400 + 86400
and unix_timestamp(qdate) < unix_timestamp("{qdate}")+86400
) a
GROUP BY a.qdate,a.term
ORDER BY a.qdate