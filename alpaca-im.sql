/*
 Navicat Premium Dump SQL

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : alpaca-im

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 22/04/2025 09:48:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat_banned
-- ----------------------------
DROP TABLE IF EXISTS `chat_banned`;
CREATE TABLE `chat_banned` (
  `banned_id` bigint NOT NULL COMMENT '封禁id',
  `banned_reason` varchar(200) DEFAULT NULL COMMENT '封禁原因',
  `banned_time` datetime DEFAULT NULL COMMENT '封禁时间',
  PRIMARY KEY (`banned_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='封禁状态';

-- ----------------------------
-- Records of chat_banned
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_config
-- ----------------------------
DROP TABLE IF EXISTS `chat_config`;
CREATE TABLE `chat_config` (
  `config_key` varchar(32) NOT NULL COMMENT 'key',
  `config_value` longtext COMMENT 'value',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_key`),
  UNIQUE KEY `idx_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设置表';

-- ----------------------------
-- Records of chat_config
-- ----------------------------
BEGIN;
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('apply_friend', '50', '申请好友单日次数');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('apply_group', '30', '申请群组单日次数');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('group_level_count', '50', '群组成员默认数量');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('group_name_search', 'N', '群组名称搜索开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('notice_content', '重要通知：近期诈骗犯罪案件时有发生，为防止您在经济上蒙受损失，请您接到陌生人或以熟人名义要求转账、汇款时，务必提高警惕，以防受骗', '系统通告');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('notice_status', 'Y', '系统通告开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_audit', 'N', '审核开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_beian', '我是备案信息', '备案信息');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_captcha', '9355', '系统验证码');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_hook', '', 'WebHook地址');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_nickname', '羊驼IM用户', '注册昵称');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_packet', '200', '红包金额');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_phone', '13800000000', '审核账号');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_project', '羊驼IM', '系统名称');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_recall', '15', '撤回时间');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_screenshot', 'Y', '系统截屏');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_share', 'https://www.baidu.com', '分享页面');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('sys_watermark', '', '水印页面');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('user_deleted', '7', '用户注销间隔');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('user_hold', 'Y', '用户手持开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('user_register', 'Y', '用户注册开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('user_sms', 'N', '用户短信开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_cash_auth', 'N', '钱包提现认证开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_cash_cost', '1', '钱包提现加成金额');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_cash_count', '3', '钱包提现单日次数');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_cash_max', '1000', '钱包提现单日最大金额');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_cash_min', '1', '钱包提现单日最小金额');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_cash_rate', '1', '钱包提现手续费比率');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_cash_remark', '预计3个工作日内处理', '钱包提现提醒消息');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_recharge_android', '1,2', '钱包充值安卓开关');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_recharge_count', '3', '钱包充值单日次数');
INSERT INTO `chat_config` (`config_key`, `config_value`, `remark`) VALUES ('wallet_recharge_ios', '1,2', '钱包充值苹果开关');
COMMIT;

-- ----------------------------
-- Table structure for chat_feedback
-- ----------------------------
DROP TABLE IF EXISTS `chat_feedback`;
CREATE TABLE `chat_feedback` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `images` longtext COMMENT '图片',
  `content` longtext COMMENT '内容',
  `version` varchar(20) DEFAULT NULL COMMENT '提交版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='建议反馈';

-- ----------------------------
-- Records of chat_feedback
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_friend
-- ----------------------------
DROP TABLE IF EXISTS `chat_friend`;
CREATE TABLE `chat_friend` (
  `friend_id` bigint NOT NULL COMMENT '主键',
  `current_id` bigint DEFAULT NULL COMMENT '当前id',
  `group_id` bigint DEFAULT NULL COMMENT '群组id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `portrait` longtext COMMENT '头像',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `user_no` varchar(32) DEFAULT NULL COMMENT '聊天号码',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `source` char(1) DEFAULT NULL COMMENT '来源',
  `black` char(1) DEFAULT 'N' COMMENT '黑名单',
  `top` char(1) DEFAULT 'N' COMMENT '置顶',
  `disturb` char(1) DEFAULT 'N' COMMENT '静默',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '注销0正常null注销',
  PRIMARY KEY (`friend_id`),
  UNIQUE KEY `user_id` (`user_id`,`current_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='好友表';

-- ----------------------------
-- Records of chat_friend
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_friend_apply
-- ----------------------------
DROP TABLE IF EXISTS `chat_friend_apply`;
CREATE TABLE `chat_friend_apply` (
  `apply_id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `portrait` longtext COMMENT '用户头像',
  `nickname` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `user_no` varchar(32) DEFAULT NULL COMMENT '聊天号码',
  `reason` varchar(200) DEFAULT NULL COMMENT '理由',
  `receive_id` bigint DEFAULT NULL COMMENT '接收id',
  `receive_remark` varchar(20) DEFAULT NULL COMMENT '接收备注',
  `source` char(1) DEFAULT NULL COMMENT '申请来源',
  `status` char(1) DEFAULT NULL COMMENT '申请状态',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='好友申请';

-- ----------------------------
-- Records of chat_friend_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_friend_inform
-- ----------------------------
DROP TABLE IF EXISTS `chat_friend_inform`;
CREATE TABLE `chat_friend_inform` (
  `inform_id` bigint NOT NULL COMMENT '主键',
  `inform_type` char(1) DEFAULT NULL COMMENT '类型',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `group_id` bigint DEFAULT NULL COMMENT '目标id',
  `images` longtext COMMENT '图片',
  `content` longtext COMMENT '内容',
  `status` char(1) DEFAULT 'N' COMMENT '处理状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='骚扰举报';

-- ----------------------------
-- Records of chat_friend_inform
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_group
-- ----------------------------
DROP TABLE IF EXISTS `chat_group`;
CREATE TABLE `chat_group` (
  `group_id` bigint NOT NULL COMMENT '主键',
  `group_name` varchar(50) DEFAULT NULL COMMENT '群名',
  `group_no` varchar(32) DEFAULT NULL COMMENT '群号',
  `banned` char(1) DEFAULT 'N' COMMENT '封禁群组',
  `portrait` longtext COMMENT '群组头像',
  `notice` varchar(200) DEFAULT NULL COMMENT '通知公告',
  `notice_top` char(1) DEFAULT 'N' COMMENT '悬浮开关',
  `config_member` char(1) DEFAULT 'N' COMMENT '成员保护',
  `config_invite` char(1) DEFAULT 'Y' COMMENT '允许邀请',
  `config_speak` char(1) DEFAULT 'N' COMMENT '全员禁言',
  `config_title` char(1) DEFAULT 'Y' COMMENT '群组头衔',
  `config_audit` char(1) DEFAULT 'N' COMMENT '群组审核',
  `config_media` char(1) DEFAULT 'Y' COMMENT '发送资源',
  `config_assign` char(1) DEFAULT 'N' COMMENT '专属可见',
  `config_nickname` char(1) DEFAULT 'Y' COMMENT '昵称开关',
  `config_packet` char(1) DEFAULT 'Y' COMMENT '红包开关',
  `config_amount` char(1) DEFAULT 'Y' COMMENT '金额开关',
  `config_scan` char(1) DEFAULT 'Y' COMMENT '二维码',
  `config_receive` char(1) DEFAULT 'N' COMMENT '红包禁抢',
  `group_level` int DEFAULT '0' COMMENT '群组等级',
  `group_level_count` int DEFAULT '0' COMMENT '群组等级容量',
  `group_level_price` decimal(8,2) DEFAULT '0.00' COMMENT '群组等级价格',
  `group_level_time` datetime DEFAULT NULL COMMENT '群组容量时间',
  `privacy_no` char(1) DEFAULT 'Y' COMMENT '隐私开关',
  `privacy_scan` char(1) DEFAULT 'Y' COMMENT '隐私开关',
  `privacy_name` char(1) DEFAULT 'Y' COMMENT '隐私开关',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '注销0正常null注销',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_no` (`group_no`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天群组';

-- ----------------------------
-- Records of chat_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_group_apply
-- ----------------------------
DROP TABLE IF EXISTS `chat_group_apply`;
CREATE TABLE `chat_group_apply` (
  `apply_id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `portrait` longtext COMMENT '用户头像',
  `group_id` bigint DEFAULT NULL COMMENT '群组id',
  `group_name` varchar(50) DEFAULT NULL COMMENT '群组名称',
  `receive_id` bigint DEFAULT NULL COMMENT '接收人id',
  `apply_status` char(1) DEFAULT NULL COMMENT '申请状态0无1同意2拒绝3忽略',
  `apply_source` char(1) DEFAULT NULL COMMENT '申请来源',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='群组申请表';

-- ----------------------------
-- Records of chat_group_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_group_inform
-- ----------------------------
DROP TABLE IF EXISTS `chat_group_inform`;
CREATE TABLE `chat_group_inform` (
  `inform_id` bigint NOT NULL COMMENT '主键',
  `inform_type` char(1) DEFAULT NULL COMMENT '类型',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `group_id` bigint DEFAULT NULL COMMENT '目标id',
  `images` longtext COMMENT '图片',
  `content` longtext COMMENT '内容',
  `status` char(1) DEFAULT 'N' COMMENT '处理状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='骚扰举报';

-- ----------------------------
-- Records of chat_group_inform
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_group_log
-- ----------------------------
DROP TABLE IF EXISTS `chat_group_log`;
CREATE TABLE `chat_group_log` (
  `id` bigint NOT NULL COMMENT '主键',
  `group_id` bigint DEFAULT NULL COMMENT '群组id',
  `log_type` varchar(4) DEFAULT NULL COMMENT '日志类型',
  `content` varchar(200) DEFAULT NULL COMMENT '操作内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='群组日志';

-- ----------------------------
-- Records of chat_group_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_group_member
-- ----------------------------
DROP TABLE IF EXISTS `chat_group_member`;
CREATE TABLE `chat_group_member` (
  `member_id` bigint NOT NULL COMMENT '主键',
  `group_id` bigint DEFAULT NULL COMMENT '群组id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `user_no` varchar(32) DEFAULT NULL COMMENT '聊天号码',
  `nickname` varchar(20) DEFAULT NULL COMMENT '备注',
  `portrait` longtext COMMENT '头像',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `member_type` varchar(10) DEFAULT 'normal' COMMENT '成员类型',
  `top` char(1) DEFAULT 'N' COMMENT '是否置顶',
  `disturb` char(1) DEFAULT 'N' COMMENT '是否免打扰',
  `member_source` char(1) DEFAULT '1' COMMENT '进群来源',
  `packet_white` char(1) DEFAULT 'N' COMMENT '禁抢白名单',
  `speak` char(1) DEFAULT 'N' COMMENT '禁言开关',
  `speak_time` datetime DEFAULT NULL COMMENT '禁言时间',
  `create_time` datetime DEFAULT NULL COMMENT '加入时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '注销0正常null注销',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `idx_group` (`user_id`,`group_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='群组成员';

-- ----------------------------
-- Records of chat_group_member
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_group_solitaire
-- ----------------------------
DROP TABLE IF EXISTS `chat_group_solitaire`;
CREATE TABLE `chat_group_solitaire` (
  `solitaire_id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '发起人',
  `group_id` bigint DEFAULT NULL COMMENT '群组',
  `subject` varchar(50) DEFAULT NULL COMMENT '主题',
  `example` varchar(200) DEFAULT NULL COMMENT '例子',
  `content` longtext COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`solitaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='成语接龙';

-- ----------------------------
-- Records of chat_group_solitaire
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_help
-- ----------------------------
DROP TABLE IF EXISTS `chat_help`;
CREATE TABLE `chat_help` (
  `help_id` bigint NOT NULL COMMENT '主键',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '内容',
  `status` char(1) DEFAULT 'Y' COMMENT '状态',
  `sort` smallint DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天帮助';

-- ----------------------------
-- Records of chat_help
-- ----------------------------
BEGIN;
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105731, '如何迁移/备份聊天记录', '目前版本不支持备份与恢复。', 'Y', 1);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105732, '聊天记录清空后还能找回吗', '目前采用的是端对端加密传输，消息只记录在用户的终端设备上，一旦删除或撤回，就无法恢复。', 'Y', 2);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105733, 'APP后台/锁屏后接收不到新消息通知', '进入手机“设置”“应用管理”找到《{}》进入权限管理赋予自启动、后台弹窗、悬浮窗、后台唤起权限/后台弹窗权限。', 'Y', 3);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105734, 'APP后台总是被清理', '进入手机“设置”“应用自启动设置”找到《{}》设置“允许自启动”或者“允许后台运行”。', 'Y', 4);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105735, 'APP后台/锁屏后接听不到语音/视频通话', '进入手机“设置”“应用管理”找到《{}》进入权限管理赋予自启动、悬浮窗、后台唤起权限/后台弹窗权限。', 'Y', 5);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105736, '如何开启消息通知', '进入“我的”页面点击“软件设置”开启“消息声音”或“消息通知”。', 'Y', 6);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105737, '怎么添加好友', '进入“消息”或“好友”页面点击右上角加号“添加好友”。', 'Y', 7);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105738, '怎么同意/拒绝添加好友', '进入“好友”页面点击“验证信息”可以看到，好友申请列表，点击“忽略”或“同意”进行操作。', 'Y', 8);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105739, '怎么切换账号', '进入“我的”页面点击“账号安全”点击“退出登录”进行操作。', 'Y', 9);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105740, '怎么查看用户服务协议/隐私协议', '进入“我的”页面点击“软件设置”点击“服务协议”或“隐私协议”进行查看。', 'Y', 10);
INSERT INTO `chat_help` (`help_id`, `title`, `content`, `status`, `sort`) VALUES (1562386781612105741, '怎么查看我的个人信息收集情况', '进入“我的”页面点击“软件设置”点击“信息收集”进行查看。', 'Y', 11);
COMMIT;

-- ----------------------------
-- Table structure for chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `chat_msg`;
CREATE TABLE `chat_msg` (
  `msg_id` bigint NOT NULL COMMENT '消息主键',
  `sync_id` bigint DEFAULT NULL COMMENT '同步id',
  `user_id` bigint DEFAULT NULL COMMENT '发送人',
  `receive_id` bigint DEFAULT NULL COMMENT '接收人',
  `group_id` bigint DEFAULT NULL COMMENT '群id',
  `talk_type` char(1) DEFAULT NULL COMMENT '聊天类型',
  `msg_type` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `content` longtext COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天消息';

-- ----------------------------
-- Records of chat_msg
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_notice
-- ----------------------------
DROP TABLE IF EXISTS `chat_notice`;
CREATE TABLE `chat_notice` (
  `notice_id` bigint NOT NULL COMMENT '主键',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '内容',
  `status` char(1) DEFAULT 'N' COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告';

-- ----------------------------
-- Records of chat_notice
-- ----------------------------
BEGIN;
INSERT INTO `chat_notice` (`notice_id`, `title`, `content`, `status`, `create_time`) VALUES (1613477970402439169, '测试公告', '重要通知：近期诈骗犯罪案件时有发生，为防止您在经济上蒙受损失，请您接到陌生人或以熟人名义要求转账、汇款时，务必提高警惕，以防受骗', 'Y', '2023-01-01 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for chat_number
-- ----------------------------
DROP TABLE IF EXISTS `chat_number`;
CREATE TABLE `chat_number` (
  `chat_no` varchar(8) NOT NULL COMMENT '编号',
  `status` char(1) DEFAULT 'N' COMMENT '状态',
  PRIMARY KEY (`chat_no`),
  UNIQUE KEY `chat_no` (`chat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统号码';

-- ----------------------------
-- Records of chat_number
-- ----------------------------
BEGIN;
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('10216744', 'Y');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('11887015', 'Y');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('12470825', 'Y');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('13338880', 'Y');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('13365143', 'Y');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('13733681', 'Y');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('13875753', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('14743093', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('15592345', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('15953446', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('16295909', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('16376919', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('16866986', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('17707967', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('18859067', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('20223689', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('20686573', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('21103070', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('21674866', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('21760700', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('22608592', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('23170212', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('23910023', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('25350834', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('26062849', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('26651441', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('26877240', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('27031492', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('27121548', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('27735384', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('27896991', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('28563733', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('28801859', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('28953366', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('29212744', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('29301510', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('29358901', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('29836407', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('29991981', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('30390756', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('31772291', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('31997881', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('32244002', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('33087377', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('34921700', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('35711455', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('35815860', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('35916784', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('36446168', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('36479994', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('37128995', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('37448885', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('37666798', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('37928247', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('37959506', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('38383542', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('38557552', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('38907222', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('39047526', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('39301272', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('39488480', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('40181066', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('40498552', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('41480103', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('41765361', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('43005007', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('43406000', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('43408155', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('43987807', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('44402947', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('44546183', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('45212606', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('45362226', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('46541699', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('46751160', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('47983946', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('50148081', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('50290554', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('50790345', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('52481160', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('52483062', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('52639670', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('53116925', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('54698067', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('56250226', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('56461945', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('56498949', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('56685178', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('57551017', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('57627108', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('59309423', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('59674506', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('59714359', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('59899646', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('59909204', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('60437989', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('60563391', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('60791799', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('60993862', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('61044836', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('61078985', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('62376555', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('62701922', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('63215332', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('63430920', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('63447015', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('63888243', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('64022071', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('64941022', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('65038983', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('65613287', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('66150677', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('66278960', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('66681049', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('67314840', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('68073496', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('68436414', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('68517269', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('69076881', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('69722312', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('69890755', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('70154140', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('71468732', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('71606105', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('71628612', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('72842470', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('73088843', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('73201050', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('73769346', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('74104428', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('75068467', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('75555816', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('75792586', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('76349160', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('76355806', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('76387429', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('76421613', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('76433864', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('76583492', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('77095504', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('77476367', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('78498207', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('78719739', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('79062852', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('79499683', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('79676469', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('79903897', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('80230944', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('80462862', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('80472595', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('80585650', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('80655059', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('81226652', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('81791514', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('81909763', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('82178800', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('82837891', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('83132909', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('83617271', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('85297009', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('86207978', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('86682459', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('86971507', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('87742730', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('88539558', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('88669820', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('88752158', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('88810241', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('89877955', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('90055536', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('90251656', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('90411965', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('91130407', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('91189237', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('91302378', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('91594221', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('91866155', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('93486324', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('93550192', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('93817346', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('93944365', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('94304958', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('94541078', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('95281562', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('95498005', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('95676587', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('95753705', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('95871764', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('96129347', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('96507943', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('96837290', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('97636727', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('98060288', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('98411093', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('98622239', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('98973864', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('99180386', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('99544146', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('99797124', 'N');
INSERT INTO `chat_number` (`chat_no`, `status`) VALUES ('99994518', 'N');
COMMIT;

-- ----------------------------
-- Table structure for chat_portrait
-- ----------------------------
DROP TABLE IF EXISTS `chat_portrait`;
CREATE TABLE `chat_portrait` (
  `id` bigint NOT NULL COMMENT '主键',
  `portrait` longtext COMMENT '头像',
  `chat_type` char(1) DEFAULT NULL COMMENT '类型',
  `status` char(1) DEFAULT 'Y' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天头像';

-- ----------------------------
-- Records of chat_portrait
-- ----------------------------
BEGIN;
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731910, 'https://img.alicdn.com/imgextra/i1/87413133/O1CN01PoqsS81Z0xr5CjDQF_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731911, 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01B9UyI51Z0xr0ghHfJ_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731912, 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01uJoEkC1Z0xr2HRPze_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731913, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN01Y8sHn41Z0xr2HVF3c_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731914, 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01MzRXKx1Z0xqztYS0U_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731915, 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01uJSXr81Z0xqvP8j6B_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731916, 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01rLvHhr1Z0xr509mb0_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731917, 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01JbXfqp1Z0xr32dbmq_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731918, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN01CqSpkj1Z0xr2pRh6i_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731919, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN019n6Eua1Z0xr32eY2C_!!87413133.png', '1', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731970, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN01Z2HXBK1Z0xr5n01Fa_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731971, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN01zsju3k1Z0xr2HSDrj_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731972, 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01yiRrTQ1Z0xr47i7cL_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731973, 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01nYqOd21Z0xqvPB8vi_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731974, 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01yj29Ke1Z0xr30zhUm_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731975, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN01r47v1w1Z0xr50Bznn_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731976, 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01eQA5Op1Z0xr3knxRm_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731977, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN017YUobu1Z0xr3ko9uj_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731978, 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01mag3bv1Z0xr2pSQtG_!!87413133.png', '2', 'Y');
INSERT INTO `chat_portrait` (`id`, `portrait`, `chat_type`, `status`) VALUES (1793574396027731979, 'https://img.alicdn.com/imgextra/i3/87413133/O1CN012rid7r1Z0xr5mzHYW_!!87413133.png', '2', 'Y');
COMMIT;

-- ----------------------------
-- Table structure for chat_resource
-- ----------------------------
DROP TABLE IF EXISTS `chat_resource`;
CREATE TABLE `chat_resource` (
  `resource_id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `url` longtext COMMENT '资源地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天资源';

-- ----------------------------
-- Records of chat_resource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_robot
-- ----------------------------
DROP TABLE IF EXISTS `chat_robot`;
CREATE TABLE `chat_robot` (
  `robot_id` bigint NOT NULL COMMENT '主键',
  `secret` varchar(32) DEFAULT NULL COMMENT '秘钥',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `portrait` varchar(200) DEFAULT NULL COMMENT '头像',
  `menu` longtext COMMENT '菜单',
  PRIMARY KEY (`robot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务号';

-- ----------------------------
-- Records of chat_robot
-- ----------------------------
BEGIN;
INSERT INTO `chat_robot` (`robot_id`, `secret`, `nickname`, `portrait`, `menu`) VALUES (10001, '8ykc55fcq1fc21agt11qtni60hujhrxf', '在线客服', 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01NxWkgo1Z0xqvPDYbs_!!87413133.png', '[]');
INSERT INTO `chat_robot` (`robot_id`, `secret`, `nickname`, `portrait`, `menu`) VALUES (10002, 'qry41hxsjg8l4kg242z5s1u91oxll8b', '支付助手', 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01sVp8VY1Z0xsCzOdWE_!!87413133.png', '[]');
INSERT INTO `chat_robot` (`robot_id`, `secret`, `nickname`, `portrait`, `menu`) VALUES (10003, 'zgs5ibsx565wn4ccbb3hqlnozwyiktm9', '羊驼助手', 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01V9Um9U1Z0xs1UA7iE_!!87413133.png', '[]');
COMMIT;

-- ----------------------------
-- Table structure for chat_robot_reply
-- ----------------------------
DROP TABLE IF EXISTS `chat_robot_reply`;
CREATE TABLE `chat_robot_reply` (
  `reply_id` bigint NOT NULL COMMENT '主键',
  `robot_id` bigint DEFAULT NULL COMMENT '机器人',
  `reply_type` varchar(20) DEFAULT NULL COMMENT '类型',
  `reply_key` varchar(200) DEFAULT NULL COMMENT '关键字',
  `content` longtext COMMENT '内容',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务号';

-- ----------------------------
-- Records of chat_robot_reply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_robot_sub
-- ----------------------------
DROP TABLE IF EXISTS `chat_robot_sub`;
CREATE TABLE `chat_robot_sub` (
  `sub_id` bigint NOT NULL COMMENT '主键',
  `robot_id` bigint DEFAULT NULL COMMENT '机器人',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `top` char(1) DEFAULT 'N' COMMENT '置顶',
  `disturb` char(1) DEFAULT 'N' COMMENT '静默',
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务号';

-- ----------------------------
-- Records of chat_robot_sub
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_sms
-- ----------------------------
DROP TABLE IF EXISTS `chat_sms`;
CREATE TABLE `chat_sms` (
  `id` bigint NOT NULL COMMENT '主键',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `mobile` varchar(50) DEFAULT '0' COMMENT '手机号',
  `status` char(1) DEFAULT 'Y' COMMENT '状态',
  `body` longtext COMMENT '结果',
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='短信记录';

-- ----------------------------
-- Records of chat_sms
-- ----------------------------
BEGIN;
INSERT INTO `chat_sms` (`id`, `content`, `mobile`, `status`, `body`, `create_time`) VALUES (1911794007558619137, '5364', '13800138000', 'Y', 'local', '2025-04-14 22:49:45');
INSERT INTO `chat_sms` (`id`, `content`, `mobile`, `status`, `body`, `create_time`) VALUES (1913505007383126018, '2932', '13800138000', 'Y', 'local', '2025-04-19 16:08:40');
COMMIT;

-- ----------------------------
-- Table structure for chat_user
-- ----------------------------
DROP TABLE IF EXISTS `chat_user`;
CREATE TABLE `chat_user` (
  `user_id` bigint NOT NULL COMMENT '主键',
  `user_no` varchar(32) DEFAULT NULL COMMENT '聊天号码',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `portrait` longtext COMMENT '头像',
  `gender` varchar(1) DEFAULT '1' COMMENT '性别1男2女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `intro` varchar(200) DEFAULT NULL COMMENT '介绍',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `salt` varchar(4) DEFAULT NULL COMMENT '盐',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `pass` char(1) DEFAULT 'N' COMMENT '密码标志',
  `auth` char(1) DEFAULT '1' COMMENT '认证状态',
  `banned` char(1) DEFAULT 'N' COMMENT '封禁状态',
  `special` char(1) DEFAULT 'N' COMMENT '测试账号',
  `abnormal` char(1) DEFAULT 'N' COMMENT '异常账号',
  `payment` char(1) DEFAULT 'N' COMMENT '支付密码',
  `privacy_no` char(1) DEFAULT 'Y' COMMENT '隐私no',
  `privacy_phone` char(1) DEFAULT 'Y' COMMENT '隐私手机',
  `privacy_scan` char(1) DEFAULT 'Y' COMMENT '隐私扫码',
  `privacy_card` char(1) DEFAULT 'Y' COMMENT '隐私名片',
  `privacy_group` char(1) DEFAULT 'Y' COMMENT '隐私群组',
  `login_ios` varchar(64) DEFAULT NULL COMMENT '苹果openId',
  `login_qq` varchar(64) DEFAULT NULL COMMENT '球球openId',
  `login_wx` varchar(64) DEFAULT NULL COMMENT '微信openId',
  `on_line` datetime DEFAULT NULL COMMENT '在线时间',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `ip` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `ip_addr` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '注销0正常null注销',
  `invite_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone` (`phone`,`deleted`),
  UNIQUE KEY `chat_no` (`user_no`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天用户';

-- ----------------------------
-- Records of chat_user
-- ----------------------------
BEGIN;
INSERT INTO `chat_user` (`user_id`, `user_no`, `phone`, `nickname`, `portrait`, `gender`, `birthday`, `intro`, `province`, `city`, `salt`, `password`, `pass`, `auth`, `banned`, `special`, `abnormal`, `payment`, `privacy_no`, `privacy_phone`, `privacy_scan`, `privacy_card`, `privacy_group`, `login_ios`, `login_qq`, `login_wx`, `on_line`, `create_time`, `ip`, `ip_addr`, `deleted`, `invite_remark`) VALUES (1913505014123372546, '10216744', '13800138000', '羊驼IM用户', 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01rLvHhr1Z0xr509mb0_!!87413133.png', '1', '1970-01-01', NULL, '北京市', '北京城区', 'w673', '8c3284f65e5264269fd443395bd9b574', 'N', '0', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, '2025-04-19 16:08:42', '2025-04-19 16:08:41', '127.0.0.1', '0|0|0|内网IP|内网IP', 0, NULL);
INSERT INTO `chat_user` (`user_id`, `user_no`, `phone`, `nickname`, `portrait`, `gender`, `birthday`, `intro`, `province`, `city`, `salt`, `password`, `pass`, `auth`, `banned`, `special`, `abnormal`, `payment`, `privacy_no`, `privacy_phone`, `privacy_scan`, `privacy_card`, `privacy_group`, `login_ios`, `login_qq`, `login_wx`, `on_line`, `create_time`, `ip`, `ip_addr`, `deleted`, `invite_remark`) VALUES (1913529347591950337, '11887015', '13800138001', '羊驼IM用户', 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01B9UyI51Z0xr0ghHfJ_!!87413133.png', '1', '1970-01-01', NULL, '北京市', '北京城区', 'v3ql', '299cdc1e29a2a8068703b732e7a933d8', 'N', '0', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2025-04-19 17:45:23', NULL, NULL, 0, NULL);
INSERT INTO `chat_user` (`user_id`, `user_no`, `phone`, `nickname`, `portrait`, `gender`, `birthday`, `intro`, `province`, `city`, `salt`, `password`, `pass`, `auth`, `banned`, `special`, `abnormal`, `payment`, `privacy_no`, `privacy_phone`, `privacy_scan`, `privacy_card`, `privacy_group`, `login_ios`, `login_qq`, `login_wx`, `on_line`, `create_time`, `ip`, `ip_addr`, `deleted`, `invite_remark`) VALUES (1913529744792539137, '12470825', '13800138002', '羊驼IM用户', 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01uJoEkC1Z0xr2HRPze_!!87413133.png', '1', '1970-01-01', NULL, '北京市', '北京城区', 'lxop', 'd82add68e09eaa7c9e848bf8373a3a93', 'N', '0', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2025-04-19 17:46:57', NULL, NULL, 0, NULL);
INSERT INTO `chat_user` (`user_id`, `user_no`, `phone`, `nickname`, `portrait`, `gender`, `birthday`, `intro`, `province`, `city`, `salt`, `password`, `pass`, `auth`, `banned`, `special`, `abnormal`, `payment`, `privacy_no`, `privacy_phone`, `privacy_scan`, `privacy_card`, `privacy_group`, `login_ios`, `login_qq`, `login_wx`, `on_line`, `create_time`, `ip`, `ip_addr`, `deleted`, `invite_remark`) VALUES (1913534863508561922, '13338880', '13800138003', '羊驼IM用户', 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01uJoEkC1Z0xr2HRPze_!!87413133.png', '1', '1970-01-01', NULL, '北京市', '北京城区', 'zj5k', 'a11040550e6daa5b91dade9b6e277850', 'Y', '0', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, '2025-04-19 23:59:18', '2025-04-19 18:07:18', '127.0.0.1', '0|0|0|内网IP|内网IP', 0, NULL);
INSERT INTO `chat_user` (`user_id`, `user_no`, `phone`, `nickname`, `portrait`, `gender`, `birthday`, `intro`, `province`, `city`, `salt`, `password`, `pass`, `auth`, `banned`, `special`, `abnormal`, `payment`, `privacy_no`, `privacy_phone`, `privacy_scan`, `privacy_card`, `privacy_group`, `login_ios`, `login_qq`, `login_wx`, `on_line`, `create_time`, `ip`, `ip_addr`, `deleted`, `invite_remark`) VALUES (1913574939542224898, '13365143', '13800138004', '羊驼IM用户', 'https://img.alicdn.com/imgextra/i3/87413133/O1CN01CqSpkj1Z0xr2pRh6i_!!87413133.png', '1', '1970-01-01', NULL, '北京市', '北京城区', 'fdd5', 'cbb5b112a9c6e0718cad0f679679e9c1', 'N', '0', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2025-04-19 20:46:33', NULL, NULL, 0, '邀请码2');
INSERT INTO `chat_user` (`user_id`, `user_no`, `phone`, `nickname`, `portrait`, `gender`, `birthday`, `intro`, `province`, `city`, `salt`, `password`, `pass`, `auth`, `banned`, `special`, `abnormal`, `payment`, `privacy_no`, `privacy_phone`, `privacy_scan`, `privacy_card`, `privacy_group`, `login_ios`, `login_qq`, `login_wx`, `on_line`, `create_time`, `ip`, `ip_addr`, `deleted`, `invite_remark`) VALUES (1913906268486057985, '13733681', '13800138005', '羊驼IM用户', 'https://img.alicdn.com/imgextra/i3/87413133/O1CN019n6Eua1Z0xr32eY2C_!!87413133.png', '1', '1970-01-01', NULL, '北京市', '北京城区', 'y5au', 'e187d29e506780cd5f81b3db741c0070', 'N', '0', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, '2025-04-20 18:43:24', '2025-04-20 18:43:08', '127.0.0.1', '0|0|0|内网IP|内网IP', 0, '邀请码1');
COMMIT;

-- ----------------------------
-- Table structure for chat_user_appeal
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_appeal`;
CREATE TABLE `chat_user_appeal` (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `images` longtext COMMENT '图片',
  `content` longtext COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户申诉';

-- ----------------------------
-- Records of chat_user_appeal
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_collect`;
CREATE TABLE `chat_user_collect` (
  `collect_id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `msg_type` varchar(20) DEFAULT NULL COMMENT '收藏类型',
  `content` longtext COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收藏表';

-- ----------------------------
-- Records of chat_user_collect
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_user_deleted
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_deleted`;
CREATE TABLE `chat_user_deleted` (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `create_time` datetime DEFAULT NULL COMMENT '注销时间',
  PRIMARY KEY (`user_id`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='注销表';

-- ----------------------------
-- Records of chat_user_deleted
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_user_info
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_info`;
CREATE TABLE `chat_user_info` (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `identity1` varchar(200) DEFAULT NULL COMMENT '正面',
  `identity2` varchar(200) DEFAULT NULL COMMENT '反面',
  `hold_card` varchar(200) DEFAULT NULL COMMENT '手持',
  `auth_reason` varchar(200) DEFAULT NULL COMMENT '认证原因',
  `auth_time` datetime DEFAULT NULL COMMENT '认证时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户详情';

-- ----------------------------
-- Records of chat_user_info
-- ----------------------------
BEGIN;
INSERT INTO `chat_user_info` (`user_id`, `name`, `id_card`, `identity1`, `identity2`, `hold_card`, `auth_reason`, `auth_time`) VALUES (1913505014123372546, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `chat_user_info` (`user_id`, `name`, `id_card`, `identity1`, `identity2`, `hold_card`, `auth_reason`, `auth_time`) VALUES (1913529347591950337, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `chat_user_info` (`user_id`, `name`, `id_card`, `identity1`, `identity2`, `hold_card`, `auth_reason`, `auth_time`) VALUES (1913529744792539137, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `chat_user_info` (`user_id`, `name`, `id_card`, `identity1`, `identity2`, `hold_card`, `auth_reason`, `auth_time`) VALUES (1913534863508561922, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `chat_user_info` (`user_id`, `name`, `id_card`, `identity1`, `identity2`, `hold_card`, `auth_reason`, `auth_time`) VALUES (1913574939542224898, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `chat_user_info` (`user_id`, `name`, `id_card`, `identity1`, `identity2`, `hold_card`, `auth_reason`, `auth_time`) VALUES (1913906268486057985, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for chat_user_log
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_log`;
CREATE TABLE `chat_user_log` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `log_type` varchar(4) DEFAULT NULL COMMENT '类型',
  `content` varchar(200) DEFAULT NULL COMMENT '操作内容',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `ip_addr` varchar(128) DEFAULT NULL COMMENT 'ip地址',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备类型',
  `device_version` varchar(32) DEFAULT NULL COMMENT '设备版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户日志';

-- ----------------------------
-- Records of chat_user_log
-- ----------------------------
BEGIN;
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913505014333087746, 1913505014123372546, '1001', '用户注册', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 16:08:41');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913505017042608129, 1913505014123372546, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 16:08:42');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913508332413431809, 1913505014123372546, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 16:21:52');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913529347843608577, 1913529347591950337, '1001', '用户注册', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 17:45:23');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913529744817704961, 1913529744792539137, '1001', '用户注册', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 17:46:57');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913534863709888513, 1913534863508561922, '1001', '用户注册', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:07:18');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913534878478032897, 1913534863508561922, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:07:21');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913534893653024770, 1913534863508561922, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:07:25');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913534982693904386, 1913534863508561922, '1008', '修改密码', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:07:46');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913534993943027714, 1913534863508561922, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:07:49');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913535054433280001, 1913534863508561922, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:08:03');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913535055662211073, 1913534863508561922, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:08:04');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913535116508979201, 1913534863508561922, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:08:18');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913538727473373186, 1913534863508561922, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:22:39');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913538729360809985, 1913534863508561922, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:22:40');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913538843047419905, 1913534863508561922, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:23:07');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913546011003904001, 1913534863508561922, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:51:36');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913546012014731265, 1913534863508561922, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:51:36');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913546057048973314, 1913534863508561922, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:51:47');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913546086694313986, 1913534863508561922, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:51:54');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913546087357014018, 1913534863508561922, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:51:54');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913546258371371010, 1913534863508561922, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 18:52:35');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913574940045541377, 1913574939542224898, '1001', '用户注册', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 20:46:33');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913621447448793089, 1913534863508561922, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 23:51:21');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913621450439331842, 1913534863508561922, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 23:51:22');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913621929349156866, 1913534863508561922, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 23:53:16');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913623445107707905, 1913534863508561922, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 23:59:17');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913623445795573761, 1913534863508561922, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-19 23:59:18');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913904933388759042, 1913534863508561922, '1005', '退出登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-20 18:37:49');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913906268905488385, 1913906268486057985, '1001', '用户注册', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-20 18:43:08');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913906336798687233, 1913906268486057985, '1002', '密码登录', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-20 18:43:24');
INSERT INTO `chat_user_log` (`id`, `user_id`, `log_type`, `content`, `ip`, `ip_addr`, `device_type`, `device_version`, `create_time`) VALUES (1913906337838874626, 1913906268486057985, '1026', '用户刷新', '127.0.0.1', '0|0|0|内网IP|内网IP', 'android', '1.1.6', '2025-04-20 18:43:24');
COMMIT;

-- ----------------------------
-- Table structure for chat_user_token
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_token`;
CREATE TABLE `chat_user_token` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `token` varchar(256) DEFAULT NULL COMMENT 'token',
  `device` varchar(32) DEFAULT NULL COMMENT '设备',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户token';

-- ----------------------------
-- Records of chat_user_token
-- ----------------------------
BEGIN;
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913505014274367489, 1913505014123372546, '5733f052766f1a8445444280283b625957f8cbf7adf3533be2802317055e2b90f0bf60eb64e920f9dd79d8dbc23f673d051fd0dbcc31526cb4543a0601db0ad9', 'android', 'phone', '2025-04-19 16:08:41', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913529347776499714, 1913529347591950337, 'da8e424842c826d9b879a7591087b1116797b7bdf832badd18b423c6511836f9b322b86d5cf53c3e6803757948ef9973307faf968fee903df4111192d1eada9e', 'android', 'phone', '2025-04-19 17:45:23', 0);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913529744838676481, 1913529744792539137, '954f0ea5c3b0de0b9c6c38dc072bfd32cc836f275b5b54b3c05478eea7f64d0a69ac00bffd74b7f6d32b09406f92736e59d64d45032c04aa9a33f5bf120efade', 'android', 'phone', '2025-04-19 17:46:57', 0);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913534863646973954, 1913534863508561922, '979f23cd468109d098503f030e80037ff15108a774299e8811252aae0c861ae64edb4786435f35edaee3411851f31bd6870314a77fc59bfeec7b75f0a22a8ac1', 'android', 'phone', '2025-04-19 18:07:18', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913534878473838593, 1913534863508561922, '7d78f1817a555e9890ffc4c79570366d2de19c894bf6ecec00538c84d51e3b26940e3653a55a05f3b265f14d0ea698560c62105b691fe951c3691fb599ae4850', 'android', 'phone', '2025-04-19 18:07:21', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913535053690888193, 1913534863508561922, '55155e11f9cd268c7e88115d96bc6f9967c0b3aaff971069bb7f00aa224b47a3d3b7c4fab34dd52ee9686d6c91c82087003d2c1bdb3f9f15cba94bd0a2290447', 'android', 'phone', '2025-04-19 18:08:03', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913538727452401666, 1913534863508561922, '17129cae5127b6f502e07d52374f0f3221eb57af700ee43fdefb5ce2f570063c903b486178d80f99b8bc221ab559a0567d9b6163c1451f62198e08f2fa9e3e24', 'android', 'phone', '2025-04-19 18:22:39', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913546010987126786, 1913534863508561922, '617f1454ae67c9468d3617be46d449e1ad4b37bd7fcdce18f794c2376386c3b8ea8f679cbcb6f043b28aec43146b082c484a9cab999bc2acb26259dcba7a9e43', 'android', 'phone', '2025-04-19 18:51:36', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913546086677536770, 1913534863508561922, 'aa1bec6c1427d7782cdfd8a42ecdf58c0f38a20d4ecff1513bdd2c9f9f135de7db5deb80b9b99baed5c4e3018f04d137138be15d13a55f60afab27a71849ed0a', 'android', 'phone', '2025-04-19 18:51:54', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913574939949072386, 1913574939542224898, '963d513a2b1e0c90a683198b6c658ea0bbd0c4a678a2eab9670619facdaed8e038b96b66f32c6ec65d59b9b4141f2edfb625d7f43b347b416e6b5a5a94892686', 'android', 'phone', '2025-04-19 20:46:33', 0);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913621446890950657, 1913534863508561922, 'd8d22e0014ff42bfac3fd4dc318c7c87de3ab8cd00d3f314458e892a9029b653304fe93987f15369765f42cc9ee0f5bd13994d35696e8acfbbc2254e405b39c2', 'android', 'phone', '2025-04-19 23:51:21', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913623445095124994, 1913534863508561922, '4b6d6b04d28bbab089e6d5e6237ad8fb5edadacb6f958b05493ed8e27e6a97263cf6a330ba17a935e503d3a9ee6fd3ed3f7dc2ce88c6b84c84495e2c121cfefe', 'android', 'phone', '2025-04-19 23:59:17', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913906268855156738, 1913906268486057985, 'e63323ea739defdc2a649ba211ff07f5f9e8c794c682a4216e2d3ab0ab64ab0a8a38ea6f382c88575a1c6784028340db9b74529763e63ce9fa0c560d89b2570f', 'android', 'phone', '2025-04-20 18:43:08', NULL);
INSERT INTO `chat_user_token` (`id`, `user_id`, `token`, `device`, `device_type`, `create_time`, `deleted`) VALUES (1913906336781910017, 1913906268486057985, '1bc7ceb621dcf73f5e0bedea4de37458f4524e6be8ba790ef7499322f622ca17cd85e341e37f087fd7618c5eef1796eae8bba54c93e89d363e76f49826afa667', 'android', 'phone', '2025-04-20 18:43:24', 0);
COMMIT;

-- ----------------------------
-- Table structure for chat_version
-- ----------------------------
DROP TABLE IF EXISTS `chat_version`;
CREATE TABLE `chat_version` (
  `id` bigint NOT NULL COMMENT '主键',
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `device` varchar(20) DEFAULT NULL COMMENT '设备',
  `url` longtext COMMENT '地址',
  `content` longtext COMMENT '内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统版本';

-- ----------------------------
-- Records of chat_version
-- ----------------------------
BEGIN;
INSERT INTO `chat_version` (`id`, `version`, `device`, `url`, `content`) VALUES (1561613225252913110, '1.0.0', 'android', 'https://www.baidu.com/demo.apk', '我是安卓包');
INSERT INTO `chat_version` (`id`, `version`, `device`, `url`, `content`) VALUES (1561613225252913111, '1.0.0', 'ios', 'https://www.baidu.com/test', '我是苹果包');
COMMIT;

-- ----------------------------
-- Table structure for chat_visit
-- ----------------------------
DROP TABLE IF EXISTS `chat_visit`;
CREATE TABLE `chat_visit` (
  `visit_id` bigint NOT NULL COMMENT '访问id',
  `visit_date` date DEFAULT NULL COMMENT '访问时间',
  `visit_count` int DEFAULT '0' COMMENT '访问次数',
  PRIMARY KEY (`visit_id`),
  UNIQUE KEY `visit_date` (`visit_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户访问';

-- ----------------------------
-- Records of chat_visit
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for chat_voice
-- ----------------------------
DROP TABLE IF EXISTS `chat_voice`;
CREATE TABLE `chat_voice` (
  `msg_id` bigint NOT NULL COMMENT '主键',
  `voice_url` longtext COMMENT '地址',
  `voice_text` longtext COMMENT '文本',
  `user_id` bigint DEFAULT '0' COMMENT '用户',
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='声音表';

-- ----------------------------
-- Records of chat_voice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
BEGIN;
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (1, '1.0.0.01', 'chat banned', 'SQL', 'V1.0.0_01__chat_banned.sql', -696532290, 'root', '2025-04-12 01:52:13', 11, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (2, '1.0.0.02', 'chat config', 'SQL', 'V1.0.0_02__chat_config.sql', 1170283213, 'root', '2025-04-12 01:52:13', 15, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (3, '1.0.0.03', 'chat feedback', 'SQL', 'V1.0.0_03__chat_feedback.sql', 1216134411, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (4, '1.0.0.04', 'chat friend', 'SQL', 'V1.0.0_04__chat_friend.sql', 168262040, 'root', '2025-04-12 01:52:13', 5, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (5, '1.0.0.05', 'chat friend apply', 'SQL', 'V1.0.0_05__chat_friend_apply.sql', 53969888, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (6, '1.0.0.06', 'chat friend inform', 'SQL', 'V1.0.0_06__chat_friend_inform.sql', 1658750223, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (7, '1.0.0.07', 'chat group', 'SQL', 'V1.0.0_07__chat_group.sql', -1174979198, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (8, '1.0.0.08', 'chat group apply', 'SQL', 'V1.0.0_08__chat_group_apply.sql', 2076408602, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (9, '1.0.0.09', 'chat group inform', 'SQL', 'V1.0.0_09__chat_group_inform.sql', -396204992, 'root', '2025-04-12 01:52:13', 8, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (10, '1.0.0.10', 'chat group log', 'SQL', 'V1.0.0_10__chat_group_log.sql', 564077313, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (11, '1.0.0.11', 'chat group member', 'SQL', 'V1.0.0_11__chat_group_member.sql', -1727677919, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (12, '1.0.0.12', 'chat group solitaire', 'SQL', 'V1.0.0_12__chat_group_solitaire.sql', -1246279350, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (13, '1.0.0.13', 'chat help', 'SQL', 'V1.0.0_13__chat_help.sql', 460438957, 'root', '2025-04-12 01:52:13', 6, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (14, '1.0.0.14', 'chat msg', 'SQL', 'V1.0.0_14__chat_msg.sql', 90236541, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (15, '1.0.0.15', 'chat notice', 'SQL', 'V1.0.0_15__chat_notice.sql', -666647298, 'root', '2025-04-12 01:52:13', 5, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (16, '1.0.0.16', 'chat number', 'SQL', 'V1.0.0_16__chat_number.sql', -199265467, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (17, '1.0.0.17', 'chat portrait', 'SQL', 'V1.0.0_17__chat_portrait.sql', -472154714, 'root', '2025-04-12 01:52:13', 7, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (18, '1.0.0.18', 'chat resource', 'SQL', 'V1.0.0_18__chat_resource.sql', -618609257, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (19, '1.0.0.19', 'chat robot', 'SQL', 'V1.0.0_19__chat_robot.sql', 1984849521, 'root', '2025-04-12 01:52:13', 5, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (20, '1.0.0.20', 'chat robot reply', 'SQL', 'V1.0.0_20__chat_robot_reply.sql', 836233174, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (21, '1.0.0.21', 'chat robot sub', 'SQL', 'V1.0.0_21__chat_robot_sub.sql', -291234311, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (22, '1.0.0.22', 'chat sms', 'SQL', 'V1.0.0_22__chat_sms.sql', 1841683570, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (23, '1.0.0.23', 'chat user', 'SQL', 'V1.0.0_23__chat_user.sql', -610753871, 'root', '2025-04-12 01:52:13', 6, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (24, '1.0.0.24', 'chat user appeal', 'SQL', 'V1.0.0_24__chat_user_appeal.sql', -1226138193, 'root', '2025-04-12 01:52:13', 4, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (25, '1.0.0.25', 'chat user collect', 'SQL', 'V1.0.0_25__chat_user_collect.sql', 873937222, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (26, '1.0.0.26', 'chat user deleted', 'SQL', 'V1.0.0_26__chat_user_deleted.sql', 238012981, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (27, '1.0.0.27', 'chat user info', 'SQL', 'V1.0.0_27__chat_user_info.sql', 486282637, 'root', '2025-04-12 01:52:13', 8, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (28, '1.0.0.28', 'chat user log', 'SQL', 'V1.0.0_28__chat_user_log.sql', -433879120, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (29, '1.0.0.29', 'chat user token', 'SQL', 'V1.0.0_29__chat_user_token.sql', -1172333741, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (30, '1.0.0.30', 'chat version', 'SQL', 'V1.0.0_30__chat_version.sql', 248026715, 'root', '2025-04-12 01:52:13', 8, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (31, '1.0.0.31', 'chat visit', 'SQL', 'V1.0.0_31__chat_visit.sql', 111420837, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (32, '1.0.0.32', 'chat voice', 'SQL', 'V1.0.0_32__chat_voice.sql', -710852154, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (33, '1.0.0.33', 'sys qrtz', 'SQL', 'V1.0.0_33__sys_qrtz.sql', -1757809918, 'root', '2025-04-12 01:52:13', 33, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (34, '1.0.0.34', 'sys info', 'SQL', 'V1.0.0_34__sys_info.sql', -578244250, 'root', '2025-04-12 01:52:13', 23, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (35, '1.0.0.35', 'sys menu', 'SQL', 'V1.0.0_35__sys_menu.sql', -473625500, 'root', '2025-04-12 01:52:13', 1, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (36, '1.0.0.36', 'wallet bank', 'SQL', 'V1.0.0_36__wallet_bank.sql', -1860479085, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (37, '1.0.0.37', 'wallet cash', 'SQL', 'V1.0.0_37__wallet_cash.sql', 130012454, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (38, '1.0.0.38', 'wallet info', 'SQL', 'V1.0.0_38__wallet_info.sql', -659731428, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (39, '1.0.0.39', 'wallet packet', 'SQL', 'V1.0.0_39__wallet_packet.sql', 264433956, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (40, '1.0.0.40', 'wallet recharge', 'SQL', 'V1.0.0_40__wallet_recharge.sql', -1580713155, 'root', '2025-04-12 01:52:13', 3, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (41, '1.0.0.41', 'wallet shopping', 'SQL', 'V1.0.0_41__wallet_shopping.sql', 1182573850, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (42, '1.0.0.42', 'wallet task', 'SQL', 'V1.0.0_42__wallet_task.sql', 386962564, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (43, '1.0.0.43', 'wallet trade', 'SQL', 'V1.0.0_43__wallet_trade.sql', -1224666004, 'root', '2025-04-12 01:52:13', 6, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (44, '1.0.0.44', 'wallet receive', 'SQL', 'V1.0.0_44__wallet_receive.sql', 1162800242, 'root', '2025-04-12 01:52:13', 2, 1);
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (45, '1.0.0.45', 'uni item', 'SQL', 'V1.0.0_45__uni_item.sql', -1632639299, 'root', '2025-04-12 01:52:13', 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799001', 'DEFAULT', '0 0/5 * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799002', 'DEFAULT', '0 0 3 * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799003', 'DEFAULT', '0 0/10 * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799004', 'DEFAULT', '0 0 5 * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799005', 'DEFAULT', '0 0/5 * * * ? *', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` tinyint(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` tinyint(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799001', 'DEFAULT', NULL, 'com.platform.modules.quartz.factory.QuartzJobExecution', 0, '1', '0', 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002C636F6D2E706C6174666F726D2E6D6F64756C65732E71756172747A2E646F6D61696E2E51756172747A4A6F6200000000000000010200054C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C000C696E766F6B6554617267657471007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C00067374617475737400274C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F5965734F724E6F456E756D3B78720029636F6D2E706C6174666F726D2E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0009626567696E54696D657400104C6A6176612F7574696C2F446174653B4C0005636F756E7471007E000A4C0007656E6454696D6571007E000D4C00056C6162656C71007E00094C0005706172616D71007E00094C0006706172616D7371007E00034C000874696D65556E69747400284C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F54696D65556E6974456E756D3B78707070707070707074000F3020302F35202A202A202A203F202A74001877616C6C65745461736B536572766963652E7461736B28297372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787018E40E69117905D974000CE992B1E58C85E4BBBBE58AA17E720025636F6D2E706C6174666F726D2E636F6D6D6F6E2E656E756D732E5965734F724E6F456E756D00000000000000001200007872000E6A6176612E6C616E672E456E756D000000000000000012000078707400035945537800);
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799002', 'DEFAULT', NULL, 'com.platform.modules.quartz.factory.QuartzJobExecution', 0, '1', '0', 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002C636F6D2E706C6174666F726D2E6D6F64756C65732E71756172747A2E646F6D61696E2E51756172747A4A6F6200000000000000010200054C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C000C696E766F6B6554617267657471007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C00067374617475737400274C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F5965734F724E6F456E756D3B78720029636F6D2E706C6174666F726D2E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0009626567696E54696D657400104C6A6176612F7574696C2F446174653B4C0005636F756E7471007E000A4C0007656E6454696D6571007E000D4C00056C6162656C71007E00094C0005706172616D71007E00094C0006706172616D7371007E00034C000874696D65556E69747400284C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F54696D65556E6974456E756D3B78707070707070707074000D3020302033202A202A203F202A740017636861745461736B536572766963652E766973697428297372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787018E40E69117905DA74000CE794A8E688B7E697A5E6B4BB7E720025636F6D2E706C6174666F726D2E636F6D6D6F6E2E656E756D732E5965734F724E6F456E756D00000000000000001200007872000E6A6176612E6C616E672E456E756D000000000000000012000078707400035945537800);
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799003', 'DEFAULT', NULL, 'com.platform.modules.quartz.factory.QuartzJobExecution', 0, '1', '0', 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002C636F6D2E706C6174666F726D2E6D6F64756C65732E71756172747A2E646F6D61696E2E51756172747A4A6F6200000000000000010200054C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C000C696E766F6B6554617267657471007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C00067374617475737400274C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F5965734F724E6F456E756D3B78720029636F6D2E706C6174666F726D2E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0009626567696E54696D657400104C6A6176612F7574696C2F446174653B4C0005636F756E7471007E000A4C0007656E6454696D6571007E000D4C00056C6162656C71007E00094C0005706172616D71007E00094C0006706172616D7371007E00034C000874696D65556E69747400284C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F54696D65556E6974456E756D3B7870707070707070707400103020302F3130202A202A202A203F202A740018636861745461736B536572766963652E62616E6E656428297372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787018E40E69117905DB74000CE794A8E688B7E8A7A3E5B0817E720025636F6D2E706C6174666F726D2E636F6D6D6F6E2E656E756D732E5965734F724E6F456E756D00000000000000001200007872000E6A6176612E6C616E672E456E756D000000000000000012000078707400035945537800);
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799004', 'DEFAULT', NULL, 'com.platform.modules.quartz.factory.QuartzJobExecution', 0, '1', '0', 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002C636F6D2E706C6174666F726D2E6D6F64756C65732E71756172747A2E646F6D61696E2E51756172747A4A6F6200000000000000010200054C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C000C696E766F6B6554617267657471007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C00067374617475737400274C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F5965734F724E6F456E756D3B78720029636F6D2E706C6174666F726D2E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0009626567696E54696D657400104C6A6176612F7574696C2F446174653B4C0005636F756E7471007E000A4C0007656E6454696D6571007E000D4C00056C6162656C71007E00094C0005706172616D71007E00094C0006706172616D7371007E00034C000874696D65556E69747400284C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F54696D65556E6974456E756D3B78707070707070707074000D3020302035202A202A203F202A740017636861745461736B536572766963652E6C6576656C28297372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787018E40E69117905DC74000CE7BEA4E7BB84E9998DE7BAA77E720025636F6D2E706C6174666F726D2E636F6D6D6F6E2E656E756D732E5965734F724E6F456E756D00000000000000001200007872000E6A6176612E6C616E672E456E756D000000000000000012000078707400035945537800);
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799005', 'DEFAULT', NULL, 'com.platform.modules.quartz.factory.QuartzJobExecution', 0, '1', '0', 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002C636F6D2E706C6174666F726D2E6D6F64756C65732E71756172747A2E646F6D61696E2E51756172747A4A6F6200000000000000010200054C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C000C696E766F6B6554617267657471007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C00067374617475737400274C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F5965734F724E6F456E756D3B78720029636F6D2E706C6174666F726D2E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0009626567696E54696D657400104C6A6176612F7574696C2F446174653B4C0005636F756E7471007E000A4C0007656E6454696D6571007E000D4C00056C6162656C71007E00094C0005706172616D71007E00094C0006706172616D7371007E00034C000874696D65556E69747400284C636F6D2F706C6174666F726D2F636F6D6D6F6E2F656E756D732F54696D65556E6974456E756D3B78707070707070707074000F3020302F35202A202A202A203F202A74001B77616C6C657452656365697665536572766963652E7461736B28297372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787018E40E69117905DD74000CE992B1E58C85E8A1A5E581BF7E720025636F6D2E706C6174666F726D2E636F6D6D6F6E2E656E756D732E5965734F724E6F456E756D00000000000000001200007872000E6A6176612E6C616E672E456E756D000000000000000012000078707400035945537800);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES ('AppScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES ('AppScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES ('AppScheduler', 'xdeMacBook-Air.local1745149392615', 1745150355545, 15000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int DEFAULT NULL,
  `int_prop_2` int DEFAULT NULL,
  `long_prop_1` bigint DEFAULT NULL,
  `long_prop_2` bigint DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint DEFAULT NULL,
  `prev_fire_time` bigint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799001', 'DEFAULT', 'TASK_CLASS_NAME1793574396027799001', 'DEFAULT', NULL, 1745150400000, 1745150100000, 5, 'WAITING', 'CRON', 1745149394000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799002', 'DEFAULT', 'TASK_CLASS_NAME1793574396027799002', 'DEFAULT', NULL, 1745175600000, -1, 5, 'WAITING', 'CRON', 1745149394000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799003', 'DEFAULT', 'TASK_CLASS_NAME1793574396027799003', 'DEFAULT', NULL, 1745150400000, 1745149800000, 5, 'WAITING', 'CRON', 1745149394000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799004', 'DEFAULT', 'TASK_CLASS_NAME1793574396027799004', 'DEFAULT', NULL, 1745182800000, -1, 5, 'WAITING', 'CRON', 1745149394000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES ('AppScheduler', 'TASK_CLASS_NAME1793574396027799005', 'DEFAULT', 'TASK_CLASS_NAME1793574396027799005', 'DEFAULT', NULL, 1745150400000, 1745150100000, 5, 'WAITING', 'CRON', 1745149394000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job` (
  `job_id` bigint NOT NULL COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `status` char(1) DEFAULT 'N' COMMENT '状态（Y正常N暂停）',
  PRIMARY KEY (`job_id`,`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of quartz_job
-- ----------------------------
BEGIN;
INSERT INTO `quartz_job` (`job_id`, `job_name`, `invoke_target`, `cron_expression`, `status`) VALUES (1793574396027799001, '钱包任务', 'walletTaskService.task()', '0 0/5 * * * ? *', 'Y');
INSERT INTO `quartz_job` (`job_id`, `job_name`, `invoke_target`, `cron_expression`, `status`) VALUES (1793574396027799002, '用户日活', 'chatTaskService.visit()', '0 0 3 * * ? *', 'Y');
INSERT INTO `quartz_job` (`job_id`, `job_name`, `invoke_target`, `cron_expression`, `status`) VALUES (1793574396027799003, '用户解封', 'chatTaskService.banned()', '0 0/10 * * * ? *', 'Y');
INSERT INTO `quartz_job` (`job_id`, `job_name`, `invoke_target`, `cron_expression`, `status`) VALUES (1793574396027799004, '群组降级', 'chatTaskService.level()', '0 0 5 * * ? *', 'Y');
INSERT INTO `quartz_job` (`job_id`, `job_name`, `invoke_target`, `cron_expression`, `status`) VALUES (1793574396027799005, '钱包补偿', 'walletReceiveService.task()', '0 0/5 * * * ? *', 'Y');
COMMIT;

-- ----------------------------
-- Table structure for quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_log`;
CREATE TABLE `quartz_log` (
  `log_id` bigint NOT NULL COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `message` varchar(2000) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of quartz_log
-- ----------------------------
BEGIN;
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910753461985624065, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-12 01:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910753461985624066, '钱包补偿', 'walletReceiveService.task()', '总共耗时：11毫秒', 'Y', '2025-04-12 01:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910754720067108866, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-12 02:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910754720201326593, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-12 02:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910754720457179138, '用户解封', 'chatTaskService.banned()', '总共耗时：83毫秒', 'Y', '2025-04-12 02:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910755978467360770, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-12 02:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910755978509303809, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-12 02:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910757236762755074, '钱包任务', 'walletTaskService.task()', '总共耗时：13毫秒', 'Y', '2025-04-12 02:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910757236792115201, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-12 02:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910757236825669634, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-12 02:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910758494970068993, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-12 02:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910758495041372161, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-12 02:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910759753252880386, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-12 02:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910759753303212033, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-12 02:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910759753319989249, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-12 02:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910761011590217730, '钱包任务', 'walletTaskService.task()', '总共耗时：13毫秒', 'Y', '2025-04-12 02:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910761011602800642, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-12 02:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910762269847863297, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-12 02:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910762269898194946, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-12 02:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910762269940137986, '钱包补偿', 'walletReceiveService.task()', '总共耗时：8毫秒', 'Y', '2025-04-12 02:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910763528097120258, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-12 02:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910763528160034818, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-12 02:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910764786384125954, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-12 02:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910764786413486082, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-12 02:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910764786434457602, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-12 02:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910766044729851905, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-12 02:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910766044750823425, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-12 02:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910767302987497474, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-12 02:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910767303021051906, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-12 02:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910767303029440514, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-12 02:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910768561291280385, '钱包任务', 'walletTaskService.task()', '总共耗时：13毫秒', 'Y', '2025-04-12 02:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910768561324834817, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-12 02:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910769819582480385, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-12 03:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910769819695726593, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-12 03:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910769819725086721, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-12 03:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910769819880275969, '用户日活', 'chatTaskService.visit()', '总共耗时：67毫秒', 'Y', '2025-04-12 03:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910771077915623426, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-12 03:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1910771077949177857, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-12 03:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911778969447849986, '钱包任务', 'walletTaskService.task()', '总共耗时：32毫秒', 'Y', '2025-04-14 21:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911778969447849987, '钱包补偿', 'walletReceiveService.task()', '总共耗时：21毫秒', 'Y', '2025-04-14 21:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911778969619816450, '用户解封', 'chatTaskService.banned()', '总共耗时：97毫秒', 'Y', '2025-04-14 21:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911784343953498113, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-14 22:11:21');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911785261306503169, '钱包补偿', 'walletReceiveService.task()', '总共耗时：16毫秒', 'Y', '2025-04-14 22:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911785261344251905, '钱包任务', 'walletTaskService.task()', '总共耗时：67毫秒', 'Y', '2025-04-14 22:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911786518876282882, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-14 22:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911786518993723393, '钱包补偿', 'walletReceiveService.task()', '总共耗时：8毫秒', 'Y', '2025-04-14 22:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911786518997917697, '用户解封', 'chatTaskService.banned()', '总共耗时：20毫秒', 'Y', '2025-04-14 22:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911787777201037313, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-14 22:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911787777234591745, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-14 22:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911789035559346177, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-14 22:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911789035601289218, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-14 22:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911789035630649345, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-14 22:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911790293791825922, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-14 22:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911790293829574658, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-14 22:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911794068866760705, '钱包补偿', 'walletReceiveService.task()', '总共耗时：9毫秒', 'Y', '2025-04-14 22:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911794068866760706, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-14 22:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1911794069017755650, '用户解封', 'chatTaskService.banned()', '总共耗时：69毫秒', 'Y', '2025-04-14 22:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913505344877797378, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-19 16:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913505344881991682, '用户解封', 'chatTaskService.banned()', '总共耗时：22毫秒', 'Y', '2025-04-19 16:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913505344890380289, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-19 16:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913506602913144834, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-19 16:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913506602967670785, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 16:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913507861221122049, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-19 16:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913507861271453698, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-19 16:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913507861338562562, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-19 16:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913509119671709697, '钱包补偿', 'walletReceiveService.task()', '总共耗时：12毫秒', 'Y', '2025-04-19 16:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913509119671709698, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 16:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913510377996468225, '钱包任务', 'walletTaskService.task()', '总共耗时：15毫秒', 'Y', '2025-04-19 16:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913510377996468226, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 16:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913510378277486593, '用户解封', 'chatTaskService.banned()', '总共耗时：85毫秒', 'Y', '2025-04-19 16:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913511636178616322, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-19 16:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913511636228947969, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 16:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913519154296569857, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-19 17:04:52');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913519185925816321, '钱包补偿', 'walletReceiveService.task()', '总共耗时：8毫秒', 'Y', '2025-04-19 17:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913519185971953665, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 17:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913525477281153025, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-19 17:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913525477390204929, '用户解封', 'chatTaskService.banned()', '总共耗时：16毫秒', 'Y', '2025-04-19 17:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913525477394399234, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 17:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913526735685599234, '钱包任务', 'walletTaskService.task()', '总共耗时：18毫秒', 'Y', '2025-04-19 17:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913526735748513794, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 17:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913527993880330241, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-19 17:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913527993955827713, '用户解封', 'chatTaskService.banned()', '总共耗时：9毫秒', 'Y', '2025-04-19 17:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913527993989382145, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-19 17:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913530510756335618, '钱包补偿', 'walletReceiveService.task()', '总共耗时：12毫秒', 'Y', '2025-04-19 17:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913530510768918529, '用户解封', 'chatTaskService.banned()', '总共耗时：31毫秒', 'Y', '2025-04-19 17:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913530510768918530, '钱包任务', 'walletTaskService.task()', '总共耗时：23毫秒', 'Y', '2025-04-19 17:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913531768758128642, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 17:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913531768791683074, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 17:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913533027061911553, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-19 18:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913533027103854594, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-19 18:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913533027149991937, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-19 18:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913534285470552066, '钱包任务', 'walletTaskService.task()', '总共耗时：19毫秒', 'Y', '2025-04-19 18:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913534285491523586, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 18:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913535543824670721, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-19 18:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913535543841447938, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-19 18:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913535543942111233, '用户解封', 'chatTaskService.banned()', '总共耗时：53毫秒', 'Y', '2025-04-19 18:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913536802027790337, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-19 18:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913536802073927682, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 18:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913538060226715649, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 18:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913538060298018818, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-19 18:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913538060352544769, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 18:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913539318564052994, '钱包任务', 'walletTaskService.task()', '总共耗时：25毫秒', 'Y', '2025-04-19 18:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913539318580830210, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 18:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913540576771366913, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-19 18:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913540576859447297, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-19 18:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913540576918167554, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 18:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913544351712075778, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-19 18:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913544351745630210, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 18:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913545609978109954, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-19 18:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913545610032635906, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-19 18:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913545610061996034, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 18:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913546868239949825, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-19 18:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913546868307058689, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 18:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913548126556315650, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-19 19:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913548126610841601, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-19 19:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913548126636007425, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 19:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913549384843321346, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-19 19:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913549384897847297, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 19:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913550643142909954, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-19 19:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913550643226796034, '用户解封', 'chatTaskService.banned()', '总共耗时：9毫秒', 'Y', '2025-04-19 19:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913550643260350465, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 19:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913551901442498562, '钱包任务', 'walletTaskService.task()', '总共耗时：15毫秒', 'Y', '2025-04-19 19:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913551901484441602, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 19:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913553159737892866, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-19 19:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913553159842750465, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-19 19:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913553159905665026, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 19:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913554417995538433, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 19:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913554418071035906, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 19:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913555676295127042, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-19 19:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913555676395790338, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-19 19:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913555676437733378, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 19:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913556934611492865, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-19 19:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913556934632464386, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 19:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913558192873332738, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 19:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913558192969801729, '用户解封', 'chatTaskService.banned()', '总共耗时：15毫秒', 'Y', '2025-04-19 19:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913558193028521985, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 19:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913567001012396034, '钱包任务', 'walletTaskService.task()', '总共耗时：23毫秒', 'Y', '2025-04-19 20:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913567001033367553, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 20:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913570775818887169, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 20:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913570775898578946, '用户解封', 'chatTaskService.banned()', '总共耗时：11毫秒', 'Y', '2025-04-19 20:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913570775898578947, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 20:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913572034084921345, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-19 20:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913572034110087169, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 20:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913573292699086849, '钱包任务', 'walletTaskService.task()', '总共耗时：18毫秒', 'Y', '2025-04-19 20:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913573292699086850, '钱包补偿', 'walletReceiveService.task()', '总共耗时：9毫秒', 'Y', '2025-04-19 20:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913573292866859009, '用户解封', 'chatTaskService.banned()', '总共耗时：73毫秒', 'Y', '2025-04-19 20:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913574550801547266, '钱包补偿', 'walletReceiveService.task()', '总共耗时：6毫秒', 'Y', '2025-04-19 20:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913574550801547267, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 20:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913575808945946626, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-19 20:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913575809050804226, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 20:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913575809075970050, '用户解封', 'chatTaskService.banned()', '总共耗时：22毫秒', 'Y', '2025-04-19 20:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913577067350396929, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 20:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913577067350396930, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-19 20:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913578325595459586, '钱包任务', 'walletTaskService.task()', '总共耗时：13毫秒', 'Y', '2025-04-19 21:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913578325662568449, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 21:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913578325813563394, '用户解封', 'chatTaskService.banned()', '总共耗时：49毫秒', 'Y', '2025-04-19 21:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913579583840522242, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 21:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913579583928602626, '钱包补偿', 'walletReceiveService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 21:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913580842228191233, '钱包任务', 'walletTaskService.task()', '总共耗时：14毫秒', 'Y', '2025-04-19 21:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913580842328854530, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-19 21:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913580842374991874, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 21:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913582100439699457, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 21:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913582100494225409, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 21:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913583358760259585, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-19 21:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913583358802202625, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-19 21:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913583358839951361, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 21:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913584617244397570, '钱包任务', 'walletTaskService.task()', '总共耗时：19毫秒', 'Y', '2025-04-19 21:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913584617244397571, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 21:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913585875309105153, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-19 21:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913585875380408322, '用户解封', 'chatTaskService.banned()', '总共耗时：10毫秒', 'Y', '2025-04-19 21:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913585875401379842, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 21:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913587133566750721, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-19 21:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913587133625470977, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 21:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913588391862145025, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-19 21:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913588391916670977, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-19 21:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913588391954419714, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-19 21:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913590908469710849, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-19 21:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913590908532625410, '用户解封', 'chatTaskService.banned()', '总共耗时：15毫秒', 'Y', '2025-04-19 21:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913590908587151362, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 21:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913592166828019713, '钱包任务', 'walletTaskService.task()', '总共耗时：18毫秒', 'Y', '2025-04-19 21:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913592166853185537, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 21:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913593425022750721, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-19 22:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913593425102442497, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-19 22:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913593425156968450, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-19 22:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913594683360088066, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 22:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913594683393642497, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 22:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913595941680648193, '钱包任务', 'walletTaskService.task()', '总共耗时：20毫秒', 'Y', '2025-04-19 22:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913595941722591233, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-19 22:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913595941760339970, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 22:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913597199929905154, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-19 22:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913597199988625410, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-19 22:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913598458242076674, '钱包任务', 'walletTaskService.task()', '总共耗时：18毫秒', 'Y', '2025-04-19 22:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913598458288214017, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-19 22:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913598458313379841, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-19 22:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913619270437244930, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-19 23:42:42');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913622365707767810, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-19 23:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913622365762293762, '钱包补偿', 'walletReceiveService.task()', '总共耗时：6毫秒', 'Y', '2025-04-19 23:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913623624003162114, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 00:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913623624128991233, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 00:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913623624149962753, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 00:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913624882332110849, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 00:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913624882390831106, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 00:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913645015012282370, '钱包任务', 'walletTaskService.task()', '总共耗时：15毫秒', 'Y', '2025-04-20 01:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913645015037448194, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 01:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913646273269927937, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 01:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913646273345425410, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-20 01:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913646273378979841, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 01:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913647531531767809, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 01:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913647531586293762, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 01:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913648789818773505, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 01:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913648789885882370, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-20 01:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913648789923631106, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 01:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913650048114167810, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 01:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913650048156110850, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 01:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913651306476670978, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 01:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913651306539585538, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-20 01:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913651306594111489, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 01:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913652564725927938, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 01:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913652564776259586, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 01:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913653822991962113, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 02:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913653823059070977, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-20 02:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913653823092625409, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 02:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913655081287356418, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 02:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913655081350270978, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 02:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913656339641470977, '钱包任务', 'walletTaskService.task()', '总共耗时：16毫秒', 'Y', '2025-04-20 02:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913656339746328577, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-20 02:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913656339788271618, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 02:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913657597873950722, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 02:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913657597911699458, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 02:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913658856165150721, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 02:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913658856232259585, '用户解封', 'chatTaskService.banned()', '总共耗时：11毫秒', 'Y', '2025-04-20 02:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913658856265814018, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 02:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913660114452156417, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 02:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913660114489905153, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 02:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913662631181357057, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 02:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913662631219105793, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 02:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913671439165231105, '钱包任务', 'walletTaskService.task()', '总共耗时：27毫秒', 'Y', '2025-04-20 03:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913671439186202626, '用户解封', 'chatTaskService.banned()', '总共耗时：16毫秒', 'Y', '2025-04-20 03:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913671439194591233, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 03:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913672697401905154, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 03:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913672697473208322, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 03:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913673955663745025, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 03:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913673955718270977, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 03:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913673955760214018, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 03:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913675213963333633, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 03:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913675214013665281, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 03:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913676472220979202, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 03:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913676472304865282, '用户解封', 'chatTaskService.banned()', '总共耗时：10毫秒', 'Y', '2025-04-20 03:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913676472342614018, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 03:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913677730554122241, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 03:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913677730604453890, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 03:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913678988794990593, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 03:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913678988845322241, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 03:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913678988887265281, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 03:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913680247144910850, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 03:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913680247199436802, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 03:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913681505398362113, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 03:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913681505427722241, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 03:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913681505465470978, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 03:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913682763693756418, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 03:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913682763731505154, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 03:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913684022026899458, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-20 04:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913684022077231105, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 04:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913684022135951362, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 04:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913685280250990594, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 04:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913685280284545026, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 04:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913686538546384897, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 04:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913686538579939329, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 04:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913686538617688066, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 04:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913691571736350721, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 04:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913691571795070977, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-20 04:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913691571857985537, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 04:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913692830014967810, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 04:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913692830048522241, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 04:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913694088314556418, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 04:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913694088369082369, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 04:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913694088411025409, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 04:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913695346584784898, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 04:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913695346622533634, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 04:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913696604909539329, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 04:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913696605022785538, '用户解封', 'chatTaskService.banned()', '总共耗时：12毫秒', 'Y', '2025-04-20 04:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913696605047951361, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 04:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913697863154601985, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 04:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913697863171379202, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 04:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913699121504522242, '钱包任务', 'walletTaskService.task()', '总共耗时：18毫秒', 'Y', '2025-04-20 05:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913699121546465281, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 05:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913699121600991233, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 05:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913699121626157057, '群组降级', 'chatTaskService.level()', '总共耗时：15毫秒', 'Y', '2025-04-20 05:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913700379774750721, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 05:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913700379820888065, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 05:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913701638049173505, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 05:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913701638179196929, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 05:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913701638179196930, '用户解封', 'chatTaskService.banned()', '总共耗时：20毫秒', 'Y', '2025-04-20 05:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913702896302624769, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 05:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913702896365539329, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 05:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913704154635767809, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 05:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913704154673516546, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 05:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913704154715459586, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 05:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913705412968910850, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 05:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913705413040214017, '钱包补偿', 'walletReceiveService.task()', '总共耗时：13毫秒', 'Y', '2025-04-20 05:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913717995872522242, '钱包任务', 'walletTaskService.task()', '总共耗时：17毫秒', 'Y', '2025-04-20 06:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913717995880910849, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 06:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913719254151139330, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 06:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913719254214053889, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 06:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913719254255996929, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 06:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913720512396201985, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 06:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913720512425562114, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 06:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913721770716762114, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 06:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913721770767093761, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 06:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913721770830008321, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 06:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913723029028933633, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 06:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913723029075070977, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 06:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913724287265607682, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 06:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913724287320133634, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 06:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913724287362076673, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 06:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913725545590362114, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 06:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913725545653276673, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 06:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913726803873173505, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 06:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913726803936088065, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 06:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913726803969642497, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 06:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913728062130819074, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 06:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913728062151790593, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 06:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913729320476545026, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 07:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913729320539459585, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 07:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913729320573014017, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 07:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913730578734190593, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 07:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913730578776133633, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 07:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913731837033779201, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 07:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913731837079916546, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 07:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913731837117665282, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 07:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913743161654579201, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 07:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913743161688133633, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 07:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913744419949973505, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 08:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913744419996110850, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 08:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913744420025470977, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913745678257950721, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 08:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913745678295699457, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913746936565927938, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 08:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913746936628842497, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 08:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913746936670785538, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913748194936819714, '钱包补偿', 'walletReceiveService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 08:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913748194936819715, '钱包任务', 'walletTaskService.task()', '总共耗时：27毫秒', 'Y', '2025-04-20 08:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913749453097996289, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 08:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913749453169299458, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 08:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913749453223825410, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913750711435333633, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 08:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913750711473082370, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 08:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913751969688784897, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 08:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913751969747505153, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 08:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913751969818808322, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913753227979984898, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 08:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913753228000956417, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913754486258601985, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 08:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913754486304739329, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 08:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913754486355070977, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 08:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913755744579162113, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 08:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913755744600133633, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913757002882945026, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 08:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913757002924888066, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-20 08:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913757002950053889, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 08:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913758261165756417, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 08:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913758261203505153, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 08:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913767069191573505, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 09:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913767069250293761, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 09:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913767069283848194, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 09:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913769585769779201, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 09:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913769585811722242, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 09:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913769585857859586, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 09:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913774618942967810, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 10:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913774619005882370, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 10:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913774619089768450, '钱包补偿', 'walletReceiveService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 10:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913775877259333634, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 10:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913775877305470977, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 10:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913778393829150721, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 10:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913778393871093762, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 10:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913779652145516546, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 10:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913779652195848193, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-20 10:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913779652241985538, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 10:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913780910474465282, '钱包任务', 'walletTaskService.task()', '总共耗时：14毫秒', 'Y', '2025-04-20 10:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913780910478659585, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 10:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913782168652419073, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 10:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913782168698556418, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-20 10:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913782168727916546, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 10:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913783427006533634, '钱包任务', 'walletTaskService.task()', '总共耗时：15毫秒', 'Y', '2025-04-20 10:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913783427035893762, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 10:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913784685314510849, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 10:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913784685373231105, '用户解封', 'chatTaskService.banned()', '总共耗时：7毫秒', 'Y', '2025-04-20 10:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913784685398396930, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 10:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913785943551184897, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 10:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913785943588933634, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 10:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913787201938853889, '钱包任务', 'walletTaskService.task()', '总共耗时：29毫秒', 'Y', '2025-04-20 10:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913787201968214018, '用户解封', 'chatTaskService.banned()', '总共耗时：14毫秒', 'Y', '2025-04-20 10:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913787202022739970, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 10:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913788460137779202, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 10:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913788460175527938, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 10:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913789718483505153, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-20 11:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913789718533836801, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 11:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913789718575779842, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 11:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913790976715984898, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 11:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913790976753733633, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 11:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913792235040739329, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 11:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913792235120431105, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 11:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913792235141402626, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 11:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913793493315162114, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 11:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913793493373882369, '钱包补偿', 'walletReceiveService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 11:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913794751577001985, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 11:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913794751627333634, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 11:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913794751673470977, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 11:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913796009918533634, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 11:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913796009960476673, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 11:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913797268226510850, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-20 11:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913797268276842497, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 11:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913797268364922882, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 11:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913798526555459586, '钱包任务', 'walletTaskService.task()', '总共耗时：15毫秒', 'Y', '2025-04-20 11:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913798526618374145, '钱包补偿', 'walletReceiveService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 11:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913799784745996290, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 11:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913799784808910849, '用户解封', 'chatTaskService.banned()', '总共耗时：12毫秒', 'Y', '2025-04-20 11:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913799784834076674, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 11:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913801043108499458, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 11:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913801043167219714, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 11:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913802301336784898, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 11:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913802301399699457, '用户解封', 'chatTaskService.banned()', '总共耗时：8毫秒', 'Y', '2025-04-20 11:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913802301450031106, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 11:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913803559640567809, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 11:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913803559669927938, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 11:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913804817956933633, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 12:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913804818045014018, '用户解封', 'chatTaskService.banned()', '总共耗时：9毫秒', 'Y', '2025-04-20 12:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913804818099539969, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 12:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913806076197801986, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 12:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913806076252327938, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 12:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913807334501584897, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 12:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913807334543527937, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 12:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913807334589665282, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 12:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913808592817950721, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 12:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913808592855699458, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 12:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913809851109150722, '钱包任务', 'walletTaskService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 12:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913809851151093762, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 12:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913809851172065282, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 12:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913811109354213378, '钱包任务', 'walletTaskService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 12:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913811109379379202, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 12:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913827467131424770, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 13:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913827467164979201, '用户解封', 'chatTaskService.banned()', '总共耗时：3毫秒', 'Y', '2025-04-20 13:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913827467181756418, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 13:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913835016945733633, '钱包任务', 'walletTaskService.task()', '总共耗时：15毫秒', 'Y', '2025-04-20 14:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913835016975093762, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 14:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913835017008648194, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 14:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913843824996716545, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 14:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913843825021882370, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 14:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913870249103527937, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 16:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913870249149665282, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 16:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913870249187414018, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 16:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913881617399615489, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 17:05:10');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913890381771116545, '钱包任务', 'walletTaskService.task()', '总共耗时：13毫秒', 'Y', '2025-04-20 17:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913890381808865281, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 17:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913890381859196930, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 17:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913891640028762113, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 17:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913891640079093761, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 17:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913892898294796289, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 17:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913892898353516546, '用户解封', 'chatTaskService.banned()', '总共耗时：6毫秒', 'Y', '2025-04-20 17:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913892898399653890, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 17:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913894156669882369, '钱包任务', 'walletTaskService.task()', '总共耗时：12毫秒', 'Y', '2025-04-20 17:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913894156699242497, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 17:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913895414898167810, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 18:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913895414961082369, '用户解封', 'chatTaskService.banned()', '总共耗时：9毫秒', 'Y', '2025-04-20 18:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913895414998831105, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 18:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913896673185173505, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 18:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913896673235505153, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 18:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913900448071356418, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 18:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913900448117493761, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 18:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913900448151048194, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 18:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913901706354167810, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 18:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913901706375139329, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 18:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913902964674727938, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 18:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913902964699893762, '用户解封', 'chatTaskService.banned()', '总共耗时：3毫秒', 'Y', '2025-04-20 18:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913902964720865281, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 18:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913904223074979841, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 18:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913904223116922882, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 18:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913905481412325377, '钱包任务', 'walletTaskService.task()', '总共耗时：18毫秒', 'Y', '2025-04-20 18:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913905481424908289, '钱包补偿', 'walletReceiveService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 18:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913905481575903234, '用户解封', 'chatTaskService.banned()', '总共耗时：61毫秒', 'Y', '2025-04-20 18:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913906739653197825, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 18:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913906739653197826, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 18:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913907997785014273, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 18:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913907997915037697, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 18:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913907997944397825, '用户解封', 'chatTaskService.banned()', '总共耗时：25毫秒', 'Y', '2025-04-20 18:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913909256143323138, '钱包任务', 'walletTaskService.task()', '总共耗时：10毫秒', 'Y', '2025-04-20 18:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913909256185266177, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 18:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913910514518409218, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 19:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913910514551963650, '用户解封', 'chatTaskService.banned()', '总共耗时：3毫秒', 'Y', '2025-04-20 19:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913910514572935169, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 19:00:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913911772771860481, '钱包任务', 'walletTaskService.task()', '总共耗时：7毫秒', 'Y', '2025-04-20 19:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913911772817997825, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 19:05:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913913031046283265, '钱包任务', 'walletTaskService.task()', '总共耗时：14毫秒', 'Y', '2025-04-20 19:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913913031092420609, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 19:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913913031167918082, '钱包补偿', 'walletReceiveService.task()', '总共耗时：3毫秒', 'Y', '2025-04-20 19:10:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913914289354260482, '钱包任务', 'walletTaskService.task()', '总共耗时：22毫秒', 'Y', '2025-04-20 19:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913914289354260483, '钱包补偿', 'walletReceiveService.task()', '总共耗时：5毫秒', 'Y', '2025-04-20 19:15:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913915547599323137, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 19:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913915547641266178, '用户解封', 'chatTaskService.banned()', '总共耗时：4毫秒', 'Y', '2025-04-20 19:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913915547687403522, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 19:20:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913916805840191489, '钱包任务', 'walletTaskService.task()', '总共耗时：9毫秒', 'Y', '2025-04-20 19:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913916805856968705, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 19:25:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913918064580182018, '钱包任务', 'walletTaskService.task()', '总共耗时：8毫秒', 'Y', '2025-04-20 19:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913918064626319361, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 19:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913918064655679490, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 19:30:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913919322472923137, '钱包补偿', 'walletReceiveService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 19:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913919322472923138, '钱包任务', 'walletTaskService.task()', '总共耗时：14毫秒', 'Y', '2025-04-20 19:35:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913920580743151617, '钱包任务', 'walletTaskService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 19:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913920580785094657, '用户解封', 'chatTaskService.banned()', '总共耗时：5毫秒', 'Y', '2025-04-20 19:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913920580806066178, '钱包补偿', 'walletReceiveService.task()', '总共耗时：1毫秒', 'Y', '2025-04-20 19:40:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913921839235682305, '钱包补偿', 'walletReceiveService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 19:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913921839235682306, '钱包任务', 'walletTaskService.task()', '总共耗时：19毫秒', 'Y', '2025-04-20 19:45:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913923097346527233, '钱包任务', 'walletTaskService.task()', '总共耗时：11毫秒', 'Y', '2025-04-20 19:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913923097438801921, '钱包补偿', 'walletReceiveService.task()', '总共耗时：2毫秒', 'Y', '2025-04-20 19:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913923097640128514, '用户解封', 'chatTaskService.banned()', '总共耗时：64毫秒', 'Y', '2025-04-20 19:50:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913924355641921537, '钱包任务', 'walletTaskService.task()', '总共耗时：6毫秒', 'Y', '2025-04-20 19:55:00');
INSERT INTO `quartz_log` (`log_id`, `job_name`, `invoke_target`, `message`, `status`, `create_time`) VALUES (1913924355692253185, '钱包补偿', 'walletReceiveService.task()', '总共耗时：4毫秒', 'Y', '2025-04-20 19:55:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_column
-- ----------------------------
DROP TABLE IF EXISTS `sys_column`;
CREATE TABLE `sys_column` (
  `column_id` bigint NOT NULL COMMENT '表格ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `table_id` int DEFAULT NULL COMMENT '字段ID',
  `content` longtext COMMENT '字段内容',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='动态表格';

-- ----------------------------
-- Records of sys_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` bigint NOT NULL COMMENT '主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `dict_code` varchar(100) DEFAULT '' COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`,`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='字典数据';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` (`dict_id`, `dict_name`, `dict_type`, `dict_code`, `dict_sort`, `remark`) VALUES (1913548894596247553, 'InviteCode', '', 'InviteCode', 0, '邀请码');
INSERT INTO `sys_dict` (`dict_id`, `dict_name`, `dict_type`, `dict_code`, `dict_sort`, `remark`) VALUES (1913548951760416770, '123456', 'InviteCode', '123456', 0, '邀请码1');
INSERT INTO `sys_dict` (`dict_id`, `dict_name`, `dict_type`, `dict_code`, `dict_sort`, `remark`) VALUES (1913548987407806465, '123123', 'InviteCode', '123123', 0, '邀请码2');
INSERT INTO `sys_dict` (`dict_id`, `dict_name`, `dict_type`, `dict_code`, `dict_sort`, `remark`) VALUES (1913553188028428289, '123321', 'InviteCode', '123321', 0, '邀请码3');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` bigint NOT NULL COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `log_type` char(2) DEFAULT '0' COMMENT '业务类型',
  `request_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `request_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `username` varchar(50) DEFAULT '' COMMENT '操作人员',
  `ip_addr` varchar(50) DEFAULT '' COMMENT '主机地址',
  `location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `message` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` char(1) DEFAULT 'N' COMMENT '操作状态（Y正常N异常）',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_login`;
CREATE TABLE `sys_login` (
  `log_id` bigint NOT NULL COMMENT '访问ID',
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ip_addr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT 'N' COMMENT '登录状态（Y成功 N失败）',
  `message` varchar(255) DEFAULT '' COMMENT '提示消息',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL COMMENT '主ID',
  `parent_id` bigint DEFAULT '0' COMMENT '父ID',
  `menu_name` varchar(50) NOT NULL COMMENT '名称',
  `menu_type` char(1) DEFAULT '' COMMENT '类型（M目录 C菜单 F按钮）',
  `icon` varchar(200) DEFAULT '#' COMMENT '图标',
  `path` varchar(200) DEFAULT '' COMMENT '路径',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `perms` varchar(200) DEFAULT NULL COMMENT '权限',
  `sort` int DEFAULT '0' COMMENT '顺序',
  `frame_flag` char(1) DEFAULT 'N' COMMENT '外链',
  `frame_url` varchar(500) DEFAULT '' COMMENT '地址',
  `status` char(1) DEFAULT 'Y' COMMENT '菜单状态（Y正常N停用）',
  `visible` char(1) DEFAULT 'N' COMMENT '显示',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993102, 0, '系统设置', '1', 'SettingOutlined', NULL, NULL, NULL, 902, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993118, 0, '系统监控', '1', 'CloudServerOutlined', NULL, NULL, NULL, 903, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993159, 1590993506, '用户管理', '2', 'AuditOutlined', '/sys/user', '/sys/user/index', 'sys:user:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993181, 1590993506, '角色管理', '2', 'SlidersOutlined', '/sys/role', '/sys/role/index', 'sys:role:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993195, 1590993102, '菜单管理', '2', 'CopyOutlined', '/sys/menu', '/sys/menu/index', 'sys:menu:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993303, 1590993102, '字典管理', '2', 'BarcodeOutlined', '/sys/dict', '/sys/dict/index', 'sys:dict:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993365, 1590993118, '在线用户', '2', 'ContactsOutlined', '/monitor/online', '/monitor/online/index', 'monitor:online:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993390, 1616398154, '定时任务', '2', 'FileExcelOutlined', '/quartz/job', '/quartz/job/index', 'quartz:job:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993460, 1725692158, '操作日志', '2', 'PicLeftOutlined', '/sys/log', '/sys/log/index', 'sys:log:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993481, 1725692158, '登录日志', '2', 'PicRightOutlined', '/sys/login', '/sys/login/index', 'sys:login:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993506, 0, '系统账户', '1', 'UserOutlined', NULL, NULL, NULL, 901, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993543, 1590993159, '用户新增', '3', '#', NULL, NULL, 'sys:user:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993546, 1590993159, '用户修改', '3', '#', NULL, NULL, 'sys:user:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993549, 1590993159, '用户删除', '3', '#', NULL, NULL, 'sys:user:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993567, 1590993181, '角色新增', '3', '#', NULL, NULL, 'sys:role:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993570, 1590993181, '角色修改', '3', '#', NULL, NULL, 'sys:role:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993579, 1590993181, '角色删除', '3', '#', NULL, NULL, 'sys:role:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993625, 1590993195, '菜单新增', '3', '#', '', '', 'sys:menu:add', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993629, 1590993195, '菜单修改', '3', '#', '', '', 'sys:menu:edit', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993633, 1590993195, '菜单删除', '3', '#', '', '', 'sys:menu:remove', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993734, 1590993303, '字典新增', '3', '#', NULL, NULL, 'sys:dict:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993737, 1590993303, '字典修改', '3', '#', NULL, NULL, 'sys:dict:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993750, 1590993303, '字典删除', '3', '#', NULL, NULL, 'sys:dict:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993793, 1590993460, '操作删除', '3', '#', NULL, NULL, 'sys:log:remove', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993804, 1590993481, '登录删除', '3', '#', NULL, NULL, 'sys:login:remove', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993816, 1590993365, '批量强退', '3', '#', NULL, NULL, 'monitor:online:logout', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993827, 1590993390, '任务新增', '3', '#', NULL, NULL, 'quartz:job:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993831, 1590993390, '任务修改', '3', '#', NULL, NULL, 'quartz:job:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1590993834, 1590993390, '任务删除', '3', '#', NULL, NULL, 'quartz:job:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1612438635, 1590993390, '执行一次', '3', '#', NULL, NULL, 'quartz:job:run', 4, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1616398154, 0, '系统任务', '1', 'AppstoreOutlined', NULL, NULL, NULL, 904, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1616407020, 1590993118, '缓存监控', '2', 'FundProjectionScreenOutlined', '/monitor/cache', '/monitor/cache/index', 'monitor:cache:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1616653528, 1590993195, '菜单复制', '3', '#', NULL, NULL, 'sys:menu:copy', 4, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1660205475, 1616398154, '定时日志', '2', 'FileExclamationOutlined', '/quartz/log', '/quartz/log/index', 'quartz:log:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1660205479, 1660205475, '任务删除', '3', '#', NULL, NULL, 'quartz:log:remove', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667963359, 1667963444, '用户管理', '2', 'UserAddOutlined', '/chat/user', '/chat/user/index', 'chat:user:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667963444, 0, '用户管理', '1', 'UserSwitchOutlined', NULL, NULL, NULL, 101, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667985163, 1673405797, '系统公告', '2', 'ScheduleOutlined', '/operate/notice', '/operate/notice/index', 'operate:notice:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667985164, 1667985163, '查询', '3', '#', '', '', 'operate:notice:query', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667985165, 1667985163, '新增', '3', '#', '', '', 'operate:notice:add', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667985166, 1667985163, '修改', '3', '#', '', '', 'operate:notice:edit', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667985167, 1667985163, '删除', '3', '#', '', '', 'operate:notice:remove', 4, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667987841, 1673405797, '帮助中心', '2', 'LineHeightOutlined', '/operate/help', '/operate/help/index', 'operate:help:list', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667987843, 1667987841, '新增', '3', '#', NULL, NULL, 'operate:help:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667987844, 1667987841, '修改', '3', '#', NULL, NULL, 'operate:help:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667987845, 1667987841, '删除', '3', '#', NULL, NULL, 'operate:help:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667988519, 1673405797, '建议反馈', '2', 'ScheduleOutlined', '/operate/feedback', '/operate/feedback/index', 'operate:feedback:list', 4, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667988523, 1667988519, '删除', '3', '#', NULL, NULL, 'operate:feedback:remove', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667991656, 1667963444, '用户举报', '2', 'UserDeleteOutlined', '/inform/user', '/inform/user/index', 'inform:user:list', 5, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667991660, 1667991656, '处理', '3', '#', NULL, NULL, 'inform:user:banned', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667994420, 1725012573, '系统升级', '2', 'RadiusBottomleftOutlined', '/operate/version', '/operate/version/index', 'operate:version:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667994423, 1667994420, '修改', '3', '#', NULL, NULL, 'operate:version:edit', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1667994424, 1667994420, '删除', '3', '#', NULL, NULL, 'chat:version:remove', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1668075049, 1667963444, '群组管理', '2', 'UsergroupAddOutlined', '/chat/group', '/chat/group/index', 'chat:group:list', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1669114031, 1725704817, '封禁', '3', '#', NULL, NULL, 'chat:user:banned', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1669116129, 1673405797, '首页公告', '2', 'VerticalAlignTopOutlined', '/operate/notify', '/operate/notify/index', 'operate:notify:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1669116132, 1669116129, '修改', '3', '#', NULL, NULL, 'operate:notify:edit', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1669779155, 1668075049, '消息', '3', '#', NULL, NULL, 'chat:group:msg', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1669780522, 1667963444, '群组举报', '2', 'UsergroupDeleteOutlined', '/inform/group', '/inform/group/index', 'inform:group:list', 6, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1669780524, 1669780522, '处理', '3', '#', NULL, NULL, 'inform:group:banned', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222559, 0, '账单统计', '1', 'BarChartOutlined', NULL, NULL, NULL, 103, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222894, 1670222559, '充值记录', '2', 'FilePdfOutlined', '/trade/recharge', '/trade/recharge/index', 'wallet:trade:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222898, 1670222559, '提现记录', '2', 'FileExclamationOutlined', '/trade/cash', '/trade/cash/index', 'wallet:trade:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222900, 1670222559, '转账记录', '2', 'FileImageOutlined', '/trade/transfer', '/trade/transfer/index', 'wallet:trade:list', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222904, 1670222559, '个人红包', '2', 'FilePdfOutlined', '/trade/packet', '/trade/packet/index', 'wallet:trade:list', 5, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222907, 1670222559, '专属红包', '2', 'FilePptOutlined', '/trade/assign', '/trade/assign/index', 'wallet:trade:list', 6, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222910, 1670222559, '手气红包', '2', 'FileExclamationOutlined', '/trade/group', '/trade/group/index', 'wallet:trade:list', 7, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670222913, 1670222559, '普通红包', '2', 'FileZipOutlined', '/trade/normal', '/trade/normal/index', 'wallet:trade:list', 8, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1670236462, 1667963359, '新增', '3', '#', NULL, NULL, 'chat:user:add', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1673405797, 0, '运营管理', '1', 'StrikethroughOutlined', NULL, NULL, NULL, 104, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1673406441, 1725704817, '修改', '3', '#', NULL, NULL, 'chat:user:edit', 4, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1673406506, 1725792755, '修改', '3', '#', NULL, NULL, 'chat:group:edit', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1673424543, 0, '应用扩展', '1', 'GlobalOutlined', NULL, NULL, NULL, 107, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1673580640, 1725704817, '充值', '3', '#', NULL, NULL, 'chat:user:wallet', 5, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1680512107, 1670222559, '扫码转账', '2', 'FileJpgOutlined', '/trade/scan', '/trade/scan/index', 'wallet:trade:list', 4, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1680601640, 0, '审批管理', '1', 'ClearOutlined', NULL, NULL, NULL, 102, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1680601960, 1680601640, '提现审批', '2', 'BorderVerticleOutlined', '/approve/cash', '/approve/cash/index', 'approve:cash:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1680601962, 1680601960, '处理', '3', '#', NULL, NULL, 'approve:cash:edit', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1680606806, 1680601640, '认证审批', '2', 'BorderTopOutlined', '/approve/auth', '/approve/auth/index', 'approve:auth:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1680606808, 1680606806, '处理', '3', '#', NULL, NULL, 'approve:auth:edit', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1682396198, 0, '统计管理', '1', 'AlignLeftOutlined', NULL, NULL, NULL, 106, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1682396199, 1682396198, '用户日活', '2', 'UserOutlined', '/statistics/visit', '/statistics/visit/index', 'statistics:user:visit', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1682396202, 1682396198, '用户增长', '2', 'FileAddOutlined', '/statistics/trend', '/statistics/trend/index', 'statistics:user:trend', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1683788284, 1725704817, '实名', '3', '#', NULL, NULL, 'chat:user:auth', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1683806084, 1670222559, '消费记录', '2', 'FileAddOutlined', '/trade/shopping', '/trade/shopping/index', 'wallet:trade:list', 10, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1689595552, 1725704817, '注销', '3', '#', NULL, NULL, 'chat:user:deleted', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1690877515, 1680601640, '解封审批', '2', 'BorderBottomOutlined', '/approve/banned', '/approve/banned/index', 'approve:banned:list', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1690877517, 1690877515, '处理', '3', '#', NULL, NULL, 'approve:banned:edit', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724569052, 1669116129, 'demo', '3', '#', NULL, NULL, 'operate:notify:query', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724577139, 1682396198, '用户充值', '2', 'NodeExpandOutlined', '/statistics/recharge', '/statistics/recharge/index', 'statistics:user:recharge', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724584046, 1682396198, '用户提现', '2', 'NodeCollapseOutlined', '/statistics/cash', '/statistics/cash/index', 'statistics:user:cash', 4, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724648552, 1673405797, '用户头像', '2', 'UserAddOutlined', '/operate/portrait/user', '/operate/portrait/user/index', 'operate:portrait:user', 5, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724651302, 1724648552, '新增', '3', '#', NULL, NULL, 'operate:portrait:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724651355, 1724648552, '修改', '3', '#', NULL, NULL, 'operate:portrait:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724651378, 1724648552, '删除', '3', '#', NULL, NULL, 'operate:portrait:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724651404, 1673405797, '群聊头像', '2', 'UsergroupAddOutlined', '/operate/portrait/group', '/operate/portrait/group/index', 'operate:portrait:group', 6, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724651405, 1724651404, '新增', '3', '#', NULL, NULL, 'operate:portrait:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724651407, 1724651404, '修改', '3', '#', NULL, NULL, 'operate:portrait:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724651408, 1724651404, '删除', '3', '#', NULL, NULL, 'operate:portrait:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724663909, 1725012573, '充值配置', '2', 'RadiusBottomrightOutlined', '/operate/recharge', '/operate/recharge/index', 'operate:recharge:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724663910, 1724663909, '修改', '3', '#', '', '', 'operate:recharge:edit', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724668523, 1725012573, '群组扩容', '2', 'RadiusUpleftOutlined', '/operate/group', '/operate/group/index', 'operate:group:list', 4, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724668524, 1724668523, '修改', '3', '#', '', '', 'operate:group:edit', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724742619, 1725012573, '提现配置', '2', 'RadiusSettingOutlined', '/operate/cash', '/operate/cash/index', 'operate:cash:list', 3, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724742620, 1724742619, '修改', '3', '#', '', '', 'operate:cash:edit', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724744484, 1725012573, '配置中心', '2', 'RadiusUprightOutlined', '/operate/config', '/operate/config/index', 'operate:config:list', 5, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1724744485, 1724744484, '修改', '3', '#', '', '', 'operate:config:edit', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725012573, 0, '配置管理', '1', 'AppstoreOutlined', NULL, NULL, NULL, 105, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725692158, 0, '系统日志', '1', 'TableOutlined', NULL, NULL, NULL, 905, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725704817, 1667963444, '用户详情', '2', 'AntDesignOutlined', '/chat/user/info', '/chat/user/index-info', 'chat:user:query', 2, 'N', '', 'Y', 'N');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725792755, 1667963444, '群组详情', '2', '#', '/chat/group/info', '/chat/group/index-info', 'chat:group:query', 4, 'N', '', 'Y', 'N');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725849590, 1725704817, '群组', '3', '#', NULL, NULL, 'chat:user:group', 8, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725849605, 1725704817, '日志', '3', '#', NULL, NULL, 'chat:user:log', 6, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725849899, 1725704817, '好友', '3', '#', NULL, NULL, 'chat:user:friend', 7, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725854289, 1725792755, '日志', '3', '#', NULL, NULL, 'chat:group:log', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1725960694, 1725704817, '消息', '3', '#', NULL, NULL, 'chat:user:msg', 9, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1726030934, 1725792755, '封禁', '3', '#', NULL, NULL, 'chat:group:banned', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1726122468, 1667988519, '查询', '3', '#', NULL, NULL, 'operate:feedback:query', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1728638324, 1673424543, '服务管理', '2', 'RadarChartOutlined', '/extend/robot', '/extend/robot/index', 'extend:robot:list', 1, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1728639762, 1728638324, '修改', '3', '#', NULL, NULL, 'extend:robot:edit', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1728980776, 1728638324, '回复', '3', '#', NULL, NULL, 'extend:robot:reply', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1728990347, 1670222559, '群内转账', '2', 'FileUnknownOutlined', '/trade/interior', '/trade/interior/index', 'wallet:trade:list', 9, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1729051469, 1682396198, '收支汇总', '2', 'TransactionOutlined', '/statistics/report', '/statistics/report/index', 'statistics:user:report', 5, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1731916066, 1680601640, '异常账户', '2', 'BorderInnerOutlined', '/approve/special', '/approve/special/index', 'approve:special:list', 4, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1734420922, 1682396198, '平台汇总', '2', 'CrownOutlined', '/statistics/balance', '/statistics/balance/index', 'statistics:user:balance', 6, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1734695226, 1673424543, '应用管理', '2', 'AimOutlined', '/extend/uni', '/extend/uni/index', 'extend:uni:list', 2, 'N', '', 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1734695227, 1734695226, '新增', '3', '#', NULL, NULL, 'extend:uni:add', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1734695228, 1734695226, '删除', '3', '#', NULL, NULL, 'extend:uni:remove', 3, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1734695304, 1734695226, '修改', '3', '#', NULL, NULL, 'extend:uni:edit', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1735786711, 1680601960, '导出', '3', '#', NULL, NULL, 'approve:cash:export', 2, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1738810367, 1667963359, '详情', '3', '#', NULL, NULL, 'chat:user:list	', 1, 'N', NULL, 'Y', 'Y');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `menu_name`, `menu_type`, `icon`, `path`, `component`, `perms`, `sort`, `frame_flag`, `frame_url`, `status`, `visible`) VALUES (1738810399, 1668075049, '详情', '3', '#', NULL, NULL, 'chat:group:list', 1, 'N', NULL, 'Y', 'Y');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL DEFAULT 'Y' COMMENT '角色状态（Y正常N停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`),
  UNIQUE KEY `role_key` (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `status`, `remark`) VALUES (1613012639384887298, '运营', 'admin', 1, 'Y', '运营');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT '0' COMMENT '角色id',
  `username` varchar(30) NOT NULL COMMENT '用户账号',
  `nickname` varchar(30) NOT NULL COMMENT '用户昵称',
  `salt` varchar(4) DEFAULT '' COMMENT '盐',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT 'Y' COMMENT '帐号状态（Y正常N停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `role_id`, `username`, `nickname`, `salt`, `password`, `status`, `remark`) VALUES (1613012757525848066, 1613012639384887298, 'admin', 'admin', 'u32t', '1f81a659afbc2f6275154cd50e70a136', 'Y', NULL);
COMMIT;

-- ----------------------------
-- Table structure for uni_item
-- ----------------------------
DROP TABLE IF EXISTS `uni_item`;
CREATE TABLE `uni_item` (
  `uni_id` bigint NOT NULL COMMENT '主键',
  `app_id` varchar(20) DEFAULT NULL COMMENT 'appId',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `version` bigint DEFAULT '100' COMMENT '版本',
  `path` varchar(200) DEFAULT NULL COMMENT '地址',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `status` char(1) DEFAULT 'N' COMMENT '状态',
  PRIMARY KEY (`uni_id`),
  UNIQUE KEY `appId` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小程序表';

-- ----------------------------
-- Records of uni_item
-- ----------------------------
BEGIN;
INSERT INTO `uni_item` (`uni_id`, `app_id`, `name`, `icon`, `version`, `path`, `type`, `status`) VALUES (10001, NULL, '百度一下', 'https://img.alicdn.com/imgextra/i2/87413133/O1CN01sm9ayS1Z0xsyy6UG8_!!87413133.jpg', 100, 'https://www.baidu.com/', 'url', 'Y');
INSERT INTO `uni_item` (`uni_id`, `app_id`, `name`, `icon`, `version`, `path`, `type`, `status`) VALUES (10002, '__UNI__E28E426', '天气预报', 'https://img.alicdn.com/imgextra/i3/87413133/O1CN011GqQfO1Z0xszOTtqa_!!87413133.jpg', 100, 'https://xaldit.com/alpaca/wgt/__UNI__E28E426.wgt', 'mini', 'Y');
INSERT INTO `uni_item` (`uni_id`, `app_id`, `name`, `icon`, `version`, `path`, `type`, `status`) VALUES (10003, '__UNI__50FBB74', '授权示例', 'https://img.alicdn.com/imgextra/i4/87413133/O1CN01JHvuTb1Z0xswBOXWk_!!87413133.jpg', 100, 'https://xaldit.com/alpaca/wgt/__UNI__50FBB74.wgt', 'mini', 'Y');
COMMIT;

-- ----------------------------
-- Table structure for wallet_bank
-- ----------------------------
DROP TABLE IF EXISTS `wallet_bank`;
CREATE TABLE `wallet_bank` (
  `bank_id` bigint NOT NULL COMMENT '卡包id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `wallet` varchar(200) DEFAULT NULL COMMENT '账户',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包卡包';

-- ----------------------------
-- Records of wallet_bank
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet_cash
-- ----------------------------
DROP TABLE IF EXISTS `wallet_cash`;
CREATE TABLE `wallet_cash` (
  `trade_id` bigint NOT NULL COMMENT '交易id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `wallet` varchar(200) DEFAULT NULL COMMENT '账户',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '申请金额',
  `rate` decimal(8,2) DEFAULT '0.00' COMMENT '交易利率',
  `cost` decimal(8,2) DEFAULT '0.00' COMMENT '交易加成',
  `charge` decimal(8,2) DEFAULT '0.00' COMMENT '交易手续',
  `reason` varchar(200) DEFAULT NULL COMMENT '拒绝原因',
  `create_time` datetime DEFAULT NULL COMMENT '交易时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`trade_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包提现';

-- ----------------------------
-- Records of wallet_cash
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet_info
-- ----------------------------
DROP TABLE IF EXISTS `wallet_info`;
CREATE TABLE `wallet_info` (
  `user_id` bigint NOT NULL COMMENT '用户',
  `balance` decimal(65,2) DEFAULT '0.00' COMMENT '余额',
  `salt` varchar(4) DEFAULT NULL COMMENT '盐巴',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `version` int DEFAULT '0' COMMENT '版本',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户钱包';

-- ----------------------------
-- Records of wallet_info
-- ----------------------------
BEGIN;
INSERT INTO `wallet_info` (`user_id`, `balance`, `salt`, `password`, `version`) VALUES (1913505014123372546, 0.00, 'zl77', '512ddf8d34b751737547edfcd0be253a', 0);
INSERT INTO `wallet_info` (`user_id`, `balance`, `salt`, `password`, `version`) VALUES (1913529347591950337, 0.00, 'cbqq', 'dc054aa4bd09b81b7060d970ea9d1cb0', 0);
INSERT INTO `wallet_info` (`user_id`, `balance`, `salt`, `password`, `version`) VALUES (1913529744792539137, 0.00, 'l7z0', 'ccf97ffde291ae083cda5310581ca18c', 0);
INSERT INTO `wallet_info` (`user_id`, `balance`, `salt`, `password`, `version`) VALUES (1913534863508561922, 0.00, '4db1', '0d1ca96539202ac45d86549fb161a0dd', 0);
INSERT INTO `wallet_info` (`user_id`, `balance`, `salt`, `password`, `version`) VALUES (1913574939542224898, 0.00, 'moyz', '047e551563f5177806ea53de00214328', 0);
INSERT INTO `wallet_info` (`user_id`, `balance`, `salt`, `password`, `version`) VALUES (1913906268486057985, 0.00, 'dz9j', '25695bb790ff601e8bedeb564c9b489b', 0);
COMMIT;

-- ----------------------------
-- Table structure for wallet_packet
-- ----------------------------
DROP TABLE IF EXISTS `wallet_packet`;
CREATE TABLE `wallet_packet` (
  `packet_id` bigint NOT NULL COMMENT '主键',
  `trade_id` bigint DEFAULT NULL COMMENT '交易id',
  `user_id` bigint DEFAULT NULL COMMENT '接收id',
  `user_no` varchar(32) DEFAULT NULL COMMENT '接收no',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `portrait` longtext COMMENT '头像',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`packet_id`),
  UNIQUE KEY `trade_id` (`trade_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包红包';

-- ----------------------------
-- Records of wallet_packet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet_receive
-- ----------------------------
DROP TABLE IF EXISTS `wallet_receive`;
CREATE TABLE `wallet_receive` (
  `trade_id` bigint NOT NULL COMMENT '交易id',
  `user_id` bigint DEFAULT NULL COMMENT '接收人',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '金额',
  `status` char(1) DEFAULT 'N' COMMENT '状态',
  `version` int DEFAULT '0' COMMENT '执行版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '执行时间',
  PRIMARY KEY (`trade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包余额';

-- ----------------------------
-- Records of wallet_receive
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet_recharge
-- ----------------------------
DROP TABLE IF EXISTS `wallet_recharge`;
CREATE TABLE `wallet_recharge` (
  `trade_id` bigint NOT NULL COMMENT '交易id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `user_no` varchar(50) DEFAULT NULL COMMENT '用户号码',
  `phone` varchar(50) DEFAULT NULL COMMENT '用户手机',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '支付金额',
  `trade_no` varchar(32) DEFAULT NULL COMMENT '交易号码',
  `order_no` varchar(50) DEFAULT NULL COMMENT '交易号码',
  `create_time` datetime DEFAULT NULL COMMENT '交易时间',
  `update_time` datetime DEFAULT NULL COMMENT '处理时间',
  `pay_type` char(1) DEFAULT NULL COMMENT '支付类型',
  PRIMARY KEY (`trade_id`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包充值';

-- ----------------------------
-- Records of wallet_recharge
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet_shopping
-- ----------------------------
DROP TABLE IF EXISTS `wallet_shopping`;
CREATE TABLE `wallet_shopping` (
  `trade_id` bigint NOT NULL COMMENT '交易id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `user_no` varchar(50) DEFAULT NULL COMMENT '用户号码',
  `phone` varchar(50) DEFAULT NULL COMMENT '用户手机',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '支付金额',
  `remark` varchar(200) DEFAULT NULL COMMENT '交易备注',
  `create_time` datetime DEFAULT NULL COMMENT '交易时间',
  PRIMARY KEY (`trade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包消费';

-- ----------------------------
-- Records of wallet_shopping
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet_task
-- ----------------------------
DROP TABLE IF EXISTS `wallet_task`;
CREATE TABLE `wallet_task` (
  `trade_id` bigint NOT NULL COMMENT '交易id',
  `trade_type` varchar(4) DEFAULT NULL COMMENT '交易类型',
  `task_time` datetime DEFAULT NULL COMMENT '执行时间',
  `status` char(1) DEFAULT 'N' COMMENT '执行状态',
  `version` int DEFAULT '0' COMMENT '执行版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '执行时间',
  PRIMARY KEY (`trade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包任务';

-- ----------------------------
-- Records of wallet_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet_trade
-- ----------------------------
DROP TABLE IF EXISTS `wallet_trade`;
CREATE TABLE `wallet_trade` (
  `trade_id` bigint NOT NULL COMMENT '主键',
  `trade_type` varchar(4) DEFAULT NULL COMMENT '交易类型',
  `trade_amount` decimal(8,2) DEFAULT '0.00' COMMENT '交易金额',
  `trade_count` int DEFAULT '1' COMMENT '交易数量',
  `trade_remark` varchar(200) DEFAULT NULL COMMENT '交易备注',
  `trade_balance` decimal(65,2) DEFAULT '0.00' COMMENT '余额',
  `trade_status` char(1) DEFAULT NULL COMMENT '交易状态',
  `source_id` bigint DEFAULT '0' COMMENT '交易来源',
  `source_type` varchar(4) DEFAULT NULL COMMENT '交易来源',
  `user_id` bigint DEFAULT '0' COMMENT '用户id',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户号码',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(50) DEFAULT NULL COMMENT '用户手机',
  `portrait` longtext COMMENT '用户头像',
  `group_id` bigint DEFAULT '0' COMMENT '群组',
  `group_no` varchar(32) DEFAULT NULL COMMENT '群号',
  `group_name` varchar(50) DEFAULT NULL COMMENT '群名',
  `receive_id` bigint DEFAULT '0' COMMENT '接收id',
  `receive_no` varchar(32) DEFAULT NULL COMMENT '接收号码',
  `receive_name` varchar(20) DEFAULT NULL COMMENT '接收昵称',
  `receive_phone` varchar(50) DEFAULT NULL COMMENT '接收手机',
  `receive_portrait` longtext COMMENT '接收头像',
  `create_time` datetime DEFAULT NULL COMMENT '生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '注销0正常null注销',
  PRIMARY KEY (`trade_id`),
  KEY `user_id` (`user_id`),
  KEY `receive_id` (`receive_id`),
  KEY `group_id` (`group_id`),
  KEY `trade_type` (`trade_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='钱包交易';

-- ----------------------------
-- Records of wallet_trade
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
