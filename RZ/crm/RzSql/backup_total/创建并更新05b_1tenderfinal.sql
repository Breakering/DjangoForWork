CREATE TABLE `05b_1tenderfinal` (
	`pk_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `bid` int(15) NOT NULL DEFAULT '0' COMMENT '标的id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户名称',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态 0 表示已经冻结， 1 表示已经投资成功，2 表示其他，比如已经撤销',
  `account` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '实际投资金额',
  `recover_account_all` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '收款总额',
  `recover_account_interest` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '收款总利息',
  `recover_account_yes` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '已收总额',
  `recover_account_interest_yes` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '已收利息',
  `recover_account_capital_yes` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '已收本金',
  `recover_account_sxf_yes` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '手续费：利息手续费，本金无',
  `recover_account_wait` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '待收总额',
  `recover_account_interest_wait` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '待收利息',
  `recover_account_capital_wait` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '待收本金',
  `recover_times` int(10) NOT NULL DEFAULT '0' COMMENT '已收期数',
  `contents` varchar(250) NOT NULL DEFAULT ' ',
  `successtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后操作时间',
  `time_h` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `per` int(11) NOT NULL DEFAULT '0' COMMENT '预投标 1表示最终完成 0 是预投标用户还没完成资金转换的 , 如果转账失败回调中会修改为 -1',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '所属站点',
  `at_1` decimal(12,2) NOT NULL DEFAULT '-1.00',
  `at_2` decimal(12,2) NOT NULL DEFAULT '-1.00',
  `at_4` decimal(12,2) NOT NULL DEFAULT '-1.00',
  `at_5` decimal(12,2) NOT NULL DEFAULT '-1.00' COMMENT '在途金额',
  `orguid` int(11) DEFAULT '0' COMMENT '最早的用户id',
  `sent_ancun` tinyint(1) DEFAULT '0' COMMENT '判断是否已发送安存',
  `save_ancun` varchar(32) DEFAULT '' COMMENT '保全号',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '债权ID',
  `lzid` int(11) NOT NULL DEFAULT '0' COMMENT '流转标投标ID',
  `aprplus` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '加息幅度',
  `recover_account_interest_plus` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '加息券利息',
  `recover_account_interest_plus_yes` decimal(10,0) DEFAULT NULL COMMENT '加息券利息已还',
  `hbid` varchar(20) NOT NULL DEFAULT '' COMMENT '使用的红包ID',
  `jxid` int(11) NOT NULL DEFAULT '0' COMMENT '使用加息券ID',
  `htid` varchar(100) NOT NULL DEFAULT '' COMMENT '合同编号',
  PRIMARY KEY (`pk_id`),
  KEY `uid` (`uid`,`status`),
  KEY `NewIndex1` (`status`,`successtime`),
  KEY `lzid` (`lzid`),
  KEY `idx_time_h` (`time_h`)
) ENGINE=InnoDB AUTO_INCREMENT=803662 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='投资';



insert into 05b_1tenderfinal
(     `id` ,
  `bid`,
  `uid` ,
  `status` ,
  `account`,
  `recover_account_all` ,
  `recover_account_interest` ,
  `recover_account_yes`,
  `recover_account_interest_yes` ,
  `recover_account_capital_yes`,
  `recover_account_sxf_yes`,
  `recover_account_wait` ,
  `recover_account_interest_wait` ,
  `recover_account_capital_wait` ,
  `recover_times`,
  `contents` ,
  `successtime`,
  `time_h` ,
  `per`,
  `pid` ,
  `cid` ,
  `at_1` ,
  `at_2`,
  `at_4` ,
  `at_5`,
  `orguid`,
  `sent_ancun`,
  `save_ancun`,
  `tid`,
  `lzid`,
  `aprplus`,
  `recover_account_interest_plus`,
  `recover_account_interest_plus_yes`,
  `hbid`,
  `jxid`,
  `htid`)
select   `id` ,
  `bid`,
  `uid` ,
  `status` ,
  `account`,
  `recover_account_all` ,
  `recover_account_interest` ,
  `recover_account_yes`,
  `recover_account_interest_yes` ,
  `recover_account_capital_yes`,
  `recover_account_sxf_yes`,
  `recover_account_wait` ,
  `recover_account_interest_wait` ,
  `recover_account_capital_wait` ,
  `recover_times`,
  `contents` ,
  `successtime`,
  `time_h` ,
  `per`,
  `pid` ,
  `cid` ,
  `at_1` ,
  `at_2`,
  `at_4` ,
  `at_5`,
  `orguid`,
  `sent_ancun`,
  `save_ancun`,
  `tid`,
  `lzid`,
  `aprplus`,
  `recover_account_interest_plus`,
  `recover_account_interest_plus_yes`,
  `hbid`,
  `jxid`,
  `htid`
from wd.05b_1tenderfinal
WHERE time_h <= DATE_FORMAT(DATE_SUB(curdate(),INTERVAL 1 DAY),"%Y-%m-%d 23:30:00");
