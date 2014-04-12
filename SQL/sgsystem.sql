/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.9
Source Server Version : 50520
Source Host           : 192.168.0.9:3306
Source Database       : sgsystem

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-04-12 11:11:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ab_group_address_book
-- ----------------------------
DROP TABLE IF EXISTS `ab_group_address_book`;
CREATE TABLE `ab_group_address_book` (
  `id` char(32) NOT NULL DEFAULT '',
  `gr_no` varchar(50) DEFAULT NULL COMMENT '编号',
  `gr_name` varchar(50) DEFAULT NULL COMMENT '分组名称',
  `gr_remark` varchar(50) DEFAULT NULL COMMENT '备注，说明',
  `gr_uid` char(32) DEFAULT NULL COMMENT '所属用户，外键ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人通讯簿分租';

-- ----------------------------
-- Records of ab_group_address_book
-- ----------------------------
INSERT INTO `ab_group_address_book` VALUES ('402881e63f3b23a2013f3b68c2a60026', '001', '同事', '', '402881f73e1c4ba4013e1c4c08470001');
INSERT INTO `ab_group_address_book` VALUES ('402881e63f3b23a2013f3b68f7000027', '002', '客户', 'xx', '402881f73e1c4ba4013e1c4c08470001');
INSERT INTO `ab_group_address_book` VALUES ('402881e63f41490b013f417e0386000d', '003', '同学', '打算', '402881f73e1c4ba4013e1c4c08470001');

-- ----------------------------
-- Table structure for ab_group_address_book_public
-- ----------------------------
DROP TABLE IF EXISTS `ab_group_address_book_public`;
CREATE TABLE `ab_group_address_book_public` (
  `id` char(32) NOT NULL DEFAULT '',
  `ga_name` varchar(50) DEFAULT NULL COMMENT '分组名',
  `ga_remark` varchar(9999) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公共分组';

-- ----------------------------
-- Records of ab_group_address_book_public
-- ----------------------------
INSERT INTO `ab_group_address_book_public` VALUES ('1', '朋友', '朋友');
INSERT INTO `ab_group_address_book_public` VALUES ('40287d81407533280140755082d00003', '政府客户', '');

-- ----------------------------
-- Table structure for ab_personal_address_book
-- ----------------------------
DROP TABLE IF EXISTS `ab_personal_address_book`;
CREATE TABLE `ab_personal_address_book` (
  `id` char(32) NOT NULL DEFAULT '',
  `pe_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `pe_sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `pe_email` varchar(50) DEFAULT NULL COMMENT 'email地址',
  `pe_phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `pe_other` varchar(50) DEFAULT NULL COMMENT '其他联系',
  `pe_grouping` varchar(50) DEFAULT NULL COMMENT '分组，调用字典',
  `pe_company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `pe_officPhone` varchar(50) DEFAULT NULL COMMENT '办公电话',
  `pe_officFax` varchar(50) DEFAULT NULL COMMENT '办公传真',
  `pe_companyAddress` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `pe_zip` varchar(50) DEFAULT NULL COMMENT '邮编',
  `pe_post` varchar(50) DEFAULT NULL COMMENT '职位',
  `pe_homeAddress` varchar(50) DEFAULT NULL COMMENT '家庭地址',
  `pe_homePhone` varchar(50) DEFAULT NULL COMMENT '家庭电话',
  `pe_remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `pe_uid` char(32) DEFAULT NULL COMMENT '所属人员',
  PRIMARY KEY (`id`),
  KEY `pe_uid_fk` (`pe_uid`),
  KEY `pe_grouping_pk` (`pe_grouping`),
  CONSTRAINT `pe_grouping_pk` FOREIGN KEY (`pe_grouping`) REFERENCES `ab_group_address_book` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pe_uid_fk` FOREIGN KEY (`pe_uid`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人通讯簿';

-- ----------------------------
-- Records of ab_personal_address_book
-- ----------------------------

-- ----------------------------
-- Table structure for ab_public_address_book
-- ----------------------------
DROP TABLE IF EXISTS `ab_public_address_book`;
CREATE TABLE `ab_public_address_book` (
  `id` char(32) NOT NULL DEFAULT '',
  `pu_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `pu_sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `pu_email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `pu_phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `pu_other` varchar(50) DEFAULT NULL COMMENT '其他联系',
  `pu_grouping` char(32) DEFAULT NULL COMMENT '分组，外键，调字典',
  `pu_company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `pu_officPhone` varchar(50) DEFAULT NULL COMMENT '办公电话',
  `pu_officFax` varchar(50) DEFAULT NULL COMMENT '办公传真',
  `pu_companyAddress` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `pu_zip` varchar(50) DEFAULT NULL COMMENT '邮编',
  `pu_post` varchar(50) DEFAULT NULL COMMENT '职位',
  `pu_homeAddress` varchar(50) DEFAULT NULL COMMENT '家庭地址',
  `pu_homePhone` varchar(50) DEFAULT NULL COMMENT '家庭电话',
  `pu_remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pk` (`pu_grouping`),
  CONSTRAINT `pk` FOREIGN KEY (`pu_grouping`) REFERENCES `ab_group_address_book_public` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司通讯薄';

-- ----------------------------
-- Records of ab_public_address_book
-- ----------------------------

-- ----------------------------
-- Table structure for dwzp
-- ----------------------------
DROP TABLE IF EXISTS `dwzp`;
CREATE TABLE `dwzp` (
  `DWZPGUID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `DWMC` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  `DWDZ` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位地址',
  `XQGW` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '需求岗位',
  `XQRS` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '需求人数',
  `XZDY` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '薪资待遇',
  `XBYQ` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别要求',
  `LXR` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人',
  `LXRDH` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人电话',
  PRIMARY KEY (`DWZPGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='单位招聘';

-- ----------------------------
-- Records of dwzp
-- ----------------------------
INSERT INTO `dwzp` VALUES ('290a5a62-91a2-484c-8fb2-3104b1abd5b5', '浪潮集团', '高新区', 'javayanf', '20', '200', '男', '张', '');
INSERT INTO `dwzp` VALUES ('30b54fdc-b16f-4468-bb44-be86ca29547d', '山东慧若电子商务有限公司', '李霞', 'java研发工程师', '50', '3000', '无', '山东', '323233');
INSERT INTO `dwzp` VALUES ('33f8fba7-dbfa-4010-9079-5a9ea507eb8a', '山东金现代', '济南历下区', 'net', '10', '2000', '无', '胡子', '');
INSERT INTO `dwzp` VALUES ('f87f196f-57f4-4863-9642-333b65aeab25', '山东慧若电子商务有限公司', '济南 灌灌灌灌', 'c++研发工程师', '20', '2000', '男', '张', '4554');

-- ----------------------------
-- Table structure for em_draftbox
-- ----------------------------
DROP TABLE IF EXISTS `em_draftbox`;
CREATE TABLE `em_draftbox` (
  `id` char(32) NOT NULL DEFAULT '',
  `ed_inUid` varchar(9999) DEFAULT NULL COMMENT '收件人ID',
  `ed_name` varchar(50) DEFAULT NULL COMMENT '标题',
  `ed_detail` varchar(2000) DEFAULT NULL COMMENT '内容',
  `ed_outUid` char(32) DEFAULT NULL COMMENT '发件人ID',
  `ed_date` datetime DEFAULT NULL COMMENT '保存时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='草稿箱';

-- ----------------------------
-- Records of em_draftbox
-- ----------------------------

-- ----------------------------
-- Table structure for em_draftbox_file
-- ----------------------------
DROP TABLE IF EXISTS `em_draftbox_file`;
CREATE TABLE `em_draftbox_file` (
  `id` char(32) NOT NULL DEFAULT '',
  `df_edid` char(32) DEFAULT NULL COMMENT '草稿箱ID',
  `df_efid` char(32) DEFAULT NULL COMMENT '附件ID',
  PRIMARY KEY (`id`),
  KEY `df_edid_fk` (`df_edid`),
  KEY `df_efid_fk` (`df_efid`),
  CONSTRAINT `df_edid_fk` FOREIGN KEY (`df_edid`) REFERENCES `em_draftbox` (`id`) ON DELETE CASCADE,
  CONSTRAINT `df_efid_fk` FOREIGN KEY (`df_efid`) REFERENCES `em_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='草稿箱和附件的关联表';

-- ----------------------------
-- Records of em_draftbox_file
-- ----------------------------

-- ----------------------------
-- Table structure for em_files
-- ----------------------------
DROP TABLE IF EXISTS `em_files`;
CREATE TABLE `em_files` (
  `id` char(32) NOT NULL DEFAULT '',
  `ef_name` varchar(50) DEFAULT NULL COMMENT '原文件名',
  `ef_new_name` char(32) DEFAULT NULL COMMENT '保存时的文件名称,UUID',
  `ef_ext` varchar(50) DEFAULT NULL COMMENT '后缀',
  `ef_size` int(50) DEFAULT NULL COMMENT '大小',
  `ef_num` int(11) DEFAULT '0' COMMENT '引用量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件附件';

-- ----------------------------
-- Records of em_files
-- ----------------------------
INSERT INTO `em_files` VALUES ('40288082453f605f01453f6174900007', 'srent_back.txt', '45a1deaae4414c3e821fae0d96a7bce5', 'txt', '328', '1');
INSERT INTO `em_files` VALUES ('40288082453f605f01453f648ed0000d', 'srent_back.txt', '2fc6c8a4755a47a09de7be5ae4d4ab64', 'txt', '328', '2');

-- ----------------------------
-- Table structure for em_inbox
-- ----------------------------
DROP TABLE IF EXISTS `em_inbox`;
CREATE TABLE `em_inbox` (
  `id` char(32) NOT NULL DEFAULT '',
  `ei_name` varchar(50) DEFAULT NULL COMMENT '标题',
  `ei_detail` varchar(2000) DEFAULT NULL COMMENT '内容',
  `ei_uid` char(32) DEFAULT NULL COMMENT '发件人',
  `ei_date` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收件箱';

-- ----------------------------
-- Records of em_inbox
-- ----------------------------
INSERT INTO `em_inbox` VALUES ('40288082453f605f01453f6174810006', '旦发个', '<p>打发打发</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:28:42');
INSERT INTO `em_inbox` VALUES ('40288082453f605f01453f648ed0000c', '斯蒂芬', '<p>斯蒂芬</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:32:05');

-- ----------------------------
-- Table structure for em_inbox_file
-- ----------------------------
DROP TABLE IF EXISTS `em_inbox_file`;
CREATE TABLE `em_inbox_file` (
  `id` char(32) NOT NULL DEFAULT '',
  `if_eiid` char(32) DEFAULT NULL COMMENT '收件箱ID',
  `if_efid` char(32) DEFAULT NULL COMMENT '附件表ID',
  PRIMARY KEY (`id`),
  KEY `if_eiid_fk` (`if_eiid`),
  KEY `if_efid_fk` (`if_efid`),
  CONSTRAINT `if_efid_fk` FOREIGN KEY (`if_efid`) REFERENCES `em_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `if_eiid_fk` FOREIGN KEY (`if_eiid`) REFERENCES `em_inbox` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收件箱和附件的关联表';

-- ----------------------------
-- Records of em_inbox_file
-- ----------------------------
INSERT INTO `em_inbox_file` VALUES ('40288082453f605f01453f617490000a', '40288082453f605f01453f6174810006', '40288082453f605f01453f6174900007');
INSERT INTO `em_inbox_file` VALUES ('40288082453f605f01453f648ed00010', '40288082453f605f01453f648ed0000c', '40288082453f605f01453f648ed0000d');

-- ----------------------------
-- Table structure for em_inbox_outbox_user
-- ----------------------------
DROP TABLE IF EXISTS `em_inbox_outbox_user`;
CREATE TABLE `em_inbox_outbox_user` (
  `id` char(32) NOT NULL DEFAULT '',
  `io_eoid` char(32) DEFAULT NULL COMMENT '发件箱ID',
  `io_eiid` char(32) DEFAULT NULL COMMENT '收件箱ID',
  `io_uid` char(32) DEFAULT NULL COMMENT '收件人ID',
  `io_status` varchar(5) DEFAULT NULL COMMENT '状态（已读未读）',
  PRIMARY KEY (`id`),
  KEY `io_uid_fk` (`io_uid`),
  KEY `io_eoid_fk` (`io_eoid`),
  KEY `io_eiid_fk` (`io_eiid`),
  CONSTRAINT `io_eiid_fk` FOREIGN KEY (`io_eiid`) REFERENCES `em_inbox` (`id`) ON DELETE CASCADE,
  CONSTRAINT `io_eoid_fk` FOREIGN KEY (`io_eoid`) REFERENCES `em_outbox` (`id`) ON DELETE SET NULL,
  CONSTRAINT `io_uid_fk` FOREIGN KEY (`io_uid`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收件箱发件箱和人员的关联表';

-- ----------------------------
-- Records of em_inbox_outbox_user
-- ----------------------------
INSERT INTO `em_inbox_outbox_user` VALUES ('40288082453f605f01453f6174900008', null, '40288082453f605f01453f6174810006', '4028808544fbf0e00144fc2621230025', '未读');
INSERT INTO `em_inbox_outbox_user` VALUES ('40288082453f605f01453f648ed0000e', '40288082453f605f01453f648ed0000b', '40288082453f605f01453f648ed0000c', '4028808544fbf0e00144fc2621230025', '未读');

-- ----------------------------
-- Table structure for em_outbox
-- ----------------------------
DROP TABLE IF EXISTS `em_outbox`;
CREATE TABLE `em_outbox` (
  `id` char(32) NOT NULL DEFAULT '',
  `eo_name` varchar(50) DEFAULT NULL COMMENT '标题',
  `eo_detail` varchar(2000) DEFAULT NULL COMMENT '内容',
  `eo_uid` char(32) DEFAULT NULL COMMENT '发件人ID',
  `eo_date` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发件箱';

-- ----------------------------
-- Records of em_outbox
-- ----------------------------
INSERT INTO `em_outbox` VALUES ('40288082453f605f01453f648ed0000b', '斯蒂芬', '<p>斯蒂芬</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:32:05');

-- ----------------------------
-- Table structure for em_outbox_file
-- ----------------------------
DROP TABLE IF EXISTS `em_outbox_file`;
CREATE TABLE `em_outbox_file` (
  `id` char(32) NOT NULL DEFAULT '',
  `of_eoid` char(32) DEFAULT NULL COMMENT '收件箱ID',
  `of_efid` char(32) DEFAULT NULL COMMENT '附件表ID',
  PRIMARY KEY (`id`),
  KEY `of_eoid_fk` (`of_eoid`),
  KEY `of_efid_fk` (`of_efid`),
  CONSTRAINT `of_efid_fk` FOREIGN KEY (`of_efid`) REFERENCES `em_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `of_eoid_fk` FOREIGN KEY (`of_eoid`) REFERENCES `em_outbox` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发件箱和附件的关联表';

-- ----------------------------
-- Records of em_outbox_file
-- ----------------------------
INSERT INTO `em_outbox_file` VALUES ('40288082453f605f01453f648ed0000f', '40288082453f605f01453f648ed0000b', '40288082453f605f01453f648ed0000d');

-- ----------------------------
-- Table structure for grqz
-- ----------------------------
DROP TABLE IF EXISTS `grqz`;
CREATE TABLE `grqz` (
  `GRQZGUID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '人口基本信息',
  `DJSJ` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '登记时间',
  `QZCS` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '求职次数',
  `QZGW` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '求职岗位',
  `XJDY` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '薪金待遇',
  PRIMARY KEY (`GRQZGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='个人救职';

-- ----------------------------
-- Records of grqz
-- ----------------------------
INSERT INTO `grqz` VALUES ('4028808644f350bd0144f3563ce6000a', '1', '2014-03-18', '541', '34', '34');
INSERT INTO `grqz` VALUES ('bc4a432e-2968-47b8-90b5-682298022d31', '801A880B-A5C8-4BB3-849D-4FAC8EBDA72C', '2014-03-29', '1', 'java', '12000');
INSERT INTO `grqz` VALUES ('ce22e1cf-1e18-4e79-b5ec-733c874d43f1', 'D6DA41CB-45F1-467F-901A-EE91630AF290', '2014-03-29', '2', 'c++ net', '20000');
INSERT INTO `grqz` VALUES ('e6ab64ff-d9e0-4d4a-b7f9-fceefce31cbf', '1188802F-5443-4020-AAC4-72B0ADF9AA92', '2014-05-01', '', 'java研发工程师', '');

-- ----------------------------
-- Table structure for jncypx
-- ----------------------------
DROP TABLE IF EXISTS `jncypx`;
CREATE TABLE `jncypx` (
  `JNCYPXGUID` varchar(100) NOT NULL,
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PXCS` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PXSJ` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PXLX` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `XMNR` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`JNCYPXGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='技能就业培训';

-- ----------------------------
-- Records of jncypx
-- ----------------------------
INSERT INTO `jncypx` VALUES ('f3330ca0-129a-4e7c-a867-2c1fc1ef6a72', 'F9D53831-92F7-4F06-BA5D-D23F76F72190', '1', '2014-03-04', '2', '3333 444');

-- ----------------------------
-- Table structure for jyyz
-- ----------------------------
DROP TABLE IF EXISTS `jyyz`;
CREATE TABLE `jyyz` (
  `JYYZGUID` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '主键',
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '人口基本',
  `SBBT` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '社保补贴',
  `JYYZBZ` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`JYYZGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='新增援助';

-- ----------------------------
-- Records of jyyz
-- ----------------------------
INSERT INTO `jyyz` VALUES ('3bc4055d-dd51-479e-9ea3-e37f55477584', '801A880B-A5C8-4BB3-849D-4FAC8EBDA72C', '500', '1111111111');
INSERT INTO `jyyz` VALUES ('3c42923e-f23a-462b-97e3-1173e04ae8b1', 'D6DA41CB-45F1-467F-901A-EE91630AF290', '111P2', '2222');

-- ----------------------------
-- Table structure for ldjc
-- ----------------------------
DROP TABLE IF EXISTS `ldjc`;
CREATE TABLE `ldjc` (
  `LDJCGUID` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '主键',
  `DWMC` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  `DWDZ` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位地址',
  `LXR` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人',
  `LXRDH` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人电话',
  `JCR` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '监察员',
  `SSSQ` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '所属社区',
  `SFHG` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否合格',
  `LDJCBZ` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LDJCGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='劳动监察';

-- ----------------------------
-- Records of ldjc
-- ----------------------------
INSERT INTO `ldjc` VALUES ('968bb818-c577-47b2-afb9-e5ff00e0bc6d', '电子', '济南', '山东', '山东', '答复', 'D663C662-38E9-4078-B44C-0D081F469174', '1', '答复 的');
INSERT INTO `ldjc` VALUES ('aa5dd233-73da-43f4-92cd-22efd8077b3b', '机械', '济南', '张', '4445', '张', 'D663C662-38E9-4078-B44C-0D081F469174', '1', '解析11 哈哈哈哈');

-- ----------------------------
-- Table structure for list_values
-- ----------------------------
DROP TABLE IF EXISTS `list_values`;
CREATE TABLE `list_values` (
  `id` varchar(50) NOT NULL,
  `list_type` int(11) NOT NULL COMMENT '字典值类型',
  `list_value` varchar(50) NOT NULL COMMENT '字典值',
  `list_desc` varchar(50) DEFAULT '' COMMENT '字典值说明',
  PRIMARY KEY (`id`),
  KEY `list_type` (`list_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典值';

-- ----------------------------
-- Records of list_values
-- ----------------------------
INSERT INTO `list_values` VALUES ('40287d81406ffc570140701372590002', '4', '本单位人员', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dacc0850003', '11', '正式工', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dad3d3f0005', '11', '合同工', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dad86da0007', '11', '临时工', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dade5ef0009', '11', '试用期员工', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1db788e8000b', '12', '书记', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1db9b1ee000d', '12', '主任', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1db9e275000f', '12', '副主任', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dba0a110011', '12', '计生员', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dba90760013', '12', '协管员', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dbc09320019', '13', '大专以下', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dbc4369001b', '13', '大专', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dbc63a0001d', '13', '本科', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dbc9bb7001f', '13', '研究生', '');
INSERT INTO `list_values` VALUES ('402881823f1d40d8013f1dbcbcd70021', '13', '研究生以上', '');
INSERT INTO `list_values` VALUES ('402881823f2309f5013f2322a5ab0003', '14', '无法胜任', '');
INSERT INTO `list_values` VALUES ('402881823f2309f5013f2322d47e0005', '14', '身体原因', '');
INSERT INTO `list_values` VALUES ('402881823f2309f5013f232301f80007', '14', '找到工作', '');
INSERT INTO `list_values` VALUES ('402881823f2309f5013f23236c3f0009', '15', '内退', '');
INSERT INTO `list_values` VALUES ('402881823f2309f5013f232394d7000b', '15', '病退', '');
INSERT INTO `list_values` VALUES ('402881e43f405647013f405e71780003', '10', '小型车', '');
INSERT INTO `list_values` VALUES ('402881e53e8bedc0013e8bf0ea9e0002', '2', '全体大会', '');
INSERT INTO `list_values` VALUES ('402881e53e8bedc0013e8bf1a90d0007', '2', '部门会议', 'x');
INSERT INTO `list_values` VALUES ('402881e63f3b23a2013f3b55913e001b', '8', '公司规章', '');
INSERT INTO `list_values` VALUES ('402881e63f3b23a2013f3b55d19a001d', '9', '现行法律', '');
INSERT INTO `list_values` VALUES ('402881e63fa8a3b3013fa8a61d5c0002', '17', '人事', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c301402819344d0007', '20', '群众', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c3014028197f3b0009', '20', '预备党员', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c301402819a0d1000b', '20', '正式党员', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281a4ab5000d', '19', '销售人员', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281b1fa4000f', '19', '初级经理', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281b46c30011', '19', '中级经理', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281b686e0013', '19', '高级经理', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281be4060015', '19', '销售分公司副经理', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281c25830017', '19', '部门助手', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281c742b0019', '19', '销售分公司经理', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281cbfbc001b', '19', '部门经理', '');
INSERT INTO `list_values` VALUES ('402881e64027f7c30140281cfc61001d', '19', '销售总监', '');
INSERT INTO `list_values` VALUES ('402881e83ecf3ff0013ecf8356400003', '5', '个人日志', '');
INSERT INTO `list_values` VALUES ('402881e83ecf3ff0013ecf839ec00005', '5', '工作日志', '');
INSERT INTO `list_values` VALUES ('402881e93fcbb31e013fcbcc1a4b0009', '18', '同意', '');
INSERT INTO `list_values` VALUES ('402881e93fcbb31e013fcbccc789000b', '18', '不同意', '');
INSERT INTO `list_values` VALUES ('402881e93fcbb31e013fcbcce337000d', '18', '已阅', '');
INSERT INTO `list_values` VALUES ('402881e93fcbb31e013fcbccfe40000f', '18', '很好', '');
INSERT INTO `list_values` VALUES ('402881ea3f1dac03013f1dad000b0002', '1', '普通通知', '');
INSERT INTO `list_values` VALUES ('402881eb3eee1b9e013eee1fe9200008', '6', '个人事务', '');
INSERT INTO `list_values` VALUES ('402881eb3eee1b9e013eee201aff000a', '6', '社区事务', '');
INSERT INTO `list_values` VALUES ('402881eb3ef922a1013ef93f45d80010', '7', '普通公告', 'xx');
INSERT INTO `list_values` VALUES ('402881f73ea21add013ea21c45810002', '1', '部门通知', '');
INSERT INTO `list_values` VALUES ('402881f73eb1d487013eb1ed69470011', '3', '普通新闻', '');
INSERT INTO `list_values` VALUES ('D663C662-38E9-4078-B44C-0D081F469172', '21', '舜华社区', '');
INSERT INTO `list_values` VALUES ('D663C662-38E9-4078-B44C-0D081F469173', '21', '舜德社区', '');
INSERT INTO `list_values` VALUES ('D663C662-38E9-4078-B44C-0D081F469174', '21', '舜世社区', '');
INSERT INTO `list_values` VALUES ('D663C662-38E9-4078-B44C-0D081F469175', '21', '舜雅社区', '');
INSERT INTO `list_values` VALUES ('D663C662-38E9-4078-B44C-0D081F469176', '21', '舜和社区', '');

-- ----------------------------
-- Table structure for messagemanager
-- ----------------------------
DROP TABLE IF EXISTS `messagemanager`;
CREATE TABLE `messagemanager` (
  `id` char(32) CHARACTER SET utf8 NOT NULL COMMENT '主键',
  `typeid` char(200) CHARACTER SET utf8 NOT NULL COMMENT '留言类型',
  `mestitle` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '新闻标题',
  `mesplot` text CHARACTER SET utf8 COMMENT '留言内容',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `promulgator` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '发布人',
  `createdtime` datetime NOT NULL COMMENT '创建时间',
  `modifiedate` datetime NOT NULL COMMENT '修改时间',
  `replycontent` text CHARACTER SET utf8 COMMENT '回复内容',
  `replydatetime` datetime DEFAULT NULL COMMENT '回复日期',
  `fwmyd` varchar(100) DEFAULT NULL COMMENT '服务满意度',
  `replypep` varchar(100) DEFAULT '' COMMENT '回复人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messagemanager
-- ----------------------------
INSERT INTO `messagemanager` VALUES ('4028808844dd23b90144dd3601ce0002', '402881f73eb1d487013eb1ed69470011', '55', '666', '1', '402881f73e1c4ba4013e1c4c08470001', '2014-03-20 09:58:28', '2014-03-20 16:45:53', '111111111', '2014-03-20 16:45:51', null, '402881f73e1c4ba4013e1c4c08470001');

-- ----------------------------
-- Table structure for mt_mapping
-- ----------------------------
DROP TABLE IF EXISTS `mt_mapping`;
CREATE TABLE `mt_mapping` (
  `id` char(32) NOT NULL DEFAULT '',
  `mp_mtid` char(32) DEFAULT NULL COMMENT '会议id',
  `mp_fkid` char(32) DEFAULT NULL COMMENT '部门ID,人员ID',
  `mp_type` char(32) DEFAULT NULL COMMENT '1部门ID,2人员ID',
  PRIMARY KEY (`id`),
  KEY `mp_mtid_fk` (`mp_mtid`),
  CONSTRAINT `mp_mtid_fk` FOREIGN KEY (`mp_mtid`) REFERENCES `mt_meeting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议--参与人员关联';

-- ----------------------------
-- Records of mt_mapping
-- ----------------------------
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e8640085', '402881ec3f89f9bd013f8a32e8260070', '402881f73e1c5181013e1c56da3c0002', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e8640086', '402881ec3f89f9bd013f8a32e8260070', '402881ea3f26a313013f26a82a8a0008', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e8640087', '402881ec3f89f9bd013f8a32e8260070', '402881ea3f26a313013f26a89689000a', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e8640088', '402881ec3f89f9bd013f8a32e8260070', '402881ea3f26a313013f26a8d56f000c', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e8640089', '402881ec3f89f9bd013f8a32e8260070', '402881ea3f26a313013f26a9739b0011', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e864008a', '402881ec3f89f9bd013f8a32e8260070', '402881ea3f26a313013f26aa10920013', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e864008b', '402881ec3f89f9bd013f8a32e8260070', '402881ea3f26a313013f26ab0f5d0017', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e864008c', '402881ec3f89f9bd013f8a32e8260070', '402881ea3f26a313013f26ab44720019', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e864008d', '402881ec3f89f9bd013f8a32e8260070', '402881ec3f884c73013f88615fd10022', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a32e864008e', '402881ec3f89f9bd013f8a32e8260070', '402881ec3f884c73013f88610ea00020', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec3f89f9bd013f8a3483790091', '402881ec3f89f9bd013f8a348379008f', '402881ea3f26a313013f26a82a8a0008', '1');
INSERT INTO `mt_mapping` VALUES ('402881ec4009553601400973640d0005', '402881ec400955360140097363e80002', '402881e63ff09969013ff0ff23e50013', '1');

-- ----------------------------
-- Table structure for mt_meeting
-- ----------------------------
DROP TABLE IF EXISTS `mt_meeting`;
CREATE TABLE `mt_meeting` (
  `id` char(32) NOT NULL,
  `m_type` varchar(50) DEFAULT NULL COMMENT '会议类型',
  `m_name` varchar(50) DEFAULT NULL COMMENT '会议主题',
  `m_host` varchar(50) DEFAULT NULL COMMENT '主持人',
  `m_date` date DEFAULT NULL COMMENT '会议日期',
  `m_statime` varchar(50) DEFAULT NULL COMMENT '会议开始时间',
  `m_endtime` varchar(50) DEFAULT NULL COMMENT '会议结束时间',
  `m_rid` char(32) DEFAULT NULL COMMENT '会议室id',
  `m_summary` varchar(2000) DEFAULT NULL COMMENT '简介',
  `m_remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `m_published` varchar(50) DEFAULT NULL COMMENT '插入时间',
  `m_uid` char(32) DEFAULT NULL COMMENT '发布人员',
  PRIMARY KEY (`id`),
  KEY `fk` (`m_rid`),
  KEY `fk2` (`m_uid`),
  KEY `m_date` (`m_date`),
  CONSTRAINT `fk` FOREIGN KEY (`m_rid`) REFERENCES `mt_room` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk2` FOREIGN KEY (`m_uid`) REFERENCES `sy_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议管理';

-- ----------------------------
-- Records of mt_meeting
-- ----------------------------
INSERT INTO `mt_meeting` VALUES ('402881ec3f89f9bd013f8a32e8260070', '402881e53e8bedc0013e8bf0ea9e0002', '员工培训', '刘金成', '2013-06-29', '10:00:00', '12:00:00', '402881e63f3b23a2013f3b26e0540002', '对全体员工的一次综合培训', '<p>每人带着一直笔一个本子，记录培训内容，望大家准时参加。</p>', '2013-06-28 17:52:39', null);
INSERT INTO `mt_meeting` VALUES ('402881ec3f89f9bd013f8a348379008f', '402881e53e8bedc0013e8bf23cb1000a', '公司制度改革', '张春雷', '2013-06-30', '11:00:00', '12:30:00', '402881e63f3b23a2013f3b26e0540002', '对公司一些制度的综合整合，进行一次统一改革', '', '2013-06-28 17:54:24', null);
INSERT INTO `mt_meeting` VALUES ('402881ec400955360140097363e80002', '402881e53e8bedc0013e8bf1a90d0007', '全体会议', '王总', '2013-07-23', '10:54:25', '10:54:45', '402881e63f3b23a2013f3b26e0540002', '方法', '<p>得到</p>', '2013-07-23 10:54:51', '402881f73e1c4ba4013e1c4c08470001');

-- ----------------------------
-- Table structure for mt_room
-- ----------------------------
DROP TABLE IF EXISTS `mt_room`;
CREATE TABLE `mt_room` (
  `id` char(32) NOT NULL,
  `mr_no` varchar(50) DEFAULT NULL COMMENT '会议室编号',
  `mr_name` varchar(50) DEFAULT NULL COMMENT '会议室名称',
  `mr_num` varchar(50) DEFAULT NULL COMMENT '容纳的人数',
  `mr_remark` varchar(9999) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议室';

-- ----------------------------
-- Records of mt_room
-- ----------------------------
INSERT INTO `mt_room` VALUES ('402881e63f3b23a2013f3b26e0540002', '001', '会议一室', '100', '有一台投影仪一台笔记本');

-- ----------------------------
-- Table structure for newscomment
-- ----------------------------
DROP TABLE IF EXISTS `newscomment`;
CREATE TABLE `newscomment` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '主键',
  `newscomments` text COMMENT '新闻评论内容',
  `conmmentsname_id` char(32) NOT NULL COMMENT '评论人姓名',
  `conmmentsdate` datetime NOT NULL COMMENT '评论日期',
  `newsid` char(64) NOT NULL COMMENT '新闻 id',
  `bycommentname_id` char(32) DEFAULT NULL COMMENT '被评论人姓名',
  PRIMARY KEY (`id`),
  KEY `newsid` (`newsid`),
  CONSTRAINT `newscomment_ibfk_1` FOREIGN KEY (`newsid`) REFERENCES `newsmanagement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻评论表';

-- ----------------------------
-- Records of newscomment
-- ----------------------------

-- ----------------------------
-- Table structure for newsmanagement
-- ----------------------------
DROP TABLE IF EXISTS `newsmanagement`;
CREATE TABLE `newsmanagement` (
  `id` char(32) NOT NULL COMMENT '主键',
  `typeid` char(200) NOT NULL COMMENT '新闻类型',
  `newstitle` varchar(100) NOT NULL COMMENT '新闻标题',
  `plotsummary` varchar(200) DEFAULT NULL COMMENT '新闻简介',
  `newsplot` text COMMENT '新闻内容',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `promulgator` varchar(100) DEFAULT NULL COMMENT '发布人',
  `createdtime` datetime NOT NULL COMMENT '创建时间',
  `modifiedate` datetime NOT NULL COMMENT '修改时间',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `contents` int(11) DEFAULT '0' COMMENT '评论数',
  `allowcomment` int(1) DEFAULT NULL COMMENT '是否允许评论',
  `modifyByname` varchar(32) DEFAULT NULL COMMENT '修改人姓名',
  `stick` int(1) DEFAULT NULL COMMENT '是否置顶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of newsmanagement
-- ----------------------------
INSERT INTO `newsmanagement` VALUES ('40288085451c215a01451c22948c0002', '402881f73eb1d487013eb1ed69470011', '今天放假', '愚人节', '<p>真的真的放假&nbsp; 逗你玩<br/></p>', '0', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:13:19', '2014-04-01 15:13:19', '3', '0', '0', null, '0');
INSERT INTO `newsmanagement` VALUES ('40288085451c215a01451c3037830004', '402881f73eb1d487013eb1ed69470011', '五旬男“宅家”  只为伺候患病双亲五旬男“宅家” 只为伺候患病双亲', '', '<p>　千华网讯（记者张烨妍）说起宅男这个称呼，大家可能都会想到80后、90后这些年轻人，喜欢宅在家里上网。可是住在铁东区对炉街道健康社区的59岁的刘广春，也长年宅在家里，几乎不出屋，他却是为了照顾年老体弱的父母。</p><p>　　日前，记者来到刘广春和父母的住处，这是一处普通双室，刘广春住在小屋，父母住在大屋。刘广春的母亲今年82岁，患哮喘病几十年，现在靠吃药维\r\n持，经常出现呼吸困难的情况。她体质非常弱，不能干家务活，炒菜的油烟味、打扫房间带起来的灰尘都会引发她的哮喘病发作。刘广春的父亲30年前意外受伤，\r\n导致颈椎压迫神经，先后做过两次手术，下肢活动一直受影响。3年前，他病情恶化，瘫痪在床，常常大小便失禁，而且肌肉萎缩，连吞咽都困难。</p><p><br/></p><p>　　为照顾父母，刘广春除了购买生活必需品，或者极其特殊的事以外，每天都待在家里。即使有事不得不出去，他也会尽快赶回来，最长不超过两个小时，\r\n因为他心里放不下患病的父母。刘广春全心全意照顾生病的父母，数十年来毫无怨言，特别是4年前他退休后，更是放下了一切事务，专心住在父母家里，24小时\r\n陪护。他每天要给父母做三餐，喂父亲吃饭喝水，给父亲收拾大小便。这些年他几乎没睡过一个整宿的觉，连社区工作人员和邻居提起他都竖起大拇指，说这样的大\r\n孝子真不多见。</p><p><br/></p>', '0', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:28:13', '2014-04-01 15:30:10', '17', '0', '0', '402881f73e1c4ba4013e1c4c08470001', '1');
INSERT INTO `newsmanagement` VALUES ('40288085452578680145263cb3f80002', '402881f73eb1d487013eb1ed69470011', '李克强：搜寻失联航班不能松懈更不能放弃', '', '<p>李克强感谢阿博特的慰问和通报，赞赏澳方应马来西亚政府要求，牵头协调南印度洋海域搜寻失联客机所做的大量工作，并向机上澳大利亚公民的亲属表示慰\r\n问。李克强说，当前搜寻工作面临更加复杂的形势和困难，但我们不能松懈，更不能放弃，要继续全力开展搜寻。中方派出的10余艘舰船和多架飞机正会同国际搜\r\n寻力量，在相关海域对从空中观测发现的疑似物品进行搜寻、打捞与核实。我们还协调了60多艘过往中国籍商船和在印度洋海域作业的20艘中国渔船参与搜寻工\r\n作。我赞同总理先生所说，搜寻工作要加大强度，这是对机上人员亲属的责任。中方将继续同澳大利亚、马来西亚等各方密切沟通与合作，全力进行搜寻，同时深入\r\n开展调查，共同努力做好相关工作。</p><p>　　阿博特感谢李克强的慰问，积极评价中方的搜寻工作，表示澳方愿与中国、马来西亚等有关各方加强沟通与合作，竭尽所能，进一步加大搜寻强度，共同处理好有关事宜。</p><p></p><p>　　阿博特说，我期待即将正式访华并出席博鳌亚洲论坛年会，同中方就推进澳中关系交换意见。澳方愿与中方加快澳中自贸协定谈判，深化两国合作。</p><p></p><p>　　李克强说，总理先生就任以来致力于推进中澳战略伙伴关系。中国政府高度重视对澳关系。欢迎你下周正式访华并出席博鳌亚洲论坛年会，我期待与你举行两国总理定期会晤，为中澳关系发展注入新动力。</p><p><br/></p>', '0', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:18:03', '2014-04-03 14:18:03', '0', '0', '0', null, '0');
INSERT INTO `newsmanagement` VALUES ('40288085452578680145263d41c10003', '402881f73eb1d487013eb1ed69470011', '菲组织外国记者赴仁爱礁 收到欢迎来中国短信', '', '<p>　“菲律宾准备好中国的报复了吗？”菲《马来亚商业洞察》3月31日一篇署名文章称，菲中已经不再是朋友，向国际仲裁庭正式提交诉状之后，菲律宾可能从盟\r\n友那里获得一些经济甜头，但与中国冲突的后果只能自己扛。文章说，中国很可能占领更多岛屿，菲律宾已经失去了黄岩岛。俄罗斯《独立报》2日发表题为“中国\r\n在南海开采天然气”的文章称，在美国鼓动下，菲律宾向国际仲裁法院对中国提起诉讼。在这一背景下，中国在南海第一口天然气田开始投产。“荔湾3”是中国第\r\n一个深水天然气田项目，是该国开采南海深水下能源的重要里程碑。</p>', '0', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:18:39', '2014-04-03 14:18:39', '0', '0', '0', null, '0');
INSERT INTO `newsmanagement` VALUES ('40288085452578680145263daa100004', '402881f73eb1d487013eb1ed69470011', '人民日报：茂名反PX游行致15死300伤系谣言', '', '<p>4月2日，香港东方日报等报道“锁城遏示威 茂名15死300伤”，并描述为“继日前有七死逾百伤后，新一波的流血冲突再造成八死二百余人受伤”。</p><p>　　对此报道，茂名市新闻办工作人员曾毅表示感到不可思议，当天他就在现场，警方采取了清场行动，有两人受伤，但没有人员死亡。茂名市政府的正式通告也明确，此群体性事件没有造成人员死亡。</p><p></p><p>　　记者寻访当地群众及茂名市人民医院等单位，了解到当时大致情况：3月30日上午9时许，有80多名群众聚集在茂名市区油城五路大草坪并慢行通过\r\n市区部分路段，以表达对拟建芳烃(PX)项目的不满。当天下午3时许，又有部分群众聚集茂名市委门前表达意见，有少数人扔矿泉水瓶、鸡蛋等，并拦截车辆造\r\n成交通堵塞，警察带回挑头分子29人协助调查；&nbsp;当晚20时许，一群不法分子开始在市区拦车辆，实施打砸行为，事后开始冲击茂名市委北门和东门。晚23时\r\n许，违法分子将停在市委东门附近一辆正在执勤的警车烧毁，随后小部分闹事者开始乘摩托车继续在市区多个地方打砸沿街商铺、广告牌，纵火烧毁多辆执勤警车及\r\n无线电通讯车、拖车等。</p><p></p><p>　　针对事件性质的演变，当地公安机关迅速采取措施应对。事件目击者、在茂名广电系统工作的张先生对记者说，最后清场阶段，有两名受伤人员被送到当地医院。记者问，看到有人死亡没有？对方表示，没有见到，也没听说。</p><p><br/></p>', '0', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:19:06', '2014-04-03 14:19:06', '0', '0', '0', null, '0');
INSERT INTO `newsmanagement` VALUES ('4028808845454b8c0145455710a80002', '402881f73eb1d487013eb1ed69470011', '国际新闻', '国际新闻', '<p>数百万造豪华大墓 劲歌热舞风光大葬<br/><br/>　　－－福建沿海丧葬陋习见闻<br/><br/>　　新华网福州4月9日电 (记者沈汝发、姜克红)清明节期间，记者在福建沿海一带采访发现，毁林造墓现象愈演愈烈，一些豪华墓穴造价动辄高达数百万元，殡葬仪式更是奢华，仪仗队、鼓乐队一应俱全，花费少则二三十万元，多则上百万元。<br/><br/>　　如此奢华丧葬，为的是祭奠死者还是给活人看？<br/><br/>　　上百万的豪华大墓什么样？<br/><br/>　　在福建沿海采访，一些村庄附近的山林坡地上，随处可见私自修建的坟墓群，其中不乏豪华墓、“活人墓”。这些巨墓工程浩大、用料讲究、雕梁画栋、造价昂贵。<br/><br/>　　在福建福清市城头镇一座面海的山坡上，远远就能看见一座座半圆形水泥坟墓密布在山林之间。沿着盘山水泥路，两旁私建坟墓鳞次栉比，一些在建的墓穴附近被砍伐的山木还未来得及清理，有些墓穴的墙体上写满了马队运石沙建墓广告。<br/><br/>　　在接近山顶处，记者看到一座在建的豪华大墓，周围林木被砍伐殆尽，裸露出黄色的山体，7位工人正在砌墙琢石，加紧施工。据工人介绍，这座翻建的大墓已经修建了一年多，花费100多万元，目前已进入收尾阶段。<br/><br/>　　在长乐市江田镇，记者看到，一座在建的豪华大墓隐蔽在群山绿水间，已经建好的墓体上覆盖着树枝和绿色遮阴网，如果不是工人施工的敲打声很难被发现。这座占地约3亩、修建时间2年的豪华大墓不仅有石象石狮把门，而且每件石料都经过精雕细琢，精美绝伦。据工人讲，这座墓耗资400多万元。<br/><br/>　　风光厚葬：劲歌热舞仪仗队 几公里的送葬队伍<br/><br/>　　不仅修坟造墓舍得花钱，丧事操办规模也越来越大，档次越来越高。受此影响，一些农村贫困家庭举债也要把丧事办得风光有面子，一场丧事办下来，少则二三十万元，多则上百万元。<br/><br/>　　4月5日清晨6点多，长乐市湖南镇东卓村一卓姓人家举行出殡仪式。数十个蓝色充气拱门占据着村里的两条主要村道，受邀而来的10多支乐队在拱门下轮番演奏，一旁的4辆卡车载着穿着暴露的舞蹈演员在劲歌热舞。如果不是周围的花圈与祭奠悼文，外人还以为这里在进行什么庆祝典礼。<br/><br/>　　记者现场看到，上午9点多，隆重的出葬仪式正式开始，仪仗队、鼓乐队、花车队、艳舞车队依次排开，后面紧随着送葬的亲友，绵延两公里的送葬队伍行进在乡间村道上，一路上锣鼓喧天，鞭炮齐鸣，引得不少村民前来观看。<br/><br/>　　一旁的村民介绍，这样的送葬仪式至少花费100万元，而这种现象在这里并不罕见。<br/><br/>　　不少群众在接受记者采访时无奈地表示，厚葬已经成了一种风俗，如果不厚葬，就很没面子，“说是祭祀死者，实际上是给活人看的。”<br/><br/>　　大操大办：追求面子的炫耀性消费<br/><br/>　　民间旧丧葬陋俗盛行，一些不良丧葬现象更是令人担忧。看穴风水先生生意兴隆，在停尸守灵和送上山时念经超度现象屡见不鲜，兜售具有迷信色彩的丧葬用品，搞封建迷信活动屡禁不止。<br/><br/>　　“这些祭祀风俗与文明祭祀背道而驰，既浪费，又加重了家庭负担。”长乐市民政局副局长陈宇说。<br/><br/></p>', '0', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 15:15:05', '2014-04-09 15:15:05', '0', '0', '0', null, '0');

-- ----------------------------
-- Table structure for newtable
-- ----------------------------
DROP TABLE IF EXISTS `newtable`;
CREATE TABLE `newtable` (
  `RKJBGUID` varchar(32) NOT NULL,
  `XM` varchar(10) DEFAULT NULL COMMENT '',
  `XMPY` varchar(10) DEFAULT NULL,
  `SFZH` varchar(18) DEFAULT NULL,
  `XB` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `CSRQ` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `MZ` varchar(20) DEFAULT NULL,
  `JG` varchar(50) DEFAULT NULL,
  `XL` varchar(20) DEFAULT NULL,
  `LXDH` varchar(20) DEFAULT NULL,
  `GZDW` varchar(50) DEFAULT NULL,
  `ZHZFRQ` varchar(10) DEFAULT NULL,
  `XCZFRQ` varchar(10) DEFAULT NULL,
  `XZDWGUID` tinyint(4) NOT NULL,
  `ZRPQGUID` varchar(0) DEFAULT NULL,
  `JZWGUID` varchar(32) DEFAULT NULL,
  `DYGUID` varchar(32) DEFAULT NULL,
  `FWGUID` varchar(32) DEFAULT NULL,
  `JTZZ` varchar(100) DEFAULT NULL,
  `HZGUID` varchar(32) DEFAULT NULL,
  `YHZGX` varchar(20) DEFAULT NULL,
  `ZP` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`RKJBGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of newtable
-- ----------------------------

-- ----------------------------
-- Table structure for per_instant_message
-- ----------------------------
DROP TABLE IF EXISTS `per_instant_message`;
CREATE TABLE `per_instant_message` (
  `id` char(32) NOT NULL,
  `send_uid` char(32) NOT NULL COMMENT '发送人id',
  `receive_uid` char(32) NOT NULL COMMENT '接收人id',
  `create_time` datetime NOT NULL COMMENT '发送时间',
  `message_content` text COMMENT '消息内容',
  `read_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息读取状态，1：已读，0：未读',
  PRIMARY KEY (`id`),
  KEY `per_instant_message_ibfk_2` (`receive_uid`),
  KEY `per_instant_message_ibfk_1` (`send_uid`),
  KEY `create_time` (`create_time`),
  KEY `read_state` (`read_state`),
  CONSTRAINT `per_instant_message_ibfk_1` FOREIGN KEY (`send_uid`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `per_instant_message_ibfk_2` FOREIGN KEY (`receive_uid`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='即时消息';

-- ----------------------------
-- Records of per_instant_message
-- ----------------------------
INSERT INTO `per_instant_message` VALUES ('402881e63fadbd94013fadc9b2460002', '402881f73e1c4ba4013e1c4c08470001', '402881f73e1c4ba4013e1c4c08470001', '2013-07-05 15:44:04', '<p>x<br/></p>', '1');

-- ----------------------------
-- Table structure for per_msg
-- ----------------------------
DROP TABLE IF EXISTS `per_msg`;
CREATE TABLE `per_msg` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '用户id',
  `msg_type` tinyint(4) NOT NULL COMMENT '消息类型',
  `table_id` char(32) NOT NULL COMMENT '内容表id',
  `msg_time` datetime NOT NULL COMMENT '发送时间',
  `read_state` tinyint(1) NOT NULL COMMENT '消息读取状态，1：已读，0：未读',
  PRIMARY KEY (`id`),
  KEY `per_msg_ibfk_1` (`user_id`),
  KEY `msg_time` (`msg_time`),
  KEY `read_state` (`read_state`),
  CONSTRAINT `per_msg_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息提醒';

-- ----------------------------
-- Records of per_msg
-- ----------------------------
INSERT INTO `per_msg` VALUES ('4028808845400fd0014540246029000a', '402881f73e1c4ba4013e1c4c08470001', '1', '4028808845400fd00145402460290009', '2014-04-08 15:01:36', '1');
INSERT INTO `per_msg` VALUES ('4028808845400fd0014540246029000d', '4028808544fbf0e00144fc2621230025', '1', '4028808845400fd00145402460290009', '2014-04-08 15:01:36', '0');
INSERT INTO `per_msg` VALUES ('40288088454443230145444428020003', '40288088454407310145443116c80001', '1', '40288088454443230145444428020002', '2014-04-09 10:14:48', '0');
INSERT INTO `per_msg` VALUES ('40288088454443230145444428020004', '402880884540bc0e014540bf19790001', '1', '40288088454443230145444428020002', '2014-04-09 10:14:48', '0');
INSERT INTO `per_msg` VALUES ('402881e63f8daba1013f8dac66900002', '402881f73e1c4ba4013e1c4c08470001', '3', '402881ec3f88bab9013f88d5f2b000e6', '2013-06-29 10:04:13', '1');
INSERT INTO `per_msg` VALUES ('402881e63f8daba1013f8dac7eca0007', '402881f73e1c4ba4013e1c4c08470001', '3', '402881ec3f88bab9013f88d5f2b000e6', '2013-06-29 10:04:19', '1');
INSERT INTO `per_msg` VALUES ('402881e63f8daba1013f8dac96dc000c', '402881f73e1c4ba4013e1c4c08470001', '3', '402881ec3f88bab9013f88d5f2b000e6', '2013-06-29 10:04:25', '1');
INSERT INTO `per_msg` VALUES ('402881e63f8daba1013f8dacaf480011', '402881f73e1c4ba4013e1c4c08470001', '3', '402881ec3f88bab9013f88d5f2b000e6', '2013-06-29 10:04:31', '1');
INSERT INTO `per_msg` VALUES ('402881e6404c130801404c387a090019', '402881f73e1c4ba4013e1c4c08470001', '1', '402881e6404c130801404c3879d50016', '2013-08-05 10:05:04', '1');
INSERT INTO `per_msg` VALUES ('402881ec3f88bab9013f88d5f2bd00e7', '402881f73e1c4ba4013e1c4c08470001', '3', '402881ec3f88bab9013f88d5f2b000e6', '2013-06-28 11:31:30', '1');
INSERT INTO `per_msg` VALUES ('402881ec3f88bab9013f88e955170105', '402881f73e1c4ba4013e1c4c08470001', '3', '402881ec3f88bab9013f88e954b30100', '2013-06-28 11:52:40', '1');
INSERT INTO `per_msg` VALUES ('402881ec3f89f9bd013f8a1a4305000e', '402881f73e1c4ba4013e1c4c08470001', '1', '402881ec3f89f9bd013f8a1a42890009', '2013-06-28 17:25:44', '1');
INSERT INTO `per_msg` VALUES ('402881ec3f89f9bd013f8a1e91ea0037', '402881f73e1c4ba4013e1c4c08470001', '1', '402881ec3f89f9bd013f8a1e91a20032', '2013-06-28 17:30:26', '1');
INSERT INTO `per_msg` VALUES ('402881ec3f89f9bd013f8a32e8640075', '402881f73e1c4ba4013e1c4c08470001', '2', '402881ec3f89f9bd013f8a32e8260070', '2013-06-28 17:52:39', '1');

-- ----------------------------
-- Table structure for per_schedule
-- ----------------------------
DROP TABLE IF EXISTS `per_schedule`;
CREATE TABLE `per_schedule` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '日程安排所属人',
  `sch_title` varchar(50) NOT NULL COMMENT '主题',
  `sch_type` char(32) DEFAULT NULL COMMENT '日程安排类型',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `warn_time` datetime DEFAULT NULL COMMENT '提醒时间',
  `sch_content` text NOT NULL COMMENT '详细内容',
  PRIMARY KEY (`id`),
  KEY `per_schedule_ibfk_1` (`user_id`),
  KEY `start_time` (`start_time`),
  KEY `warn_time` (`warn_time`),
  KEY `per_schedule_ibfk_2` (`sch_type`),
  CONSTRAINT `per_schedule_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `per_schedule_ibfk_2` FOREIGN KEY (`sch_type`) REFERENCES `list_values` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程安排';

-- ----------------------------
-- Records of per_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for pe_staff
-- ----------------------------
DROP TABLE IF EXISTS `pe_staff`;
CREATE TABLE `pe_staff` (
  `id` char(32) NOT NULL DEFAULT '',
  `ps_name` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `ps_sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `ps_birthday` date DEFAULT NULL COMMENT '生日',
  `ps_age` int(11) DEFAULT NULL COMMENT '年龄',
  `ps_presentAddress` varchar(200) DEFAULT NULL COMMENT '现居住地',
  `ps_homePhone` varchar(15) DEFAULT NULL COMMENT '家庭电话',
  `ps_phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `ps_other` varchar(15) DEFAULT NULL COMMENT '其他联系人',
  `ps_accountAddress` varchar(200) DEFAULT NULL COMMENT '户口所在地',
  `ps_ethnic` varchar(50) DEFAULT NULL COMMENT '民族',
  `ps_card` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `ps_homeTown` varchar(200) DEFAULT NULL COMMENT '籍贯',
  `ps_userId` char(32) DEFAULT NULL COMMENT '用户帐户',
  `ps_staffId` varchar(50) DEFAULT NULL COMMENT '员工编号',
  `ps_wage` varchar(50) DEFAULT NULL COMMENT '工资卡号',
  `ps_social` varchar(50) DEFAULT NULL COMMENT '社保号',
  `ps_edu` char(32) DEFAULT NULL COMMENT '学历',
  `ps_specialty` varchar(50) DEFAULT NULL COMMENT '专业',
  `ps_school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `ps_graduation` date DEFAULT NULL COMMENT '毕业时间',
  `ps_status` varchar(50) DEFAULT NULL COMMENT '职位状态（在职，离职，退休）',
  `ps_type` char(32) DEFAULT NULL COMMENT '职位类型',
  `ps_post` char(32) DEFAULT NULL COMMENT '职位',
  `ps_entryDate` date DEFAULT NULL COMMENT '入职时间',
  `ps_resReason` char(32) DEFAULT NULL COMMENT '离职原因',
  `ps_resDate` date DEFAULT NULL COMMENT '离职时间',
  `ps_resRemark` varchar(9999) DEFAULT NULL COMMENT '离职备注',
  `ps_retReason` char(32) DEFAULT NULL COMMENT '退休原因',
  `ps_retRemark` varchar(9999) DEFAULT NULL COMMENT '退休备注',
  `ps_retDate` date DEFAULT NULL COMMENT '退休时间',
  `ps_uid` char(32) DEFAULT NULL COMMENT '录入人',
  `ps_inDate` date DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工信息表';

-- ----------------------------
-- Records of pe_staff
-- ----------------------------
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97de317b0007', 'tt', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 't', null, '离职', '', '', null, '402881823f2309f5013f2322a5ab0003', '2013-07-02', 'ttt', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97e37d64000a', 'ttt3213', '男', '2013-07-10', '3213', '3123', '', '13213213213123', '3123', '321', '21312', '3123213213', '321', '402881ea3f26a313013f26af50290027', '21312', '123123', '123323', '', 'hh', 'hhh', '2013-07-09', '离职', '', '', '2013-07-11', '402881823f2309f5013f2322a5ab0003', '2013-07-08', '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97ec38c2000c', '3434343', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, null, null);
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97edbd54000d', '6665665', '男', null, '11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, null, null);
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97eeb4f0000e', 'tyry', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, null, null);
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97ef6cb0000f', 'uii', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97eff9590010', '6i', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97f0cec70011', '567567', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97f2538e0012', 'dsadasd', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97f3bb060013', 'sdadsa', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97f437e40015', 'asdsa', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97f49f7b0016', 'tr', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f97fd1d870017', 'try{', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ec3f97ad64013f981fcc770018', 'ff', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881f73e1c4ba4013e1c4c08470001', '2013-07-01');
INSERT INTO `pe_staff` VALUES ('402881ed403d836401403d98ada7000a', '23', '男', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '在职', '', '', null, '', null, '', '', '', null, '402881ec3f73e10b013f73e74ee8000a', '2013-08-02');

-- ----------------------------
-- Table structure for rkjb
-- ----------------------------
DROP TABLE IF EXISTS `rkjb`;
CREATE TABLE `rkjb` (
  `RKJBGUID` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '主键',
  `XM` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `XMPY` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名缩写',
  `SFZH` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号',
  `XB` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别',
  `CSRQ` char(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '出生日期',
  `MZ` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '民族',
  `JG` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '籍贯',
  `XL` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '学历',
  `LXDH` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系方式',
  `GZDW` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '工作单位',
  `ZHZFRQ` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '最后走访日期',
  `XCZFRQ` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '下次走访日期',
  `XZDWGUID` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '社区',
  `ZRPQGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '所属片区',
  `JZWGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '建筑物',
  `DYGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '单元号',
  `FWGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '房屋',
  `JTZZ` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '基本操作',
  `HZGUID` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '户主',
  `YHZGX` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '与户主关系',
  `ZP` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '未知',
  PRIMARY KEY (`RKJBGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='人口管理表';

-- ----------------------------
-- Records of rkjb
-- ----------------------------
INSERT INTO `rkjb` VALUES ('1188802F-5443-4020-AAC4-72B0ADF9AA92', '张国强', 'ZGQ', '1', '1', '', '', '', '', '', '', '', '', '1188802F-5443-4020-AAC4-72B0ADF9AA92', '', '8D0B4E4D-C5CD-41CF-A965-C5680267832C', '8D0B4E4D-C5CD-41CF-A965-C5680267832C', '', '', '', '', '');
INSERT INTO `rkjb` VALUES ('F9D53831-92F7-4F06-BA5D-D23F76F72190', '李松', 'LS', '0', '', '', '', '', '', '', '', '', '', 'F9D53831-92F7-4F06-BA5D-D23F76F72190', '', 'F9D53831-92F7-4F06-BA5D-D23F76F72190', 'F9D53831-92F7-4F06-BA5D-D23F76F72190', '', '', '', '', '');

-- ----------------------------
-- Table structure for rkjs
-- ----------------------------
DROP TABLE IF EXISTS `rkjs`;
CREATE TABLE `rkjs` (
  `RKJSGUID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `FNBH` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '妇女编号',
  `SFZGYLFN` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否自管育龄妇女',
  `SFXHHY` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否计生协会会员',
  `SFXHZYZ` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否计生协会志愿者',
  `LRLC` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '流入流出',
  `HCLR` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '何处流入',
  `HSLR` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '何时流入',
  `HCLC` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '何处流出',
  `HSLC` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '何时流出',
  `QRQC` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '迁入迁出',
  `HCQR` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '何处迁入',
  `HSQR` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '何时迁入',
  `HCQC` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '何处迁出',
  `HSQC` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT '何时迁出',
  PRIMARY KEY (`RKJSGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='人口计生表';

-- ----------------------------
-- Records of rkjs
-- ----------------------------
INSERT INTO `rkjs` VALUES ('644316a0-346a-46c2-bf7d-5746ad304dcc', '1188802F-5443-4020-AAC4-72B0ADF9AA92', '888', '是', '是', '', '', '999', '', '88888888', '', '', '', '', '888', '');
INSERT INTO `rkjs` VALUES ('9b5e95da-102b-47e3-9a46-494ae31da4e0', 'F9D53831-92F7-4F06-BA5D-D23F76F72190', '', '是', '是', '', '', '11', '2014-04-01', '555', '2014-04-09', '', '33', '2014-03-31', '44', '2014-04-15');

-- ----------------------------
-- Table structure for shyl
-- ----------------------------
DROP TABLE IF EXISTS `shyl`;
CREATE TABLE `shyl` (
  `SHYLGUID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `STZK` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `HLLX` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SFDB` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `SFPK` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `SFKC` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `JGYL` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `RTYL` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `SMFW` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `LNFZ` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `YJT` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `SHYLBZ` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`SHYLGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='社会养老表';

-- ----------------------------
-- Records of shyl
-- ----------------------------
INSERT INTO `shyl` VALUES ('90ec7adb-6bb6-4c45-abdc-9fb9cf142d25', 'F9D53831-92F7-4F06-BA5D-D23F76F72190', '一般', '自理', '否', '否', '否', '否', '否', '否', '否', '否', '111');
INSERT INTO `shyl` VALUES ('ccd48dd7-00cf-4d71-9374-479fd54b3d56', '1188802F-5443-4020-AAC4-72B0ADF9AA92', '良好', '自理', '否', '是', '是', '否', '是', '否', '否', '否', '答复111');

-- ----------------------------
-- Table structure for syrygl
-- ----------------------------
DROP TABLE IF EXISTS `syrygl`;
CREATE TABLE `syrygl` (
  `SYRYGLGUID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `SYSJ` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `SYQDW` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SYRYBZ` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`SYRYGLGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='失业人员管理';

-- ----------------------------
-- Records of syrygl
-- ----------------------------
INSERT INTO `syrygl` VALUES ('045839cf-7596-4330-9c0c-56cb30fbb89f', '1188802F-5443-4020-AAC4-72B0ADF9AA92', '2014-03-05', '111', '11111');

-- ----------------------------
-- Table structure for sy_action
-- ----------------------------
DROP TABLE IF EXISTS `sy_action`;
CREATE TABLE `sy_action` (
  `id` char(32) NOT NULL,
  `menu_id` char(32) NOT NULL COMMENT '此操作关联的菜单ID,0代表系统公共权限',
  `action_sort` smallint(6) NOT NULL COMMENT 'action 排序，用于显示',
  `action_name` varchar(50) NOT NULL COMMENT '操作名称',
  `action_url` varchar(500) NOT NULL COMMENT '请求url,不需要参数，如果还有多个请求用，隔开',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `action_sort` (`action_sort`),
  CONSTRAINT `sy_action_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sy_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='action操作表';

-- ----------------------------
-- Records of sy_action
-- ----------------------------
INSERT INTO `sy_action` VALUES ('40287d8140755d68014075675f5c0009', '402881f73eb50cf5013eb511679b0006', '5', '公共通讯录分组查询', 'publicGroup/load.do');
INSERT INTO `sy_action` VALUES ('40287d8140755d6801407567d8da000a', '402881f73eb50cf5013eb511679b0006', '6', '公公通讯录分组添加', 'publicGroup/addPage.do');
INSERT INTO `sy_action` VALUES ('40287d8140755d680140756875e5000b', '402881f73eb50cf5013eb511679b0006', '7', '公共通讯录分组修改', 'publicGroup/updatePage.do');
INSERT INTO `sy_action` VALUES ('40287d8140755d6801407568f505000c', '402881f73eb50cf5013eb511679b0006', '8', '公共通讯录分组删除', 'publicGroup/del.do');
INSERT INTO `sy_action` VALUES ('40287d81407faa8401407fb757650008', '402881f73eb50cf5013eb511679b0006', '9', 'excel导入', 'public/excelPage.do,public/excel.do');
INSERT INTO `sy_action` VALUES ('4028808544de019d0144de0752860002', '4028808544d44b730144d45106460002', '10', '删除人口管理', 'person/delRKJB.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc168db60005', '4028808544d44b730144d4517cce0004', '1', '添加计生管理', 'Familyplan/addPage.do?');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc16de760006', '4028808544d44b730144d4517cce0004', '2', '修改计生管理', 'Familyplan/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc172e1c0007', '4028808544d44b730144d4517cce0004', '3', '删除', 'Familyplan/del.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc185b810008', '4028808544d44b730144d45203a20006', '1', '添加', 'pension/addPage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1899d20009', '4028808544d44b730144d45203a20006', '2', '修改', 'pension/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc18e504000a', '4028808544d44b730144d45203a20006', '3', '删除', 'pension/del.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc195c76000b', '4028808544de2fbc0144de3306140002', '1', '添加', 'txry/jumpaddtxry.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc199cab000c', '4028808544de2fbc0144de3306140002', '2', '修改', 'txry/jumpedittxry.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc19e415000d', '4028808544de2fbc0144de3306140002', '3', '删除', 'txry/deltxry.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1a6ccd000e', '4028808544de2fbc0144de33a4e40004', '1', '添加', 'ldjc/jumpaddldjc.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1aa9d6000f', '4028808544de2fbc0144de33a4e40004', '2', '修改', 'ldjc/jumpeditldjc.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1aea2a0010', '4028808544de2fbc0144de33a4e40004', '3', '删除', 'ldjc/delldjc.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1b5b430011', '4028808544de2fbc0144de3826260012', '1', '添加', 'ldjc/delldjc.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1ba53d0012', '4028808544de2fbc0144de3826260012', '2', '修改', 'jyyz/jumpeditjyyz.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1bde3f0013', '4028808544de2fbc0144de3826260012', '3', '删除', 'jyyz/deljyyz.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1c55820014', '4028808544de2fbc0144de36893f000c', '1', '添加', 'xedkffqk/jumpaddxedkffqk.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1c95f60015', '4028808544de2fbc0144de36893f000c', '2', '修改', 'xedkffqk/findxedkffqk.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1cd4660016', '4028808544de2fbc0144de36893f000c', '3', '删除', 'xedkffqk/delxedkffqk.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1d7e230017', '4028808544de2fbc0144de3773120010', '1', '添加', 'sygl/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1db9f40018', '4028808544de2fbc0144de3773120010', '2', '修改', 'sygl/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1e15c00019', '4028808544de2fbc0144de3773120010', '2', '删除', 'sygl/del.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1eadca001a', '4028808544de2fbc0144de36f97d000e', '1', '添加', 'cypx/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1ef979001b', '4028808544de2fbc0144de36f97d000e', '2', '修改', 'cypx/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1f3d67001c', '4028808544de2fbc0144de36f97d000e', '3', '删除', 'cypx/del.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1fa97f001d', '4028808544de2fbc0144de3503e70008', '1', '添加', 'dwzp/addPage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc1ff4d1001e', '4028808544de2fbc0144de3503e70008', '2', '修改', 'dwzp/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc203489001f', '4028808544de2fbc0144de3503e70008', '3', '删除', 'dwzp/del.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc20a17c0020', '4028808544de2fbc0144de359039000a', '1', '添加', 'grqz/addPage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc20e6550021', '4028808544de2fbc0144de359039000a', '2', '修改', 'grqz/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc213a600022', '4028808544de2fbc0144de359039000a', '3', '删除', 'grqz/del.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc2533e50023', '4028808844dd23b90144dd449be80004', '1', '回复', 'message/updatePage.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc2572a30024', '4028808844dd23b90144dd449be80004', '2', '删除', 'message/del.do');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc3e580d0033', '4028808844dd23b90144dd449be80004', '1', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc402ea2003b', '4028808244dd2b620144dd39a1e80005', '1', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc405091003c', '4028808244dd2b620144dd67e6440008', '1', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc408e36003d', '4028808544d44b730144d45106460002', '1', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc40b67f003e', '4028808544d44b730144d4517cce0004', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc40df16003f', '4028808544d44b730144d45203a20006', '121', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc4130cf0040', '4028808544de2fbc0144de3306140002', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc414e790041', '4028808544de2fbc0144de33a4e40004', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc4186420042', '4028808544de2fbc0144de3826260012', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc41d2400043', '4028808544de2fbc0144de36893f000c', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc421cd50044', '4028808544de2fbc0144de36f97d000e', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc425c6f0045', '4028808544de2fbc0144de3773120010', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc42914a0046', '4028808544de2fbc0144de3503e70008', '121', '查看', '21');
INSERT INTO `sy_action` VALUES ('4028808544fbf0e00144fc42bcde0047', '4028808544de2fbc0144de359039000a', '4', '查看', '1');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f321590cb0002', '402881f73eb1853c013eb1ac49290008', '1', '查询', 'affiche/show.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f321619ac0003', '402881f73eb1853c013eb1ac49290008', '2', '添加', 'affiche/addPage.do,affiche/add.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3216872d0004', '402881f73eb1853c013eb1ac49290008', '3', '修改', 'affiche/updatePage.do,affiche/update.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3216c71b0005', '402881f73eb1853c013eb1ac49290008', '4', '批量删除', 'affiche/del.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f321761a50006', '402881f73eb1853c013eb1acb679000b', '1', '查询', 'affiche/dept/show.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3217b8f70007', '402881f73eb1853c013eb1acb679000b', '2', '添加', 'affiche/dept/addPage.do,affiche/dept/add.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3218d4b90008', '402881f73eb1853c013eb1acb679000b', '3', '修改', 'affiche/dept/updatePage.do,affiche/dept/update.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f321918d40009', '402881f73eb1853c013eb1acb679000b', '4', '批量删除', 'affiche/dept/del.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f32549d7c0038', '402881f73ea22a57013ea2357c180015', '1', '通知详情', 'notice/show.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3255b1f0003a', '402881f73ea22a57013ea2357c180015', '2', '下载附件', 'notice/download.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3255fa36003b', '402881f73ea22a57013ea2357c180015', '3', '查阅情况', 'notice/cyqk.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3270ae8b003e', '402881e83eca193c013eca1ceb6a0002', '1', '未读查询', 'msgwarn/load/notread.do,msgwarn/show.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f32714796003f', '402881e83eca193c013eca1ceb6a0002', '2', '已读查询', 'msgwarn/load/isread.do,msgwarn/show.do');
INSERT INTO `sy_action` VALUES ('402880e63f320964013f3271b0b00040', '402881e83eca193c013eca1ceb6a0002', '3', '批量删除', 'msgwarn/del.do');
INSERT INTO `sy_action` VALUES ('402880e63f32b9f9013f32bbfb090002', '402881f73eb50cf5013eb5339e94001f', '1', '发送消息', 'instantMessage/addPage.do,instantMessage/add.do,instantMessage/queryUsers.do,instantMessage/selectHistoryMessage.do');
INSERT INTO `sy_action` VALUES ('402880e63f32b9f9013f32becabe0003', '402881f73eb50cf5013eb5339e94001f', '2', '已收消息', 'instantMessage/selectReceiveMessage.do,instantMessage/show.do');
INSERT INTO `sy_action` VALUES ('402880e63f32b9f9013f32bf3ae90004', '402881f73eb50cf5013eb5339e94001f', '3', '已发消息', 'instantMessage/selectSendMessage.do,instantMessage/show.do');
INSERT INTO `sy_action` VALUES ('402880e63f32b9f9013f32d8c3080010', '402881f73eb50cf5013eb5339e94001f', '4', '批量删除', 'instantMessage/del.do');
INSERT INTO `sy_action` VALUES ('402880e63f388a66013f388c67350005', '402880e63f384d56013f384e413a0002', '1', '修改密码', 'user/updateMyPw.do');
INSERT INTO `sy_action` VALUES ('402880e73f435b0d013f4361592d001b', '402881eb3ee3fba3013ee3fd8d660008', '1', '保存草稿', 'email/save.do,email/edit.do,email/updateDraft.do');
INSERT INTO `sy_action` VALUES ('402881e53f091a2e013f0936f5140002', '402881ea3f227e74013f2280351f0002', '1', '访问系统', 'main.do,dept/load/all.do');
INSERT INTO `sy_action` VALUES ('402881e53f091a2e013f093768710003', '402881ea3f227e74013f2280351f0002', '2', '查询在线人员', 'main/online.do');
INSERT INTO `sy_action` VALUES ('402881e53f091a2e013f093847180004', '402881ea3f227e74013f2280351f0002', '3', 'ajax定时刷新未读信息', 'main/warnmsg.do');
INSERT INTO `sy_action` VALUES ('402881e53f091a2e013f093a96680005', '402881ea3f227e74013f2280351f0002', '4', '查询出今日日程安排，用于js提醒', 'schedule/queryWarn.do');
INSERT INTO `sy_action` VALUES ('402881e53f091a2e013f093c5d050006', '402881ea3f227e74013f2280351f0002', '5', '用户查找带回', 'user/lookUpPage.do,user/lookUp.do');
INSERT INTO `sy_action` VALUES ('402881e53f091a2e013f093d70d70007', '402881ea3f227e74013f2280351f0002', '6', '部门查找带回', 'dept/lookUpPage.do,dept/lookUp.do');
INSERT INTO `sy_action` VALUES ('402881e53f091a2e013f093f0a120008', '402881ea3f227e74013f2280351f0002', '7', '角色查找带回', 'user/lookUpPage.do');
INSERT INTO `sy_action` VALUES ('402881e63f404f96013f40c3868a0004', '402881f73eb1853c013eb1ad4a7c000d', '1', '查询', 'news/look.do,news/answer.do,news/answernewscomment.do');
INSERT INTO `sy_action` VALUES ('402881e63f404f96013f40cb352d0005', '402881f73eb1853c013eb1ad4a7c000d', '2', '添加', 'news/addPage.do,news/add.do');
INSERT INTO `sy_action` VALUES ('402881e63f404f96013f40cb895d0006', '402881f73eb1853c013eb1ad4a7c000d', '3', '修改', 'news/updatePage.do,news/update.do');
INSERT INTO `sy_action` VALUES ('402881e63f404f96013f40cbcd880007', '402881f73eb1853c013eb1ad4a7c000d', '4', '批量删除', 'news/delete.do');
INSERT INTO `sy_action` VALUES ('402881e63f404f96013f40cc26350008', '402881f73eb1853c013eb1ad4a7c000d', '5', '终止', 'news/stop.do');
INSERT INTO `sy_action` VALUES ('402881e63f404f96013f40cc53c20009', '402881f73eb1853c013eb1ad4a7c000d', '6', '生成', 'news/generate.do');
INSERT INTO `sy_action` VALUES ('402881e63f404f96013f40cd435a000a', '402881f73eb1853c013eb1ad4a7c000d', '7', '管理评论', 'news/managementcontent.do,news/deletecontent.do,news/answer.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f418fe4f30010', '402881f73eb50cf5013eb510db780004', '1', '查询', 'personal/queryGroup.do,personal/find.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f419029100011', '402881f73eb50cf5013eb510db780004', '2', '添加', 'personal/addPage.do,personal/add.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f41908a590012', '402881f73eb50cf5013eb510db780004', '3', '修改', 'personal/updatePage.do,personal/update.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f4190cc280013', '402881f73eb50cf5013eb510db780004', '4', '批量删除', 'personal/del.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f41916b0b0014', '402881f73eb50cf5013eb510db780004', '5', '分组管理__查询', 'group/load.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f4191e6970015', '402881f73eb50cf5013eb510db780004', '6', '分组管理__添加', 'group/addPage.do,group/add.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f4192390b0016', '402881f73eb50cf5013eb510db780004', '7', '分组管理__修改', 'group/updatePage.do,group/update.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f41929c920017', '402881f73eb50cf5013eb510db780004', '8', '分组管理__批量删除', 'group/del.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f4192fcbf0018', '402881f73eb50cf5013eb511679b0006', '1', '查询', 'public/queryGroup.do,public/find.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f419341110019', '402881f73eb50cf5013eb511679b0006', '2', '添加', 'public/addPage.do,public/add.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f4193890b001a', '402881f73eb50cf5013eb511679b0006', '3', '修改', 'public/updatePage.do,public/update.do');
INSERT INTO `sy_action` VALUES ('402881e63f41490b013f4193bcf9001b', '402881f73eb50cf5013eb511679b0006', '4', '批量删除', 'public/del.do');
INSERT INTO `sy_action` VALUES ('402881e63f421408013f421d8cac0017', '402881eb3ee3fba3013ee3fcd72d0002', '1', '发送_回复_转发', 'email/add.do,email/forwardIn.do,email/addPageIn.do,email/forwardOut.do,email/addDraft.do,email/addIn.do');
INSERT INTO `sy_action` VALUES ('402881e63f421408013f421eff180018', '402881eb3ee3fba3013ee3fd05e50004', '1', '查询', 'email/findIn.do,email/download.do');
INSERT INTO `sy_action` VALUES ('402881e63f421408013f421fef33001a', '402881eb3ee3fba3013ee3fd05e50004', '2', '批量删除', 'email/delIn.do');
INSERT INTO `sy_action` VALUES ('402881e63f421408013f4220dd9d001c', '402881eb3ee3fba3013ee3fd53d00006', '1', '查询', 'email/findOut.do');
INSERT INTO `sy_action` VALUES ('402881e63f421408013f422108d4001d', '402881eb3ee3fba3013ee3fd53d00006', '2', '批量删除', 'email/delOut.do');
INSERT INTO `sy_action` VALUES ('402881e63f421408013f4221da1b001f', '402881eb3ee3fba3013ee3fd8d660008', '2', '批量删除', 'email/deldraft.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1cac7e013f1cb9ff4e0008', '402881f73e3fbaee013e3ff8caf90014', '1', '查询', 'list/load.do,list/query.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1cac7e013f1cc456b20009', '402881f73e3fbaee013e3fe8dae50002', '1', '查询', 'dept/load.do,dept/updatePage.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dba2656000a', '402881f73e3fbaee013e3fe9a8e30004', '1', '查询', 'user/load.do,user/queryUsers.do,user/show.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dc37c8f000e', '402881f73e3fbaee013e3fe9a8e30004', '7', '查看角色', 'user/updateRolePage.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dc57ece000f', '402881f73e3fbaee013e3fe9a8e30004', '6', '重置密码', 'user/updatePwPage.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dcb86d10018', '402881f73e3fbaee013e3fedf99f0008', '2', '添加', 'role/addPage.do,role/add.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dcbc8080019', '402881f73e3fbaee013e3fedf99f0008', '3', '修改', 'role/updatePage.do,role/update.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dcc3084001a', '402881f73e3fbaee013e3fedf99f0008', '4', '删除', 'role/del.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dcccff3001b', '402881f73e3fbaee013e3fedf99f0008', '5', '查看权限', 'role/power/updatePage.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dceb70f001c', '402881f73e3fbaee013e3fedf99f0008', '9', '分配用户', 'role/queryUsers.do,role/role/queryUsers.do,role/roleAddUsers.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dd2fc59001d', '402881f73e3fbaee013e3fedf99f0008', '7', '查看用户', 'role/queryRoleUsers.do,role/queryRoleUsers.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dd692c1001e', '402881f73e3fbaee013e3fedf99f0008', '1', '查询', 'role/load.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1dde719d002a', '402881f73e3fbaee013e3ff73351000e', '1', '查询', 'log/login.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1db56c013f1de053e10031', '402881f73e3fbaee013e3ff7c58f0010', '1', '查询', 'log/action.do');
INSERT INTO `sy_action` VALUES ('402881ea3f1de78f013f1dea9f130003', '402881f73e3fbaee013e3ff93b470016', '1', '菜单查询', 'menu/load.do,menu/updatePage.do,menu/lookUpPage.do,menu/icons.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22b327013f22b723c70006', '402881f73e3fbaee013e3ffde7fe0026', '1', '查询', 'companyFiles/show.do,companyFiles/tree/load.do,companyFiles/tree/query.do,companyFiles/tree/allNode.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22b327013f22b8800f0007', '402881f73e3fbaee013e3ffde7fe0026', '3', '创建文件', 'companyFiles/addFilePage.do,companyFiles/addFile.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22b327013f22b9bc600008', '402881f73e3fbaee013e3ffde7fe0026', '6', '删除文件夹', 'companyFiles/delNode.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22d5fa013f22ea3048000c', '402881f73e3fbaee013e3ffd3d470024', '1', '查询', 'shareFiles/show.do,shareFiles/tree/load.do,shareFiles/tree/query.do,shareFiles/tree/allNode.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22d5fa013f22eb6c13000d', '402881f73e3fbaee013e3ffd3d470024', '3', '创建文件', 'shareFiles/addFilePage.do,shareFiles/addFile.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22d5fa013f22ed8c3d000e', '402881f73e3fbaee013e3ffd3d470024', '6', '删除文件夹', 'shareFiles/delNode.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22d5fa013f230e4178001a', '402881f73e3fbaee013e3ffc8ec70020', '1', '查询', 'personalFiles/show.do,personalFiles/tree/load.do,personalFiles/tree/query.do,personalFiles/tree/allNode.do');
INSERT INTO `sy_action` VALUES ('402881ea3f22d5fa013f230f0239001b', '402881f73e3fbaee013e3ffc8ec70020', '3', '创建文件', 'personalFiles/addFile.do,personalFiles/addFilePage.do,');
INSERT INTO `sy_action` VALUES ('402881ea3f22d5fa013f230fb564001c', '402881f73e3fbaee013e3ffc8ec70020', '6', '删除文件夹', 'personalFiles/delNode.do');
INSERT INTO `sy_action` VALUES ('402881ea3f27d27d013f27d3cb140002', '402881f73e3fbaee013e3ffede450028', '1', '查询', 'notice/show.do');
INSERT INTO `sy_action` VALUES ('402881ea3f27d27d013f27e74ff70003', '402881f73e3fbaee013e3ffede450028', '2', '添加', 'notice/addPage.do,notice/add.do');
INSERT INTO `sy_action` VALUES ('402881ea3f27d27d013f27e8bdde0004', '402881f73e3fbaee013e3ffede450028', '3', '修改', 'notice/updatePage.do,notice/update.do');
INSERT INTO `sy_action` VALUES ('402881ea3f27d27d013f27e93b0f0005', '402881f73e3fbaee013e3ffede450028', '4', '批量删除', 'notice/del.do');
INSERT INTO `sy_action` VALUES ('402881ea3f27d27d013f27ea0f500007', '402881f73e3fbaee013e3ffede450028', '5', '下载附件', 'notice/download.do');
INSERT INTO `sy_action` VALUES ('402881ea3f27d27d013f27eaffcf0008', '402881f73e3fbaee013e3ffede450028', '6', '查阅情况', 'notice/cyqk.do');
INSERT INTO `sy_action` VALUES ('402881ea3f5b1d14013f5b21e9ad0009', '402881e63f502ae1013f502d7dff0002', '1', '查询', 'tableCustom/dev/query.do');
INSERT INTO `sy_action` VALUES ('402881ea3f5b1d14013f5b225989000a', '402881e63f502ae1013f502d7dff0002', '2', '添加', 'tableCustom/dev/addPage.do,tableCustom/dev/add.do');
INSERT INTO `sy_action` VALUES ('402881ea3f5b1d14013f5b22ac5a000b', '402881e63f502ae1013f502d7dff0002', '3', '修改', 'tableCustom/dev/updatePage.do,tableCustom/dev/update.do');
INSERT INTO `sy_action` VALUES ('402881ea3f5b1d14013f5b22f772000c', '402881e63f502ae1013f502d7dff0002', '4', '批量删除', 'tableCustom/dev/del.do');
INSERT INTO `sy_action` VALUES ('402881ec3f74e4bc013f751014dd000e', '402881ea3f227e74013f2280351f0002', '8', '地区查找带回', 'district/lookUpPage.do');
INSERT INTO `sy_action` VALUES ('402881ec3f7f9910013f7fa190720005', '402881f73e3fbaee013e3fe9a8e30004', '8', '分配角色', 'user/updateRole.do');
INSERT INTO `sy_action` VALUES ('402881ec3f7f9910013f7fa8e6920006', '402881f73e3fbaee013e3fedf99f0008', '6', '修改权限', 'role/power/update.do');
INSERT INTO `sy_action` VALUES ('402881ec3f7f9910013f7facf2410008', '402881f73e3fbaee013e3fedf99f0008', '8', '批量移除用户', 'role/delRoleUsers.do');
INSERT INTO `sy_action` VALUES ('402881ec3f8e0bc2013f8e1191a00002', '402881ec3f7960cb013f796260390002', '1', '查看设置', 'systemSet/updatePage.do');
INSERT INTO `sy_action` VALUES ('402881ec3f8e0bc2013f8e11cffe0003', '402881ec3f7960cb013f796260390002', '2', '修改设置', 'systemSet/update.do');
INSERT INTO `sy_action` VALUES ('402881f73e4951dc013e497b27810005', '402881f73e3fbaee013e3ff8caf90014', '2', '添加', 'list/addPage.do,list/add.do');
INSERT INTO `sy_action` VALUES ('402881f73e4951dc013e497e6fc60006', '402881f73e3fbaee013e3ff8caf90014', '3', '修改', 'list/updatePage.do,list/update.do');
INSERT INTO `sy_action` VALUES ('402881f73e4951dc013e498b3d9b0007', '402881f73e3fbaee013e3ff8caf90014', '4', '批量删除', 'list/del.do');
INSERT INTO `sy_action` VALUES ('402881f73e4a2cc5013e4a46ae1b0002', '402881f73e3fbaee013e3ffc8ec70020', '2', '创建文件夹', 'personalFiles/addNodePage.do,personalFiles/addNode.do');
INSERT INTO `sy_action` VALUES ('402881f73e4a2cc5013e4a47a1350003', '402881f73e3fbaee013e3ffc8ec70020', '4', '修改', 'personalFiles/updatePage.do,personalFiles/update.do');
INSERT INTO `sy_action` VALUES ('402881f73e4a2cc5013e4a483b520004', '402881f73e3fbaee013e3ffc8ec70020', '5', '批量删除文件', 'personalFiles/delFile.do');
INSERT INTO `sy_action` VALUES ('402881f73e4a2cc5013e4a4ac71e0006', '402881f73e3fbaee013e3ffc8ec70020', '7', '下载文件', 'personalFiles/download.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e8fb130001c', '402881f73e3fbaee013e3ffd3d470024', '2', '创建文件夹', 'shareFiles/addNodePage.do,shareFiles/addNode.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9139c4001d', '402881f73e3fbaee013e3ffd3d470024', '4', '修改', 'shareFiles/updatePage.do,shareFiles/update.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e917d55001e', '402881f73e3fbaee013e3ffd3d470024', '5', '批量删除文件', 'shareFiles/delFile.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9360da0020', '402881f73e3fbaee013e3ffd3d470024', '7', '下载文件', 'shareFiles/download.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e94524f0021', '402881f73e3fbaee013e3ffde7fe0026', '2', '创建文件夹', 'companyFiles/addNodePage.do,companyFiles/addNode.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9492f10022', '402881f73e3fbaee013e3ffde7fe0026', '4', '修改', 'companyFiles/updatePage.do,companyFiles/update.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e94f4e80023', '402881f73e3fbaee013e3ffde7fe0026', '5', '批量删除文件', 'companyFiles/delFile.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9591a50025', '402881f73e3fbaee013e3ffde7fe0026', '7', '下载文件', 'companyFiles/download.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e96fbf30026', '402881f73e3fbaee013e3fe8dae50002', '2', '添加', 'dept/addPage.do,dept/add.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e98aadb0028', '402881f73e3fbaee013e3fe8dae50002', '3', '修改', 'dept/update.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9a27790029', '402881f73e3fbaee013e3fe8dae50002', '4', '删除', 'dept/del.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9d5f05002a', '402881f73e3fbaee013e3fe9a8e30004', '2', '添加', 'user/addPage.do,user/add.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9dced6002b', '402881f73e3fbaee013e3fe9a8e30004', '3', '修改', 'user/updatePage.do,user/update.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4e9f6e4d002c', '402881f73e3fbaee013e3fe9a8e30004', '4', '批量删除', 'user/del.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4ea2229f002f', '402881f73e3fbaee013e3ff73351000e', '2', '批量删除', 'log/login/del.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4ea265560030', '402881f73e3fbaee013e3ff7c58f0010', '2', '批量删除', 'log/action/del.do');
INSERT INTO `sy_action` VALUES ('402881f73e4e11dd013e4ea662160033', '402881f73e3fbaee013e3ff93b470016', '3', '修改菜单', 'menu/update.do,menu/icons.do,menu/lookUpPage.do');

-- ----------------------------
-- Table structure for sy_dept
-- ----------------------------
DROP TABLE IF EXISTS `sy_dept`;
CREATE TABLE `sy_dept` (
  `id` varchar(50) NOT NULL,
  `dept_sort` smallint(6) NOT NULL COMMENT '部门排序号,范围1-999',
  `dept_name` varchar(50) NOT NULL COMMENT '部门名称',
  `dept_phone` varchar(20) DEFAULT '' COMMENT '部门电话',
  `dept_fax` varchar(20) DEFAULT '' COMMENT '部门传真',
  `dept_address` varchar(100) DEFAULT '' COMMENT '部门地址',
  `super_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '上级部门id,若无上级，则为0',
  `lead_uid` char(32) DEFAULT '0' COMMENT '部门主管，0为无主管',
  `dept_desc` varchar(200) DEFAULT '' COMMENT '部门表述',
  PRIMARY KEY (`id`),
  KEY `super_id` (`super_id`),
  KEY `dept_sort` (`dept_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sy_dept
-- ----------------------------
INSERT INTO `sy_dept` VALUES ('D663C662-38E9-4078-B44C-0D081F469172', '1', '舜华社区', '', '', '', 'D663C662-38E9-4078-B44C-0D081F469177', '', '');
INSERT INTO `sy_dept` VALUES ('D663C662-38E9-4078-B44C-0D081F469173', '2', '舜德社区', '', '', '', 'D663C662-38E9-4078-B44C-0D081F469177', '', '');
INSERT INTO `sy_dept` VALUES ('D663C662-38E9-4078-B44C-0D081F469174', '5', '舜世社区', '', '', '', 'D663C662-38E9-4078-B44C-0D081F469177', '', '');
INSERT INTO `sy_dept` VALUES ('D663C662-38E9-4078-B44C-0D081F469175', '4', '舜雅社区', '', '', '', 'D663C662-38E9-4078-B44C-0D081F469177', '', '');
INSERT INTO `sy_dept` VALUES ('D663C662-38E9-4078-B44C-0D081F469176', '3', '舜和社区', '', '', '', 'D663C662-38E9-4078-B44C-0D081F469177', '', '');
INSERT INTO `sy_dept` VALUES ('D663C662-38E9-4078-B44C-0D081F469177', '1', '舜耕社区', '', '', '', '0', '', '舜耕社区');

-- ----------------------------
-- Table structure for sy_district
-- ----------------------------
DROP TABLE IF EXISTS `sy_district`;
CREATE TABLE `sy_district` (
  `id` char(32) NOT NULL,
  `super_id` char(32) DEFAULT NULL COMMENT '上级id,0代表顶级',
  `dis_sort` smallint(6) NOT NULL COMMENT '排序号,用一级下数值越小越靠前',
  `dis_name` varchar(50) NOT NULL COMMENT '名称',
  `dis_desc` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `dis_sort` (`dis_sort`),
  KEY `dis_name` (`dis_name`),
  KEY `sy_district_ibfk_1` (`super_id`),
  CONSTRAINT `sy_district_ibfk_1` FOREIGN KEY (`super_id`) REFERENCES `sy_district` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区划分表,用于省市县的选择';

-- ----------------------------
-- Records of sy_district
-- ----------------------------
INSERT INTO `sy_district` VALUES ('0', null, '1', '地区管理', '顶级节点');
INSERT INTO `sy_district` VALUES ('402881ea3f5b1d14013f5b1fdc080006', '0', '1', '中国', '中华人民共和国');
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e3d0f38', '402881ea3f5b1d14013f5b1fdc080006', '25', '北京市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f39', '402881ec3f74d2d5013f74dc2e3d0f38', '25', '东城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f3a', '402881ec3f74d2d5013f74dc2e3d0f38', '30', '西城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f3b', '402881ec3f74d2d5013f74dc2e3d0f38', '35', '崇文区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f3c', '402881ec3f74d2d5013f74dc2e3d0f38', '40', '宣武区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f3d', '402881ec3f74d2d5013f74dc2e3d0f38', '45', '朝阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f3e', '402881ec3f74d2d5013f74dc2e3d0f38', '50', '丰台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f3f', '402881ec3f74d2d5013f74dc2e3d0f38', '55', '石景山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f40', '402881ec3f74d2d5013f74dc2e3d0f38', '60', '海淀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f41', '402881ec3f74d2d5013f74dc2e3d0f38', '65', '门头沟区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f42', '402881ec3f74d2d5013f74dc2e3d0f38', '70', '房山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f43', '402881ec3f74d2d5013f74dc2e3d0f38', '75', '通州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f44', '402881ec3f74d2d5013f74dc2e3d0f38', '80', '顺义区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f45', '402881ec3f74d2d5013f74dc2e3d0f38', '85', '昌平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f46', '402881ec3f74d2d5013f74dc2e3d0f38', '90', '大兴区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f47', '402881ec3f74d2d5013f74dc2e3d0f38', '95', '怀柔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e4d0f48', '402881ec3f74d2d5013f74dc2e3d0f38', '100', '平谷区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f49', '402881ec3f74d2d5013f74dc2e3d0f38', '25', '密云县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f4a', '402881ec3f74d2d5013f74dc2e3d0f38', '30', '延庆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f4b', '402881ea3f5b1d14013f5b1fdc080006', '30', '天津市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f4c', '402881ec3f74d2d5013f74dc2e5d0f4b', '25', '和平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f4d', '402881ec3f74d2d5013f74dc2e5d0f4b', '30', '河东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f4e', '402881ec3f74d2d5013f74dc2e5d0f4b', '35', '河西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f4f', '402881ec3f74d2d5013f74dc2e5d0f4b', '40', '南开区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f50', '402881ec3f74d2d5013f74dc2e5d0f4b', '45', '河北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f51', '402881ec3f74d2d5013f74dc2e5d0f4b', '50', '红桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f52', '402881ec3f74d2d5013f74dc2e5d0f4b', '55', '塘沽区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f53', '402881ec3f74d2d5013f74dc2e5d0f4b', '60', '汉沽区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f54', '402881ec3f74d2d5013f74dc2e5d0f4b', '65', '大港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f55', '402881ec3f74d2d5013f74dc2e5d0f4b', '70', '东丽区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f56', '402881ec3f74d2d5013f74dc2e5d0f4b', '75', '西青区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f57', '402881ec3f74d2d5013f74dc2e5d0f4b', '80', '津南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f58', '402881ec3f74d2d5013f74dc2e5d0f4b', '85', '北辰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f59', '402881ec3f74d2d5013f74dc2e5d0f4b', '90', '武清区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f5a', '402881ec3f74d2d5013f74dc2e5d0f4b', '95', '宝坻区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f5b', '402881ec3f74d2d5013f74dc2e5d0f4b', '25', '宁河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f5c', '402881ec3f74d2d5013f74dc2e5d0f4b', '30', '静海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f5d', '402881ec3f74d2d5013f74dc2e5d0f4b', '35', '蓟　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e5d0f5e', '402881ea3f5b1d14013f5b1fdc080006', '35', '河北省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f5f', '402881ec3f74d2d5013f74dc2e5d0f5e', '25', '石家庄市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f61', '402881ec3f74d2d5013f74dc2e6d0f5f', '30', '长安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f62', '402881ec3f74d2d5013f74dc2e6d0f5f', '35', '桥东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f63', '402881ec3f74d2d5013f74dc2e6d0f5f', '40', '桥西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f64', '402881ec3f74d2d5013f74dc2e6d0f5f', '45', '新华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f65', '402881ec3f74d2d5013f74dc2e6d0f5f', '50', '井陉矿区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f66', '402881ec3f74d2d5013f74dc2e6d0f5f', '55', '裕华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f67', '402881ec3f74d2d5013f74dc2e6d0f5f', '60', '井陉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f68', '402881ec3f74d2d5013f74dc2e6d0f5f', '65', '正定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f69', '402881ec3f74d2d5013f74dc2e6d0f5f', '70', '栾城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f6a', '402881ec3f74d2d5013f74dc2e6d0f5f', '75', '行唐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f6b', '402881ec3f74d2d5013f74dc2e6d0f5f', '80', '灵寿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f6c', '402881ec3f74d2d5013f74dc2e6d0f5f', '85', '高邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f6d', '402881ec3f74d2d5013f74dc2e6d0f5f', '90', '深泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f6e', '402881ec3f74d2d5013f74dc2e6d0f5f', '95', '赞皇县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f6f', '402881ec3f74d2d5013f74dc2e6d0f5f', '100', '无极县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f70', '402881ec3f74d2d5013f74dc2e6d0f5f', '105', '平山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f71', '402881ec3f74d2d5013f74dc2e6d0f5f', '110', '元氏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f72', '402881ec3f74d2d5013f74dc2e6d0f5f', '115', '赵　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f73', '402881ec3f74d2d5013f74dc2e6d0f5f', '120', '辛集市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f74', '402881ec3f74d2d5013f74dc2e6d0f5f', '125', '藁城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f75', '402881ec3f74d2d5013f74dc2e6d0f5f', '130', '晋州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f76', '402881ec3f74d2d5013f74dc2e6d0f5f', '135', '新乐市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f77', '402881ec3f74d2d5013f74dc2e6d0f5f', '140', '鹿泉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e6d0f78', '402881ec3f74d2d5013f74dc2e5d0f5e', '30', '唐山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f7a', '402881ec3f74d2d5013f74dc2e6d0f78', '30', '路南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f7b', '402881ec3f74d2d5013f74dc2e6d0f78', '35', '路北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f7c', '402881ec3f74d2d5013f74dc2e6d0f78', '40', '古冶区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f7d', '402881ec3f74d2d5013f74dc2e6d0f78', '45', '开平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f7e', '402881ec3f74d2d5013f74dc2e6d0f78', '50', '丰南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f7f', '402881ec3f74d2d5013f74dc2e6d0f78', '55', '丰润区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f80', '402881ec3f74d2d5013f74dc2e6d0f78', '60', '滦　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f81', '402881ec3f74d2d5013f74dc2e6d0f78', '65', '滦南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f82', '402881ec3f74d2d5013f74dc2e6d0f78', '70', '乐亭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f83', '402881ec3f74d2d5013f74dc2e6d0f78', '75', '迁西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f84', '402881ec3f74d2d5013f74dc2e6d0f78', '80', '玉田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f85', '402881ec3f74d2d5013f74dc2e6d0f78', '85', '唐海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f86', '402881ec3f74d2d5013f74dc2e6d0f78', '90', '遵化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f87', '402881ec3f74d2d5013f74dc2e6d0f78', '95', '迁安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f88', '402881ec3f74d2d5013f74dc2e5d0f5e', '35', '秦皇岛市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f8a', '402881ec3f74d2d5013f74dc2e7c0f88', '30', '海港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f8b', '402881ec3f74d2d5013f74dc2e7c0f88', '35', '山海关区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f8c', '402881ec3f74d2d5013f74dc2e7c0f88', '40', '北戴河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f8d', '402881ec3f74d2d5013f74dc2e7c0f88', '45', '青龙满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f8e', '402881ec3f74d2d5013f74dc2e7c0f88', '50', '昌黎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f8f', '402881ec3f74d2d5013f74dc2e7c0f88', '55', '抚宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f90', '402881ec3f74d2d5013f74dc2e7c0f88', '60', '卢龙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e7c0f91', '402881ec3f74d2d5013f74dc2e5d0f5e', '40', '邯郸市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f93', '402881ec3f74d2d5013f74dc2e7c0f91', '30', '邯山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f94', '402881ec3f74d2d5013f74dc2e7c0f91', '35', '丛台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f95', '402881ec3f74d2d5013f74dc2e7c0f91', '40', '复兴区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f96', '402881ec3f74d2d5013f74dc2e7c0f91', '45', '峰峰矿区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f97', '402881ec3f74d2d5013f74dc2e7c0f91', '50', '邯郸县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f98', '402881ec3f74d2d5013f74dc2e7c0f91', '55', '临漳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f99', '402881ec3f74d2d5013f74dc2e7c0f91', '60', '成安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f9a', '402881ec3f74d2d5013f74dc2e7c0f91', '65', '大名县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f9b', '402881ec3f74d2d5013f74dc2e7c0f91', '70', '涉　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f9c', '402881ec3f74d2d5013f74dc2e7c0f91', '75', '磁　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f9d', '402881ec3f74d2d5013f74dc2e7c0f91', '80', '肥乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f9e', '402881ec3f74d2d5013f74dc2e7c0f91', '85', '永年县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0f9f', '402881ec3f74d2d5013f74dc2e7c0f91', '90', '邱　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0fa0', '402881ec3f74d2d5013f74dc2e7c0f91', '95', '鸡泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0fa1', '402881ec3f74d2d5013f74dc2e7c0f91', '100', '广平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0fa2', '402881ec3f74d2d5013f74dc2e7c0f91', '105', '馆陶县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0fa3', '402881ec3f74d2d5013f74dc2e7c0f91', '110', '魏　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0fa4', '402881ec3f74d2d5013f74dc2e7c0f91', '115', '曲周县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0fa5', '402881ec3f74d2d5013f74dc2e7c0f91', '120', '武安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e8c0fa6', '402881ec3f74d2d5013f74dc2e5d0f5e', '45', '邢台市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fa8', '402881ec3f74d2d5013f74dc2e8c0fa6', '30', '桥东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fa9', '402881ec3f74d2d5013f74dc2e8c0fa6', '35', '桥西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0faa', '402881ec3f74d2d5013f74dc2e8c0fa6', '40', '邢台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fab', '402881ec3f74d2d5013f74dc2e8c0fa6', '45', '临城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fac', '402881ec3f74d2d5013f74dc2e8c0fa6', '50', '内丘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fad', '402881ec3f74d2d5013f74dc2e8c0fa6', '55', '柏乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fae', '402881ec3f74d2d5013f74dc2e8c0fa6', '60', '隆尧县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0faf', '402881ec3f74d2d5013f74dc2e8c0fa6', '65', '任　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb0', '402881ec3f74d2d5013f74dc2e8c0fa6', '70', '南和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb1', '402881ec3f74d2d5013f74dc2e8c0fa6', '75', '宁晋县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb2', '402881ec3f74d2d5013f74dc2e8c0fa6', '80', '巨鹿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb3', '402881ec3f74d2d5013f74dc2e8c0fa6', '85', '新河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb4', '402881ec3f74d2d5013f74dc2e8c0fa6', '90', '广宗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb5', '402881ec3f74d2d5013f74dc2e8c0fa6', '95', '平乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb6', '402881ec3f74d2d5013f74dc2e8c0fa6', '100', '威　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb7', '402881ec3f74d2d5013f74dc2e8c0fa6', '105', '清河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb8', '402881ec3f74d2d5013f74dc2e8c0fa6', '110', '临西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fb9', '402881ec3f74d2d5013f74dc2e8c0fa6', '115', '南宫市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fba', '402881ec3f74d2d5013f74dc2e8c0fa6', '120', '沙河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fbb', '402881ec3f74d2d5013f74dc2e5d0f5e', '50', '保定市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fbd', '402881ec3f74d2d5013f74dc2e9c0fbb', '30', '新市区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fbe', '402881ec3f74d2d5013f74dc2e9c0fbb', '35', '北市区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fbf', '402881ec3f74d2d5013f74dc2e9c0fbb', '40', '南市区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc0', '402881ec3f74d2d5013f74dc2e9c0fbb', '45', '满城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc1', '402881ec3f74d2d5013f74dc2e9c0fbb', '50', '清苑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc2', '402881ec3f74d2d5013f74dc2e9c0fbb', '55', '涞水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc3', '402881ec3f74d2d5013f74dc2e9c0fbb', '60', '阜平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc4', '402881ec3f74d2d5013f74dc2e9c0fbb', '65', '徐水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc5', '402881ec3f74d2d5013f74dc2e9c0fbb', '70', '定兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc6', '402881ec3f74d2d5013f74dc2e9c0fbb', '75', '唐　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc7', '402881ec3f74d2d5013f74dc2e9c0fbb', '80', '高阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc8', '402881ec3f74d2d5013f74dc2e9c0fbb', '85', '容城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fc9', '402881ec3f74d2d5013f74dc2e9c0fbb', '90', '涞源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fca', '402881ec3f74d2d5013f74dc2e9c0fbb', '95', '望都县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fcb', '402881ec3f74d2d5013f74dc2e9c0fbb', '100', '安新县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fcc', '402881ec3f74d2d5013f74dc2e9c0fbb', '105', '易　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fcd', '402881ec3f74d2d5013f74dc2e9c0fbb', '110', '曲阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fce', '402881ec3f74d2d5013f74dc2e9c0fbb', '115', '蠡　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fcf', '402881ec3f74d2d5013f74dc2e9c0fbb', '120', '顺平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fd0', '402881ec3f74d2d5013f74dc2e9c0fbb', '125', '博野县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fd1', '402881ec3f74d2d5013f74dc2e9c0fbb', '130', '雄　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fd2', '402881ec3f74d2d5013f74dc2e9c0fbb', '135', '涿州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fd3', '402881ec3f74d2d5013f74dc2e9c0fbb', '140', '定州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fd4', '402881ec3f74d2d5013f74dc2e9c0fbb', '145', '安国市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fd5', '402881ec3f74d2d5013f74dc2e9c0fbb', '150', '高碑店市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2e9c0fd6', '402881ec3f74d2d5013f74dc2e5d0f5e', '55', '张家口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fd8', '402881ec3f74d2d5013f74dc2e9c0fd6', '30', '桥东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fd9', '402881ec3f74d2d5013f74dc2e9c0fd6', '35', '桥西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fda', '402881ec3f74d2d5013f74dc2e9c0fd6', '40', '宣化区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fdb', '402881ec3f74d2d5013f74dc2e9c0fd6', '45', '下花园区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fdc', '402881ec3f74d2d5013f74dc2e9c0fd6', '50', '宣化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fdd', '402881ec3f74d2d5013f74dc2e9c0fd6', '55', '张北县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fde', '402881ec3f74d2d5013f74dc2e9c0fd6', '60', '康保县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fdf', '402881ec3f74d2d5013f74dc2e9c0fd6', '65', '沽源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe0', '402881ec3f74d2d5013f74dc2e9c0fd6', '70', '尚义县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe1', '402881ec3f74d2d5013f74dc2e9c0fd6', '75', '蔚　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe2', '402881ec3f74d2d5013f74dc2e9c0fd6', '80', '阳原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe3', '402881ec3f74d2d5013f74dc2e9c0fd6', '85', '怀安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe4', '402881ec3f74d2d5013f74dc2e9c0fd6', '90', '万全县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe5', '402881ec3f74d2d5013f74dc2e9c0fd6', '95', '怀来县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe6', '402881ec3f74d2d5013f74dc2e9c0fd6', '100', '涿鹿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe7', '402881ec3f74d2d5013f74dc2e9c0fd6', '105', '赤城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe8', '402881ec3f74d2d5013f74dc2e9c0fd6', '110', '崇礼县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fe9', '402881ec3f74d2d5013f74dc2e5d0f5e', '60', '承德市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0feb', '402881ec3f74d2d5013f74dc2eab0fe9', '30', '双桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fec', '402881ec3f74d2d5013f74dc2eab0fe9', '35', '双滦区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fed', '402881ec3f74d2d5013f74dc2eab0fe9', '40', '鹰手营子矿区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fee', '402881ec3f74d2d5013f74dc2eab0fe9', '45', '承德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fef', '402881ec3f74d2d5013f74dc2eab0fe9', '50', '兴隆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff0', '402881ec3f74d2d5013f74dc2eab0fe9', '55', '平泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff1', '402881ec3f74d2d5013f74dc2eab0fe9', '60', '滦平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff2', '402881ec3f74d2d5013f74dc2eab0fe9', '65', '隆化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff3', '402881ec3f74d2d5013f74dc2eab0fe9', '70', '丰宁满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff4', '402881ec3f74d2d5013f74dc2eab0fe9', '75', '宽城满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff5', '402881ec3f74d2d5013f74dc2eab0fe9', '80', '围场满族蒙古族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff6', '402881ec3f74d2d5013f74dc2e5d0f5e', '65', '沧州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff8', '402881ec3f74d2d5013f74dc2eab0ff6', '30', '新华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ff9', '402881ec3f74d2d5013f74dc2eab0ff6', '35', '运河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ffa', '402881ec3f74d2d5013f74dc2eab0ff6', '40', '沧　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ffb', '402881ec3f74d2d5013f74dc2eab0ff6', '45', '青　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ffc', '402881ec3f74d2d5013f74dc2eab0ff6', '50', '东光县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ffd', '402881ec3f74d2d5013f74dc2eab0ff6', '55', '海兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0ffe', '402881ec3f74d2d5013f74dc2eab0ff6', '60', '盐山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab0fff', '402881ec3f74d2d5013f74dc2eab0ff6', '65', '肃宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab1000', '402881ec3f74d2d5013f74dc2eab0ff6', '70', '南皮县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab1001', '402881ec3f74d2d5013f74dc2eab0ff6', '75', '吴桥县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab1002', '402881ec3f74d2d5013f74dc2eab0ff6', '80', '献　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab1003', '402881ec3f74d2d5013f74dc2eab0ff6', '85', '孟村回族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab1004', '402881ec3f74d2d5013f74dc2eab0ff6', '90', '泊头市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab1005', '402881ec3f74d2d5013f74dc2eab0ff6', '95', '任丘市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eab1006', '402881ec3f74d2d5013f74dc2eab0ff6', '100', '黄骅市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1007', '402881ec3f74d2d5013f74dc2eab0ff6', '105', '河间市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1008', '402881ec3f74d2d5013f74dc2e5d0f5e', '70', '廊坊市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb100a', '402881ec3f74d2d5013f74dc2ebb1008', '30', '安次区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb100b', '402881ec3f74d2d5013f74dc2ebb1008', '35', '广阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb100c', '402881ec3f74d2d5013f74dc2ebb1008', '40', '固安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb100d', '402881ec3f74d2d5013f74dc2ebb1008', '45', '永清县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb100e', '402881ec3f74d2d5013f74dc2ebb1008', '50', '香河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb100f', '402881ec3f74d2d5013f74dc2ebb1008', '55', '大城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1010', '402881ec3f74d2d5013f74dc2ebb1008', '60', '文安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1011', '402881ec3f74d2d5013f74dc2ebb1008', '65', '大厂回族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1012', '402881ec3f74d2d5013f74dc2ebb1008', '70', '霸州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1013', '402881ec3f74d2d5013f74dc2ebb1008', '75', '三河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1014', '402881ec3f74d2d5013f74dc2e5d0f5e', '75', '衡水市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1016', '402881ec3f74d2d5013f74dc2ebb1014', '30', '桃城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1017', '402881ec3f74d2d5013f74dc2ebb1014', '35', '枣强县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1018', '402881ec3f74d2d5013f74dc2ebb1014', '40', '武邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1019', '402881ec3f74d2d5013f74dc2ebb1014', '45', '武强县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb101a', '402881ec3f74d2d5013f74dc2ebb1014', '50', '饶阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb101b', '402881ec3f74d2d5013f74dc2ebb1014', '55', '安平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb101c', '402881ec3f74d2d5013f74dc2ebb1014', '60', '故城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb101d', '402881ec3f74d2d5013f74dc2ebb1014', '65', '景　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb101e', '402881ec3f74d2d5013f74dc2ebb1014', '70', '阜城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb101f', '402881ec3f74d2d5013f74dc2ebb1014', '75', '冀州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1020', '402881ec3f74d2d5013f74dc2ebb1014', '80', '深州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ebb1021', '402881ea3f5b1d14013f5b1fdc080006', '40', '山西省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca1022', '402881ec3f74d2d5013f74dc2ebb1021', '25', '太原市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca1024', '402881ec3f74d2d5013f74dc2eca1022', '30', '小店区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca1025', '402881ec3f74d2d5013f74dc2eca1022', '35', '迎泽区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca1026', '402881ec3f74d2d5013f74dc2eca1022', '40', '杏花岭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca1027', '402881ec3f74d2d5013f74dc2eca1022', '45', '尖草坪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca1028', '402881ec3f74d2d5013f74dc2eca1022', '50', '万柏林区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca1029', '402881ec3f74d2d5013f74dc2eca1022', '55', '晋源区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca102a', '402881ec3f74d2d5013f74dc2eca1022', '60', '清徐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca102b', '402881ec3f74d2d5013f74dc2eca1022', '65', '阳曲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca102c', '402881ec3f74d2d5013f74dc2eca1022', '70', '娄烦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca102d', '402881ec3f74d2d5013f74dc2eca1022', '75', '古交市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eca102e', '402881ec3f74d2d5013f74dc2ebb1021', '30', '大同市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1030', '402881ec3f74d2d5013f74dc2eca102e', '30', '城　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1031', '402881ec3f74d2d5013f74dc2eca102e', '35', '矿　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1032', '402881ec3f74d2d5013f74dc2eca102e', '40', '南郊区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1033', '402881ec3f74d2d5013f74dc2eca102e', '45', '新荣区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1034', '402881ec3f74d2d5013f74dc2eca102e', '50', '阳高县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1035', '402881ec3f74d2d5013f74dc2eca102e', '55', '天镇县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1036', '402881ec3f74d2d5013f74dc2eca102e', '60', '广灵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1037', '402881ec3f74d2d5013f74dc2eca102e', '65', '灵丘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1038', '402881ec3f74d2d5013f74dc2eca102e', '70', '浑源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1039', '402881ec3f74d2d5013f74dc2eca102e', '75', '左云县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea103a', '402881ec3f74d2d5013f74dc2eca102e', '80', '大同县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea103b', '402881ec3f74d2d5013f74dc2ebb1021', '35', '阳泉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea103d', '402881ec3f74d2d5013f74dc2eea103b', '30', '城　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea103e', '402881ec3f74d2d5013f74dc2eea103b', '35', '矿　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea103f', '402881ec3f74d2d5013f74dc2eea103b', '40', '郊　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1040', '402881ec3f74d2d5013f74dc2eea103b', '45', '平定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1041', '402881ec3f74d2d5013f74dc2eea103b', '50', '盂　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1042', '402881ec3f74d2d5013f74dc2ebb1021', '40', '长治市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1044', '402881ec3f74d2d5013f74dc2eea1042', '30', '城　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1045', '402881ec3f74d2d5013f74dc2eea1042', '35', '郊　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1046', '402881ec3f74d2d5013f74dc2eea1042', '40', '长治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1047', '402881ec3f74d2d5013f74dc2eea1042', '45', '襄垣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1048', '402881ec3f74d2d5013f74dc2eea1042', '50', '屯留县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1049', '402881ec3f74d2d5013f74dc2eea1042', '55', '平顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea104a', '402881ec3f74d2d5013f74dc2eea1042', '60', '黎城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea104b', '402881ec3f74d2d5013f74dc2eea1042', '65', '壶关县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea104c', '402881ec3f74d2d5013f74dc2eea1042', '70', '长子县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea104d', '402881ec3f74d2d5013f74dc2eea1042', '75', '武乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea104e', '402881ec3f74d2d5013f74dc2eea1042', '80', '沁　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea104f', '402881ec3f74d2d5013f74dc2eea1042', '85', '沁源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1050', '402881ec3f74d2d5013f74dc2eea1042', '90', '潞城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2eea1051', '402881ec3f74d2d5013f74dc2ebb1021', '45', '晋城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ef91053', '402881ec3f74d2d5013f74dc2eea1051', '30', '城　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ef91054', '402881ec3f74d2d5013f74dc2eea1051', '35', '沁水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ef91055', '402881ec3f74d2d5013f74dc2eea1051', '40', '阳城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ef91056', '402881ec3f74d2d5013f74dc2eea1051', '45', '陵川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ef91057', '402881ec3f74d2d5013f74dc2eea1051', '50', '泽州县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ef91058', '402881ec3f74d2d5013f74dc2eea1051', '55', '高平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ef91059', '402881ec3f74d2d5013f74dc2ebb1021', '50', '朔州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09105b', '402881ec3f74d2d5013f74dc2ef91059', '30', '朔城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09105c', '402881ec3f74d2d5013f74dc2ef91059', '35', '平鲁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09105d', '402881ec3f74d2d5013f74dc2ef91059', '40', '山阴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09105e', '402881ec3f74d2d5013f74dc2ef91059', '45', '应　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09105f', '402881ec3f74d2d5013f74dc2ef91059', '50', '右玉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091060', '402881ec3f74d2d5013f74dc2ef91059', '55', '怀仁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091061', '402881ec3f74d2d5013f74dc2ebb1021', '55', '晋中市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091063', '402881ec3f74d2d5013f74dc2f091061', '30', '榆次区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091064', '402881ec3f74d2d5013f74dc2f091061', '35', '榆社县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091065', '402881ec3f74d2d5013f74dc2f091061', '40', '左权县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091066', '402881ec3f74d2d5013f74dc2f091061', '45', '和顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091067', '402881ec3f74d2d5013f74dc2f091061', '50', '昔阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091068', '402881ec3f74d2d5013f74dc2f091061', '55', '寿阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f091069', '402881ec3f74d2d5013f74dc2f091061', '60', '太谷县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09106a', '402881ec3f74d2d5013f74dc2f091061', '65', '祁　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09106b', '402881ec3f74d2d5013f74dc2f091061', '70', '平遥县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09106c', '402881ec3f74d2d5013f74dc2f091061', '75', '灵石县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09106d', '402881ec3f74d2d5013f74dc2f091061', '80', '介休市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f09106e', '402881ec3f74d2d5013f74dc2ebb1021', '60', '运城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181070', '402881ec3f74d2d5013f74dc2f09106e', '30', '盐湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181071', '402881ec3f74d2d5013f74dc2f09106e', '35', '临猗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181072', '402881ec3f74d2d5013f74dc2f09106e', '40', '万荣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181073', '402881ec3f74d2d5013f74dc2f09106e', '45', '闻喜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181074', '402881ec3f74d2d5013f74dc2f09106e', '50', '稷山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181075', '402881ec3f74d2d5013f74dc2f09106e', '55', '新绛县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181076', '402881ec3f74d2d5013f74dc2f09106e', '60', '绛　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181077', '402881ec3f74d2d5013f74dc2f09106e', '65', '垣曲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181078', '402881ec3f74d2d5013f74dc2f09106e', '70', '夏　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f181079', '402881ec3f74d2d5013f74dc2f09106e', '75', '平陆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f18107a', '402881ec3f74d2d5013f74dc2f09106e', '80', '芮城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f18107b', '402881ec3f74d2d5013f74dc2f09106e', '85', '永济市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f18107c', '402881ec3f74d2d5013f74dc2f09106e', '90', '河津市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f18107d', '402881ec3f74d2d5013f74dc2ebb1021', '65', '忻州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28107f', '402881ec3f74d2d5013f74dc2f18107d', '30', '忻府区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281080', '402881ec3f74d2d5013f74dc2f18107d', '35', '定襄县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281081', '402881ec3f74d2d5013f74dc2f18107d', '40', '五台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281082', '402881ec3f74d2d5013f74dc2f18107d', '45', '代　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281083', '402881ec3f74d2d5013f74dc2f18107d', '50', '繁峙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281084', '402881ec3f74d2d5013f74dc2f18107d', '55', '宁武县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281085', '402881ec3f74d2d5013f74dc2f18107d', '60', '静乐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281086', '402881ec3f74d2d5013f74dc2f18107d', '65', '神池县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281087', '402881ec3f74d2d5013f74dc2f18107d', '70', '五寨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281088', '402881ec3f74d2d5013f74dc2f18107d', '75', '岢岚县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281089', '402881ec3f74d2d5013f74dc2f18107d', '80', '河曲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28108a', '402881ec3f74d2d5013f74dc2f18107d', '85', '保德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28108b', '402881ec3f74d2d5013f74dc2f18107d', '90', '偏关县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28108c', '402881ec3f74d2d5013f74dc2f18107d', '95', '原平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28108d', '402881ec3f74d2d5013f74dc2ebb1021', '70', '临汾市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28108f', '402881ec3f74d2d5013f74dc2f28108d', '30', '尧都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281090', '402881ec3f74d2d5013f74dc2f28108d', '35', '曲沃县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281091', '402881ec3f74d2d5013f74dc2f28108d', '40', '翼城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281092', '402881ec3f74d2d5013f74dc2f28108d', '45', '襄汾县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281093', '402881ec3f74d2d5013f74dc2f28108d', '50', '洪洞县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281094', '402881ec3f74d2d5013f74dc2f28108d', '55', '古　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281095', '402881ec3f74d2d5013f74dc2f28108d', '60', '安泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281096', '402881ec3f74d2d5013f74dc2f28108d', '65', '浮山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281097', '402881ec3f74d2d5013f74dc2f28108d', '70', '吉　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281098', '402881ec3f74d2d5013f74dc2f28108d', '75', '乡宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f281099', '402881ec3f74d2d5013f74dc2f28108d', '80', '大宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28109a', '402881ec3f74d2d5013f74dc2f28108d', '85', '隰　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28109b', '402881ec3f74d2d5013f74dc2f28108d', '90', '永和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28109c', '402881ec3f74d2d5013f74dc2f28108d', '95', '蒲　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28109d', '402881ec3f74d2d5013f74dc2f28108d', '100', '汾西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28109e', '402881ec3f74d2d5013f74dc2f28108d', '105', '侯马市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f28109f', '402881ec3f74d2d5013f74dc2f28108d', '110', '霍州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f2810a0', '402881ec3f74d2d5013f74dc2ebb1021', '75', '吕梁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a2', '402881ec3f74d2d5013f74dc2f2810a0', '30', '离石区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a3', '402881ec3f74d2d5013f74dc2f2810a0', '35', '文水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a4', '402881ec3f74d2d5013f74dc2f2810a0', '40', '交城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a5', '402881ec3f74d2d5013f74dc2f2810a0', '45', '兴　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a6', '402881ec3f74d2d5013f74dc2f2810a0', '50', '临　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a7', '402881ec3f74d2d5013f74dc2f2810a0', '55', '柳林县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a8', '402881ec3f74d2d5013f74dc2f2810a0', '60', '石楼县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810a9', '402881ec3f74d2d5013f74dc2f2810a0', '65', '岚　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810aa', '402881ec3f74d2d5013f74dc2f2810a0', '70', '方山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810ab', '402881ec3f74d2d5013f74dc2f2810a0', '75', '中阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810ac', '402881ec3f74d2d5013f74dc2f2810a0', '80', '交口县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810ad', '402881ec3f74d2d5013f74dc2f2810a0', '85', '孝义市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810ae', '402881ec3f74d2d5013f74dc2f2810a0', '90', '汾阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810af', '402881ea3f5b1d14013f5b1fdc080006', '45', '内蒙古自治区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f3810b0', '402881ec3f74d2d5013f74dc2f3810af', '25', '呼和浩特市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b2', '402881ec3f74d2d5013f74dc2f3810b0', '30', '新城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b3', '402881ec3f74d2d5013f74dc2f3810b0', '35', '回民区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b4', '402881ec3f74d2d5013f74dc2f3810b0', '40', '玉泉区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b5', '402881ec3f74d2d5013f74dc2f3810b0', '45', '赛罕区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b6', '402881ec3f74d2d5013f74dc2f3810b0', '50', '土默特左旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b7', '402881ec3f74d2d5013f74dc2f3810b0', '55', '托克托县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b8', '402881ec3f74d2d5013f74dc2f3810b0', '60', '和林格尔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710b9', '402881ec3f74d2d5013f74dc2f3810b0', '65', '清水河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710ba', '402881ec3f74d2d5013f74dc2f3810b0', '70', '武川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710bb', '402881ec3f74d2d5013f74dc2f3810af', '30', '包头市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710bd', '402881ec3f74d2d5013f74dc2f4710bb', '30', '东河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710be', '402881ec3f74d2d5013f74dc2f4710bb', '35', '昆都仑区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710bf', '402881ec3f74d2d5013f74dc2f4710bb', '40', '青山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c0', '402881ec3f74d2d5013f74dc2f4710bb', '45', '石拐区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c1', '402881ec3f74d2d5013f74dc2f4710bb', '50', '白云矿区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c2', '402881ec3f74d2d5013f74dc2f4710bb', '55', '九原区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c3', '402881ec3f74d2d5013f74dc2f4710bb', '60', '土默特右旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c4', '402881ec3f74d2d5013f74dc2f4710bb', '65', '固阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c5', '402881ec3f74d2d5013f74dc2f4710bb', '70', '达尔罕茂明安联合旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c6', '402881ec3f74d2d5013f74dc2f3810af', '35', '乌海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c8', '402881ec3f74d2d5013f74dc2f4710c6', '30', '海勃湾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710c9', '402881ec3f74d2d5013f74dc2f4710c6', '35', '海南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710ca', '402881ec3f74d2d5013f74dc2f4710c6', '40', '乌达区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f4710cb', '402881ec3f74d2d5013f74dc2f3810af', '40', '赤峰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710cd', '402881ec3f74d2d5013f74dc2f4710cb', '30', '红山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710ce', '402881ec3f74d2d5013f74dc2f4710cb', '35', '元宝山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710cf', '402881ec3f74d2d5013f74dc2f4710cb', '40', '松山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d0', '402881ec3f74d2d5013f74dc2f4710cb', '45', '阿鲁科尔沁旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d1', '402881ec3f74d2d5013f74dc2f4710cb', '50', '巴林左旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d2', '402881ec3f74d2d5013f74dc2f4710cb', '55', '巴林右旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d3', '402881ec3f74d2d5013f74dc2f4710cb', '60', '林西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d4', '402881ec3f74d2d5013f74dc2f4710cb', '65', '克什克腾旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d5', '402881ec3f74d2d5013f74dc2f4710cb', '70', '翁牛特旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d6', '402881ec3f74d2d5013f74dc2f4710cb', '75', '喀喇沁旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d7', '402881ec3f74d2d5013f74dc2f4710cb', '80', '宁城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d8', '402881ec3f74d2d5013f74dc2f4710cb', '85', '敖汉旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710d9', '402881ec3f74d2d5013f74dc2f3810af', '45', '通辽市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710db', '402881ec3f74d2d5013f74dc2f5710d9', '30', '科尔沁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710dc', '402881ec3f74d2d5013f74dc2f5710d9', '35', '科尔沁左翼中旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710dd', '402881ec3f74d2d5013f74dc2f5710d9', '40', '科尔沁左翼后旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710de', '402881ec3f74d2d5013f74dc2f5710d9', '45', '开鲁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710df', '402881ec3f74d2d5013f74dc2f5710d9', '50', '库伦旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710e0', '402881ec3f74d2d5013f74dc2f5710d9', '55', '奈曼旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710e1', '402881ec3f74d2d5013f74dc2f5710d9', '60', '扎鲁特旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710e2', '402881ec3f74d2d5013f74dc2f5710d9', '65', '霍林郭勒市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f5710e3', '402881ec3f74d2d5013f74dc2f3810af', '50', '鄂尔多斯市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610e4', '402881ec3f74d2d5013f74dc2f5710e3', '25', '东胜区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610e5', '402881ec3f74d2d5013f74dc2f5710e3', '30', '达拉特旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610e6', '402881ec3f74d2d5013f74dc2f5710e3', '35', '准格尔旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610e7', '402881ec3f74d2d5013f74dc2f5710e3', '40', '鄂托克前旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610e8', '402881ec3f74d2d5013f74dc2f5710e3', '45', '鄂托克旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610e9', '402881ec3f74d2d5013f74dc2f5710e3', '50', '杭锦旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610ea', '402881ec3f74d2d5013f74dc2f5710e3', '55', '乌审旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610eb', '402881ec3f74d2d5013f74dc2f5710e3', '60', '伊金霍洛旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610ec', '402881ec3f74d2d5013f74dc2f3810af', '55', '呼伦贝尔市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610ee', '402881ec3f74d2d5013f74dc2f6610ec', '30', '海拉尔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610ef', '402881ec3f74d2d5013f74dc2f6610ec', '35', '阿荣旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f0', '402881ec3f74d2d5013f74dc2f6610ec', '40', '莫力达瓦达斡尔族自治旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f1', '402881ec3f74d2d5013f74dc2f6610ec', '45', '鄂伦春自治旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f2', '402881ec3f74d2d5013f74dc2f6610ec', '50', '鄂温克族自治旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f3', '402881ec3f74d2d5013f74dc2f6610ec', '55', '陈巴尔虎旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f4', '402881ec3f74d2d5013f74dc2f6610ec', '60', '新巴尔虎左旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f5', '402881ec3f74d2d5013f74dc2f6610ec', '65', '新巴尔虎右旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f6', '402881ec3f74d2d5013f74dc2f6610ec', '70', '满洲里市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f7', '402881ec3f74d2d5013f74dc2f6610ec', '75', '牙克石市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f8', '402881ec3f74d2d5013f74dc2f6610ec', '80', '扎兰屯市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610f9', '402881ec3f74d2d5013f74dc2f6610ec', '85', '额尔古纳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610fa', '402881ec3f74d2d5013f74dc2f6610ec', '90', '根河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f6610fb', '402881ec3f74d2d5013f74dc2f3810af', '60', '巴彦淖尔市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f7610fd', '402881ec3f74d2d5013f74dc2f6610fb', '30', '临河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f7610fe', '402881ec3f74d2d5013f74dc2f6610fb', '35', '五原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f7610ff', '402881ec3f74d2d5013f74dc2f6610fb', '40', '磴口县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761100', '402881ec3f74d2d5013f74dc2f6610fb', '45', '乌拉特前旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761101', '402881ec3f74d2d5013f74dc2f6610fb', '50', '乌拉特中旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761102', '402881ec3f74d2d5013f74dc2f6610fb', '55', '乌拉特后旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761103', '402881ec3f74d2d5013f74dc2f6610fb', '60', '杭锦后旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761104', '402881ec3f74d2d5013f74dc2f3810af', '65', '乌兰察布市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761106', '402881ec3f74d2d5013f74dc2f761104', '30', '集宁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761107', '402881ec3f74d2d5013f74dc2f761104', '35', '卓资县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761108', '402881ec3f74d2d5013f74dc2f761104', '40', '化德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761109', '402881ec3f74d2d5013f74dc2f761104', '45', '商都县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f76110a', '402881ec3f74d2d5013f74dc2f761104', '50', '兴和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f76110b', '402881ec3f74d2d5013f74dc2f761104', '55', '凉城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f76110c', '402881ec3f74d2d5013f74dc2f761104', '60', '察哈尔右翼前旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f76110d', '402881ec3f74d2d5013f74dc2f761104', '65', '察哈尔右翼中旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f76110e', '402881ec3f74d2d5013f74dc2f761104', '70', '察哈尔右翼后旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f76110f', '402881ec3f74d2d5013f74dc2f761104', '75', '四子王旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761110', '402881ec3f74d2d5013f74dc2f761104', '80', '丰镇市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f761111', '402881ec3f74d2d5013f74dc2f3810af', '70', '兴安盟', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861112', '402881ec3f74d2d5013f74dc2f761111', '25', '乌兰浩特市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861113', '402881ec3f74d2d5013f74dc2f761111', '30', '阿尔山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861114', '402881ec3f74d2d5013f74dc2f761111', '35', '科尔沁右翼前旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861115', '402881ec3f74d2d5013f74dc2f761111', '40', '科尔沁右翼中旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861116', '402881ec3f74d2d5013f74dc2f761111', '45', '扎赉特旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861117', '402881ec3f74d2d5013f74dc2f761111', '50', '突泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861118', '402881ec3f74d2d5013f74dc2f3810af', '75', '锡林郭勒盟', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861119', '402881ec3f74d2d5013f74dc2f861118', '25', '二连浩特市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f86111a', '402881ec3f74d2d5013f74dc2f861118', '30', '锡林浩特市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f86111b', '402881ec3f74d2d5013f74dc2f861118', '35', '阿巴嘎旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f86111c', '402881ec3f74d2d5013f74dc2f861118', '40', '苏尼特左旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f86111d', '402881ec3f74d2d5013f74dc2f861118', '45', '苏尼特右旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f86111e', '402881ec3f74d2d5013f74dc2f861118', '50', '东乌珠穆沁旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f86111f', '402881ec3f74d2d5013f74dc2f861118', '55', '西乌珠穆沁旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861120', '402881ec3f74d2d5013f74dc2f861118', '60', '太仆寺旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861121', '402881ec3f74d2d5013f74dc2f861118', '65', '镶黄旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861122', '402881ec3f74d2d5013f74dc2f861118', '70', '正镶白旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861123', '402881ec3f74d2d5013f74dc2f861118', '75', '正蓝旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861124', '402881ec3f74d2d5013f74dc2f861118', '80', '多伦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861125', '402881ec3f74d2d5013f74dc2f3810af', '80', '阿拉善盟', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861126', '402881ec3f74d2d5013f74dc2f861125', '25', '阿拉善左旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861127', '402881ec3f74d2d5013f74dc2f861125', '30', '阿拉善右旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861128', '402881ec3f74d2d5013f74dc2f861125', '35', '额济纳旗', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f861129', '402881ea3f5b1d14013f5b1fdc080006', '50', '辽宁省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2f95112a', '402881ec3f74d2d5013f74dc2f861129', '25', '沈阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5112c', '402881ec3f74d2d5013f74dc2f95112a', '30', '和平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5112d', '402881ec3f74d2d5013f74dc2f95112a', '35', '沈河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5112e', '402881ec3f74d2d5013f74dc2f95112a', '40', '大东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5112f', '402881ec3f74d2d5013f74dc2f95112a', '45', '皇姑区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51130', '402881ec3f74d2d5013f74dc2f95112a', '50', '铁西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51131', '402881ec3f74d2d5013f74dc2f95112a', '55', '苏家屯区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51132', '402881ec3f74d2d5013f74dc2f95112a', '60', '东陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51133', '402881ec3f74d2d5013f74dc2f95112a', '65', '新城子区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51134', '402881ec3f74d2d5013f74dc2f95112a', '70', '于洪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51135', '402881ec3f74d2d5013f74dc2f95112a', '75', '辽中县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51136', '402881ec3f74d2d5013f74dc2f95112a', '80', '康平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51137', '402881ec3f74d2d5013f74dc2f95112a', '85', '法库县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51138', '402881ec3f74d2d5013f74dc2f95112a', '90', '新民市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51139', '402881ec3f74d2d5013f74dc2f861129', '30', '大连市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5113b', '402881ec3f74d2d5013f74dc2fa51139', '30', '中山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5113c', '402881ec3f74d2d5013f74dc2fa51139', '35', '西岗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5113d', '402881ec3f74d2d5013f74dc2fa51139', '40', '沙河口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5113e', '402881ec3f74d2d5013f74dc2fa51139', '45', '甘井子区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa5113f', '402881ec3f74d2d5013f74dc2fa51139', '50', '旅顺口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51140', '402881ec3f74d2d5013f74dc2fa51139', '55', '金州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51141', '402881ec3f74d2d5013f74dc2fa51139', '60', '长海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51142', '402881ec3f74d2d5013f74dc2fa51139', '65', '瓦房店市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51143', '402881ec3f74d2d5013f74dc2fa51139', '70', '普兰店市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51144', '402881ec3f74d2d5013f74dc2fa51139', '75', '庄河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fa51145', '402881ec3f74d2d5013f74dc2f861129', '35', '鞍山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb41147', '402881ec3f74d2d5013f74dc2fa51145', '30', '铁东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb41148', '402881ec3f74d2d5013f74dc2fa51145', '35', '铁西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb41149', '402881ec3f74d2d5013f74dc2fa51145', '40', '立山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb4114a', '402881ec3f74d2d5013f74dc2fa51145', '45', '千山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb4114b', '402881ec3f74d2d5013f74dc2fa51145', '50', '台安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb4114c', '402881ec3f74d2d5013f74dc2fa51145', '55', '岫岩满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb4114d', '402881ec3f74d2d5013f74dc2fa51145', '60', '海城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fb4114e', '402881ec3f74d2d5013f74dc2f861129', '40', '抚顺市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41150', '402881ec3f74d2d5013f74dc2fb4114e', '30', '新抚区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41151', '402881ec3f74d2d5013f74dc2fb4114e', '35', '东洲区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41152', '402881ec3f74d2d5013f74dc2fb4114e', '40', '望花区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41153', '402881ec3f74d2d5013f74dc2fb4114e', '45', '顺城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41154', '402881ec3f74d2d5013f74dc2fb4114e', '50', '抚顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41155', '402881ec3f74d2d5013f74dc2fb4114e', '55', '新宾满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41156', '402881ec3f74d2d5013f74dc2fb4114e', '60', '清原满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41157', '402881ec3f74d2d5013f74dc2f861129', '45', '本溪市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41159', '402881ec3f74d2d5013f74dc2fc41157', '30', '平山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc4115a', '402881ec3f74d2d5013f74dc2fc41157', '35', '溪湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc4115b', '402881ec3f74d2d5013f74dc2fc41157', '40', '明山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc4115c', '402881ec3f74d2d5013f74dc2fc41157', '45', '南芬区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc4115d', '402881ec3f74d2d5013f74dc2fc41157', '50', '本溪满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc4115e', '402881ec3f74d2d5013f74dc2fc41157', '55', '桓仁满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc4115f', '402881ec3f74d2d5013f74dc2f861129', '50', '丹东市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41161', '402881ec3f74d2d5013f74dc2fc4115f', '30', '元宝区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41162', '402881ec3f74d2d5013f74dc2fc4115f', '35', '振兴区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41163', '402881ec3f74d2d5013f74dc2fc4115f', '40', '振安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41164', '402881ec3f74d2d5013f74dc2fc4115f', '45', '宽甸满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41165', '402881ec3f74d2d5013f74dc2fc4115f', '50', '东港市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41166', '402881ec3f74d2d5013f74dc2fc4115f', '55', '凤城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fc41167', '402881ec3f74d2d5013f74dc2f861129', '55', '锦州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41169', '402881ec3f74d2d5013f74dc2fc41167', '30', '古塔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd4116a', '402881ec3f74d2d5013f74dc2fc41167', '35', '凌河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd4116b', '402881ec3f74d2d5013f74dc2fc41167', '40', '太和区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd4116c', '402881ec3f74d2d5013f74dc2fc41167', '45', '黑山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd4116d', '402881ec3f74d2d5013f74dc2fc41167', '50', '义　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd4116e', '402881ec3f74d2d5013f74dc2fc41167', '55', '凌海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd4116f', '402881ec3f74d2d5013f74dc2fc41167', '60', '北宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41170', '402881ec3f74d2d5013f74dc2f861129', '60', '营口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41172', '402881ec3f74d2d5013f74dc2fd41170', '30', '站前区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41173', '402881ec3f74d2d5013f74dc2fd41170', '35', '西市区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41174', '402881ec3f74d2d5013f74dc2fd41170', '40', '鲅鱼圈区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41175', '402881ec3f74d2d5013f74dc2fd41170', '45', '老边区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41176', '402881ec3f74d2d5013f74dc2fd41170', '50', '盖州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41177', '402881ec3f74d2d5013f74dc2fd41170', '55', '大石桥市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fd41178', '402881ec3f74d2d5013f74dc2f861129', '65', '阜新市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3117a', '402881ec3f74d2d5013f74dc2fd41178', '30', '海州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3117b', '402881ec3f74d2d5013f74dc2fd41178', '35', '新邱区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3117c', '402881ec3f74d2d5013f74dc2fd41178', '40', '太平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3117d', '402881ec3f74d2d5013f74dc2fd41178', '45', '清河门区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3117e', '402881ec3f74d2d5013f74dc2fd41178', '50', '细河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3117f', '402881ec3f74d2d5013f74dc2fd41178', '55', '阜新蒙古族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31180', '402881ec3f74d2d5013f74dc2fd41178', '60', '彰武县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31181', '402881ec3f74d2d5013f74dc2f861129', '70', '辽阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31183', '402881ec3f74d2d5013f74dc2fe31181', '30', '白塔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31184', '402881ec3f74d2d5013f74dc2fe31181', '35', '文圣区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31185', '402881ec3f74d2d5013f74dc2fe31181', '40', '宏伟区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31186', '402881ec3f74d2d5013f74dc2fe31181', '45', '弓长岭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31187', '402881ec3f74d2d5013f74dc2fe31181', '50', '太子河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31188', '402881ec3f74d2d5013f74dc2fe31181', '55', '辽阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31189', '402881ec3f74d2d5013f74dc2fe31181', '60', '灯塔市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3118a', '402881ec3f74d2d5013f74dc2f861129', '75', '盘锦市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3118c', '402881ec3f74d2d5013f74dc2fe3118a', '30', '双台子区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3118d', '402881ec3f74d2d5013f74dc2fe3118a', '35', '兴隆台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3118e', '402881ec3f74d2d5013f74dc2fe3118a', '40', '大洼县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe3118f', '402881ec3f74d2d5013f74dc2fe3118a', '45', '盘山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2fe31190', '402881ec3f74d2d5013f74dc2f861129', '80', '铁岭市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31192', '402881ec3f74d2d5013f74dc2fe31190', '30', '银州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31193', '402881ec3f74d2d5013f74dc2fe31190', '35', '清河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31194', '402881ec3f74d2d5013f74dc2fe31190', '40', '铁岭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31195', '402881ec3f74d2d5013f74dc2fe31190', '45', '西丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31196', '402881ec3f74d2d5013f74dc2fe31190', '50', '昌图县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31197', '402881ec3f74d2d5013f74dc2fe31190', '55', '调兵山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31198', '402881ec3f74d2d5013f74dc2fe31190', '60', '开原市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff31199', '402881ec3f74d2d5013f74dc2f861129', '85', '朝阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff3119b', '402881ec3f74d2d5013f74dc2ff31199', '30', '双塔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff3119c', '402881ec3f74d2d5013f74dc2ff31199', '35', '龙城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff3119d', '402881ec3f74d2d5013f74dc2ff31199', '40', '朝阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff3119e', '402881ec3f74d2d5013f74dc2ff31199', '45', '建平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff3119f', '402881ec3f74d2d5013f74dc2ff31199', '50', '喀喇沁左翼蒙古族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff311a0', '402881ec3f74d2d5013f74dc2ff31199', '55', '北票市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff311a1', '402881ec3f74d2d5013f74dc2ff31199', '60', '凌源市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc2ff311a2', '402881ec3f74d2d5013f74dc2f861129', '90', '葫芦岛市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211a4', '402881ec3f74d2d5013f74dc2ff311a2', '30', '连山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211a5', '402881ec3f74d2d5013f74dc2ff311a2', '35', '龙港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211a6', '402881ec3f74d2d5013f74dc2ff311a2', '40', '南票区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211a7', '402881ec3f74d2d5013f74dc2ff311a2', '45', '绥中县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211a8', '402881ec3f74d2d5013f74dc2ff311a2', '50', '建昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211a9', '402881ec3f74d2d5013f74dc2ff311a2', '55', '兴城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211aa', '402881ea3f5b1d14013f5b1fdc080006', '55', '吉林省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc300211ab', '402881ec3f74d2d5013f74dc300211aa', '25', '长春市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211ad', '402881ec3f74d2d5013f74dc300211ab', '30', '南关区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211ae', '402881ec3f74d2d5013f74dc300211ab', '35', '宽城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211af', '402881ec3f74d2d5013f74dc300211ab', '40', '朝阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b0', '402881ec3f74d2d5013f74dc300211ab', '45', '二道区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b1', '402881ec3f74d2d5013f74dc300211ab', '50', '绿园区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b2', '402881ec3f74d2d5013f74dc300211ab', '55', '双阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b3', '402881ec3f74d2d5013f74dc300211ab', '60', '农安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b4', '402881ec3f74d2d5013f74dc300211ab', '65', '九台市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b5', '402881ec3f74d2d5013f74dc300211ab', '70', '榆树市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b6', '402881ec3f74d2d5013f74dc300211ab', '75', '德惠市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b7', '402881ec3f74d2d5013f74dc300211aa', '30', '吉林市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211b9', '402881ec3f74d2d5013f74dc301211b7', '30', '昌邑区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211ba', '402881ec3f74d2d5013f74dc301211b7', '35', '龙潭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211bb', '402881ec3f74d2d5013f74dc301211b7', '40', '船营区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211bc', '402881ec3f74d2d5013f74dc301211b7', '45', '丰满区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211bd', '402881ec3f74d2d5013f74dc301211b7', '50', '永吉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211be', '402881ec3f74d2d5013f74dc301211b7', '55', '蛟河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211bf', '402881ec3f74d2d5013f74dc301211b7', '60', '桦甸市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211c0', '402881ec3f74d2d5013f74dc301211b7', '65', '舒兰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211c1', '402881ec3f74d2d5013f74dc301211b7', '70', '磐石市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc301211c2', '402881ec3f74d2d5013f74dc300211aa', '35', '四平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc302211c4', '402881ec3f74d2d5013f74dc301211c2', '30', '铁西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc302211c5', '402881ec3f74d2d5013f74dc301211c2', '35', '铁东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc302211c6', '402881ec3f74d2d5013f74dc301211c2', '40', '梨树县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc302211c7', '402881ec3f74d2d5013f74dc301211c2', '45', '伊通满族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc302211c8', '402881ec3f74d2d5013f74dc301211c2', '50', '公主岭市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc302211c9', '402881ec3f74d2d5013f74dc301211c2', '55', '双辽市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc302211ca', '402881ec3f74d2d5013f74dc300211aa', '40', '辽源市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111cc', '402881ec3f74d2d5013f74dc302211ca', '30', '龙山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111cd', '402881ec3f74d2d5013f74dc302211ca', '35', '西安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111ce', '402881ec3f74d2d5013f74dc302211ca', '40', '东丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111cf', '402881ec3f74d2d5013f74dc302211ca', '45', '东辽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d0', '402881ec3f74d2d5013f74dc300211aa', '45', '通化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d2', '402881ec3f74d2d5013f74dc303111d0', '30', '东昌区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d3', '402881ec3f74d2d5013f74dc303111d0', '35', '二道江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d4', '402881ec3f74d2d5013f74dc303111d0', '40', '通化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d5', '402881ec3f74d2d5013f74dc303111d0', '45', '辉南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d6', '402881ec3f74d2d5013f74dc303111d0', '50', '柳河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d7', '402881ec3f74d2d5013f74dc303111d0', '55', '梅河口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d8', '402881ec3f74d2d5013f74dc303111d0', '60', '集安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111d9', '402881ec3f74d2d5013f74dc300211aa', '50', '白山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111db', '402881ec3f74d2d5013f74dc303111d9', '30', '八道江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111dc', '402881ec3f74d2d5013f74dc303111d9', '35', '抚松县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111dd', '402881ec3f74d2d5013f74dc303111d9', '40', '靖宇县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111de', '402881ec3f74d2d5013f74dc303111d9', '45', '长白朝鲜族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111df', '402881ec3f74d2d5013f74dc303111d9', '50', '江源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111e0', '402881ec3f74d2d5013f74dc303111d9', '55', '临江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc303111e1', '402881ec3f74d2d5013f74dc300211aa', '55', '松原市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111e3', '402881ec3f74d2d5013f74dc303111e1', '30', '宁江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111e4', '402881ec3f74d2d5013f74dc303111e1', '35', '前郭尔罗斯蒙古族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111e5', '402881ec3f74d2d5013f74dc303111e1', '40', '长岭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111e6', '402881ec3f74d2d5013f74dc303111e1', '45', '乾安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111e7', '402881ec3f74d2d5013f74dc303111e1', '50', '扶余县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111e8', '402881ec3f74d2d5013f74dc300211aa', '60', '白城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111ea', '402881ec3f74d2d5013f74dc304111e8', '30', '洮北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111eb', '402881ec3f74d2d5013f74dc304111e8', '35', '镇赉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111ec', '402881ec3f74d2d5013f74dc304111e8', '40', '通榆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111ed', '402881ec3f74d2d5013f74dc304111e8', '45', '洮南市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111ee', '402881ec3f74d2d5013f74dc304111e8', '50', '大安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc304111ef', '402881ec3f74d2d5013f74dc300211aa', '65', '延边朝鲜族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f0', '402881ec3f74d2d5013f74dc304111ef', '25', '延吉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f1', '402881ec3f74d2d5013f74dc304111ef', '30', '图们市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f2', '402881ec3f74d2d5013f74dc304111ef', '35', '敦化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f3', '402881ec3f74d2d5013f74dc304111ef', '40', '珲春市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f4', '402881ec3f74d2d5013f74dc304111ef', '45', '龙井市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f5', '402881ec3f74d2d5013f74dc304111ef', '50', '和龙市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f6', '402881ec3f74d2d5013f74dc304111ef', '55', '汪清县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f7', '402881ec3f74d2d5013f74dc304111ef', '60', '安图县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f8', '402881ea3f5b1d14013f5b1fdc080006', '60', '黑龙江省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc305011f9', '402881ec3f74d2d5013f74dc305011f8', '25', '哈尔滨市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc306011fb', '402881ec3f74d2d5013f74dc305011f9', '30', '道里区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc306011fc', '402881ec3f74d2d5013f74dc305011f9', '35', '南岗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc306011fd', '402881ec3f74d2d5013f74dc305011f9', '40', '道外区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc306011fe', '402881ec3f74d2d5013f74dc305011f9', '45', '香坊区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc306011ff', '402881ec3f74d2d5013f74dc305011f9', '50', '动力区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601200', '402881ec3f74d2d5013f74dc305011f9', '55', '平房区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601201', '402881ec3f74d2d5013f74dc305011f9', '60', '松北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601202', '402881ec3f74d2d5013f74dc305011f9', '65', '呼兰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601203', '402881ec3f74d2d5013f74dc305011f9', '70', '依兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601204', '402881ec3f74d2d5013f74dc305011f9', '75', '方正县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601205', '402881ec3f74d2d5013f74dc305011f9', '80', '宾　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601206', '402881ec3f74d2d5013f74dc305011f9', '85', '巴彦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601207', '402881ec3f74d2d5013f74dc305011f9', '90', '木兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601208', '402881ec3f74d2d5013f74dc305011f9', '95', '通河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30601209', '402881ec3f74d2d5013f74dc305011f9', '100', '延寿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3060120a', '402881ec3f74d2d5013f74dc305011f9', '105', '阿城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3060120b', '402881ec3f74d2d5013f74dc305011f9', '110', '双城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3060120c', '402881ec3f74d2d5013f74dc305011f9', '115', '尚志市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3060120d', '402881ec3f74d2d5013f74dc305011f9', '120', '五常市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3060120e', '402881ec3f74d2d5013f74dc305011f8', '30', '齐齐哈尔市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1210', '402881ec3f74d2d5013f74dc3060120e', '30', '龙沙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1211', '402881ec3f74d2d5013f74dc3060120e', '35', '建华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1212', '402881ec3f74d2d5013f74dc3060120e', '40', '铁锋区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1213', '402881ec3f74d2d5013f74dc3060120e', '45', '昂昂溪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1214', '402881ec3f74d2d5013f74dc3060120e', '50', '富拉尔基区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1215', '402881ec3f74d2d5013f74dc3060120e', '55', '碾子山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1216', '402881ec3f74d2d5013f74dc3060120e', '60', '梅里斯达斡尔族区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1217', '402881ec3f74d2d5013f74dc3060120e', '65', '龙江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1218', '402881ec3f74d2d5013f74dc3060120e', '70', '依安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1219', '402881ec3f74d2d5013f74dc3060120e', '75', '泰来县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f121a', '402881ec3f74d2d5013f74dc3060120e', '80', '甘南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f121b', '402881ec3f74d2d5013f74dc3060120e', '85', '富裕县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f121c', '402881ec3f74d2d5013f74dc3060120e', '90', '克山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f121d', '402881ec3f74d2d5013f74dc3060120e', '95', '克东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f121e', '402881ec3f74d2d5013f74dc3060120e', '100', '拜泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f121f', '402881ec3f74d2d5013f74dc3060120e', '105', '讷河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1220', '402881ec3f74d2d5013f74dc305011f8', '35', '鸡西市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1222', '402881ec3f74d2d5013f74dc307f1220', '30', '鸡冠区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1223', '402881ec3f74d2d5013f74dc307f1220', '35', '恒山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1224', '402881ec3f74d2d5013f74dc307f1220', '40', '滴道区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1225', '402881ec3f74d2d5013f74dc307f1220', '45', '梨树区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1226', '402881ec3f74d2d5013f74dc307f1220', '50', '城子河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1227', '402881ec3f74d2d5013f74dc307f1220', '55', '麻山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1228', '402881ec3f74d2d5013f74dc307f1220', '60', '鸡东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f1229', '402881ec3f74d2d5013f74dc307f1220', '65', '虎林市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f122a', '402881ec3f74d2d5013f74dc307f1220', '70', '密山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc307f122b', '402881ec3f74d2d5013f74dc305011f8', '40', '鹤岗市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f122d', '402881ec3f74d2d5013f74dc307f122b', '30', '向阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f122e', '402881ec3f74d2d5013f74dc307f122b', '35', '工农区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f122f', '402881ec3f74d2d5013f74dc307f122b', '40', '南山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f1230', '402881ec3f74d2d5013f74dc307f122b', '45', '兴安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f1231', '402881ec3f74d2d5013f74dc307f122b', '50', '东山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f1232', '402881ec3f74d2d5013f74dc307f122b', '55', '兴山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f1233', '402881ec3f74d2d5013f74dc307f122b', '60', '萝北县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f1234', '402881ec3f74d2d5013f74dc307f122b', '65', '绥滨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc308f1235', '402881ec3f74d2d5013f74dc305011f8', '45', '双鸭山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e1237', '402881ec3f74d2d5013f74dc308f1235', '30', '尖山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e1238', '402881ec3f74d2d5013f74dc308f1235', '35', '岭东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e1239', '402881ec3f74d2d5013f74dc308f1235', '40', '四方台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e123a', '402881ec3f74d2d5013f74dc308f1235', '45', '宝山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e123b', '402881ec3f74d2d5013f74dc308f1235', '50', '集贤县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e123c', '402881ec3f74d2d5013f74dc308f1235', '55', '友谊县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e123d', '402881ec3f74d2d5013f74dc308f1235', '60', '宝清县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e123e', '402881ec3f74d2d5013f74dc308f1235', '65', '饶河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc309e123f', '402881ec3f74d2d5013f74dc305011f8', '50', '大庆市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1241', '402881ec3f74d2d5013f74dc309e123f', '30', '萨尔图区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1242', '402881ec3f74d2d5013f74dc309e123f', '35', '龙凤区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1243', '402881ec3f74d2d5013f74dc309e123f', '40', '让胡路区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1244', '402881ec3f74d2d5013f74dc309e123f', '45', '红岗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1245', '402881ec3f74d2d5013f74dc309e123f', '50', '大同区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1246', '402881ec3f74d2d5013f74dc309e123f', '55', '肇州县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1247', '402881ec3f74d2d5013f74dc309e123f', '60', '肇源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1248', '402881ec3f74d2d5013f74dc309e123f', '65', '林甸县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1249', '402881ec3f74d2d5013f74dc309e123f', '70', '杜尔伯特蒙古族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae124a', '402881ec3f74d2d5013f74dc305011f8', '55', '伊春市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae124c', '402881ec3f74d2d5013f74dc30ae124a', '30', '伊春区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae124d', '402881ec3f74d2d5013f74dc30ae124a', '35', '南岔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae124e', '402881ec3f74d2d5013f74dc30ae124a', '40', '友好区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae124f', '402881ec3f74d2d5013f74dc30ae124a', '45', '西林区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1250', '402881ec3f74d2d5013f74dc30ae124a', '50', '翠峦区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1251', '402881ec3f74d2d5013f74dc30ae124a', '55', '新青区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1252', '402881ec3f74d2d5013f74dc30ae124a', '60', '美溪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1253', '402881ec3f74d2d5013f74dc30ae124a', '65', '金山屯区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1254', '402881ec3f74d2d5013f74dc30ae124a', '70', '五营区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1255', '402881ec3f74d2d5013f74dc30ae124a', '75', '乌马河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1256', '402881ec3f74d2d5013f74dc30ae124a', '80', '汤旺河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1257', '402881ec3f74d2d5013f74dc30ae124a', '85', '带岭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1258', '402881ec3f74d2d5013f74dc30ae124a', '90', '乌伊岭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae1259', '402881ec3f74d2d5013f74dc30ae124a', '95', '红星区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae125a', '402881ec3f74d2d5013f74dc30ae124a', '100', '上甘岭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae125b', '402881ec3f74d2d5013f74dc30ae124a', '105', '嘉荫县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae125c', '402881ec3f74d2d5013f74dc30ae124a', '110', '铁力市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30ae125d', '402881ec3f74d2d5013f74dc305011f8', '60', '佳木斯市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be125f', '402881ec3f74d2d5013f74dc30ae125d', '30', '永红区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1260', '402881ec3f74d2d5013f74dc30ae125d', '35', '向阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1261', '402881ec3f74d2d5013f74dc30ae125d', '40', '前进区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1262', '402881ec3f74d2d5013f74dc30ae125d', '45', '东风区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1263', '402881ec3f74d2d5013f74dc30ae125d', '50', '郊　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1264', '402881ec3f74d2d5013f74dc30ae125d', '55', '桦南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1265', '402881ec3f74d2d5013f74dc30ae125d', '60', '桦川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1266', '402881ec3f74d2d5013f74dc30ae125d', '65', '汤原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1267', '402881ec3f74d2d5013f74dc30ae125d', '70', '抚远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1268', '402881ec3f74d2d5013f74dc30ae125d', '75', '同江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1269', '402881ec3f74d2d5013f74dc30ae125d', '80', '富锦市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be126a', '402881ec3f74d2d5013f74dc305011f8', '65', '七台河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be126c', '402881ec3f74d2d5013f74dc30be126a', '30', '新兴区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be126d', '402881ec3f74d2d5013f74dc30be126a', '35', '桃山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be126e', '402881ec3f74d2d5013f74dc30be126a', '40', '茄子河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be126f', '402881ec3f74d2d5013f74dc30be126a', '45', '勃利县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30be1270', '402881ec3f74d2d5013f74dc305011f8', '70', '牡丹江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1272', '402881ec3f74d2d5013f74dc30be1270', '30', '东安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1273', '402881ec3f74d2d5013f74dc30be1270', '35', '阳明区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1274', '402881ec3f74d2d5013f74dc30be1270', '40', '爱民区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1275', '402881ec3f74d2d5013f74dc30be1270', '45', '西安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1276', '402881ec3f74d2d5013f74dc30be1270', '50', '东宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1277', '402881ec3f74d2d5013f74dc30be1270', '55', '林口县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1278', '402881ec3f74d2d5013f74dc30be1270', '60', '绥芬河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1279', '402881ec3f74d2d5013f74dc30be1270', '65', '海林市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd127a', '402881ec3f74d2d5013f74dc30be1270', '70', '宁安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd127b', '402881ec3f74d2d5013f74dc30be1270', '75', '穆棱市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd127c', '402881ec3f74d2d5013f74dc305011f8', '75', '黑河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd127e', '402881ec3f74d2d5013f74dc30cd127c', '30', '爱辉区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd127f', '402881ec3f74d2d5013f74dc30cd127c', '35', '嫩江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1280', '402881ec3f74d2d5013f74dc30cd127c', '40', '逊克县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1281', '402881ec3f74d2d5013f74dc30cd127c', '45', '孙吴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1282', '402881ec3f74d2d5013f74dc30cd127c', '50', '北安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30cd1283', '402881ec3f74d2d5013f74dc30cd127c', '55', '五大连池市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30dd1284', '402881ec3f74d2d5013f74dc305011f8', '80', '绥化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc1286', '402881ec3f74d2d5013f74dc30dd1284', '30', '北林区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc1287', '402881ec3f74d2d5013f74dc30dd1284', '35', '望奎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc1288', '402881ec3f74d2d5013f74dc30dd1284', '40', '兰西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc1289', '402881ec3f74d2d5013f74dc30dd1284', '45', '青冈县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc128a', '402881ec3f74d2d5013f74dc30dd1284', '50', '庆安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc128b', '402881ec3f74d2d5013f74dc30dd1284', '55', '明水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc128c', '402881ec3f74d2d5013f74dc30dd1284', '60', '绥棱县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc128d', '402881ec3f74d2d5013f74dc30dd1284', '65', '安达市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc128e', '402881ec3f74d2d5013f74dc30dd1284', '70', '肇东市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc128f', '402881ec3f74d2d5013f74dc30dd1284', '75', '海伦市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc30fc1290', '402881ec3f74d2d5013f74dc305011f8', '85', '大兴安岭地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1291', '402881ec3f74d2d5013f74dc30fc1290', '25', '呼玛县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1292', '402881ec3f74d2d5013f74dc30fc1290', '30', '塔河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1293', '402881ec3f74d2d5013f74dc30fc1290', '35', '漠河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1294', '402881ea3f5b1d14013f5b1fdc080006', '65', '上海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1295', '402881ec3f74d2d5013f74dc310c1294', '25', '黄浦区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1296', '402881ec3f74d2d5013f74dc310c1294', '30', '卢湾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1297', '402881ec3f74d2d5013f74dc310c1294', '35', '徐汇区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1298', '402881ec3f74d2d5013f74dc310c1294', '40', '长宁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c1299', '402881ec3f74d2d5013f74dc310c1294', '45', '静安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c129a', '402881ec3f74d2d5013f74dc310c1294', '50', '普陀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c129b', '402881ec3f74d2d5013f74dc310c1294', '55', '闸北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c129c', '402881ec3f74d2d5013f74dc310c1294', '60', '虹口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c129d', '402881ec3f74d2d5013f74dc310c1294', '65', '杨浦区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c129e', '402881ec3f74d2d5013f74dc310c1294', '70', '闵行区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c129f', '402881ec3f74d2d5013f74dc310c1294', '75', '宝山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c12a0', '402881ec3f74d2d5013f74dc310c1294', '80', '嘉定区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c12a1', '402881ec3f74d2d5013f74dc310c1294', '85', '浦东新区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c12a2', '402881ec3f74d2d5013f74dc310c1294', '90', '金山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c12a3', '402881ec3f74d2d5013f74dc310c1294', '95', '松江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c12a4', '402881ec3f74d2d5013f74dc310c1294', '100', '青浦区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c12a5', '402881ec3f74d2d5013f74dc310c1294', '105', '南汇区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc310c12a6', '402881ec3f74d2d5013f74dc310c1294', '110', '奉贤区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc311b12a7', '402881ec3f74d2d5013f74dc310c1294', '25', '崇明县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc311b12a8', '402881ea3f5b1d14013f5b1fdc080006', '70', '江苏省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc311b12a9', '402881ec3f74d2d5013f74dc311b12a8', '25', '南京市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12ab', '402881ec3f74d2d5013f74dc311b12a9', '30', '玄武区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12ac', '402881ec3f74d2d5013f74dc311b12a9', '35', '白下区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12ad', '402881ec3f74d2d5013f74dc311b12a9', '40', '秦淮区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12ae', '402881ec3f74d2d5013f74dc311b12a9', '45', '建邺区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12af', '402881ec3f74d2d5013f74dc311b12a9', '50', '鼓楼区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b0', '402881ec3f74d2d5013f74dc311b12a9', '55', '下关区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b1', '402881ec3f74d2d5013f74dc311b12a9', '60', '浦口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b2', '402881ec3f74d2d5013f74dc311b12a9', '65', '栖霞区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b3', '402881ec3f74d2d5013f74dc311b12a9', '70', '雨花台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b4', '402881ec3f74d2d5013f74dc311b12a9', '75', '江宁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b5', '402881ec3f74d2d5013f74dc311b12a9', '80', '六合区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b6', '402881ec3f74d2d5013f74dc311b12a9', '85', '溧水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b7', '402881ec3f74d2d5013f74dc311b12a9', '90', '高淳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12b8', '402881ec3f74d2d5013f74dc311b12a8', '30', '无锡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12ba', '402881ec3f74d2d5013f74dc312b12b8', '30', '崇安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12bb', '402881ec3f74d2d5013f74dc312b12b8', '35', '南长区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12bc', '402881ec3f74d2d5013f74dc312b12b8', '40', '北塘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12bd', '402881ec3f74d2d5013f74dc312b12b8', '45', '锡山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12be', '402881ec3f74d2d5013f74dc312b12b8', '50', '惠山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12bf', '402881ec3f74d2d5013f74dc312b12b8', '55', '滨湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12c0', '402881ec3f74d2d5013f74dc312b12b8', '60', '江阴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12c1', '402881ec3f74d2d5013f74dc312b12b8', '65', '宜兴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc312b12c2', '402881ec3f74d2d5013f74dc311b12a8', '35', '徐州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12c4', '402881ec3f74d2d5013f74dc312b12c2', '30', '鼓楼区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12c5', '402881ec3f74d2d5013f74dc312b12c2', '35', '云龙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12c6', '402881ec3f74d2d5013f74dc312b12c2', '40', '九里区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12c7', '402881ec3f74d2d5013f74dc312b12c2', '45', '贾汪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12c8', '402881ec3f74d2d5013f74dc312b12c2', '50', '泉山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12c9', '402881ec3f74d2d5013f74dc312b12c2', '55', '丰　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12ca', '402881ec3f74d2d5013f74dc312b12c2', '60', '沛　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12cb', '402881ec3f74d2d5013f74dc312b12c2', '65', '铜山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12cc', '402881ec3f74d2d5013f74dc312b12c2', '70', '睢宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12cd', '402881ec3f74d2d5013f74dc312b12c2', '75', '新沂市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12ce', '402881ec3f74d2d5013f74dc312b12c2', '80', '邳州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12cf', '402881ec3f74d2d5013f74dc311b12a8', '40', '常州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d1', '402881ec3f74d2d5013f74dc313a12cf', '30', '天宁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d2', '402881ec3f74d2d5013f74dc313a12cf', '35', '钟楼区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d3', '402881ec3f74d2d5013f74dc313a12cf', '40', '戚墅堰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d4', '402881ec3f74d2d5013f74dc313a12cf', '45', '新北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d5', '402881ec3f74d2d5013f74dc313a12cf', '50', '武进区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d6', '402881ec3f74d2d5013f74dc313a12cf', '55', '溧阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d7', '402881ec3f74d2d5013f74dc313a12cf', '60', '金坛市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc313a12d8', '402881ec3f74d2d5013f74dc311b12a8', '45', '苏州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12da', '402881ec3f74d2d5013f74dc313a12d8', '30', '沧浪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12db', '402881ec3f74d2d5013f74dc313a12d8', '35', '平江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12dc', '402881ec3f74d2d5013f74dc313a12d8', '40', '金阊区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12dd', '402881ec3f74d2d5013f74dc313a12d8', '45', '虎丘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12de', '402881ec3f74d2d5013f74dc313a12d8', '50', '吴中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12df', '402881ec3f74d2d5013f74dc313a12d8', '55', '相城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e0', '402881ec3f74d2d5013f74dc313a12d8', '60', '常熟市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e1', '402881ec3f74d2d5013f74dc313a12d8', '65', '张家港市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e2', '402881ec3f74d2d5013f74dc313a12d8', '70', '昆山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e3', '402881ec3f74d2d5013f74dc313a12d8', '75', '吴江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e4', '402881ec3f74d2d5013f74dc313a12d8', '80', '太仓市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e5', '402881ec3f74d2d5013f74dc311b12a8', '50', '南通市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e7', '402881ec3f74d2d5013f74dc314a12e5', '30', '崇川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e8', '402881ec3f74d2d5013f74dc314a12e5', '35', '港闸区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12e9', '402881ec3f74d2d5013f74dc314a12e5', '40', '海安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12ea', '402881ec3f74d2d5013f74dc314a12e5', '45', '如东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12eb', '402881ec3f74d2d5013f74dc314a12e5', '50', '启东市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12ec', '402881ec3f74d2d5013f74dc314a12e5', '55', '如皋市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12ed', '402881ec3f74d2d5013f74dc314a12e5', '60', '通州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12ee', '402881ec3f74d2d5013f74dc314a12e5', '65', '海门市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc314a12ef', '402881ec3f74d2d5013f74dc311b12a8', '55', '连云港市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f1', '402881ec3f74d2d5013f74dc314a12ef', '30', '连云区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f2', '402881ec3f74d2d5013f74dc314a12ef', '35', '新浦区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f3', '402881ec3f74d2d5013f74dc314a12ef', '40', '海州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f4', '402881ec3f74d2d5013f74dc314a12ef', '45', '赣榆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f5', '402881ec3f74d2d5013f74dc314a12ef', '50', '东海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f6', '402881ec3f74d2d5013f74dc314a12ef', '55', '灌云县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f7', '402881ec3f74d2d5013f74dc314a12ef', '60', '灌南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12f8', '402881ec3f74d2d5013f74dc311b12a8', '60', '淮安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12fa', '402881ec3f74d2d5013f74dc315a12f8', '30', '清河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12fb', '402881ec3f74d2d5013f74dc315a12f8', '35', '楚州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12fc', '402881ec3f74d2d5013f74dc315a12f8', '40', '淮阴区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12fd', '402881ec3f74d2d5013f74dc315a12f8', '45', '清浦区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12fe', '402881ec3f74d2d5013f74dc315a12f8', '50', '涟水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a12ff', '402881ec3f74d2d5013f74dc315a12f8', '55', '洪泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a1300', '402881ec3f74d2d5013f74dc315a12f8', '60', '盱眙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a1301', '402881ec3f74d2d5013f74dc315a12f8', '65', '金湖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc315a1302', '402881ec3f74d2d5013f74dc311b12a8', '65', '盐城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31691304', '402881ec3f74d2d5013f74dc315a1302', '30', '亭湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31691305', '402881ec3f74d2d5013f74dc315a1302', '35', '盐都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31691306', '402881ec3f74d2d5013f74dc315a1302', '40', '响水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31691307', '402881ec3f74d2d5013f74dc315a1302', '45', '滨海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31691308', '402881ec3f74d2d5013f74dc315a1302', '50', '阜宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31691309', '402881ec3f74d2d5013f74dc315a1302', '55', '射阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3169130a', '402881ec3f74d2d5013f74dc315a1302', '60', '建湖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3169130b', '402881ec3f74d2d5013f74dc315a1302', '65', '东台市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3169130c', '402881ec3f74d2d5013f74dc315a1302', '70', '大丰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3169130d', '402881ec3f74d2d5013f74dc311b12a8', '70', '扬州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3179130f', '402881ec3f74d2d5013f74dc3169130d', '30', '广陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31791310', '402881ec3f74d2d5013f74dc3169130d', '35', '邗江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31791311', '402881ec3f74d2d5013f74dc3169130d', '40', '郊　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31791312', '402881ec3f74d2d5013f74dc3169130d', '45', '宝应县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31791313', '402881ec3f74d2d5013f74dc3169130d', '50', '仪征市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31791314', '402881ec3f74d2d5013f74dc3169130d', '55', '高邮市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31791315', '402881ec3f74d2d5013f74dc3169130d', '60', '江都市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc31791316', '402881ec3f74d2d5013f74dc311b12a8', '75', '镇江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11318', '402881ec3f74d2d5013f74dc31791316', '30', '京口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11319', '402881ec3f74d2d5013f74dc31791316', '35', '润州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b1131a', '402881ec3f74d2d5013f74dc31791316', '40', '丹徒区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b1131b', '402881ec3f74d2d5013f74dc31791316', '45', '丹阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b1131c', '402881ec3f74d2d5013f74dc31791316', '50', '扬中市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b1131d', '402881ec3f74d2d5013f74dc31791316', '55', '句容市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b1131e', '402881ec3f74d2d5013f74dc311b12a8', '80', '泰州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11320', '402881ec3f74d2d5013f74dc32b1131e', '30', '海陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11321', '402881ec3f74d2d5013f74dc32b1131e', '35', '高港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11322', '402881ec3f74d2d5013f74dc32b1131e', '40', '兴化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11323', '402881ec3f74d2d5013f74dc32b1131e', '45', '靖江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11324', '402881ec3f74d2d5013f74dc32b1131e', '50', '泰兴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11325', '402881ec3f74d2d5013f74dc32b1131e', '55', '姜堰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32b11326', '402881ec3f74d2d5013f74dc311b12a8', '85', '宿迁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01328', '402881ec3f74d2d5013f74dc32b11326', '30', '宿城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01329', '402881ec3f74d2d5013f74dc32b11326', '35', '宿豫区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0132a', '402881ec3f74d2d5013f74dc32b11326', '40', '沭阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0132b', '402881ec3f74d2d5013f74dc32b11326', '45', '泗阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0132c', '402881ec3f74d2d5013f74dc32b11326', '50', '泗洪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0132d', '402881ea3f5b1d14013f5b1fdc080006', '75', '浙江省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0132e', '402881ec3f74d2d5013f74dc32c0132d', '25', '杭州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01330', '402881ec3f74d2d5013f74dc32c0132e', '30', '上城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01331', '402881ec3f74d2d5013f74dc32c0132e', '35', '下城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01332', '402881ec3f74d2d5013f74dc32c0132e', '40', '江干区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01333', '402881ec3f74d2d5013f74dc32c0132e', '45', '拱墅区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01334', '402881ec3f74d2d5013f74dc32c0132e', '50', '西湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01335', '402881ec3f74d2d5013f74dc32c0132e', '55', '滨江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01336', '402881ec3f74d2d5013f74dc32c0132e', '60', '萧山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01337', '402881ec3f74d2d5013f74dc32c0132e', '65', '余杭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01338', '402881ec3f74d2d5013f74dc32c0132e', '70', '桐庐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c01339', '402881ec3f74d2d5013f74dc32c0132e', '75', '淳安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0133a', '402881ec3f74d2d5013f74dc32c0132e', '80', '建德市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0133b', '402881ec3f74d2d5013f74dc32c0132e', '85', '富阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0133c', '402881ec3f74d2d5013f74dc32c0132e', '90', '临安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32c0133d', '402881ec3f74d2d5013f74dc32c0132d', '30', '宁波市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d1133f', '402881ec3f74d2d5013f74dc32c0133d', '30', '海曙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11340', '402881ec3f74d2d5013f74dc32c0133d', '35', '江东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11341', '402881ec3f74d2d5013f74dc32c0133d', '40', '江北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11342', '402881ec3f74d2d5013f74dc32c0133d', '45', '北仑区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11343', '402881ec3f74d2d5013f74dc32c0133d', '50', '镇海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11344', '402881ec3f74d2d5013f74dc32c0133d', '55', '鄞州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11345', '402881ec3f74d2d5013f74dc32c0133d', '60', '象山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11346', '402881ec3f74d2d5013f74dc32c0133d', '65', '宁海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11347', '402881ec3f74d2d5013f74dc32c0133d', '70', '余姚市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11348', '402881ec3f74d2d5013f74dc32c0133d', '75', '慈溪市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d11349', '402881ec3f74d2d5013f74dc32c0133d', '80', '奉化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32d1134a', '402881ec3f74d2d5013f74dc32c0132d', '35', '温州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e1134c', '402881ec3f74d2d5013f74dc32d1134a', '30', '鹿城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e1134d', '402881ec3f74d2d5013f74dc32d1134a', '35', '龙湾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e1134e', '402881ec3f74d2d5013f74dc32d1134a', '40', '瓯海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e1134f', '402881ec3f74d2d5013f74dc32d1134a', '45', '洞头县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11350', '402881ec3f74d2d5013f74dc32d1134a', '50', '永嘉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11351', '402881ec3f74d2d5013f74dc32d1134a', '55', '平阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11352', '402881ec3f74d2d5013f74dc32d1134a', '60', '苍南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11353', '402881ec3f74d2d5013f74dc32d1134a', '65', '文成县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11354', '402881ec3f74d2d5013f74dc32d1134a', '70', '泰顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11355', '402881ec3f74d2d5013f74dc32d1134a', '75', '瑞安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11356', '402881ec3f74d2d5013f74dc32d1134a', '80', '乐清市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32e11357', '402881ec3f74d2d5013f74dc32c0132d', '40', '嘉兴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f01359', '402881ec3f74d2d5013f74dc32e11357', '30', '秀城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f0135a', '402881ec3f74d2d5013f74dc32e11357', '35', '秀洲区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f0135b', '402881ec3f74d2d5013f74dc32e11357', '40', '嘉善县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f0135c', '402881ec3f74d2d5013f74dc32e11357', '45', '海盐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f0135d', '402881ec3f74d2d5013f74dc32e11357', '50', '海宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f0135e', '402881ec3f74d2d5013f74dc32e11357', '55', '平湖市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f0135f', '402881ec3f74d2d5013f74dc32e11357', '60', '桐乡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc32f01360', '402881ec3f74d2d5013f74dc32c0132d', '45', '湖州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33001362', '402881ec3f74d2d5013f74dc32f01360', '30', '吴兴区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33001363', '402881ec3f74d2d5013f74dc32f01360', '35', '南浔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33001364', '402881ec3f74d2d5013f74dc32f01360', '40', '德清县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33001365', '402881ec3f74d2d5013f74dc32f01360', '45', '长兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33001366', '402881ec3f74d2d5013f74dc32f01360', '50', '安吉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33001367', '402881ec3f74d2d5013f74dc32c0132d', '50', '绍兴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc330f1369', '402881ec3f74d2d5013f74dc33001367', '30', '越城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc330f136a', '402881ec3f74d2d5013f74dc33001367', '35', '绍兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc330f136b', '402881ec3f74d2d5013f74dc33001367', '40', '新昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc330f136c', '402881ec3f74d2d5013f74dc33001367', '45', '诸暨市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc330f136d', '402881ec3f74d2d5013f74dc33001367', '50', '上虞市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc330f136e', '402881ec3f74d2d5013f74dc33001367', '55', '嵊州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc330f136f', '402881ec3f74d2d5013f74dc32c0132d', '55', '金华市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1371', '402881ec3f74d2d5013f74dc330f136f', '30', '婺城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1372', '402881ec3f74d2d5013f74dc330f136f', '35', '金东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1373', '402881ec3f74d2d5013f74dc330f136f', '40', '武义县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1374', '402881ec3f74d2d5013f74dc330f136f', '45', '浦江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1375', '402881ec3f74d2d5013f74dc330f136f', '50', '磐安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1376', '402881ec3f74d2d5013f74dc330f136f', '55', '兰溪市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1377', '402881ec3f74d2d5013f74dc330f136f', '60', '义乌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1378', '402881ec3f74d2d5013f74dc330f136f', '65', '东阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1379', '402881ec3f74d2d5013f74dc330f136f', '70', '永康市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f137a', '402881ec3f74d2d5013f74dc32c0132d', '60', '衢州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f137c', '402881ec3f74d2d5013f74dc331f137a', '30', '柯城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f137d', '402881ec3f74d2d5013f74dc331f137a', '35', '衢江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f137e', '402881ec3f74d2d5013f74dc331f137a', '40', '常山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f137f', '402881ec3f74d2d5013f74dc331f137a', '45', '开化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1380', '402881ec3f74d2d5013f74dc331f137a', '50', '龙游县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1381', '402881ec3f74d2d5013f74dc331f137a', '55', '江山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc331f1382', '402881ec3f74d2d5013f74dc32c0132d', '65', '舟山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc332f1384', '402881ec3f74d2d5013f74dc331f1382', '30', '定海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc332f1385', '402881ec3f74d2d5013f74dc331f1382', '35', '普陀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc332f1386', '402881ec3f74d2d5013f74dc331f1382', '40', '岱山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc332f1387', '402881ec3f74d2d5013f74dc331f1382', '45', '嵊泗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc332f1388', '402881ec3f74d2d5013f74dc32c0132d', '70', '台州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e138a', '402881ec3f74d2d5013f74dc332f1388', '30', '椒江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e138b', '402881ec3f74d2d5013f74dc332f1388', '35', '黄岩区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e138c', '402881ec3f74d2d5013f74dc332f1388', '40', '路桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e138d', '402881ec3f74d2d5013f74dc332f1388', '45', '玉环县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e138e', '402881ec3f74d2d5013f74dc332f1388', '50', '三门县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e138f', '402881ec3f74d2d5013f74dc332f1388', '55', '天台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1390', '402881ec3f74d2d5013f74dc332f1388', '60', '仙居县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1391', '402881ec3f74d2d5013f74dc332f1388', '65', '温岭市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1392', '402881ec3f74d2d5013f74dc332f1388', '70', '临海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1393', '402881ec3f74d2d5013f74dc32c0132d', '75', '丽水市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1395', '402881ec3f74d2d5013f74dc334e1393', '30', '莲都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1396', '402881ec3f74d2d5013f74dc334e1393', '35', '青田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1397', '402881ec3f74d2d5013f74dc334e1393', '40', '缙云县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1398', '402881ec3f74d2d5013f74dc334e1393', '45', '遂昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e1399', '402881ec3f74d2d5013f74dc334e1393', '50', '松阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e139a', '402881ec3f74d2d5013f74dc334e1393', '55', '云和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e139b', '402881ec3f74d2d5013f74dc334e1393', '60', '庆元县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e139c', '402881ec3f74d2d5013f74dc334e1393', '65', '景宁畲族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e139d', '402881ec3f74d2d5013f74dc334e1393', '70', '龙泉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc334e139e', '402881ea3f5b1d14013f5b1fdc080006', '80', '安徽省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc335d139f', '402881ec3f74d2d5013f74dc334e139e', '25', '合肥市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a1', '402881ec3f74d2d5013f74dc335d139f', '30', '瑶海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a2', '402881ec3f74d2d5013f74dc335d139f', '35', '庐阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a3', '402881ec3f74d2d5013f74dc335d139f', '40', '蜀山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a4', '402881ec3f74d2d5013f74dc335d139f', '45', '包河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a5', '402881ec3f74d2d5013f74dc335d139f', '50', '长丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a6', '402881ec3f74d2d5013f74dc335d139f', '55', '肥东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a7', '402881ec3f74d2d5013f74dc335d139f', '60', '肥西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13a8', '402881ec3f74d2d5013f74dc334e139e', '30', '芜湖市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13aa', '402881ec3f74d2d5013f74dc336d13a8', '30', '镜湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13ab', '402881ec3f74d2d5013f74dc336d13a8', '35', '马塘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13ac', '402881ec3f74d2d5013f74dc336d13a8', '40', '新芜区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13ad', '402881ec3f74d2d5013f74dc336d13a8', '45', '鸠江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13ae', '402881ec3f74d2d5013f74dc336d13a8', '50', '芜湖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13af', '402881ec3f74d2d5013f74dc336d13a8', '55', '繁昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13b0', '402881ec3f74d2d5013f74dc336d13a8', '60', '南陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc336d13b1', '402881ec3f74d2d5013f74dc334e139e', '35', '蚌埠市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13b3', '402881ec3f74d2d5013f74dc336d13b1', '30', '龙子湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13b4', '402881ec3f74d2d5013f74dc336d13b1', '35', '蚌山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13b5', '402881ec3f74d2d5013f74dc336d13b1', '40', '禹会区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13b6', '402881ec3f74d2d5013f74dc336d13b1', '45', '淮上区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13b7', '402881ec3f74d2d5013f74dc336d13b1', '50', '怀远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13b8', '402881ec3f74d2d5013f74dc336d13b1', '55', '五河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13b9', '402881ec3f74d2d5013f74dc336d13b1', '60', '固镇县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13ba', '402881ec3f74d2d5013f74dc334e139e', '40', '淮南市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc337d13bc', '402881ec3f74d2d5013f74dc337d13ba', '30', '大通区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13bd', '402881ec3f74d2d5013f74dc337d13ba', '35', '田家庵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13be', '402881ec3f74d2d5013f74dc337d13ba', '40', '谢家集区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13bf', '402881ec3f74d2d5013f74dc337d13ba', '45', '八公山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c0', '402881ec3f74d2d5013f74dc337d13ba', '50', '潘集区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c1', '402881ec3f74d2d5013f74dc337d13ba', '55', '凤台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c2', '402881ec3f74d2d5013f74dc334e139e', '45', '马鞍山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c4', '402881ec3f74d2d5013f74dc338c13c2', '30', '金家庄区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c5', '402881ec3f74d2d5013f74dc338c13c2', '35', '花山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c6', '402881ec3f74d2d5013f74dc338c13c2', '40', '雨山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c7', '402881ec3f74d2d5013f74dc338c13c2', '45', '当涂县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc338c13c8', '402881ec3f74d2d5013f74dc334e139e', '50', '淮北市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc339c13ca', '402881ec3f74d2d5013f74dc338c13c8', '30', '杜集区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc339c13cb', '402881ec3f74d2d5013f74dc338c13c8', '35', '相山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc339c13cc', '402881ec3f74d2d5013f74dc338c13c8', '40', '烈山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc339c13cd', '402881ec3f74d2d5013f74dc338c13c8', '45', '濉溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc339c13ce', '402881ec3f74d2d5013f74dc334e139e', '55', '铜陵市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ab13d0', '402881ec3f74d2d5013f74dc339c13ce', '30', '铜官山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ab13d1', '402881ec3f74d2d5013f74dc339c13ce', '35', '狮子山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ab13d2', '402881ec3f74d2d5013f74dc339c13ce', '40', '郊　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ab13d3', '402881ec3f74d2d5013f74dc339c13ce', '45', '铜陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ab13d4', '402881ec3f74d2d5013f74dc334e139e', '60', '安庆市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13d6', '402881ec3f74d2d5013f74dc33ab13d4', '30', '迎江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13d7', '402881ec3f74d2d5013f74dc33ab13d4', '35', '大观区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13d8', '402881ec3f74d2d5013f74dc33ab13d4', '40', '郊　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13d9', '402881ec3f74d2d5013f74dc33ab13d4', '45', '怀宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13da', '402881ec3f74d2d5013f74dc33ab13d4', '50', '枞阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13db', '402881ec3f74d2d5013f74dc33ab13d4', '55', '潜山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13dc', '402881ec3f74d2d5013f74dc33ab13d4', '60', '太湖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13dd', '402881ec3f74d2d5013f74dc33ab13d4', '65', '宿松县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13de', '402881ec3f74d2d5013f74dc33ab13d4', '70', '望江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13df', '402881ec3f74d2d5013f74dc33ab13d4', '75', '岳西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e0', '402881ec3f74d2d5013f74dc33ab13d4', '80', '桐城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e1', '402881ec3f74d2d5013f74dc334e139e', '65', '黄山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e3', '402881ec3f74d2d5013f74dc33bb13e1', '30', '屯溪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e4', '402881ec3f74d2d5013f74dc33bb13e1', '35', '黄山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e5', '402881ec3f74d2d5013f74dc33bb13e1', '40', '徽州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e6', '402881ec3f74d2d5013f74dc33bb13e1', '45', '歙　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e7', '402881ec3f74d2d5013f74dc33bb13e1', '50', '休宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33bb13e8', '402881ec3f74d2d5013f74dc33bb13e1', '55', '黟　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13e9', '402881ec3f74d2d5013f74dc33bb13e1', '60', '祁门县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13ea', '402881ec3f74d2d5013f74dc334e139e', '70', '滁州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13ec', '402881ec3f74d2d5013f74dc33cb13ea', '30', '琅琊区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13ed', '402881ec3f74d2d5013f74dc33cb13ea', '35', '南谯区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13ee', '402881ec3f74d2d5013f74dc33cb13ea', '40', '来安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13ef', '402881ec3f74d2d5013f74dc33cb13ea', '45', '全椒县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f0', '402881ec3f74d2d5013f74dc33cb13ea', '50', '定远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f1', '402881ec3f74d2d5013f74dc33cb13ea', '55', '凤阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f2', '402881ec3f74d2d5013f74dc33cb13ea', '60', '天长市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f3', '402881ec3f74d2d5013f74dc33cb13ea', '65', '明光市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f4', '402881ec3f74d2d5013f74dc334e139e', '75', '阜阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f6', '402881ec3f74d2d5013f74dc33cb13f4', '30', '颍州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f7', '402881ec3f74d2d5013f74dc33cb13f4', '35', '颍东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33cb13f8', '402881ec3f74d2d5013f74dc33cb13f4', '40', '颍泉区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da13f9', '402881ec3f74d2d5013f74dc33cb13f4', '45', '临泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da13fa', '402881ec3f74d2d5013f74dc33cb13f4', '50', '太和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da13fb', '402881ec3f74d2d5013f74dc33cb13f4', '55', '阜南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da13fc', '402881ec3f74d2d5013f74dc33cb13f4', '60', '颍上县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da13fd', '402881ec3f74d2d5013f74dc33cb13f4', '65', '界首市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da13fe', '402881ec3f74d2d5013f74dc334e139e', '80', '宿州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da1400', '402881ec3f74d2d5013f74dc33da13fe', '30', '墉桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da1401', '402881ec3f74d2d5013f74dc33da13fe', '35', '砀山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da1402', '402881ec3f74d2d5013f74dc33da13fe', '40', '萧　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da1403', '402881ec3f74d2d5013f74dc33da13fe', '45', '灵璧县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da1404', '402881ec3f74d2d5013f74dc33da13fe', '50', '泗　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33da1405', '402881ec3f74d2d5013f74dc334e139e', '85', '巢湖市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ea1407', '402881ec3f74d2d5013f74dc33da1405', '30', '居巢区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ea1408', '402881ec3f74d2d5013f74dc33da1405', '35', '庐江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ea1409', '402881ec3f74d2d5013f74dc33da1405', '40', '无为县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ea140a', '402881ec3f74d2d5013f74dc33da1405', '45', '含山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ea140b', '402881ec3f74d2d5013f74dc33da1405', '50', '和　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33ea140c', '402881ec3f74d2d5013f74dc334e139e', '90', '六安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f9140e', '402881ec3f74d2d5013f74dc33ea140c', '30', '金安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f9140f', '402881ec3f74d2d5013f74dc33ea140c', '35', '裕安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91410', '402881ec3f74d2d5013f74dc33ea140c', '40', '寿　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91411', '402881ec3f74d2d5013f74dc33ea140c', '45', '霍邱县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91412', '402881ec3f74d2d5013f74dc33ea140c', '50', '舒城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91413', '402881ec3f74d2d5013f74dc33ea140c', '55', '金寨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91414', '402881ec3f74d2d5013f74dc33ea140c', '60', '霍山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91415', '402881ec3f74d2d5013f74dc334e139e', '95', '亳州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91417', '402881ec3f74d2d5013f74dc33f91415', '30', '谯城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91418', '402881ec3f74d2d5013f74dc33f91415', '35', '涡阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f91419', '402881ec3f74d2d5013f74dc33f91415', '40', '蒙城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f9141a', '402881ec3f74d2d5013f74dc33f91415', '45', '利辛县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc33f9141b', '402881ec3f74d2d5013f74dc334e139e', '100', '池州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3409141d', '402881ec3f74d2d5013f74dc33f9141b', '30', '贵池区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3409141e', '402881ec3f74d2d5013f74dc33f9141b', '35', '东至县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3409141f', '402881ec3f74d2d5013f74dc33f9141b', '40', '石台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091420', '402881ec3f74d2d5013f74dc33f9141b', '45', '青阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091421', '402881ec3f74d2d5013f74dc334e139e', '105', '宣城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091423', '402881ec3f74d2d5013f74dc34091421', '30', '宣州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091424', '402881ec3f74d2d5013f74dc34091421', '35', '郎溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091425', '402881ec3f74d2d5013f74dc34091421', '40', '广德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091426', '402881ec3f74d2d5013f74dc34091421', '45', '泾　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091427', '402881ec3f74d2d5013f74dc34091421', '50', '绩溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091428', '402881ec3f74d2d5013f74dc34091421', '55', '旌德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34091429', '402881ec3f74d2d5013f74dc34091421', '60', '宁国市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3409142a', '402881ea3f5b1d14013f5b1fdc080006', '85', '福建省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3419142b', '402881ec3f74d2d5013f74dc3409142a', '25', '福州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3419142d', '402881ec3f74d2d5013f74dc3419142b', '30', '鼓楼区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3419142e', '402881ec3f74d2d5013f74dc3419142b', '35', '台江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3419142f', '402881ec3f74d2d5013f74dc3419142b', '40', '仓山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191430', '402881ec3f74d2d5013f74dc3419142b', '45', '马尾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191431', '402881ec3f74d2d5013f74dc3419142b', '50', '晋安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191432', '402881ec3f74d2d5013f74dc3419142b', '55', '闽侯县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191433', '402881ec3f74d2d5013f74dc3419142b', '60', '连江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191434', '402881ec3f74d2d5013f74dc3419142b', '65', '罗源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191435', '402881ec3f74d2d5013f74dc3419142b', '70', '闽清县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191436', '402881ec3f74d2d5013f74dc3419142b', '75', '永泰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191437', '402881ec3f74d2d5013f74dc3419142b', '80', '平潭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191438', '402881ec3f74d2d5013f74dc3419142b', '85', '福清市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34191439', '402881ec3f74d2d5013f74dc3419142b', '90', '长乐市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3419143a', '402881ec3f74d2d5013f74dc3409142a', '30', '厦门市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3428143c', '402881ec3f74d2d5013f74dc3419143a', '30', '思明区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3428143d', '402881ec3f74d2d5013f74dc3419143a', '35', '海沧区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3428143e', '402881ec3f74d2d5013f74dc3419143a', '40', '湖里区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3428143f', '402881ec3f74d2d5013f74dc3419143a', '45', '集美区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34281440', '402881ec3f74d2d5013f74dc3419143a', '50', '同安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34281441', '402881ec3f74d2d5013f74dc3419143a', '55', '翔安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34281442', '402881ec3f74d2d5013f74dc3409142a', '35', '莆田市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34381444', '402881ec3f74d2d5013f74dc34281442', '30', '城厢区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34381445', '402881ec3f74d2d5013f74dc34281442', '35', '涵江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34381446', '402881ec3f74d2d5013f74dc34281442', '40', '荔城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34381447', '402881ec3f74d2d5013f74dc34281442', '45', '秀屿区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34381448', '402881ec3f74d2d5013f74dc34281442', '50', '仙游县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34381449', '402881ec3f74d2d5013f74dc3409142a', '40', '三明市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447144b', '402881ec3f74d2d5013f74dc34381449', '30', '梅列区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447144c', '402881ec3f74d2d5013f74dc34381449', '35', '三元区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447144d', '402881ec3f74d2d5013f74dc34381449', '40', '明溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447144e', '402881ec3f74d2d5013f74dc34381449', '45', '清流县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447144f', '402881ec3f74d2d5013f74dc34381449', '50', '宁化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471450', '402881ec3f74d2d5013f74dc34381449', '55', '大田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471451', '402881ec3f74d2d5013f74dc34381449', '60', '尤溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471452', '402881ec3f74d2d5013f74dc34381449', '65', '沙　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471453', '402881ec3f74d2d5013f74dc34381449', '70', '将乐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471454', '402881ec3f74d2d5013f74dc34381449', '75', '泰宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471455', '402881ec3f74d2d5013f74dc34381449', '80', '建宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471456', '402881ec3f74d2d5013f74dc34381449', '85', '永安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471457', '402881ec3f74d2d5013f74dc3409142a', '45', '泉州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471459', '402881ec3f74d2d5013f74dc34471457', '30', '鲤城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447145a', '402881ec3f74d2d5013f74dc34471457', '35', '丰泽区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447145b', '402881ec3f74d2d5013f74dc34471457', '40', '洛江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447145c', '402881ec3f74d2d5013f74dc34471457', '45', '泉港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447145d', '402881ec3f74d2d5013f74dc34471457', '50', '惠安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447145e', '402881ec3f74d2d5013f74dc34471457', '55', '安溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447145f', '402881ec3f74d2d5013f74dc34471457', '60', '永春县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471460', '402881ec3f74d2d5013f74dc34471457', '65', '德化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471461', '402881ec3f74d2d5013f74dc34471457', '70', '金门县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471462', '402881ec3f74d2d5013f74dc34471457', '75', '石狮市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471463', '402881ec3f74d2d5013f74dc34471457', '80', '晋江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471464', '402881ec3f74d2d5013f74dc34471457', '85', '南安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471465', '402881ec3f74d2d5013f74dc3409142a', '50', '漳州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471467', '402881ec3f74d2d5013f74dc34471465', '30', '芗城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471468', '402881ec3f74d2d5013f74dc34471465', '35', '龙文区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471469', '402881ec3f74d2d5013f74dc34471465', '40', '云霄县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447146a', '402881ec3f74d2d5013f74dc34471465', '45', '漳浦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447146b', '402881ec3f74d2d5013f74dc34471465', '50', '诏安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447146c', '402881ec3f74d2d5013f74dc34471465', '55', '长泰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447146d', '402881ec3f74d2d5013f74dc34471465', '60', '东山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447146e', '402881ec3f74d2d5013f74dc34471465', '65', '南靖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3447146f', '402881ec3f74d2d5013f74dc34471465', '70', '平和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471470', '402881ec3f74d2d5013f74dc34471465', '75', '华安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471471', '402881ec3f74d2d5013f74dc34471465', '80', '龙海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34471472', '402881ec3f74d2d5013f74dc3409142a', '55', '南平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571474', '402881ec3f74d2d5013f74dc34471472', '30', '延平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571475', '402881ec3f74d2d5013f74dc34471472', '35', '顺昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571476', '402881ec3f74d2d5013f74dc34471472', '40', '浦城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571477', '402881ec3f74d2d5013f74dc34471472', '45', '光泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571478', '402881ec3f74d2d5013f74dc34471472', '50', '松溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571479', '402881ec3f74d2d5013f74dc34471472', '55', '政和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3457147a', '402881ec3f74d2d5013f74dc34471472', '60', '邵武市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3457147b', '402881ec3f74d2d5013f74dc34471472', '65', '武夷山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3457147c', '402881ec3f74d2d5013f74dc34471472', '70', '建瓯市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3457147d', '402881ec3f74d2d5013f74dc34471472', '75', '建阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3457147e', '402881ec3f74d2d5013f74dc3409142a', '60', '龙岩市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571480', '402881ec3f74d2d5013f74dc3457147e', '30', '新罗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571481', '402881ec3f74d2d5013f74dc3457147e', '35', '长汀县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571482', '402881ec3f74d2d5013f74dc3457147e', '40', '永定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571483', '402881ec3f74d2d5013f74dc3457147e', '45', '上杭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571484', '402881ec3f74d2d5013f74dc3457147e', '50', '武平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571485', '402881ec3f74d2d5013f74dc3457147e', '55', '连城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571486', '402881ec3f74d2d5013f74dc3457147e', '60', '漳平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34571487', '402881ec3f74d2d5013f74dc3409142a', '65', '宁德市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34671489', '402881ec3f74d2d5013f74dc34571487', '30', '蕉城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3467148a', '402881ec3f74d2d5013f74dc34571487', '35', '霞浦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3467148b', '402881ec3f74d2d5013f74dc34571487', '40', '古田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3467148c', '402881ec3f74d2d5013f74dc34571487', '45', '屏南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3467148d', '402881ec3f74d2d5013f74dc34571487', '50', '寿宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3467148e', '402881ec3f74d2d5013f74dc34571487', '55', '周宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3467148f', '402881ec3f74d2d5013f74dc34571487', '60', '柘荣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34671490', '402881ec3f74d2d5013f74dc34571487', '65', '福安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34671491', '402881ec3f74d2d5013f74dc34571487', '70', '福鼎市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34671492', '402881ea3f5b1d14013f5b1fdc080006', '90', '江西省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34761493', '402881ec3f74d2d5013f74dc34671492', '25', '南昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34861495', '402881ec3f74d2d5013f74dc34761493', '30', '东湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34861496', '402881ec3f74d2d5013f74dc34761493', '35', '西湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34861497', '402881ec3f74d2d5013f74dc34761493', '40', '青云谱区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34861498', '402881ec3f74d2d5013f74dc34761493', '45', '湾里区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34861499', '402881ec3f74d2d5013f74dc34761493', '50', '青山湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3486149a', '402881ec3f74d2d5013f74dc34761493', '55', '南昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3486149b', '402881ec3f74d2d5013f74dc34761493', '60', '新建县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3486149c', '402881ec3f74d2d5013f74dc34761493', '65', '安义县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3486149d', '402881ec3f74d2d5013f74dc34761493', '70', '进贤县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3486149e', '402881ec3f74d2d5013f74dc34671492', '30', '景德镇市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc348614a0', '402881ec3f74d2d5013f74dc3486149e', '30', '昌江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc348614a1', '402881ec3f74d2d5013f74dc3486149e', '35', '珠山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc348614a2', '402881ec3f74d2d5013f74dc3486149e', '40', '浮梁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc348614a3', '402881ec3f74d2d5013f74dc3486149e', '45', '乐平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc348614a4', '402881ec3f74d2d5013f74dc34671492', '35', '萍乡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514a6', '402881ec3f74d2d5013f74dc348614a4', '30', '安源区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514a7', '402881ec3f74d2d5013f74dc348614a4', '35', '湘东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514a8', '402881ec3f74d2d5013f74dc348614a4', '40', '莲花县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514a9', '402881ec3f74d2d5013f74dc348614a4', '45', '上栗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514aa', '402881ec3f74d2d5013f74dc348614a4', '50', '芦溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514ab', '402881ec3f74d2d5013f74dc34671492', '40', '九江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514ad', '402881ec3f74d2d5013f74dc349514ab', '30', '庐山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514ae', '402881ec3f74d2d5013f74dc349514ab', '35', '浔阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514af', '402881ec3f74d2d5013f74dc349514ab', '40', '九江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b0', '402881ec3f74d2d5013f74dc349514ab', '45', '武宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b1', '402881ec3f74d2d5013f74dc349514ab', '50', '修水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b2', '402881ec3f74d2d5013f74dc349514ab', '55', '永修县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b3', '402881ec3f74d2d5013f74dc349514ab', '60', '德安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b4', '402881ec3f74d2d5013f74dc349514ab', '65', '星子县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b5', '402881ec3f74d2d5013f74dc349514ab', '70', '都昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b6', '402881ec3f74d2d5013f74dc349514ab', '75', '湖口县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b7', '402881ec3f74d2d5013f74dc349514ab', '80', '彭泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b8', '402881ec3f74d2d5013f74dc349514ab', '85', '瑞昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc349514b9', '402881ec3f74d2d5013f74dc34671492', '45', '新余市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34a514bb', '402881ec3f74d2d5013f74dc349514b9', '30', '渝水区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34a514bc', '402881ec3f74d2d5013f74dc349514b9', '35', '分宜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34a514bd', '402881ec3f74d2d5013f74dc34671492', '50', '鹰潭市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34a514bf', '402881ec3f74d2d5013f74dc34a514bd', '30', '月湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34a514c0', '402881ec3f74d2d5013f74dc34a514bd', '35', '余江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34a514c1', '402881ec3f74d2d5013f74dc34a514bd', '40', '贵溪市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34a514c2', '402881ec3f74d2d5013f74dc34671492', '55', '赣州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514c4', '402881ec3f74d2d5013f74dc34a514c2', '30', '章贡区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514c5', '402881ec3f74d2d5013f74dc34a514c2', '35', '赣　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514c6', '402881ec3f74d2d5013f74dc34a514c2', '40', '信丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514c7', '402881ec3f74d2d5013f74dc34a514c2', '45', '大余县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514c8', '402881ec3f74d2d5013f74dc34a514c2', '50', '上犹县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514c9', '402881ec3f74d2d5013f74dc34a514c2', '55', '崇义县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514ca', '402881ec3f74d2d5013f74dc34a514c2', '60', '安远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514cb', '402881ec3f74d2d5013f74dc34a514c2', '65', '龙南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514cc', '402881ec3f74d2d5013f74dc34a514c2', '70', '定南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514cd', '402881ec3f74d2d5013f74dc34a514c2', '75', '全南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514ce', '402881ec3f74d2d5013f74dc34a514c2', '80', '宁都县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514cf', '402881ec3f74d2d5013f74dc34a514c2', '85', '于都县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d0', '402881ec3f74d2d5013f74dc34a514c2', '90', '兴国县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d1', '402881ec3f74d2d5013f74dc34a514c2', '95', '会昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d2', '402881ec3f74d2d5013f74dc34a514c2', '100', '寻乌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d3', '402881ec3f74d2d5013f74dc34a514c2', '105', '石城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d4', '402881ec3f74d2d5013f74dc34a514c2', '110', '瑞金市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d5', '402881ec3f74d2d5013f74dc34a514c2', '115', '南康市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d6', '402881ec3f74d2d5013f74dc34671492', '60', '吉安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d8', '402881ec3f74d2d5013f74dc34b514d6', '30', '吉州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34b514d9', '402881ec3f74d2d5013f74dc34b514d6', '35', '青原区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414da', '402881ec3f74d2d5013f74dc34b514d6', '40', '吉安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414db', '402881ec3f74d2d5013f74dc34b514d6', '45', '吉水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414dc', '402881ec3f74d2d5013f74dc34b514d6', '50', '峡江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414dd', '402881ec3f74d2d5013f74dc34b514d6', '55', '新干县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414de', '402881ec3f74d2d5013f74dc34b514d6', '60', '永丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414df', '402881ec3f74d2d5013f74dc34b514d6', '65', '泰和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e0', '402881ec3f74d2d5013f74dc34b514d6', '70', '遂川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e1', '402881ec3f74d2d5013f74dc34b514d6', '75', '万安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e2', '402881ec3f74d2d5013f74dc34b514d6', '80', '安福县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e3', '402881ec3f74d2d5013f74dc34b514d6', '85', '永新县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e4', '402881ec3f74d2d5013f74dc34b514d6', '90', '井冈山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e5', '402881ec3f74d2d5013f74dc34671492', '65', '宜春市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e7', '402881ec3f74d2d5013f74dc34c414e5', '30', '袁州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e8', '402881ec3f74d2d5013f74dc34c414e5', '35', '奉新县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414e9', '402881ec3f74d2d5013f74dc34c414e5', '40', '万载县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414ea', '402881ec3f74d2d5013f74dc34c414e5', '45', '上高县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414eb', '402881ec3f74d2d5013f74dc34c414e5', '50', '宜丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414ec', '402881ec3f74d2d5013f74dc34c414e5', '55', '靖安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414ed', '402881ec3f74d2d5013f74dc34c414e5', '60', '铜鼓县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414ee', '402881ec3f74d2d5013f74dc34c414e5', '65', '丰城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414ef', '402881ec3f74d2d5013f74dc34c414e5', '70', '樟树市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414f0', '402881ec3f74d2d5013f74dc34c414e5', '75', '高安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34c414f1', '402881ec3f74d2d5013f74dc34671492', '70', '抚州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414f3', '402881ec3f74d2d5013f74dc34c414f1', '30', '临川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414f4', '402881ec3f74d2d5013f74dc34c414f1', '35', '南城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414f5', '402881ec3f74d2d5013f74dc34c414f1', '40', '黎川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414f6', '402881ec3f74d2d5013f74dc34c414f1', '45', '南丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414f7', '402881ec3f74d2d5013f74dc34c414f1', '50', '崇仁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414f8', '402881ec3f74d2d5013f74dc34c414f1', '55', '乐安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414f9', '402881ec3f74d2d5013f74dc34c414f1', '60', '宜黄县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414fa', '402881ec3f74d2d5013f74dc34c414f1', '65', '金溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414fb', '402881ec3f74d2d5013f74dc34c414f1', '70', '资溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414fc', '402881ec3f74d2d5013f74dc34c414f1', '75', '东乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414fd', '402881ec3f74d2d5013f74dc34c414f1', '80', '广昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d414fe', '402881ec3f74d2d5013f74dc34671492', '75', '上饶市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41500', '402881ec3f74d2d5013f74dc34d414fe', '30', '信州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41501', '402881ec3f74d2d5013f74dc34d414fe', '35', '上饶县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41502', '402881ec3f74d2d5013f74dc34d414fe', '40', '广丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41503', '402881ec3f74d2d5013f74dc34d414fe', '45', '玉山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41504', '402881ec3f74d2d5013f74dc34d414fe', '50', '铅山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41505', '402881ec3f74d2d5013f74dc34d414fe', '55', '横峰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41506', '402881ec3f74d2d5013f74dc34d414fe', '60', '弋阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41507', '402881ec3f74d2d5013f74dc34d414fe', '65', '余干县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41508', '402881ec3f74d2d5013f74dc34d414fe', '70', '鄱阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d41509', '402881ec3f74d2d5013f74dc34d414fe', '75', '万年县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d4150a', '402881ec3f74d2d5013f74dc34d414fe', '80', '婺源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d4150b', '402881ec3f74d2d5013f74dc34d414fe', '85', '德兴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34d4150c', '402881ea3f5b1d14013f5b1fdc080006', '95', '山东省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34e3150d', '402881ec3f74d2d5013f74dc34d4150c', '25', '济南市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f3150f', '402881ec3f74d2d5013f74dc34e3150d', '30', '历下区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31510', '402881ec3f74d2d5013f74dc34e3150d', '35', '市中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31511', '402881ec3f74d2d5013f74dc34e3150d', '40', '槐荫区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31512', '402881ec3f74d2d5013f74dc34e3150d', '45', '天桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31513', '402881ec3f74d2d5013f74dc34e3150d', '50', '历城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31514', '402881ec3f74d2d5013f74dc34e3150d', '55', '长清区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31515', '402881ec3f74d2d5013f74dc34e3150d', '60', '平阴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31516', '402881ec3f74d2d5013f74dc34e3150d', '65', '济阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31517', '402881ec3f74d2d5013f74dc34e3150d', '70', '商河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31518', '402881ec3f74d2d5013f74dc34e3150d', '75', '章丘市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc34f31519', '402881ec3f74d2d5013f74dc34d4150c', '30', '青岛市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503151b', '402881ec3f74d2d5013f74dc34f31519', '30', '市南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503151c', '402881ec3f74d2d5013f74dc34f31519', '35', '市北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503151d', '402881ec3f74d2d5013f74dc34f31519', '40', '四方区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503151e', '402881ec3f74d2d5013f74dc34f31519', '45', '黄岛区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503151f', '402881ec3f74d2d5013f74dc34f31519', '50', '崂山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031520', '402881ec3f74d2d5013f74dc34f31519', '55', '李沧区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031521', '402881ec3f74d2d5013f74dc34f31519', '60', '城阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031522', '402881ec3f74d2d5013f74dc34f31519', '65', '胶州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031523', '402881ec3f74d2d5013f74dc34f31519', '70', '即墨市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031524', '402881ec3f74d2d5013f74dc34f31519', '75', '平度市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031525', '402881ec3f74d2d5013f74dc34f31519', '80', '胶南市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031526', '402881ec3f74d2d5013f74dc34f31519', '85', '莱西市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031527', '402881ec3f74d2d5013f74dc34d4150c', '35', '淄博市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031529', '402881ec3f74d2d5013f74dc35031527', '30', '淄川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503152a', '402881ec3f74d2d5013f74dc35031527', '35', '张店区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503152b', '402881ec3f74d2d5013f74dc35031527', '40', '博山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503152c', '402881ec3f74d2d5013f74dc35031527', '45', '临淄区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503152d', '402881ec3f74d2d5013f74dc35031527', '50', '周村区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503152e', '402881ec3f74d2d5013f74dc35031527', '55', '桓台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3503152f', '402881ec3f74d2d5013f74dc35031527', '60', '高青县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031530', '402881ec3f74d2d5013f74dc35031527', '65', '沂源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35031531', '402881ec3f74d2d5013f74dc34d4150c', '40', '枣庄市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121533', '402881ec3f74d2d5013f74dc35031531', '30', '市中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121534', '402881ec3f74d2d5013f74dc35031531', '35', '薛城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121535', '402881ec3f74d2d5013f74dc35031531', '40', '峄城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121536', '402881ec3f74d2d5013f74dc35031531', '45', '台儿庄区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121537', '402881ec3f74d2d5013f74dc35031531', '50', '山亭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121538', '402881ec3f74d2d5013f74dc35031531', '55', '滕州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121539', '402881ec3f74d2d5013f74dc34d4150c', '45', '东营市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3512153b', '402881ec3f74d2d5013f74dc35121539', '30', '东营区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3512153c', '402881ec3f74d2d5013f74dc35121539', '35', '河口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3512153d', '402881ec3f74d2d5013f74dc35121539', '40', '垦利县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3512153e', '402881ec3f74d2d5013f74dc35121539', '45', '利津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3512153f', '402881ec3f74d2d5013f74dc35121539', '50', '广饶县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35121540', '402881ec3f74d2d5013f74dc34d4150c', '50', '烟台市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221542', '402881ec3f74d2d5013f74dc35121540', '30', '芝罘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221543', '402881ec3f74d2d5013f74dc35121540', '35', '福山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221544', '402881ec3f74d2d5013f74dc35121540', '40', '牟平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221545', '402881ec3f74d2d5013f74dc35121540', '45', '莱山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221546', '402881ec3f74d2d5013f74dc35121540', '50', '长岛县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221547', '402881ec3f74d2d5013f74dc35121540', '55', '龙口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221548', '402881ec3f74d2d5013f74dc35121540', '60', '莱阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35221549', '402881ec3f74d2d5013f74dc35121540', '65', '莱州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3522154a', '402881ec3f74d2d5013f74dc35121540', '70', '蓬莱市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3522154b', '402881ec3f74d2d5013f74dc35121540', '75', '招远市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3522154c', '402881ec3f74d2d5013f74dc35121540', '80', '栖霞市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3522154d', '402881ec3f74d2d5013f74dc35121540', '85', '海阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3522154e', '402881ec3f74d2d5013f74dc34d4150c', '55', '潍坊市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311550', '402881ec3f74d2d5013f74dc3522154e', '30', '潍城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311551', '402881ec3f74d2d5013f74dc3522154e', '35', '寒亭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311552', '402881ec3f74d2d5013f74dc3522154e', '40', '坊子区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311553', '402881ec3f74d2d5013f74dc3522154e', '45', '奎文区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311554', '402881ec3f74d2d5013f74dc3522154e', '50', '临朐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311555', '402881ec3f74d2d5013f74dc3522154e', '55', '昌乐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311556', '402881ec3f74d2d5013f74dc3522154e', '60', '青州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311557', '402881ec3f74d2d5013f74dc3522154e', '65', '诸城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311558', '402881ec3f74d2d5013f74dc3522154e', '70', '寿光市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311559', '402881ec3f74d2d5013f74dc3522154e', '75', '安丘市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3531155a', '402881ec3f74d2d5013f74dc3522154e', '80', '高密市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3531155b', '402881ec3f74d2d5013f74dc3522154e', '85', '昌邑市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3531155c', '402881ec3f74d2d5013f74dc34d4150c', '60', '济宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3531155e', '402881ec3f74d2d5013f74dc3531155c', '30', '市中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3531155f', '402881ec3f74d2d5013f74dc3531155c', '35', '任城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311560', '402881ec3f74d2d5013f74dc3531155c', '40', '微山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311561', '402881ec3f74d2d5013f74dc3531155c', '45', '鱼台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311562', '402881ec3f74d2d5013f74dc3531155c', '50', '金乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311563', '402881ec3f74d2d5013f74dc3531155c', '55', '嘉祥县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311564', '402881ec3f74d2d5013f74dc3531155c', '60', '汶上县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311565', '402881ec3f74d2d5013f74dc3531155c', '65', '泗水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311566', '402881ec3f74d2d5013f74dc3531155c', '70', '梁山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311567', '402881ec3f74d2d5013f74dc3531155c', '75', '曲阜市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311568', '402881ec3f74d2d5013f74dc3531155c', '80', '兖州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35311569', '402881ec3f74d2d5013f74dc3531155c', '85', '邹城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3531156a', '402881ec3f74d2d5013f74dc34d4150c', '65', '泰安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3541156c', '402881ec3f74d2d5013f74dc3531156a', '30', '泰山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3541156d', '402881ec3f74d2d5013f74dc3531156a', '35', '岱岳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3541156e', '402881ec3f74d2d5013f74dc3531156a', '40', '宁阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3541156f', '402881ec3f74d2d5013f74dc3531156a', '45', '东平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411570', '402881ec3f74d2d5013f74dc3531156a', '50', '新泰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411571', '402881ec3f74d2d5013f74dc3531156a', '55', '肥城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411572', '402881ec3f74d2d5013f74dc34d4150c', '70', '威海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411574', '402881ec3f74d2d5013f74dc35411572', '30', '环翠区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411575', '402881ec3f74d2d5013f74dc35411572', '35', '文登市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411576', '402881ec3f74d2d5013f74dc35411572', '40', '荣成市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411577', '402881ec3f74d2d5013f74dc35411572', '45', '乳山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35411578', '402881ec3f74d2d5013f74dc34d4150c', '75', '日照市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3551157a', '402881ec3f74d2d5013f74dc35411578', '30', '东港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3551157b', '402881ec3f74d2d5013f74dc35411578', '35', '岚山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3551157c', '402881ec3f74d2d5013f74dc35411578', '40', '五莲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3551157d', '402881ec3f74d2d5013f74dc35411578', '45', '莒　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3551157e', '402881ec3f74d2d5013f74dc34d4150c', '80', '莱芜市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601580', '402881ec3f74d2d5013f74dc3551157e', '30', '莱城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601581', '402881ec3f74d2d5013f74dc3551157e', '35', '钢城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601582', '402881ec3f74d2d5013f74dc34d4150c', '85', '临沂市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601584', '402881ec3f74d2d5013f74dc35601582', '30', '兰山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601585', '402881ec3f74d2d5013f74dc35601582', '35', '罗庄区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601586', '402881ec3f74d2d5013f74dc35601582', '40', '河东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601587', '402881ec3f74d2d5013f74dc35601582', '45', '沂南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601588', '402881ec3f74d2d5013f74dc35601582', '50', '郯城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601589', '402881ec3f74d2d5013f74dc35601582', '55', '沂水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3560158a', '402881ec3f74d2d5013f74dc35601582', '60', '苍山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3560158b', '402881ec3f74d2d5013f74dc35601582', '65', '费　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3560158c', '402881ec3f74d2d5013f74dc35601582', '70', '平邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3560158d', '402881ec3f74d2d5013f74dc35601582', '75', '莒南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3560158e', '402881ec3f74d2d5013f74dc35601582', '80', '蒙阴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3560158f', '402881ec3f74d2d5013f74dc35601582', '85', '临沭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35601590', '402881ec3f74d2d5013f74dc34d4150c', '90', '德州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701592', '402881ec3f74d2d5013f74dc35601590', '30', '德城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701593', '402881ec3f74d2d5013f74dc35601590', '35', '陵　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701594', '402881ec3f74d2d5013f74dc35601590', '40', '宁津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701595', '402881ec3f74d2d5013f74dc35601590', '45', '庆云县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701596', '402881ec3f74d2d5013f74dc35601590', '50', '临邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701597', '402881ec3f74d2d5013f74dc35601590', '55', '齐河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701598', '402881ec3f74d2d5013f74dc35601590', '60', '平原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35701599', '402881ec3f74d2d5013f74dc35601590', '65', '夏津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3570159a', '402881ec3f74d2d5013f74dc35601590', '70', '武城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3570159b', '402881ec3f74d2d5013f74dc35601590', '75', '乐陵市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3570159c', '402881ec3f74d2d5013f74dc35601590', '80', '禹城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3570159d', '402881ec3f74d2d5013f74dc34d4150c', '95', '聊城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f159f', '402881ec3f74d2d5013f74dc3570159d', '30', '东昌府区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a0', '402881ec3f74d2d5013f74dc3570159d', '35', '阳谷县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a1', '402881ec3f74d2d5013f74dc3570159d', '40', '莘　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a2', '402881ec3f74d2d5013f74dc3570159d', '45', '茌平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a3', '402881ec3f74d2d5013f74dc3570159d', '50', '东阿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a4', '402881ec3f74d2d5013f74dc3570159d', '55', '冠　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a5', '402881ec3f74d2d5013f74dc3570159d', '60', '高唐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a6', '402881ec3f74d2d5013f74dc3570159d', '65', '临清市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc357f15a7', '402881ec3f74d2d5013f74dc34d4150c', '100', '滨州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15a9', '402881ec3f74d2d5013f74dc357f15a7', '30', '滨城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15aa', '402881ec3f74d2d5013f74dc357f15a7', '35', '惠民县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15ab', '402881ec3f74d2d5013f74dc357f15a7', '40', '阳信县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15ac', '402881ec3f74d2d5013f74dc357f15a7', '45', '无棣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15ad', '402881ec3f74d2d5013f74dc357f15a7', '50', '沾化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15ae', '402881ec3f74d2d5013f74dc357f15a7', '55', '博兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15af', '402881ec3f74d2d5013f74dc357f15a7', '60', '邹平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b0', '402881ec3f74d2d5013f74dc34d4150c', '105', '荷泽市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b2', '402881ec3f74d2d5013f74dc358f15b0', '30', '牡丹区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b3', '402881ec3f74d2d5013f74dc358f15b0', '35', '曹　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b4', '402881ec3f74d2d5013f74dc358f15b0', '40', '单　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b5', '402881ec3f74d2d5013f74dc358f15b0', '45', '成武县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b6', '402881ec3f74d2d5013f74dc358f15b0', '50', '巨野县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b7', '402881ec3f74d2d5013f74dc358f15b0', '55', '郓城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b8', '402881ec3f74d2d5013f74dc358f15b0', '60', '鄄城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15b9', '402881ec3f74d2d5013f74dc358f15b0', '65', '定陶县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15ba', '402881ec3f74d2d5013f74dc358f15b0', '70', '东明县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc358f15bb', '402881ea3f5b1d14013f5b1fdc080006', '100', '河南省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc359f15bc', '402881ec3f74d2d5013f74dc358f15bb', '25', '郑州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc359f15be', '402881ec3f74d2d5013f74dc359f15bc', '30', '中原区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc359f15bf', '402881ec3f74d2d5013f74dc359f15bc', '35', '二七区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc359f15c0', '402881ec3f74d2d5013f74dc359f15bc', '40', '管城回族区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc359f15c1', '402881ec3f74d2d5013f74dc359f15bc', '45', '金水区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc359f15c2', '402881ec3f74d2d5013f74dc359f15bc', '50', '上街区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc359f15c3', '402881ec3f74d2d5013f74dc359f15bc', '55', '邙山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15c4', '402881ec3f74d2d5013f74dc359f15bc', '60', '中牟县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15c5', '402881ec3f74d2d5013f74dc359f15bc', '65', '巩义市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15c6', '402881ec3f74d2d5013f74dc359f15bc', '70', '荥阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15c7', '402881ec3f74d2d5013f74dc359f15bc', '75', '新密市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15c8', '402881ec3f74d2d5013f74dc359f15bc', '80', '新郑市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15c9', '402881ec3f74d2d5013f74dc359f15bc', '85', '登封市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15ca', '402881ec3f74d2d5013f74dc358f15bb', '30', '开封市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15cc', '402881ec3f74d2d5013f74dc35ae15ca', '30', '龙亭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15cd', '402881ec3f74d2d5013f74dc35ae15ca', '35', '顺河回族区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15ce', '402881ec3f74d2d5013f74dc35ae15ca', '40', '鼓楼区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15cf', '402881ec3f74d2d5013f74dc35ae15ca', '45', '南关区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15d0', '402881ec3f74d2d5013f74dc35ae15ca', '50', '郊　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15d1', '402881ec3f74d2d5013f74dc35ae15ca', '55', '杞　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15d2', '402881ec3f74d2d5013f74dc35ae15ca', '60', '通许县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15d3', '402881ec3f74d2d5013f74dc35ae15ca', '65', '尉氏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15d4', '402881ec3f74d2d5013f74dc35ae15ca', '70', '开封县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15d5', '402881ec3f74d2d5013f74dc35ae15ca', '75', '兰考县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35ae15d6', '402881ec3f74d2d5013f74dc358f15bb', '35', '洛阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15d8', '402881ec3f74d2d5013f74dc35ae15d6', '30', '老城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15d9', '402881ec3f74d2d5013f74dc35ae15d6', '35', '西工区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15da', '402881ec3f74d2d5013f74dc35ae15d6', '40', '廛河回族区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15db', '402881ec3f74d2d5013f74dc35ae15d6', '45', '涧西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15dc', '402881ec3f74d2d5013f74dc35ae15d6', '50', '吉利区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15dd', '402881ec3f74d2d5013f74dc35ae15d6', '55', '洛龙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15de', '402881ec3f74d2d5013f74dc35ae15d6', '60', '孟津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15df', '402881ec3f74d2d5013f74dc35ae15d6', '65', '新安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e0', '402881ec3f74d2d5013f74dc35ae15d6', '70', '栾川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e1', '402881ec3f74d2d5013f74dc35ae15d6', '75', '嵩　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e2', '402881ec3f74d2d5013f74dc35ae15d6', '80', '汝阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e3', '402881ec3f74d2d5013f74dc35ae15d6', '85', '宜阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e4', '402881ec3f74d2d5013f74dc35ae15d6', '90', '洛宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e5', '402881ec3f74d2d5013f74dc35ae15d6', '95', '伊川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e6', '402881ec3f74d2d5013f74dc35ae15d6', '100', '偃师市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35be15e7', '402881ec3f74d2d5013f74dc358f15bb', '40', '平顶山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15e9', '402881ec3f74d2d5013f74dc35be15e7', '30', '新华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15ea', '402881ec3f74d2d5013f74dc35be15e7', '35', '卫东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15eb', '402881ec3f74d2d5013f74dc35be15e7', '40', '石龙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15ec', '402881ec3f74d2d5013f74dc35be15e7', '45', '湛河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15ed', '402881ec3f74d2d5013f74dc35be15e7', '50', '宝丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15ee', '402881ec3f74d2d5013f74dc35be15e7', '55', '叶　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15ef', '402881ec3f74d2d5013f74dc35be15e7', '60', '鲁山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15f0', '402881ec3f74d2d5013f74dc35be15e7', '65', '郏　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15f1', '402881ec3f74d2d5013f74dc35be15e7', '70', '舞钢市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15f2', '402881ec3f74d2d5013f74dc35be15e7', '75', '汝州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc35cd15f3', '402881ec3f74d2d5013f74dc358f15bb', '45', '安阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515f5', '402881ec3f74d2d5013f74dc35cd15f3', '30', '文峰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515f6', '402881ec3f74d2d5013f74dc35cd15f3', '35', '北关区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515f7', '402881ec3f74d2d5013f74dc35cd15f3', '40', '殷都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515f8', '402881ec3f74d2d5013f74dc35cd15f3', '45', '龙安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515f9', '402881ec3f74d2d5013f74dc35cd15f3', '50', '安阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515fa', '402881ec3f74d2d5013f74dc35cd15f3', '55', '汤阴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515fb', '402881ec3f74d2d5013f74dc35cd15f3', '60', '滑　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515fc', '402881ec3f74d2d5013f74dc35cd15f3', '65', '内黄县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515fd', '402881ec3f74d2d5013f74dc35cd15f3', '70', '林州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc370515fe', '402881ec3f74d2d5013f74dc358f15bb', '50', '鹤壁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151600', '402881ec3f74d2d5013f74dc370515fe', '30', '鹤山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151601', '402881ec3f74d2d5013f74dc370515fe', '35', '山城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151602', '402881ec3f74d2d5013f74dc370515fe', '40', '淇滨区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151603', '402881ec3f74d2d5013f74dc370515fe', '45', '浚　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151604', '402881ec3f74d2d5013f74dc370515fe', '50', '淇　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151605', '402881ec3f74d2d5013f74dc358f15bb', '55', '新乡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151607', '402881ec3f74d2d5013f74dc37151605', '30', '红旗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151608', '402881ec3f74d2d5013f74dc37151605', '35', '卫滨区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151609', '402881ec3f74d2d5013f74dc37151605', '40', '凤泉区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3715160a', '402881ec3f74d2d5013f74dc37151605', '45', '牧野区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3715160b', '402881ec3f74d2d5013f74dc37151605', '50', '新乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3715160c', '402881ec3f74d2d5013f74dc37151605', '55', '获嘉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3715160d', '402881ec3f74d2d5013f74dc37151605', '60', '原阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3715160e', '402881ec3f74d2d5013f74dc37151605', '65', '延津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3715160f', '402881ec3f74d2d5013f74dc37151605', '70', '封丘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151610', '402881ec3f74d2d5013f74dc37151605', '75', '长垣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151611', '402881ec3f74d2d5013f74dc37151605', '80', '卫辉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151612', '402881ec3f74d2d5013f74dc37151605', '85', '辉县市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37151613', '402881ec3f74d2d5013f74dc358f15bb', '60', '焦作市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261615', '402881ec3f74d2d5013f74dc37151613', '30', '解放区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261616', '402881ec3f74d2d5013f74dc37151613', '35', '中站区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261617', '402881ec3f74d2d5013f74dc37151613', '40', '马村区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261618', '402881ec3f74d2d5013f74dc37151613', '45', '山阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261619', '402881ec3f74d2d5013f74dc37151613', '50', '修武县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3726161a', '402881ec3f74d2d5013f74dc37151613', '55', '博爱县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3726161b', '402881ec3f74d2d5013f74dc37151613', '60', '武陟县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3726161c', '402881ec3f74d2d5013f74dc37151613', '65', '温　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3726161d', '402881ec3f74d2d5013f74dc37151613', '70', '济源市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3726161e', '402881ec3f74d2d5013f74dc37151613', '75', '沁阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3726161f', '402881ec3f74d2d5013f74dc37151613', '80', '孟州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261620', '402881ec3f74d2d5013f74dc358f15bb', '65', '濮阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261622', '402881ec3f74d2d5013f74dc37261620', '30', '华龙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261623', '402881ec3f74d2d5013f74dc37261620', '35', '清丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261624', '402881ec3f74d2d5013f74dc37261620', '40', '南乐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261625', '402881ec3f74d2d5013f74dc37261620', '45', '范　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261626', '402881ec3f74d2d5013f74dc37261620', '50', '台前县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261627', '402881ec3f74d2d5013f74dc37261620', '55', '濮阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37261628', '402881ec3f74d2d5013f74dc358f15bb', '70', '许昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3735162a', '402881ec3f74d2d5013f74dc37261628', '30', '魏都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3735162b', '402881ec3f74d2d5013f74dc37261628', '35', '许昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3735162c', '402881ec3f74d2d5013f74dc37261628', '40', '鄢陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3735162d', '402881ec3f74d2d5013f74dc37261628', '45', '襄城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3735162e', '402881ec3f74d2d5013f74dc37261628', '50', '禹州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3735162f', '402881ec3f74d2d5013f74dc37261628', '55', '长葛市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37351630', '402881ec3f74d2d5013f74dc358f15bb', '75', '漯河市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37351632', '402881ec3f74d2d5013f74dc37351630', '30', '源汇区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37351633', '402881ec3f74d2d5013f74dc37351630', '35', '郾城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37351634', '402881ec3f74d2d5013f74dc37351630', '40', '召陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37351635', '402881ec3f74d2d5013f74dc37351630', '45', '舞阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37351636', '402881ec3f74d2d5013f74dc37351630', '50', '临颍县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37351637', '402881ec3f74d2d5013f74dc358f15bb', '80', '三门峡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541639', '402881ec3f74d2d5013f74dc37351637', '30', '湖滨区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754163a', '402881ec3f74d2d5013f74dc37351637', '35', '渑池县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754163b', '402881ec3f74d2d5013f74dc37351637', '40', '陕　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754163c', '402881ec3f74d2d5013f74dc37351637', '45', '卢氏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754163d', '402881ec3f74d2d5013f74dc37351637', '50', '义马市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754163e', '402881ec3f74d2d5013f74dc37351637', '55', '灵宝市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754163f', '402881ec3f74d2d5013f74dc358f15bb', '85', '南阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541641', '402881ec3f74d2d5013f74dc3754163f', '30', '宛城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541642', '402881ec3f74d2d5013f74dc3754163f', '35', '卧龙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541643', '402881ec3f74d2d5013f74dc3754163f', '40', '南召县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541644', '402881ec3f74d2d5013f74dc3754163f', '45', '方城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541645', '402881ec3f74d2d5013f74dc3754163f', '50', '西峡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541646', '402881ec3f74d2d5013f74dc3754163f', '55', '镇平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541647', '402881ec3f74d2d5013f74dc3754163f', '60', '内乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541648', '402881ec3f74d2d5013f74dc3754163f', '65', '淅川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37541649', '402881ec3f74d2d5013f74dc3754163f', '70', '社旗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754164a', '402881ec3f74d2d5013f74dc3754163f', '75', '唐河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754164b', '402881ec3f74d2d5013f74dc3754163f', '80', '新野县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754164c', '402881ec3f74d2d5013f74dc3754163f', '85', '桐柏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754164d', '402881ec3f74d2d5013f74dc3754163f', '90', '邓州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3754164e', '402881ec3f74d2d5013f74dc358f15bb', '90', '商丘市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741650', '402881ec3f74d2d5013f74dc3754164e', '30', '梁园区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741651', '402881ec3f74d2d5013f74dc3754164e', '35', '睢阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741652', '402881ec3f74d2d5013f74dc3754164e', '40', '民权县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741653', '402881ec3f74d2d5013f74dc3754164e', '45', '睢　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741654', '402881ec3f74d2d5013f74dc3754164e', '50', '宁陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741655', '402881ec3f74d2d5013f74dc3754164e', '55', '柘城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741656', '402881ec3f74d2d5013f74dc3754164e', '60', '虞城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741657', '402881ec3f74d2d5013f74dc3754164e', '65', '夏邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741658', '402881ec3f74d2d5013f74dc3754164e', '70', '永城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37741659', '402881ec3f74d2d5013f74dc358f15bb', '95', '信阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3774165b', '402881ec3f74d2d5013f74dc37741659', '30', '师河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3783165c', '402881ec3f74d2d5013f74dc37741659', '35', '平桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3783165d', '402881ec3f74d2d5013f74dc37741659', '40', '罗山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3783165e', '402881ec3f74d2d5013f74dc37741659', '45', '光山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3783165f', '402881ec3f74d2d5013f74dc37741659', '50', '新　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37831660', '402881ec3f74d2d5013f74dc37741659', '55', '商城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37831661', '402881ec3f74d2d5013f74dc37741659', '60', '固始县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37831662', '402881ec3f74d2d5013f74dc37741659', '65', '潢川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37831663', '402881ec3f74d2d5013f74dc37741659', '70', '淮滨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37831664', '402881ec3f74d2d5013f74dc37741659', '75', '息　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37831665', '402881ec3f74d2d5013f74dc358f15bb', '100', '周口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37931667', '402881ec3f74d2d5013f74dc37831665', '30', '川汇区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37931668', '402881ec3f74d2d5013f74dc37831665', '35', '扶沟县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37931669', '402881ec3f74d2d5013f74dc37831665', '40', '西华县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3793166a', '402881ec3f74d2d5013f74dc37831665', '45', '商水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3793166b', '402881ec3f74d2d5013f74dc37831665', '50', '沈丘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3793166c', '402881ec3f74d2d5013f74dc37831665', '55', '郸城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3793166d', '402881ec3f74d2d5013f74dc37831665', '60', '淮阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3793166e', '402881ec3f74d2d5013f74dc37831665', '65', '太康县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3793166f', '402881ec3f74d2d5013f74dc37831665', '70', '鹿邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37931670', '402881ec3f74d2d5013f74dc37831665', '75', '项城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37931671', '402881ec3f74d2d5013f74dc358f15bb', '105', '驻马店市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a21673', '402881ec3f74d2d5013f74dc37931671', '30', '驿城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a21674', '402881ec3f74d2d5013f74dc37931671', '35', '西平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a21675', '402881ec3f74d2d5013f74dc37931671', '40', '上蔡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a21676', '402881ec3f74d2d5013f74dc37931671', '45', '平舆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a21677', '402881ec3f74d2d5013f74dc37931671', '50', '正阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a21678', '402881ec3f74d2d5013f74dc37931671', '55', '确山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a21679', '402881ec3f74d2d5013f74dc37931671', '60', '泌阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a2167a', '402881ec3f74d2d5013f74dc37931671', '65', '汝南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a2167b', '402881ec3f74d2d5013f74dc37931671', '70', '遂平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a2167c', '402881ec3f74d2d5013f74dc37931671', '75', '新蔡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37a2167d', '402881ea3f5b1d14013f5b1fdc080006', '105', '湖北省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37b2167e', '402881ec3f74d2d5013f74dc37a2167d', '25', '武汉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21680', '402881ec3f74d2d5013f74dc37b2167e', '30', '江岸区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21681', '402881ec3f74d2d5013f74dc37b2167e', '35', '江汉区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21682', '402881ec3f74d2d5013f74dc37b2167e', '40', '乔口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21683', '402881ec3f74d2d5013f74dc37b2167e', '45', '汉阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21684', '402881ec3f74d2d5013f74dc37b2167e', '50', '武昌区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21685', '402881ec3f74d2d5013f74dc37b2167e', '55', '青山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21686', '402881ec3f74d2d5013f74dc37b2167e', '60', '洪山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21687', '402881ec3f74d2d5013f74dc37b2167e', '65', '东西湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21688', '402881ec3f74d2d5013f74dc37b2167e', '70', '汉南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c21689', '402881ec3f74d2d5013f74dc37b2167e', '75', '蔡甸区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c2168a', '402881ec3f74d2d5013f74dc37b2167e', '80', '江夏区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c2168b', '402881ec3f74d2d5013f74dc37b2167e', '85', '黄陂区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c2168c', '402881ec3f74d2d5013f74dc37b2167e', '90', '新洲区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37c2168d', '402881ec3f74d2d5013f74dc37a2167d', '30', '黄石市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37d1168f', '402881ec3f74d2d5013f74dc37c2168d', '30', '黄石港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37d11690', '402881ec3f74d2d5013f74dc37c2168d', '35', '西塞山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37d11691', '402881ec3f74d2d5013f74dc37c2168d', '40', '下陆区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37d11692', '402881ec3f74d2d5013f74dc37c2168d', '45', '铁山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37d11693', '402881ec3f74d2d5013f74dc37c2168d', '50', '阳新县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37d11694', '402881ec3f74d2d5013f74dc37c2168d', '55', '大冶市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37d11695', '402881ec3f74d2d5013f74dc37a2167d', '35', '十堰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f01697', '402881ec3f74d2d5013f74dc37d11695', '30', '茅箭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f01698', '402881ec3f74d2d5013f74dc37d11695', '35', '张湾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f01699', '402881ec3f74d2d5013f74dc37d11695', '40', '郧　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f0169a', '402881ec3f74d2d5013f74dc37d11695', '45', '郧西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f0169b', '402881ec3f74d2d5013f74dc37d11695', '50', '竹山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f0169c', '402881ec3f74d2d5013f74dc37d11695', '55', '竹溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f0169d', '402881ec3f74d2d5013f74dc37d11695', '60', '房　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f0169e', '402881ec3f74d2d5013f74dc37d11695', '65', '丹江口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc37f0169f', '402881ec3f74d2d5013f74dc37a2167d', '40', '宜昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a1', '402881ec3f74d2d5013f74dc37f0169f', '30', '西陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a2', '402881ec3f74d2d5013f74dc37f0169f', '35', '伍家岗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a3', '402881ec3f74d2d5013f74dc37f0169f', '40', '点军区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a4', '402881ec3f74d2d5013f74dc37f0169f', '45', '猇亭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a5', '402881ec3f74d2d5013f74dc37f0169f', '50', '夷陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a6', '402881ec3f74d2d5013f74dc37f0169f', '55', '远安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a7', '402881ec3f74d2d5013f74dc37f0169f', '60', '兴山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a8', '402881ec3f74d2d5013f74dc37f0169f', '65', '秭归县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016a9', '402881ec3f74d2d5013f74dc37f0169f', '70', '长阳土家族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016aa', '402881ec3f74d2d5013f74dc37f0169f', '75', '五峰土家族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016ab', '402881ec3f74d2d5013f74dc37f0169f', '80', '宜都市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016ac', '402881ec3f74d2d5013f74dc37f0169f', '85', '当阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016ad', '402881ec3f74d2d5013f74dc37f0169f', '90', '枝江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc380016ae', '402881ec3f74d2d5013f74dc37a2167d', '45', '襄樊市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b0', '402881ec3f74d2d5013f74dc380016ae', '30', '襄城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b1', '402881ec3f74d2d5013f74dc380016ae', '35', '樊城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b2', '402881ec3f74d2d5013f74dc380016ae', '40', '襄阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b3', '402881ec3f74d2d5013f74dc380016ae', '45', '南漳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b4', '402881ec3f74d2d5013f74dc380016ae', '50', '谷城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b5', '402881ec3f74d2d5013f74dc380016ae', '55', '保康县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b6', '402881ec3f74d2d5013f74dc380016ae', '60', '老河口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b7', '402881ec3f74d2d5013f74dc380016ae', '65', '枣阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b8', '402881ec3f74d2d5013f74dc380016ae', '70', '宜城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381016b9', '402881ec3f74d2d5013f74dc37a2167d', '50', '鄂州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381f16bb', '402881ec3f74d2d5013f74dc381016b9', '30', '梁子湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381f16bc', '402881ec3f74d2d5013f74dc381016b9', '35', '华容区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381f16bd', '402881ec3f74d2d5013f74dc381016b9', '40', '鄂城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc381f16be', '402881ec3f74d2d5013f74dc37a2167d', '55', '荆门市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c0', '402881ec3f74d2d5013f74dc381f16be', '30', '东宝区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c1', '402881ec3f74d2d5013f74dc381f16be', '35', '掇刀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c2', '402881ec3f74d2d5013f74dc381f16be', '40', '京山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c3', '402881ec3f74d2d5013f74dc381f16be', '45', '沙洋县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c4', '402881ec3f74d2d5013f74dc381f16be', '50', '钟祥市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c5', '402881ec3f74d2d5013f74dc37a2167d', '60', '孝感市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c7', '402881ec3f74d2d5013f74dc382f16c5', '30', '孝南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c8', '402881ec3f74d2d5013f74dc382f16c5', '35', '孝昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16c9', '402881ec3f74d2d5013f74dc382f16c5', '40', '大悟县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16ca', '402881ec3f74d2d5013f74dc382f16c5', '45', '云梦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16cb', '402881ec3f74d2d5013f74dc382f16c5', '50', '应城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16cc', '402881ec3f74d2d5013f74dc382f16c5', '55', '安陆市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16cd', '402881ec3f74d2d5013f74dc382f16c5', '60', '汉川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc382f16ce', '402881ec3f74d2d5013f74dc37a2167d', '65', '荆州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d0', '402881ec3f74d2d5013f74dc382f16ce', '30', '沙市区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d1', '402881ec3f74d2d5013f74dc382f16ce', '35', '荆州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d2', '402881ec3f74d2d5013f74dc382f16ce', '40', '公安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d3', '402881ec3f74d2d5013f74dc382f16ce', '45', '监利县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d4', '402881ec3f74d2d5013f74dc382f16ce', '50', '江陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d5', '402881ec3f74d2d5013f74dc382f16ce', '55', '石首市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d6', '402881ec3f74d2d5013f74dc382f16ce', '60', '洪湖市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d7', '402881ec3f74d2d5013f74dc382f16ce', '65', '松滋市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc383e16d8', '402881ec3f74d2d5013f74dc37a2167d', '70', '黄冈市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16da', '402881ec3f74d2d5013f74dc383e16d8', '30', '黄州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16db', '402881ec3f74d2d5013f74dc383e16d8', '35', '团风县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16dc', '402881ec3f74d2d5013f74dc383e16d8', '40', '红安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16dd', '402881ec3f74d2d5013f74dc383e16d8', '45', '罗田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16de', '402881ec3f74d2d5013f74dc383e16d8', '50', '英山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16df', '402881ec3f74d2d5013f74dc383e16d8', '55', '浠水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e0', '402881ec3f74d2d5013f74dc383e16d8', '60', '蕲春县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e1', '402881ec3f74d2d5013f74dc383e16d8', '65', '黄梅县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e2', '402881ec3f74d2d5013f74dc383e16d8', '70', '麻城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e3', '402881ec3f74d2d5013f74dc383e16d8', '75', '武穴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e4', '402881ec3f74d2d5013f74dc37a2167d', '75', '咸宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e6', '402881ec3f74d2d5013f74dc384e16e4', '30', '咸安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e7', '402881ec3f74d2d5013f74dc384e16e4', '35', '嘉鱼县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e8', '402881ec3f74d2d5013f74dc384e16e4', '40', '通城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16e9', '402881ec3f74d2d5013f74dc384e16e4', '45', '崇阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16ea', '402881ec3f74d2d5013f74dc384e16e4', '50', '通山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16eb', '402881ec3f74d2d5013f74dc384e16e4', '55', '赤壁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc384e16ec', '402881ec3f74d2d5013f74dc37a2167d', '80', '随州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16ee', '402881ec3f74d2d5013f74dc384e16ec', '30', '曾都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16ef', '402881ec3f74d2d5013f74dc384e16ec', '35', '广水市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f0', '402881ec3f74d2d5013f74dc37a2167d', '85', '恩施土家族苗族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f1', '402881ec3f74d2d5013f74dc385e16f0', '25', '恩施市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f2', '402881ec3f74d2d5013f74dc385e16f0', '30', '利川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f3', '402881ec3f74d2d5013f74dc385e16f0', '35', '建始县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f4', '402881ec3f74d2d5013f74dc385e16f0', '40', '巴东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f5', '402881ec3f74d2d5013f74dc385e16f0', '45', '宣恩县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f6', '402881ec3f74d2d5013f74dc385e16f0', '50', '咸丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f7', '402881ec3f74d2d5013f74dc385e16f0', '55', '来凤县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f8', '402881ec3f74d2d5013f74dc385e16f0', '60', '鹤峰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc385e16f9', '402881ec3f74d2d5013f74dc37a2167d', '90', '省直辖行政单位', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc386d16fa', '402881ec3f74d2d5013f74dc385e16f9', '25', '仙桃市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc386d16fb', '402881ec3f74d2d5013f74dc385e16f9', '30', '潜江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc386d16fc', '402881ec3f74d2d5013f74dc385e16f9', '35', '天门市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc386d16fd', '402881ec3f74d2d5013f74dc385e16f9', '40', '神农架林区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc386d16fe', '402881ea3f5b1d14013f5b1fdc080006', '110', '湖南省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc386d16ff', '402881ec3f74d2d5013f74dc386d16fe', '25', '长沙市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1701', '402881ec3f74d2d5013f74dc386d16ff', '30', '芙蓉区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1702', '402881ec3f74d2d5013f74dc386d16ff', '35', '天心区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1703', '402881ec3f74d2d5013f74dc386d16ff', '40', '岳麓区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1704', '402881ec3f74d2d5013f74dc386d16ff', '45', '开福区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1705', '402881ec3f74d2d5013f74dc386d16ff', '50', '雨花区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1706', '402881ec3f74d2d5013f74dc386d16ff', '55', '长沙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1707', '402881ec3f74d2d5013f74dc386d16ff', '60', '望城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1708', '402881ec3f74d2d5013f74dc386d16ff', '65', '宁乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d1709', '402881ec3f74d2d5013f74dc386d16ff', '70', '浏阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc387d170a', '402881ec3f74d2d5013f74dc386d16fe', '30', '株洲市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c170c', '402881ec3f74d2d5013f74dc387d170a', '30', '荷塘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c170d', '402881ec3f74d2d5013f74dc387d170a', '35', '芦淞区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c170e', '402881ec3f74d2d5013f74dc387d170a', '40', '石峰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c170f', '402881ec3f74d2d5013f74dc387d170a', '45', '天元区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c1710', '402881ec3f74d2d5013f74dc387d170a', '50', '株洲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c1711', '402881ec3f74d2d5013f74dc387d170a', '55', '攸　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c1712', '402881ec3f74d2d5013f74dc387d170a', '60', '茶陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c1713', '402881ec3f74d2d5013f74dc387d170a', '65', '炎陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c1714', '402881ec3f74d2d5013f74dc387d170a', '70', '醴陵市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc388c1715', '402881ec3f74d2d5013f74dc386d16fe', '35', '湘潭市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1717', '402881ec3f74d2d5013f74dc388c1715', '30', '雨湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1718', '402881ec3f74d2d5013f74dc388c1715', '35', '岳塘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1719', '402881ec3f74d2d5013f74dc388c1715', '40', '湘潭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c171a', '402881ec3f74d2d5013f74dc388c1715', '45', '湘乡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c171b', '402881ec3f74d2d5013f74dc388c1715', '50', '韶山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c171c', '402881ec3f74d2d5013f74dc386d16fe', '40', '衡阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c171e', '402881ec3f74d2d5013f74dc389c171c', '30', '珠晖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c171f', '402881ec3f74d2d5013f74dc389c171c', '35', '雁峰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1720', '402881ec3f74d2d5013f74dc389c171c', '40', '石鼓区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1721', '402881ec3f74d2d5013f74dc389c171c', '45', '蒸湘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1722', '402881ec3f74d2d5013f74dc389c171c', '50', '南岳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1723', '402881ec3f74d2d5013f74dc389c171c', '55', '衡阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1724', '402881ec3f74d2d5013f74dc389c171c', '60', '衡南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1725', '402881ec3f74d2d5013f74dc389c171c', '65', '衡山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1726', '402881ec3f74d2d5013f74dc389c171c', '70', '衡东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1727', '402881ec3f74d2d5013f74dc389c171c', '75', '祁东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1728', '402881ec3f74d2d5013f74dc389c171c', '80', '耒阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c1729', '402881ec3f74d2d5013f74dc389c171c', '85', '常宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc389c172a', '402881ec3f74d2d5013f74dc386d16fe', '45', '邵阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac172c', '402881ec3f74d2d5013f74dc389c172a', '30', '双清区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac172d', '402881ec3f74d2d5013f74dc389c172a', '35', '大祥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac172e', '402881ec3f74d2d5013f74dc389c172a', '40', '北塔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac172f', '402881ec3f74d2d5013f74dc389c172a', '45', '邵东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1730', '402881ec3f74d2d5013f74dc389c172a', '50', '新邵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1731', '402881ec3f74d2d5013f74dc389c172a', '55', '邵阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1732', '402881ec3f74d2d5013f74dc389c172a', '60', '隆回县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1733', '402881ec3f74d2d5013f74dc389c172a', '65', '洞口县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1734', '402881ec3f74d2d5013f74dc389c172a', '70', '绥宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1735', '402881ec3f74d2d5013f74dc389c172a', '75', '新宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1736', '402881ec3f74d2d5013f74dc389c172a', '80', '城步苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1737', '402881ec3f74d2d5013f74dc389c172a', '85', '武冈市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ac1738', '402881ec3f74d2d5013f74dc386d16fe', '50', '岳阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb173a', '402881ec3f74d2d5013f74dc38ac1738', '30', '岳阳楼区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb173b', '402881ec3f74d2d5013f74dc38ac1738', '35', '云溪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb173c', '402881ec3f74d2d5013f74dc38ac1738', '40', '君山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb173d', '402881ec3f74d2d5013f74dc38ac1738', '45', '岳阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb173e', '402881ec3f74d2d5013f74dc38ac1738', '50', '华容县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb173f', '402881ec3f74d2d5013f74dc38ac1738', '55', '湘阴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb1740', '402881ec3f74d2d5013f74dc38ac1738', '60', '平江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb1741', '402881ec3f74d2d5013f74dc38ac1738', '65', '汨罗市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb1742', '402881ec3f74d2d5013f74dc38ac1738', '70', '临湘市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38bb1743', '402881ec3f74d2d5013f74dc386d16fe', '55', '常德市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb1745', '402881ec3f74d2d5013f74dc38bb1743', '30', '武陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb1746', '402881ec3f74d2d5013f74dc38bb1743', '35', '鼎城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb1747', '402881ec3f74d2d5013f74dc38bb1743', '40', '安乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb1748', '402881ec3f74d2d5013f74dc38bb1743', '45', '汉寿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb1749', '402881ec3f74d2d5013f74dc38bb1743', '50', '澧　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb174a', '402881ec3f74d2d5013f74dc38bb1743', '55', '临澧县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb174b', '402881ec3f74d2d5013f74dc38bb1743', '60', '桃源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb174c', '402881ec3f74d2d5013f74dc38bb1743', '65', '石门县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb174d', '402881ec3f74d2d5013f74dc38bb1743', '70', '津市市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38cb174e', '402881ec3f74d2d5013f74dc386d16fe', '60', '张家界市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38da1750', '402881ec3f74d2d5013f74dc38cb174e', '30', '永定区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38da1751', '402881ec3f74d2d5013f74dc38cb174e', '35', '武陵源区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38da1752', '402881ec3f74d2d5013f74dc38cb174e', '40', '慈利县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38da1753', '402881ec3f74d2d5013f74dc38cb174e', '45', '桑植县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38da1754', '402881ec3f74d2d5013f74dc386d16fe', '65', '益阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea1756', '402881ec3f74d2d5013f74dc38da1754', '30', '资阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea1757', '402881ec3f74d2d5013f74dc38da1754', '35', '赫山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea1758', '402881ec3f74d2d5013f74dc38da1754', '40', '南　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea1759', '402881ec3f74d2d5013f74dc38da1754', '45', '桃江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea175a', '402881ec3f74d2d5013f74dc38da1754', '50', '安化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea175b', '402881ec3f74d2d5013f74dc38da1754', '55', '沅江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea175c', '402881ec3f74d2d5013f74dc386d16fe', '70', '郴州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38ea175e', '402881ec3f74d2d5013f74dc38ea175c', '30', '北湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa175f', '402881ec3f74d2d5013f74dc38ea175c', '35', '苏仙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1760', '402881ec3f74d2d5013f74dc38ea175c', '40', '桂阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1761', '402881ec3f74d2d5013f74dc38ea175c', '45', '宜章县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1762', '402881ec3f74d2d5013f74dc38ea175c', '50', '永兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1763', '402881ec3f74d2d5013f74dc38ea175c', '55', '嘉禾县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1764', '402881ec3f74d2d5013f74dc38ea175c', '60', '临武县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1765', '402881ec3f74d2d5013f74dc38ea175c', '65', '汝城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1766', '402881ec3f74d2d5013f74dc38ea175c', '70', '桂东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1767', '402881ec3f74d2d5013f74dc38ea175c', '75', '安仁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1768', '402881ec3f74d2d5013f74dc38ea175c', '80', '资兴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1769', '402881ec3f74d2d5013f74dc386d16fe', '75', '永州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa176b', '402881ec3f74d2d5013f74dc38fa1769', '30', '芝山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa176c', '402881ec3f74d2d5013f74dc38fa1769', '35', '冷水滩区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa176d', '402881ec3f74d2d5013f74dc38fa1769', '40', '祁阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa176e', '402881ec3f74d2d5013f74dc38fa1769', '45', '东安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa176f', '402881ec3f74d2d5013f74dc38fa1769', '50', '双牌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1770', '402881ec3f74d2d5013f74dc38fa1769', '55', '道　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1771', '402881ec3f74d2d5013f74dc38fa1769', '60', '江永县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1772', '402881ec3f74d2d5013f74dc38fa1769', '65', '宁远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1773', '402881ec3f74d2d5013f74dc38fa1769', '70', '蓝山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1774', '402881ec3f74d2d5013f74dc38fa1769', '75', '新田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1775', '402881ec3f74d2d5013f74dc38fa1769', '80', '江华瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc38fa1776', '402881ec3f74d2d5013f74dc386d16fe', '80', '怀化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39091778', '402881ec3f74d2d5013f74dc38fa1776', '30', '鹤城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39091779', '402881ec3f74d2d5013f74dc38fa1776', '35', '中方县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3909177a', '402881ec3f74d2d5013f74dc38fa1776', '40', '沅陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3909177b', '402881ec3f74d2d5013f74dc38fa1776', '45', '辰溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3909177c', '402881ec3f74d2d5013f74dc38fa1776', '50', '溆浦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3909177d', '402881ec3f74d2d5013f74dc38fa1776', '55', '会同县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3909177e', '402881ec3f74d2d5013f74dc38fa1776', '60', '麻阳苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3909177f', '402881ec3f74d2d5013f74dc38fa1776', '65', '新晃侗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39091780', '402881ec3f74d2d5013f74dc38fa1776', '70', '芷江侗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39091781', '402881ec3f74d2d5013f74dc38fa1776', '75', '靖州苗族侗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39091782', '402881ec3f74d2d5013f74dc38fa1776', '80', '通道侗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39091783', '402881ec3f74d2d5013f74dc38fa1776', '85', '洪江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39091784', '402881ec3f74d2d5013f74dc386d16fe', '85', '娄底市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191786', '402881ec3f74d2d5013f74dc39091784', '30', '娄星区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191787', '402881ec3f74d2d5013f74dc39091784', '35', '双峰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191788', '402881ec3f74d2d5013f74dc39091784', '40', '新化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191789', '402881ec3f74d2d5013f74dc39091784', '45', '冷水江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3919178a', '402881ec3f74d2d5013f74dc39091784', '50', '涟源市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3919178b', '402881ec3f74d2d5013f74dc386d16fe', '90', '湘西土家族苗族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3919178c', '402881ec3f74d2d5013f74dc3919178b', '25', '吉首市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3919178d', '402881ec3f74d2d5013f74dc3919178b', '30', '泸溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3919178e', '402881ec3f74d2d5013f74dc3919178b', '35', '凤凰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3919178f', '402881ec3f74d2d5013f74dc3919178b', '40', '花垣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191790', '402881ec3f74d2d5013f74dc3919178b', '45', '保靖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191791', '402881ec3f74d2d5013f74dc3919178b', '50', '古丈县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191792', '402881ec3f74d2d5013f74dc3919178b', '55', '永顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191793', '402881ec3f74d2d5013f74dc3919178b', '60', '龙山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39191794', '402881ea3f5b1d14013f5b1fdc080006', '115', '广东省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39281795', '402881ec3f74d2d5013f74dc39191794', '25', '广州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39381797', '402881ec3f74d2d5013f74dc39281795', '30', '东山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39381798', '402881ec3f74d2d5013f74dc39281795', '35', '荔湾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39381799', '402881ec3f74d2d5013f74dc39281795', '40', '越秀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3938179a', '402881ec3f74d2d5013f74dc39281795', '45', '海珠区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3938179b', '402881ec3f74d2d5013f74dc39281795', '50', '天河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3938179c', '402881ec3f74d2d5013f74dc39281795', '55', '芳村区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3938179d', '402881ec3f74d2d5013f74dc39281795', '60', '白云区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3938179e', '402881ec3f74d2d5013f74dc39281795', '65', '黄埔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3938179f', '402881ec3f74d2d5013f74dc39281795', '70', '番禺区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc393817a0', '402881ec3f74d2d5013f74dc39281795', '75', '花都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc393817a1', '402881ec3f74d2d5013f74dc39281795', '80', '增城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc393817a2', '402881ec3f74d2d5013f74dc39281795', '85', '从化市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc393817a3', '402881ec3f74d2d5013f74dc39191794', '30', '韶关市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717a5', '402881ec3f74d2d5013f74dc393817a3', '30', '武江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717a6', '402881ec3f74d2d5013f74dc393817a3', '35', '浈江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717a7', '402881ec3f74d2d5013f74dc393817a3', '40', '曲江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717a8', '402881ec3f74d2d5013f74dc393817a3', '45', '始兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717a9', '402881ec3f74d2d5013f74dc393817a3', '50', '仁化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717aa', '402881ec3f74d2d5013f74dc393817a3', '55', '翁源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717ab', '402881ec3f74d2d5013f74dc393817a3', '60', '乳源瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717ac', '402881ec3f74d2d5013f74dc393817a3', '65', '新丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717ad', '402881ec3f74d2d5013f74dc393817a3', '70', '乐昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717ae', '402881ec3f74d2d5013f74dc393817a3', '75', '南雄市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc395717af', '402881ec3f74d2d5013f74dc39191794', '35', '深圳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc396717b1', '402881ec3f74d2d5013f74dc395717af', '30', '罗湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc396717b2', '402881ec3f74d2d5013f74dc395717af', '35', '福田区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc396717b3', '402881ec3f74d2d5013f74dc395717af', '40', '南山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc396717b4', '402881ec3f74d2d5013f74dc395717af', '45', '宝安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc396717b5', '402881ec3f74d2d5013f74dc395717af', '50', '龙岗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc396717b6', '402881ec3f74d2d5013f74dc395717af', '55', '盐田区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc396717b7', '402881ec3f74d2d5013f74dc39191794', '40', '珠海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617b9', '402881ec3f74d2d5013f74dc396717b7', '30', '香洲区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617ba', '402881ec3f74d2d5013f74dc396717b7', '35', '斗门区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617bb', '402881ec3f74d2d5013f74dc396717b7', '40', '金湾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617bc', '402881ec3f74d2d5013f74dc39191794', '45', '汕头市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617be', '402881ec3f74d2d5013f74dc398617bc', '30', '龙湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617bf', '402881ec3f74d2d5013f74dc398617bc', '35', '金平区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617c0', '402881ec3f74d2d5013f74dc398617bc', '40', '濠江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617c1', '402881ec3f74d2d5013f74dc398617bc', '45', '潮阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617c2', '402881ec3f74d2d5013f74dc398617bc', '50', '潮南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617c3', '402881ec3f74d2d5013f74dc398617bc', '55', '澄海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617c4', '402881ec3f74d2d5013f74dc398617bc', '60', '南澳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc398617c5', '402881ec3f74d2d5013f74dc39191794', '50', '佛山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39a517c7', '402881ec3f74d2d5013f74dc398617c5', '30', '禅城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39a517c8', '402881ec3f74d2d5013f74dc398617c5', '35', '南海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39a517c9', '402881ec3f74d2d5013f74dc398617c5', '40', '顺德区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39a517ca', '402881ec3f74d2d5013f74dc398617c5', '45', '三水区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39a517cb', '402881ec3f74d2d5013f74dc398617c5', '50', '高明区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39a517cc', '402881ec3f74d2d5013f74dc39191794', '55', '江门市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517ce', '402881ec3f74d2d5013f74dc39a517cc', '30', '蓬江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517cf', '402881ec3f74d2d5013f74dc39a517cc', '35', '江海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d0', '402881ec3f74d2d5013f74dc39a517cc', '40', '新会区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d1', '402881ec3f74d2d5013f74dc39a517cc', '45', '台山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d2', '402881ec3f74d2d5013f74dc39a517cc', '50', '开平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d3', '402881ec3f74d2d5013f74dc39a517cc', '55', '鹤山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d4', '402881ec3f74d2d5013f74dc39a517cc', '60', '恩平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d5', '402881ec3f74d2d5013f74dc39191794', '60', '湛江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d7', '402881ec3f74d2d5013f74dc39b517d5', '30', '赤坎区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d8', '402881ec3f74d2d5013f74dc39b517d5', '35', '霞山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517d9', '402881ec3f74d2d5013f74dc39b517d5', '40', '坡头区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517da', '402881ec3f74d2d5013f74dc39b517d5', '45', '麻章区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517db', '402881ec3f74d2d5013f74dc39b517d5', '50', '遂溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517dc', '402881ec3f74d2d5013f74dc39b517d5', '55', '徐闻县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517dd', '402881ec3f74d2d5013f74dc39b517d5', '60', '廉江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517de', '402881ec3f74d2d5013f74dc39b517d5', '65', '雷州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517df', '402881ec3f74d2d5013f74dc39b517d5', '70', '吴川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39b517e0', '402881ec3f74d2d5013f74dc39191794', '65', '茂名市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39c417e2', '402881ec3f74d2d5013f74dc39b517e0', '30', '茂南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39c417e3', '402881ec3f74d2d5013f74dc39b517e0', '35', '茂港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39c417e4', '402881ec3f74d2d5013f74dc39b517e0', '40', '电白县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39c417e5', '402881ec3f74d2d5013f74dc39b517e0', '45', '高州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39c417e6', '402881ec3f74d2d5013f74dc39b517e0', '50', '化州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39c417e7', '402881ec3f74d2d5013f74dc39b517e0', '55', '信宜市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39c417e8', '402881ec3f74d2d5013f74dc39191794', '70', '肇庆市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417ea', '402881ec3f74d2d5013f74dc39c417e8', '30', '端州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417eb', '402881ec3f74d2d5013f74dc39c417e8', '35', '鼎湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417ec', '402881ec3f74d2d5013f74dc39c417e8', '40', '广宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417ed', '402881ec3f74d2d5013f74dc39c417e8', '45', '怀集县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417ee', '402881ec3f74d2d5013f74dc39c417e8', '50', '封开县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417ef', '402881ec3f74d2d5013f74dc39c417e8', '55', '德庆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417f0', '402881ec3f74d2d5013f74dc39c417e8', '60', '高要市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417f1', '402881ec3f74d2d5013f74dc39c417e8', '65', '四会市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39d417f2', '402881ec3f74d2d5013f74dc39191794', '75', '惠州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417f4', '402881ec3f74d2d5013f74dc39d417f2', '30', '惠城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417f5', '402881ec3f74d2d5013f74dc39d417f2', '35', '惠阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417f6', '402881ec3f74d2d5013f74dc39d417f2', '40', '博罗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417f7', '402881ec3f74d2d5013f74dc39d417f2', '45', '惠东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417f8', '402881ec3f74d2d5013f74dc39d417f2', '50', '龙门县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417f9', '402881ec3f74d2d5013f74dc39191794', '80', '梅州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417fb', '402881ec3f74d2d5013f74dc39e417f9', '30', '梅江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417fc', '402881ec3f74d2d5013f74dc39e417f9', '35', '梅　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417fd', '402881ec3f74d2d5013f74dc39e417f9', '40', '大埔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417fe', '402881ec3f74d2d5013f74dc39e417f9', '45', '丰顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e417ff', '402881ec3f74d2d5013f74dc39e417f9', '50', '五华县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e41800', '402881ec3f74d2d5013f74dc39e417f9', '55', '平远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e41801', '402881ec3f74d2d5013f74dc39e417f9', '60', '蕉岭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e41802', '402881ec3f74d2d5013f74dc39e417f9', '65', '兴宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39e41803', '402881ec3f74d2d5013f74dc39191794', '85', '汕尾市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f31805', '402881ec3f74d2d5013f74dc39e41803', '30', '城　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f31806', '402881ec3f74d2d5013f74dc39e41803', '35', '海丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f31807', '402881ec3f74d2d5013f74dc39e41803', '40', '陆河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f31808', '402881ec3f74d2d5013f74dc39e41803', '45', '陆丰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f31809', '402881ec3f74d2d5013f74dc39191794', '90', '河源市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f3180b', '402881ec3f74d2d5013f74dc39f31809', '30', '源城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f3180c', '402881ec3f74d2d5013f74dc39f31809', '35', '紫金县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f3180d', '402881ec3f74d2d5013f74dc39f31809', '40', '龙川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f3180e', '402881ec3f74d2d5013f74dc39f31809', '45', '连平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f3180f', '402881ec3f74d2d5013f74dc39f31809', '50', '和平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f31810', '402881ec3f74d2d5013f74dc39f31809', '55', '东源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc39f31811', '402881ec3f74d2d5013f74dc39191794', '95', '阳江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031813', '402881ec3f74d2d5013f74dc39f31811', '30', '江城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031814', '402881ec3f74d2d5013f74dc39f31811', '35', '阳西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031815', '402881ec3f74d2d5013f74dc39f31811', '40', '阳东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031816', '402881ec3f74d2d5013f74dc39f31811', '45', '阳春市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031817', '402881ec3f74d2d5013f74dc39191794', '100', '清远市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031819', '402881ec3f74d2d5013f74dc3a031817', '30', '清城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a03181a', '402881ec3f74d2d5013f74dc3a031817', '35', '佛冈县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a03181b', '402881ec3f74d2d5013f74dc3a031817', '40', '阳山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a03181c', '402881ec3f74d2d5013f74dc3a031817', '45', '连山壮族瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a03181d', '402881ec3f74d2d5013f74dc3a031817', '50', '连南瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a03181e', '402881ec3f74d2d5013f74dc3a031817', '55', '清新县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a03181f', '402881ec3f74d2d5013f74dc3a031817', '60', '英德市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031820', '402881ec3f74d2d5013f74dc3a031817', '65', '连州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a031821', '402881ec3f74d2d5013f74dc39191794', '105', '东莞市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a121822', '402881ec3f74d2d5013f74dc39191794', '110', '中山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a221823', '402881ec3f74d2d5013f74dc39191794', '115', '潮州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a321825', '402881ec3f74d2d5013f74dc3a221823', '30', '湘桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a321826', '402881ec3f74d2d5013f74dc3a221823', '35', '潮安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a321827', '402881ec3f74d2d5013f74dc3a221823', '40', '饶平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a321828', '402881ec3f74d2d5013f74dc39191794', '120', '揭阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a32182a', '402881ec3f74d2d5013f74dc3a321828', '30', '榕城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a32182b', '402881ec3f74d2d5013f74dc3a321828', '35', '揭东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a32182c', '402881ec3f74d2d5013f74dc3a321828', '40', '揭西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a32182d', '402881ec3f74d2d5013f74dc3a321828', '45', '惠来县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a32182e', '402881ec3f74d2d5013f74dc3a321828', '50', '普宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a32182f', '402881ec3f74d2d5013f74dc39191794', '125', '云浮市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a411831', '402881ec3f74d2d5013f74dc3a32182f', '30', '云城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a411832', '402881ec3f74d2d5013f74dc3a32182f', '35', '新兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a411833', '402881ec3f74d2d5013f74dc3a32182f', '40', '郁南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a411834', '402881ec3f74d2d5013f74dc3a32182f', '45', '云安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a411835', '402881ec3f74d2d5013f74dc3a32182f', '50', '罗定市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a411836', '402881ea3f5b1d14013f5b1fdc080006', '120', '广西壮族自治区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a411837', '402881ec3f74d2d5013f74dc3a411836', '25', '南宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a511839', '402881ec3f74d2d5013f74dc3a411837', '30', '兴宁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a51183a', '402881ec3f74d2d5013f74dc3a411837', '35', '青秀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a51183b', '402881ec3f74d2d5013f74dc3a411837', '40', '江南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a51183c', '402881ec3f74d2d5013f74dc3a411837', '45', '西乡塘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a51183d', '402881ec3f74d2d5013f74dc3a411837', '50', '良庆区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a51183e', '402881ec3f74d2d5013f74dc3a411837', '55', '邕宁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a51183f', '402881ec3f74d2d5013f74dc3a411837', '60', '武鸣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a511840', '402881ec3f74d2d5013f74dc3a411837', '65', '隆安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a511841', '402881ec3f74d2d5013f74dc3a411837', '70', '马山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a511842', '402881ec3f74d2d5013f74dc3a411837', '75', '上林县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a511843', '402881ec3f74d2d5013f74dc3a411837', '80', '宾阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a511844', '402881ec3f74d2d5013f74dc3a411837', '85', '横　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a511845', '402881ec3f74d2d5013f74dc3a411836', '30', '柳州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a701847', '402881ec3f74d2d5013f74dc3a511845', '30', '城中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a701848', '402881ec3f74d2d5013f74dc3a511845', '35', '鱼峰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a701849', '402881ec3f74d2d5013f74dc3a511845', '40', '柳南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a70184a', '402881ec3f74d2d5013f74dc3a511845', '45', '柳北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80184b', '402881ec3f74d2d5013f74dc3a511845', '50', '柳江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80184c', '402881ec3f74d2d5013f74dc3a511845', '55', '柳城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80184d', '402881ec3f74d2d5013f74dc3a511845', '60', '鹿寨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80184e', '402881ec3f74d2d5013f74dc3a511845', '65', '融安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80184f', '402881ec3f74d2d5013f74dc3a511845', '70', '融水苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801850', '402881ec3f74d2d5013f74dc3a511845', '75', '三江侗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801851', '402881ec3f74d2d5013f74dc3a411836', '35', '桂林市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801853', '402881ec3f74d2d5013f74dc3a801851', '30', '秀峰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801854', '402881ec3f74d2d5013f74dc3a801851', '35', '叠彩区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801855', '402881ec3f74d2d5013f74dc3a801851', '40', '象山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801856', '402881ec3f74d2d5013f74dc3a801851', '45', '七星区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801857', '402881ec3f74d2d5013f74dc3a801851', '50', '雁山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801858', '402881ec3f74d2d5013f74dc3a801851', '55', '阳朔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801859', '402881ec3f74d2d5013f74dc3a801851', '60', '临桂县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80185a', '402881ec3f74d2d5013f74dc3a801851', '65', '灵川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80185b', '402881ec3f74d2d5013f74dc3a801851', '70', '全州县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80185c', '402881ec3f74d2d5013f74dc3a801851', '75', '兴安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80185d', '402881ec3f74d2d5013f74dc3a801851', '80', '永福县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80185e', '402881ec3f74d2d5013f74dc3a801851', '85', '灌阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a80185f', '402881ec3f74d2d5013f74dc3a801851', '90', '龙胜各族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801860', '402881ec3f74d2d5013f74dc3a801851', '95', '资源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801861', '402881ec3f74d2d5013f74dc3a801851', '100', '平乐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801862', '402881ec3f74d2d5013f74dc3a801851', '105', '荔蒲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801863', '402881ec3f74d2d5013f74dc3a801851', '110', '恭城瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a801864', '402881ec3f74d2d5013f74dc3a411836', '40', '梧州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f1866', '402881ec3f74d2d5013f74dc3a801864', '30', '万秀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f1867', '402881ec3f74d2d5013f74dc3a801864', '35', '蝶山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f1868', '402881ec3f74d2d5013f74dc3a801864', '40', '长洲区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f1869', '402881ec3f74d2d5013f74dc3a801864', '45', '苍梧县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f186a', '402881ec3f74d2d5013f74dc3a801864', '50', '藤　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f186b', '402881ec3f74d2d5013f74dc3a801864', '55', '蒙山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f186c', '402881ec3f74d2d5013f74dc3a801864', '60', '岑溪市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3a8f186d', '402881ec3f74d2d5013f74dc3a411836', '45', '北海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be6186f', '402881ec3f74d2d5013f74dc3a8f186d', '30', '海城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61870', '402881ec3f74d2d5013f74dc3a8f186d', '35', '银海区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61871', '402881ec3f74d2d5013f74dc3a8f186d', '40', '铁山港区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61872', '402881ec3f74d2d5013f74dc3a8f186d', '45', '合浦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61873', '402881ec3f74d2d5013f74dc3a411836', '50', '防城港市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61875', '402881ec3f74d2d5013f74dc3be61873', '30', '港口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61876', '402881ec3f74d2d5013f74dc3be61873', '35', '防城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61877', '402881ec3f74d2d5013f74dc3be61873', '40', '上思县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61878', '402881ec3f74d2d5013f74dc3be61873', '45', '东兴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3be61879', '402881ec3f74d2d5013f74dc3a411836', '55', '钦州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3bf6187b', '402881ec3f74d2d5013f74dc3be61879', '30', '钦南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3bf6187c', '402881ec3f74d2d5013f74dc3be61879', '35', '钦北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3bf6187d', '402881ec3f74d2d5013f74dc3be61879', '40', '灵山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3bf6187e', '402881ec3f74d2d5013f74dc3be61879', '45', '浦北县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3bf6187f', '402881ec3f74d2d5013f74dc3a411836', '60', '贵港市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c161881', '402881ec3f74d2d5013f74dc3bf6187f', '30', '港北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c161882', '402881ec3f74d2d5013f74dc3bf6187f', '35', '港南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c161883', '402881ec3f74d2d5013f74dc3bf6187f', '40', '覃塘区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c161884', '402881ec3f74d2d5013f74dc3bf6187f', '45', '平南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c161885', '402881ec3f74d2d5013f74dc3bf6187f', '50', '桂平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c161886', '402881ec3f74d2d5013f74dc3a411836', '65', '玉林市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261888', '402881ec3f74d2d5013f74dc3c161886', '30', '玉州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261889', '402881ec3f74d2d5013f74dc3c161886', '35', '容　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26188a', '402881ec3f74d2d5013f74dc3c161886', '40', '陆川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26188b', '402881ec3f74d2d5013f74dc3c161886', '45', '博白县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26188c', '402881ec3f74d2d5013f74dc3c161886', '50', '兴业县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26188d', '402881ec3f74d2d5013f74dc3c161886', '55', '北流市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26188e', '402881ec3f74d2d5013f74dc3a411836', '70', '百色市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261890', '402881ec3f74d2d5013f74dc3c26188e', '30', '右江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261891', '402881ec3f74d2d5013f74dc3c26188e', '35', '田阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261892', '402881ec3f74d2d5013f74dc3c26188e', '40', '田东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261893', '402881ec3f74d2d5013f74dc3c26188e', '45', '平果县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261894', '402881ec3f74d2d5013f74dc3c26188e', '50', '德保县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261895', '402881ec3f74d2d5013f74dc3c26188e', '55', '靖西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261896', '402881ec3f74d2d5013f74dc3c26188e', '60', '那坡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261897', '402881ec3f74d2d5013f74dc3c26188e', '65', '凌云县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261898', '402881ec3f74d2d5013f74dc3c26188e', '70', '乐业县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c261899', '402881ec3f74d2d5013f74dc3c26188e', '75', '田林县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26189a', '402881ec3f74d2d5013f74dc3c26188e', '80', '西林县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26189b', '402881ec3f74d2d5013f74dc3c26188e', '85', '隆林各族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c26189c', '402881ec3f74d2d5013f74dc3a411836', '75', '贺州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c35189e', '402881ec3f74d2d5013f74dc3c26189c', '30', '八步区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c35189f', '402881ec3f74d2d5013f74dc3c26189c', '35', '昭平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c3518a0', '402881ec3f74d2d5013f74dc3c26189c', '40', '钟山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c3518a1', '402881ec3f74d2d5013f74dc3c26189c', '45', '富川瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c3518a2', '402881ec3f74d2d5013f74dc3a411836', '80', '河池市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518a4', '402881ec3f74d2d5013f74dc3c3518a2', '30', '金城江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518a5', '402881ec3f74d2d5013f74dc3c3518a2', '35', '南丹县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518a6', '402881ec3f74d2d5013f74dc3c3518a2', '40', '天峨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518a7', '402881ec3f74d2d5013f74dc3c3518a2', '45', '凤山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518a8', '402881ec3f74d2d5013f74dc3c3518a2', '50', '东兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518a9', '402881ec3f74d2d5013f74dc3c3518a2', '55', '罗城仫佬族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518aa', '402881ec3f74d2d5013f74dc3c3518a2', '60', '环江毛南族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518ab', '402881ec3f74d2d5013f74dc3c3518a2', '65', '巴马瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518ac', '402881ec3f74d2d5013f74dc3c3518a2', '70', '都安瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518ad', '402881ec3f74d2d5013f74dc3c3518a2', '75', '大化瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518ae', '402881ec3f74d2d5013f74dc3c3518a2', '80', '宜州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518af', '402881ec3f74d2d5013f74dc3a411836', '85', '来宾市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518b1', '402881ec3f74d2d5013f74dc3c4518af', '30', '兴宾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518b2', '402881ec3f74d2d5013f74dc3c4518af', '35', '忻城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518b3', '402881ec3f74d2d5013f74dc3c4518af', '40', '象州县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518b4', '402881ec3f74d2d5013f74dc3c4518af', '45', '武宣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518b5', '402881ec3f74d2d5013f74dc3c4518af', '50', '金秀瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518b6', '402881ec3f74d2d5013f74dc3c4518af', '55', '合山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c4518b7', '402881ec3f74d2d5013f74dc3a411836', '90', '崇左市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518b9', '402881ec3f74d2d5013f74dc3c4518b7', '30', '江洲区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518ba', '402881ec3f74d2d5013f74dc3c4518b7', '35', '扶绥县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518bb', '402881ec3f74d2d5013f74dc3c4518b7', '40', '宁明县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518bc', '402881ec3f74d2d5013f74dc3c4518b7', '45', '龙州县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518bd', '402881ec3f74d2d5013f74dc3c4518b7', '50', '大新县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518be', '402881ec3f74d2d5013f74dc3c4518b7', '55', '天等县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518bf', '402881ec3f74d2d5013f74dc3c4518b7', '60', '凭祥市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c5518c0', '402881ea3f5b1d14013f5b1fdc080006', '125', '海南省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c6418c1', '402881ec3f74d2d5013f74dc3c5518c0', '25', '海口市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c7418c3', '402881ec3f74d2d5013f74dc3c6418c1', '30', '秀英区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c7418c4', '402881ec3f74d2d5013f74dc3c6418c1', '35', '龙华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c7418c5', '402881ec3f74d2d5013f74dc3c6418c1', '40', '琼山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c7418c6', '402881ec3f74d2d5013f74dc3c6418c1', '45', '美兰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c7418c7', '402881ec3f74d2d5013f74dc3c5518c0', '30', '三亚市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3c9318c9', '402881ec3f74d2d5013f74dc3c5518c0', '35', '省直辖县级行政单位', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318ca', '402881ec3f74d2d5013f74dc3c9318c9', '25', '五指山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318cb', '402881ec3f74d2d5013f74dc3c9318c9', '30', '琼海市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318cc', '402881ec3f74d2d5013f74dc3c9318c9', '35', '儋州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318cd', '402881ec3f74d2d5013f74dc3c9318c9', '40', '文昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318ce', '402881ec3f74d2d5013f74dc3c9318c9', '45', '万宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318cf', '402881ec3f74d2d5013f74dc3c9318c9', '50', '东方市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d0', '402881ec3f74d2d5013f74dc3c9318c9', '55', '定安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d1', '402881ec3f74d2d5013f74dc3c9318c9', '60', '屯昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d2', '402881ec3f74d2d5013f74dc3c9318c9', '65', '澄迈县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d3', '402881ec3f74d2d5013f74dc3c9318c9', '70', '临高县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d4', '402881ec3f74d2d5013f74dc3c9318c9', '75', '白沙黎族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d5', '402881ec3f74d2d5013f74dc3c9318c9', '80', '昌江黎族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d6', '402881ec3f74d2d5013f74dc3c9318c9', '85', '乐东黎族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d7', '402881ec3f74d2d5013f74dc3c9318c9', '90', '陵水黎族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d8', '402881ec3f74d2d5013f74dc3c9318c9', '95', '保亭黎族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318d9', '402881ec3f74d2d5013f74dc3c9318c9', '100', '琼中黎族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318da', '402881ec3f74d2d5013f74dc3c9318c9', '105', '西沙群岛', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318db', '402881ec3f74d2d5013f74dc3c9318c9', '110', '南沙群岛', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318dc', '402881ec3f74d2d5013f74dc3c9318c9', '115', '中沙群岛的岛礁及其海域', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ca318dd', '402881ea3f5b1d14013f5b1fdc080006', '130', '重庆市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218de', '402881ec3f74d2d5013f74dc3ca318dd', '25', '万州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218df', '402881ec3f74d2d5013f74dc3ca318dd', '30', '涪陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e0', '402881ec3f74d2d5013f74dc3ca318dd', '35', '渝中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e1', '402881ec3f74d2d5013f74dc3ca318dd', '40', '大渡口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e2', '402881ec3f74d2d5013f74dc3ca318dd', '45', '江北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e3', '402881ec3f74d2d5013f74dc3ca318dd', '50', '沙坪坝区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e4', '402881ec3f74d2d5013f74dc3ca318dd', '55', '九龙坡区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e5', '402881ec3f74d2d5013f74dc3ca318dd', '60', '南岸区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e6', '402881ec3f74d2d5013f74dc3ca318dd', '65', '北碚区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e7', '402881ec3f74d2d5013f74dc3ca318dd', '70', '万盛区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e8', '402881ec3f74d2d5013f74dc3ca318dd', '75', '双桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218e9', '402881ec3f74d2d5013f74dc3ca318dd', '80', '渝北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218ea', '402881ec3f74d2d5013f74dc3ca318dd', '85', '巴南区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218eb', '402881ec3f74d2d5013f74dc3ca318dd', '90', '黔江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cb218ec', '402881ec3f74d2d5013f74dc3ca318dd', '95', '长寿区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218ed', '402881ec3f74d2d5013f74dc3ca318dd', '25', '綦江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218ee', '402881ec3f74d2d5013f74dc3ca318dd', '30', '潼南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218ef', '402881ec3f74d2d5013f74dc3ca318dd', '35', '铜梁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f0', '402881ec3f74d2d5013f74dc3ca318dd', '40', '大足县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f1', '402881ec3f74d2d5013f74dc3ca318dd', '45', '荣昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f2', '402881ec3f74d2d5013f74dc3ca318dd', '50', '璧山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f3', '402881ec3f74d2d5013f74dc3ca318dd', '55', '梁平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f4', '402881ec3f74d2d5013f74dc3ca318dd', '60', '城口县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f5', '402881ec3f74d2d5013f74dc3ca318dd', '65', '丰都县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f6', '402881ec3f74d2d5013f74dc3ca318dd', '70', '垫江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f7', '402881ec3f74d2d5013f74dc3ca318dd', '75', '武隆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f8', '402881ec3f74d2d5013f74dc3ca318dd', '80', '忠　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218f9', '402881ec3f74d2d5013f74dc3ca318dd', '85', '开　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218fa', '402881ec3f74d2d5013f74dc3ca318dd', '90', '云阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218fb', '402881ec3f74d2d5013f74dc3ca318dd', '95', '奉节县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218fc', '402881ec3f74d2d5013f74dc3ca318dd', '100', '巫山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218fd', '402881ec3f74d2d5013f74dc3ca318dd', '105', '巫溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218fe', '402881ec3f74d2d5013f74dc3ca318dd', '110', '石柱土家族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc218ff', '402881ec3f74d2d5013f74dc3ca318dd', '115', '秀山土家族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc21900', '402881ec3f74d2d5013f74dc3ca318dd', '120', '酉阳土家族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc21901', '402881ec3f74d2d5013f74dc3ca318dd', '125', '彭水苗族土家族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cc21902', '402881ec3f74d2d5013f74dc3ca318dd', '35', '市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cd11903', '402881ec3f74d2d5013f74dc3cc21902', '25', '江津市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cd11904', '402881ec3f74d2d5013f74dc3cc21902', '30', '合川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cd11905', '402881ec3f74d2d5013f74dc3cc21902', '35', '永川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cd11906', '402881ec3f74d2d5013f74dc3cc21902', '40', '南川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cd11907', '402881ea3f5b1d14013f5b1fdc080006', '135', '四川省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ce11908', '402881ec3f74d2d5013f74dc3cd11907', '25', '成都市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1190a', '402881ec3f74d2d5013f74dc3ce11908', '30', '锦江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1190b', '402881ec3f74d2d5013f74dc3ce11908', '35', '青羊区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1190c', '402881ec3f74d2d5013f74dc3ce11908', '40', '金牛区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1190d', '402881ec3f74d2d5013f74dc3ce11908', '45', '武侯区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1190e', '402881ec3f74d2d5013f74dc3ce11908', '50', '成华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1190f', '402881ec3f74d2d5013f74dc3ce11908', '55', '龙泉驿区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11910', '402881ec3f74d2d5013f74dc3ce11908', '60', '青白江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11911', '402881ec3f74d2d5013f74dc3ce11908', '65', '新都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11912', '402881ec3f74d2d5013f74dc3ce11908', '70', '温江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11913', '402881ec3f74d2d5013f74dc3ce11908', '75', '金堂县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11914', '402881ec3f74d2d5013f74dc3ce11908', '80', '双流县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11915', '402881ec3f74d2d5013f74dc3ce11908', '85', '郫　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11916', '402881ec3f74d2d5013f74dc3ce11908', '90', '大邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11917', '402881ec3f74d2d5013f74dc3ce11908', '95', '蒲江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11918', '402881ec3f74d2d5013f74dc3ce11908', '100', '新津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf11919', '402881ec3f74d2d5013f74dc3ce11908', '105', '都江堰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1191a', '402881ec3f74d2d5013f74dc3ce11908', '110', '彭州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1191b', '402881ec3f74d2d5013f74dc3ce11908', '115', '邛崃市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1191c', '402881ec3f74d2d5013f74dc3ce11908', '120', '崇州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3cf1191d', '402881ec3f74d2d5013f74dc3cd11907', '30', '自贡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d10191f', '402881ec3f74d2d5013f74dc3cf1191d', '30', '自流井区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101920', '402881ec3f74d2d5013f74dc3cf1191d', '35', '贡井区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101921', '402881ec3f74d2d5013f74dc3cf1191d', '40', '大安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101922', '402881ec3f74d2d5013f74dc3cf1191d', '45', '沿滩区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101923', '402881ec3f74d2d5013f74dc3cf1191d', '50', '荣　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101924', '402881ec3f74d2d5013f74dc3cf1191d', '55', '富顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101925', '402881ec3f74d2d5013f74dc3cd11907', '35', '攀枝花市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101927', '402881ec3f74d2d5013f74dc3d101925', '30', '东　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101928', '402881ec3f74d2d5013f74dc3d101925', '35', '西　区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d101929', '402881ec3f74d2d5013f74dc3d101925', '40', '仁和区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d10192a', '402881ec3f74d2d5013f74dc3d101925', '45', '米易县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d10192b', '402881ec3f74d2d5013f74dc3d101925', '50', '盐边县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d10192c', '402881ec3f74d2d5013f74dc3cd11907', '40', '泸州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f192e', '402881ec3f74d2d5013f74dc3d10192c', '30', '江阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f192f', '402881ec3f74d2d5013f74dc3d10192c', '35', '纳溪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f1930', '402881ec3f74d2d5013f74dc3d10192c', '40', '龙马潭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f1931', '402881ec3f74d2d5013f74dc3d10192c', '45', '泸　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f1932', '402881ec3f74d2d5013f74dc3d10192c', '50', '合江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f1933', '402881ec3f74d2d5013f74dc3d10192c', '55', '叙永县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f1934', '402881ec3f74d2d5013f74dc3d10192c', '60', '古蔺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d1f1935', '402881ec3f74d2d5013f74dc3cd11907', '45', '德阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d3f1937', '402881ec3f74d2d5013f74dc3d1f1935', '30', '旌阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d3f1938', '402881ec3f74d2d5013f74dc3d1f1935', '35', '中江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d3f1939', '402881ec3f74d2d5013f74dc3d1f1935', '40', '罗江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d3f193a', '402881ec3f74d2d5013f74dc3d1f1935', '45', '广汉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d3f193b', '402881ec3f74d2d5013f74dc3d1f1935', '50', '什邡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d3f193c', '402881ec3f74d2d5013f74dc3d1f1935', '55', '绵竹市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d3f193d', '402881ec3f74d2d5013f74dc3cd11907', '50', '绵阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e193f', '402881ec3f74d2d5013f74dc3d3f193d', '30', '涪城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1940', '402881ec3f74d2d5013f74dc3d3f193d', '35', '游仙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1941', '402881ec3f74d2d5013f74dc3d3f193d', '40', '三台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1942', '402881ec3f74d2d5013f74dc3d3f193d', '45', '盐亭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1943', '402881ec3f74d2d5013f74dc3d3f193d', '50', '安　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1944', '402881ec3f74d2d5013f74dc3d3f193d', '55', '梓潼县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1945', '402881ec3f74d2d5013f74dc3d3f193d', '60', '北川羌族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1946', '402881ec3f74d2d5013f74dc3d3f193d', '65', '平武县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1947', '402881ec3f74d2d5013f74dc3d3f193d', '70', '江油市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d5e1948', '402881ec3f74d2d5013f74dc3cd11907', '55', '广元市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d194a', '402881ec3f74d2d5013f74dc3d5e1948', '30', '市中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d194b', '402881ec3f74d2d5013f74dc3d5e1948', '35', '元坝区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d194c', '402881ec3f74d2d5013f74dc3d5e1948', '40', '朝天区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d194d', '402881ec3f74d2d5013f74dc3d5e1948', '45', '旺苍县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d194e', '402881ec3f74d2d5013f74dc3d5e1948', '50', '青川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d194f', '402881ec3f74d2d5013f74dc3d5e1948', '55', '剑阁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d1950', '402881ec3f74d2d5013f74dc3d5e1948', '60', '苍溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d6d1951', '402881ec3f74d2d5013f74dc3cd11907', '60', '遂宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d7d1953', '402881ec3f74d2d5013f74dc3d6d1951', '30', '船山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d7d1954', '402881ec3f74d2d5013f74dc3d6d1951', '35', '安居区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d7d1955', '402881ec3f74d2d5013f74dc3d6d1951', '40', '蓬溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d7d1956', '402881ec3f74d2d5013f74dc3d6d1951', '45', '射洪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d7d1957', '402881ec3f74d2d5013f74dc3d6d1951', '50', '大英县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d7d1958', '402881ec3f74d2d5013f74dc3cd11907', '65', '内江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d8d195a', '402881ec3f74d2d5013f74dc3d7d1958', '30', '市中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d8d195b', '402881ec3f74d2d5013f74dc3d7d1958', '35', '东兴区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d8d195c', '402881ec3f74d2d5013f74dc3d7d1958', '40', '威远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d8d195d', '402881ec3f74d2d5013f74dc3d7d1958', '45', '资中县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d8d195e', '402881ec3f74d2d5013f74dc3d7d1958', '50', '隆昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d8d195f', '402881ec3f74d2d5013f74dc3cd11907', '70', '乐山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1961', '402881ec3f74d2d5013f74dc3d8d195f', '30', '市中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1962', '402881ec3f74d2d5013f74dc3d8d195f', '35', '沙湾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1963', '402881ec3f74d2d5013f74dc3d8d195f', '40', '五通桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1964', '402881ec3f74d2d5013f74dc3d8d195f', '45', '金口河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1965', '402881ec3f74d2d5013f74dc3d8d195f', '50', '犍为县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1966', '402881ec3f74d2d5013f74dc3d8d195f', '55', '井研县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1967', '402881ec3f74d2d5013f74dc3d8d195f', '60', '夹江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1968', '402881ec3f74d2d5013f74dc3d8d195f', '65', '沐川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c1969', '402881ec3f74d2d5013f74dc3d8d195f', '70', '峨边彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c196a', '402881ec3f74d2d5013f74dc3d8d195f', '75', '马边彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c196b', '402881ec3f74d2d5013f74dc3d8d195f', '80', '峨眉山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3d9c196c', '402881ec3f74d2d5013f74dc3cd11907', '75', '南充市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb196e', '402881ec3f74d2d5013f74dc3d9c196c', '30', '顺庆区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb196f', '402881ec3f74d2d5013f74dc3d9c196c', '35', '高坪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1970', '402881ec3f74d2d5013f74dc3d9c196c', '40', '嘉陵区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1971', '402881ec3f74d2d5013f74dc3d9c196c', '45', '南部县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1972', '402881ec3f74d2d5013f74dc3d9c196c', '50', '营山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1973', '402881ec3f74d2d5013f74dc3d9c196c', '55', '蓬安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1974', '402881ec3f74d2d5013f74dc3d9c196c', '60', '仪陇县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1975', '402881ec3f74d2d5013f74dc3d9c196c', '65', '西充县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1976', '402881ec3f74d2d5013f74dc3d9c196c', '70', '阆中市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dbb1977', '402881ec3f74d2d5013f74dc3cd11907', '80', '眉山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dcb1979', '402881ec3f74d2d5013f74dc3dbb1977', '30', '东坡区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dcb197a', '402881ec3f74d2d5013f74dc3dbb1977', '35', '仁寿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dcb197b', '402881ec3f74d2d5013f74dc3dbb1977', '40', '彭山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dcb197c', '402881ec3f74d2d5013f74dc3dbb1977', '45', '洪雅县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dcb197d', '402881ec3f74d2d5013f74dc3dbb1977', '50', '丹棱县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dcb197e', '402881ec3f74d2d5013f74dc3dbb1977', '55', '青神县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dcb197f', '402881ec3f74d2d5013f74dc3cd11907', '85', '宜宾市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1981', '402881ec3f74d2d5013f74dc3dcb197f', '30', '翠屏区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1982', '402881ec3f74d2d5013f74dc3dcb197f', '35', '宜宾县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1983', '402881ec3f74d2d5013f74dc3dcb197f', '40', '南溪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1984', '402881ec3f74d2d5013f74dc3dcb197f', '45', '江安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1985', '402881ec3f74d2d5013f74dc3dcb197f', '50', '长宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1986', '402881ec3f74d2d5013f74dc3dcb197f', '55', '高　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1987', '402881ec3f74d2d5013f74dc3dcb197f', '60', '珙　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1988', '402881ec3f74d2d5013f74dc3dcb197f', '65', '筠连县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb1989', '402881ec3f74d2d5013f74dc3dcb197f', '70', '兴文县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb198a', '402881ec3f74d2d5013f74dc3dcb197f', '75', '屏山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ddb198b', '402881ec3f74d2d5013f74dc3cd11907', '90', '广安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dea198d', '402881ec3f74d2d5013f74dc3ddb198b', '30', '广安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dea198e', '402881ec3f74d2d5013f74dc3ddb198b', '35', '岳池县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dea198f', '402881ec3f74d2d5013f74dc3ddb198b', '40', '武胜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dea1990', '402881ec3f74d2d5013f74dc3ddb198b', '45', '邻水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dea1991', '402881ec3f74d2d5013f74dc3ddb198b', '50', '华莹市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3dea1992', '402881ec3f74d2d5013f74dc3cd11907', '95', '达州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e191994', '402881ec3f74d2d5013f74dc3dea1992', '30', '通川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e191995', '402881ec3f74d2d5013f74dc3dea1992', '35', '达　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e191996', '402881ec3f74d2d5013f74dc3dea1992', '40', '宣汉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e191997', '402881ec3f74d2d5013f74dc3dea1992', '45', '开江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e191998', '402881ec3f74d2d5013f74dc3dea1992', '50', '大竹县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e191999', '402881ec3f74d2d5013f74dc3dea1992', '55', '渠　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e19199a', '402881ec3f74d2d5013f74dc3dea1992', '60', '万源市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e19199b', '402881ec3f74d2d5013f74dc3cd11907', '100', '雅安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e29199d', '402881ec3f74d2d5013f74dc3e19199b', '30', '雨城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e29199e', '402881ec3f74d2d5013f74dc3e19199b', '35', '名山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e29199f', '402881ec3f74d2d5013f74dc3e19199b', '40', '荥经县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e2919a0', '402881ec3f74d2d5013f74dc3e19199b', '45', '汉源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e2919a1', '402881ec3f74d2d5013f74dc3e19199b', '50', '石棉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e2919a2', '402881ec3f74d2d5013f74dc3e19199b', '55', '天全县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e2919a3', '402881ec3f74d2d5013f74dc3e19199b', '60', '芦山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e2919a4', '402881ec3f74d2d5013f74dc3e19199b', '65', '宝兴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e2919a5', '402881ec3f74d2d5013f74dc3cd11907', '105', '巴中市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819a7', '402881ec3f74d2d5013f74dc3e2919a5', '30', '巴州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819a8', '402881ec3f74d2d5013f74dc3e2919a5', '35', '通江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819a9', '402881ec3f74d2d5013f74dc3e2919a5', '40', '南江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819aa', '402881ec3f74d2d5013f74dc3e2919a5', '45', '平昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819ab', '402881ec3f74d2d5013f74dc3cd11907', '110', '资阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819ad', '402881ec3f74d2d5013f74dc3e3819ab', '30', '雁江区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819ae', '402881ec3f74d2d5013f74dc3e3819ab', '35', '安岳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819af', '402881ec3f74d2d5013f74dc3e3819ab', '40', '乐至县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819b0', '402881ec3f74d2d5013f74dc3e3819ab', '45', '简阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e3819b1', '402881ec3f74d2d5013f74dc3cd11907', '115', '阿坝藏族羌族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b2', '402881ec3f74d2d5013f74dc3e3819b1', '25', '汶川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b3', '402881ec3f74d2d5013f74dc3e3819b1', '30', '理　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b4', '402881ec3f74d2d5013f74dc3e3819b1', '35', '茂　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b5', '402881ec3f74d2d5013f74dc3e3819b1', '40', '松潘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b6', '402881ec3f74d2d5013f74dc3e3819b1', '45', '九寨沟县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b7', '402881ec3f74d2d5013f74dc3e3819b1', '50', '金川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b8', '402881ec3f74d2d5013f74dc3e3819b1', '55', '小金县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719b9', '402881ec3f74d2d5013f74dc3e3819b1', '60', '黑水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719ba', '402881ec3f74d2d5013f74dc3e3819b1', '65', '马尔康县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719bb', '402881ec3f74d2d5013f74dc3e3819b1', '70', '壤塘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719bc', '402881ec3f74d2d5013f74dc3e3819b1', '75', '阿坝县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719bd', '402881ec3f74d2d5013f74dc3e3819b1', '80', '若尔盖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719be', '402881ec3f74d2d5013f74dc3e3819b1', '85', '红原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e5719bf', '402881ec3f74d2d5013f74dc3cd11907', '120', '甘孜藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c0', '402881ec3f74d2d5013f74dc3e5719bf', '25', '康定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c1', '402881ec3f74d2d5013f74dc3e5719bf', '30', '泸定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c2', '402881ec3f74d2d5013f74dc3e5719bf', '35', '丹巴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c3', '402881ec3f74d2d5013f74dc3e5719bf', '40', '九龙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c4', '402881ec3f74d2d5013f74dc3e5719bf', '45', '雅江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c5', '402881ec3f74d2d5013f74dc3e5719bf', '50', '道孚县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c6', '402881ec3f74d2d5013f74dc3e5719bf', '55', '炉霍县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c7', '402881ec3f74d2d5013f74dc3e5719bf', '60', '甘孜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c8', '402881ec3f74d2d5013f74dc3e5719bf', '65', '新龙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719c9', '402881ec3f74d2d5013f74dc3e5719bf', '70', '德格县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719ca', '402881ec3f74d2d5013f74dc3e5719bf', '75', '白玉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719cb', '402881ec3f74d2d5013f74dc3e5719bf', '80', '石渠县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719cc', '402881ec3f74d2d5013f74dc3e5719bf', '85', '色达县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719cd', '402881ec3f74d2d5013f74dc3e5719bf', '90', '理塘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719ce', '402881ec3f74d2d5013f74dc3e5719bf', '95', '巴塘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719cf', '402881ec3f74d2d5013f74dc3e5719bf', '100', '乡城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719d0', '402881ec3f74d2d5013f74dc3e5719bf', '105', '稻城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719d1', '402881ec3f74d2d5013f74dc3e5719bf', '110', '得荣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e6719d2', '402881ec3f74d2d5013f74dc3cd11907', '125', '凉山彝族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719d3', '402881ec3f74d2d5013f74dc3e6719d2', '25', '西昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719d4', '402881ec3f74d2d5013f74dc3e6719d2', '30', '木里藏族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719d5', '402881ec3f74d2d5013f74dc3e6719d2', '35', '盐源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719d6', '402881ec3f74d2d5013f74dc3e6719d2', '40', '德昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719d7', '402881ec3f74d2d5013f74dc3e6719d2', '45', '会理县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719d8', '402881ec3f74d2d5013f74dc3e6719d2', '50', '会东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719d9', '402881ec3f74d2d5013f74dc3e6719d2', '55', '宁南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719da', '402881ec3f74d2d5013f74dc3e6719d2', '60', '普格县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719db', '402881ec3f74d2d5013f74dc3e6719d2', '65', '布拖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719dc', '402881ec3f74d2d5013f74dc3e6719d2', '70', '金阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719dd', '402881ec3f74d2d5013f74dc3e6719d2', '75', '昭觉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719de', '402881ec3f74d2d5013f74dc3e6719d2', '80', '喜德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719df', '402881ec3f74d2d5013f74dc3e6719d2', '85', '冕宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719e0', '402881ec3f74d2d5013f74dc3e6719d2', '90', '越西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719e1', '402881ec3f74d2d5013f74dc3e6719d2', '95', '甘洛县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719e2', '402881ec3f74d2d5013f74dc3e6719d2', '100', '美姑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719e3', '402881ec3f74d2d5013f74dc3e6719d2', '105', '雷波县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e7719e4', '402881ea3f5b1d14013f5b1fdc080006', '140', '贵州省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3e8619e5', '402881ec3f74d2d5013f74dc3e7719e4', '25', '贵阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519e7', '402881ec3f74d2d5013f74dc3e8619e5', '30', '南明区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519e8', '402881ec3f74d2d5013f74dc3e8619e5', '35', '云岩区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519e9', '402881ec3f74d2d5013f74dc3e8619e5', '40', '花溪区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519ea', '402881ec3f74d2d5013f74dc3e8619e5', '45', '乌当区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519eb', '402881ec3f74d2d5013f74dc3e8619e5', '50', '白云区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519ec', '402881ec3f74d2d5013f74dc3e8619e5', '55', '小河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519ed', '402881ec3f74d2d5013f74dc3e8619e5', '60', '开阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519ee', '402881ec3f74d2d5013f74dc3e8619e5', '65', '息烽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519ef', '402881ec3f74d2d5013f74dc3e8619e5', '70', '修文县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519f0', '402881ec3f74d2d5013f74dc3e8619e5', '75', '清镇市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ea519f1', '402881ec3f74d2d5013f74dc3e7719e4', '30', '六盘水市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3eb519f2', '402881ec3f74d2d5013f74dc3ea519f1', '25', '钟山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3eb519f3', '402881ec3f74d2d5013f74dc3ea519f1', '30', '六枝特区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3eb519f4', '402881ec3f74d2d5013f74dc3ea519f1', '35', '水城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3eb519f5', '402881ec3f74d2d5013f74dc3ea519f1', '40', '盘　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3eb519f6', '402881ec3f74d2d5013f74dc3e7719e4', '35', '遵义市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419f8', '402881ec3f74d2d5013f74dc3eb519f6', '30', '红花岗区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419f9', '402881ec3f74d2d5013f74dc3eb519f6', '35', '汇川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419fa', '402881ec3f74d2d5013f74dc3eb519f6', '40', '遵义县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419fb', '402881ec3f74d2d5013f74dc3eb519f6', '45', '桐梓县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419fc', '402881ec3f74d2d5013f74dc3eb519f6', '50', '绥阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419fd', '402881ec3f74d2d5013f74dc3eb519f6', '55', '正安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419fe', '402881ec3f74d2d5013f74dc3eb519f6', '60', '道真仡佬族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed419ff', '402881ec3f74d2d5013f74dc3eb519f6', '65', '务川仡佬族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a00', '402881ec3f74d2d5013f74dc3eb519f6', '70', '凤冈县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a01', '402881ec3f74d2d5013f74dc3eb519f6', '75', '湄潭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a02', '402881ec3f74d2d5013f74dc3eb519f6', '80', '余庆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a03', '402881ec3f74d2d5013f74dc3eb519f6', '85', '习水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a04', '402881ec3f74d2d5013f74dc3eb519f6', '90', '赤水市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a05', '402881ec3f74d2d5013f74dc3eb519f6', '95', '仁怀市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a06', '402881ec3f74d2d5013f74dc3e7719e4', '40', '安顺市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a08', '402881ec3f74d2d5013f74dc3ed41a06', '30', '西秀区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a09', '402881ec3f74d2d5013f74dc3ed41a06', '35', '平坝县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a0a', '402881ec3f74d2d5013f74dc3ed41a06', '40', '普定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a0b', '402881ec3f74d2d5013f74dc3ed41a06', '45', '镇宁布依族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a0c', '402881ec3f74d2d5013f74dc3ed41a06', '50', '关岭布依族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a0d', '402881ec3f74d2d5013f74dc3ed41a06', '55', '紫云苗族布依族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ed41a0e', '402881ec3f74d2d5013f74dc3e7719e4', '45', '铜仁地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a0f', '402881ec3f74d2d5013f74dc3ed41a0e', '25', '铜仁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a10', '402881ec3f74d2d5013f74dc3ed41a0e', '30', '江口县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a11', '402881ec3f74d2d5013f74dc3ed41a0e', '35', '玉屏侗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a12', '402881ec3f74d2d5013f74dc3ed41a0e', '40', '石阡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a13', '402881ec3f74d2d5013f74dc3ed41a0e', '45', '思南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a14', '402881ec3f74d2d5013f74dc3ed41a0e', '50', '印江土家族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a15', '402881ec3f74d2d5013f74dc3ed41a0e', '55', '德江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a16', '402881ec3f74d2d5013f74dc3ed41a0e', '60', '沿河土家族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a17', '402881ec3f74d2d5013f74dc3ed41a0e', '65', '松桃苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a18', '402881ec3f74d2d5013f74dc3ed41a0e', '70', '万山特区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ef31a19', '402881ec3f74d2d5013f74dc3e7719e4', '50', '黔西南布依族苗族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a1a', '402881ec3f74d2d5013f74dc3ef31a19', '25', '兴义市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a1b', '402881ec3f74d2d5013f74dc3ef31a19', '30', '兴仁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a1c', '402881ec3f74d2d5013f74dc3ef31a19', '35', '普安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a1d', '402881ec3f74d2d5013f74dc3ef31a19', '40', '晴隆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a1e', '402881ec3f74d2d5013f74dc3ef31a19', '45', '贞丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a1f', '402881ec3f74d2d5013f74dc3ef31a19', '50', '望谟县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a20', '402881ec3f74d2d5013f74dc3ef31a19', '55', '册亨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a21', '402881ec3f74d2d5013f74dc3ef31a19', '60', '安龙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f031a22', '402881ec3f74d2d5013f74dc3e7719e4', '55', '毕节地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a23', '402881ec3f74d2d5013f74dc3f031a22', '25', '毕节市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a24', '402881ec3f74d2d5013f74dc3f031a22', '30', '大方县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a25', '402881ec3f74d2d5013f74dc3f031a22', '35', '黔西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a26', '402881ec3f74d2d5013f74dc3f031a22', '40', '金沙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a27', '402881ec3f74d2d5013f74dc3f031a22', '45', '织金县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a28', '402881ec3f74d2d5013f74dc3f031a22', '50', '纳雍县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a29', '402881ec3f74d2d5013f74dc3f031a22', '55', '威宁彝族回族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a2a', '402881ec3f74d2d5013f74dc3f031a22', '60', '赫章县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f131a2b', '402881ec3f74d2d5013f74dc3e7719e4', '60', '黔东南苗族侗族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a2c', '402881ec3f74d2d5013f74dc3f131a2b', '25', '凯里市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a2d', '402881ec3f74d2d5013f74dc3f131a2b', '30', '黄平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a2e', '402881ec3f74d2d5013f74dc3f131a2b', '35', '施秉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a2f', '402881ec3f74d2d5013f74dc3f131a2b', '40', '三穗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a30', '402881ec3f74d2d5013f74dc3f131a2b', '45', '镇远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a31', '402881ec3f74d2d5013f74dc3f131a2b', '50', '岑巩县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a32', '402881ec3f74d2d5013f74dc3f131a2b', '55', '天柱县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a33', '402881ec3f74d2d5013f74dc3f131a2b', '60', '锦屏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a34', '402881ec3f74d2d5013f74dc3f131a2b', '65', '剑河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a35', '402881ec3f74d2d5013f74dc3f131a2b', '70', '台江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a36', '402881ec3f74d2d5013f74dc3f131a2b', '75', '黎平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a37', '402881ec3f74d2d5013f74dc3f131a2b', '80', '榕江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a38', '402881ec3f74d2d5013f74dc3f131a2b', '85', '从江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a39', '402881ec3f74d2d5013f74dc3f131a2b', '90', '雷山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a3a', '402881ec3f74d2d5013f74dc3f131a2b', '95', '麻江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a3b', '402881ec3f74d2d5013f74dc3f131a2b', '100', '丹寨县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f221a3c', '402881ec3f74d2d5013f74dc3e7719e4', '65', '黔南布依族苗族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a3d', '402881ec3f74d2d5013f74dc3f221a3c', '25', '都匀市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a3e', '402881ec3f74d2d5013f74dc3f221a3c', '30', '福泉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a3f', '402881ec3f74d2d5013f74dc3f221a3c', '35', '荔波县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a40', '402881ec3f74d2d5013f74dc3f221a3c', '40', '贵定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a41', '402881ec3f74d2d5013f74dc3f221a3c', '45', '瓮安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a42', '402881ec3f74d2d5013f74dc3f221a3c', '50', '独山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a43', '402881ec3f74d2d5013f74dc3f221a3c', '55', '平塘县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a44', '402881ec3f74d2d5013f74dc3f221a3c', '60', '罗甸县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a45', '402881ec3f74d2d5013f74dc3f221a3c', '65', '长顺县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a46', '402881ec3f74d2d5013f74dc3f221a3c', '70', '龙里县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a47', '402881ec3f74d2d5013f74dc3f221a3c', '75', '惠水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a48', '402881ec3f74d2d5013f74dc3f221a3c', '80', '三都水族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f611a49', '402881ea3f5b1d14013f5b1fdc080006', '145', '云南省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f801a4a', '402881ec3f74d2d5013f74dc3f611a49', '25', '昆明市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a4c', '402881ec3f74d2d5013f74dc3f801a4a', '30', '五华区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a4d', '402881ec3f74d2d5013f74dc3f801a4a', '35', '盘龙区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a4e', '402881ec3f74d2d5013f74dc3f801a4a', '40', '官渡区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a4f', '402881ec3f74d2d5013f74dc3f801a4a', '45', '西山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a50', '402881ec3f74d2d5013f74dc3f801a4a', '50', '东川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a51', '402881ec3f74d2d5013f74dc3f801a4a', '55', '呈贡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a52', '402881ec3f74d2d5013f74dc3f801a4a', '60', '晋宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a53', '402881ec3f74d2d5013f74dc3f801a4a', '65', '富民县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a54', '402881ec3f74d2d5013f74dc3f801a4a', '70', '宜良县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a55', '402881ec3f74d2d5013f74dc3f801a4a', '75', '石林彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a56', '402881ec3f74d2d5013f74dc3f801a4a', '80', '嵩明县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a57', '402881ec3f74d2d5013f74dc3f801a4a', '85', '禄劝彝族苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a58', '402881ec3f74d2d5013f74dc3f801a4a', '90', '寻甸回族彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a59', '402881ec3f74d2d5013f74dc3f801a4a', '95', '安宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3f8f1a5a', '402881ec3f74d2d5013f74dc3f611a49', '30', '曲靖市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a5c', '402881ec3f74d2d5013f74dc3f8f1a5a', '30', '麒麟区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a5d', '402881ec3f74d2d5013f74dc3f8f1a5a', '35', '马龙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a5e', '402881ec3f74d2d5013f74dc3f8f1a5a', '40', '陆良县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a5f', '402881ec3f74d2d5013f74dc3f8f1a5a', '45', '师宗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a60', '402881ec3f74d2d5013f74dc3f8f1a5a', '50', '罗平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a61', '402881ec3f74d2d5013f74dc3f8f1a5a', '55', '富源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a62', '402881ec3f74d2d5013f74dc3f8f1a5a', '60', '会泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a63', '402881ec3f74d2d5013f74dc3f8f1a5a', '65', '沾益县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a64', '402881ec3f74d2d5013f74dc3f8f1a5a', '70', '宣威市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3faf1a65', '402881ec3f74d2d5013f74dc3f611a49', '35', '玉溪市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a67', '402881ec3f74d2d5013f74dc3faf1a65', '30', '红塔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a68', '402881ec3f74d2d5013f74dc3faf1a65', '35', '江川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a69', '402881ec3f74d2d5013f74dc3faf1a65', '40', '澄江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a6a', '402881ec3f74d2d5013f74dc3faf1a65', '45', '通海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a6b', '402881ec3f74d2d5013f74dc3faf1a65', '50', '华宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a6c', '402881ec3f74d2d5013f74dc3faf1a65', '55', '易门县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a6d', '402881ec3f74d2d5013f74dc3faf1a65', '60', '峨山彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a6e', '402881ec3f74d2d5013f74dc3faf1a65', '65', '新平彝族傣族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a6f', '402881ec3f74d2d5013f74dc3faf1a65', '70', '元江哈尼族彝族傣族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fbe1a70', '402881ec3f74d2d5013f74dc3f611a49', '40', '保山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fce1a72', '402881ec3f74d2d5013f74dc3fbe1a70', '30', '隆阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fce1a73', '402881ec3f74d2d5013f74dc3fbe1a70', '35', '施甸县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fce1a74', '402881ec3f74d2d5013f74dc3fbe1a70', '40', '腾冲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fce1a75', '402881ec3f74d2d5013f74dc3fbe1a70', '45', '龙陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fce1a76', '402881ec3f74d2d5013f74dc3fbe1a70', '50', '昌宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fce1a77', '402881ec3f74d2d5013f74dc3f611a49', '45', '昭通市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a79', '402881ec3f74d2d5013f74dc3fce1a77', '30', '昭阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a7a', '402881ec3f74d2d5013f74dc3fce1a77', '35', '鲁甸县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a7b', '402881ec3f74d2d5013f74dc3fce1a77', '40', '巧家县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a7c', '402881ec3f74d2d5013f74dc3fce1a77', '45', '盐津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a7d', '402881ec3f74d2d5013f74dc3fce1a77', '50', '大关县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a7e', '402881ec3f74d2d5013f74dc3fce1a77', '55', '永善县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a7f', '402881ec3f74d2d5013f74dc3fce1a77', '60', '绥江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a80', '402881ec3f74d2d5013f74dc3fce1a77', '65', '镇雄县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a81', '402881ec3f74d2d5013f74dc3fce1a77', '70', '彝良县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a82', '402881ec3f74d2d5013f74dc3fce1a77', '75', '威信县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a83', '402881ec3f74d2d5013f74dc3fce1a77', '80', '水富县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fdd1a84', '402881ec3f74d2d5013f74dc3f611a49', '50', '丽江市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fed1a86', '402881ec3f74d2d5013f74dc3fdd1a84', '30', '古城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fed1a87', '402881ec3f74d2d5013f74dc3fdd1a84', '35', '玉龙纳西族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fed1a88', '402881ec3f74d2d5013f74dc3fdd1a84', '40', '永胜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fed1a89', '402881ec3f74d2d5013f74dc3fdd1a84', '45', '华坪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fed1a8a', '402881ec3f74d2d5013f74dc3fdd1a84', '50', '宁蒗彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3fed1a8b', '402881ec3f74d2d5013f74dc3f611a49', '55', '思茅市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a8d', '402881ec3f74d2d5013f74dc3fed1a8b', '30', '翠云区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a8e', '402881ec3f74d2d5013f74dc3fed1a8b', '35', '普洱哈尼族彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a8f', '402881ec3f74d2d5013f74dc3fed1a8b', '40', '墨江哈尼族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a90', '402881ec3f74d2d5013f74dc3fed1a8b', '45', '景东彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a91', '402881ec3f74d2d5013f74dc3fed1a8b', '50', '景谷傣族彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a92', '402881ec3f74d2d5013f74dc3fed1a8b', '55', '镇沅彝族哈尼族拉祜族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a93', '402881ec3f74d2d5013f74dc3fed1a8b', '60', '江城哈尼族彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a94', '402881ec3f74d2d5013f74dc3fed1a8b', '65', '孟连傣族拉祜族佤族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a95', '402881ec3f74d2d5013f74dc3fed1a8b', '70', '澜沧拉祜族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a96', '402881ec3f74d2d5013f74dc3fed1a8b', '75', '西盟佤族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc3ffe1a97', '402881ec3f74d2d5013f74dc3f611a49', '60', '临沧市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1a99', '402881ec3f74d2d5013f74dc3ffe1a97', '30', '临翔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1a9a', '402881ec3f74d2d5013f74dc3ffe1a97', '35', '凤庆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1a9b', '402881ec3f74d2d5013f74dc3ffe1a97', '40', '云　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1a9c', '402881ec3f74d2d5013f74dc3ffe1a97', '45', '永德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1a9d', '402881ec3f74d2d5013f74dc3ffe1a97', '50', '镇康县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1a9e', '402881ec3f74d2d5013f74dc3ffe1a97', '55', '双江拉祜族佤族布朗族傣族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1a9f', '402881ec3f74d2d5013f74dc3ffe1a97', '60', '耿马傣族佤族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1aa0', '402881ec3f74d2d5013f74dc3ffe1a97', '65', '沧源佤族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc400d1aa1', '402881ec3f74d2d5013f74dc3f611a49', '65', '楚雄彝族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa2', '402881ec3f74d2d5013f74dc400d1aa1', '25', '楚雄市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa3', '402881ec3f74d2d5013f74dc400d1aa1', '30', '双柏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa4', '402881ec3f74d2d5013f74dc400d1aa1', '35', '牟定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa5', '402881ec3f74d2d5013f74dc400d1aa1', '40', '南华县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa6', '402881ec3f74d2d5013f74dc400d1aa1', '45', '姚安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa7', '402881ec3f74d2d5013f74dc400d1aa1', '50', '大姚县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa8', '402881ec3f74d2d5013f74dc400d1aa1', '55', '永仁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aa9', '402881ec3f74d2d5013f74dc400d1aa1', '60', '元谋县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aaa', '402881ec3f74d2d5013f74dc400d1aa1', '65', '武定县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aab', '402881ec3f74d2d5013f74dc400d1aa1', '70', '禄丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc401d1aac', '402881ec3f74d2d5013f74dc3f611a49', '70', '红河哈尼族彝族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1aad', '402881ec3f74d2d5013f74dc401d1aac', '25', '个旧市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1aae', '402881ec3f74d2d5013f74dc401d1aac', '30', '开远市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1aaf', '402881ec3f74d2d5013f74dc401d1aac', '35', '蒙自县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab0', '402881ec3f74d2d5013f74dc401d1aac', '40', '屏边苗族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab1', '402881ec3f74d2d5013f74dc401d1aac', '45', '建水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab2', '402881ec3f74d2d5013f74dc401d1aac', '50', '石屏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab3', '402881ec3f74d2d5013f74dc401d1aac', '55', '弥勒县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab4', '402881ec3f74d2d5013f74dc401d1aac', '60', '泸西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab5', '402881ec3f74d2d5013f74dc401d1aac', '65', '元阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab6', '402881ec3f74d2d5013f74dc401d1aac', '70', '红河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab7', '402881ec3f74d2d5013f74dc401d1aac', '75', '金平苗族瑶族傣族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab8', '402881ec3f74d2d5013f74dc401d1aac', '80', '绿春县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ab9', '402881ec3f74d2d5013f74dc401d1aac', '85', '河口瑶族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1aba', '402881ec3f74d2d5013f74dc3f611a49', '75', '文山壮族苗族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1abb', '402881ec3f74d2d5013f74dc402c1aba', '25', '文山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1abc', '402881ec3f74d2d5013f74dc402c1aba', '30', '砚山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1abd', '402881ec3f74d2d5013f74dc402c1aba', '35', '西畴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1abe', '402881ec3f74d2d5013f74dc402c1aba', '40', '麻栗坡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1abf', '402881ec3f74d2d5013f74dc402c1aba', '45', '马关县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ac0', '402881ec3f74d2d5013f74dc402c1aba', '50', '丘北县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ac1', '402881ec3f74d2d5013f74dc402c1aba', '55', '广南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ac2', '402881ec3f74d2d5013f74dc402c1aba', '60', '富宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc402c1ac3', '402881ec3f74d2d5013f74dc3f611a49', '80', '西双版纳傣族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc403c1ac4', '402881ec3f74d2d5013f74dc402c1ac3', '25', '景洪市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc403c1ac5', '402881ec3f74d2d5013f74dc402c1ac3', '30', '勐海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc403c1ac6', '402881ec3f74d2d5013f74dc402c1ac3', '35', '勐腊县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc403c1ac7', '402881ec3f74d2d5013f74dc3f611a49', '85', '大理白族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ac8', '402881ec3f74d2d5013f74dc403c1ac7', '25', '大理市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ac9', '402881ec3f74d2d5013f74dc403c1ac7', '30', '漾濞彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1aca', '402881ec3f74d2d5013f74dc403c1ac7', '35', '祥云县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1acb', '402881ec3f74d2d5013f74dc403c1ac7', '40', '宾川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1acc', '402881ec3f74d2d5013f74dc403c1ac7', '45', '弥渡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1acd', '402881ec3f74d2d5013f74dc403c1ac7', '50', '南涧彝族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ace', '402881ec3f74d2d5013f74dc403c1ac7', '55', '巍山彝族回族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1acf', '402881ec3f74d2d5013f74dc403c1ac7', '60', '永平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ad0', '402881ec3f74d2d5013f74dc403c1ac7', '65', '云龙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ad1', '402881ec3f74d2d5013f74dc403c1ac7', '70', '洱源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ad2', '402881ec3f74d2d5013f74dc403c1ac7', '75', '剑川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ad3', '402881ec3f74d2d5013f74dc403c1ac7', '80', '鹤庆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc404c1ad4', '402881ec3f74d2d5013f74dc3f611a49', '90', '德宏傣族景颇族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1ad5', '402881ec3f74d2d5013f74dc404c1ad4', '25', '瑞丽市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1ad6', '402881ec3f74d2d5013f74dc404c1ad4', '30', '潞西市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1ad7', '402881ec3f74d2d5013f74dc404c1ad4', '35', '梁河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1ad8', '402881ec3f74d2d5013f74dc404c1ad4', '40', '盈江县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1ad9', '402881ec3f74d2d5013f74dc404c1ad4', '45', '陇川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1ada', '402881ec3f74d2d5013f74dc3f611a49', '95', '怒江傈僳族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1adb', '402881ec3f74d2d5013f74dc405b1ada', '25', '泸水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1adc', '402881ec3f74d2d5013f74dc405b1ada', '30', '福贡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1add', '402881ec3f74d2d5013f74dc405b1ada', '35', '贡山独龙族怒族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1ade', '402881ec3f74d2d5013f74dc405b1ada', '40', '兰坪白族普米族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc405b1adf', '402881ec3f74d2d5013f74dc3f611a49', '100', '迪庆藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc406b1ae0', '402881ec3f74d2d5013f74dc405b1adf', '25', '香格里拉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc406b1ae1', '402881ec3f74d2d5013f74dc405b1adf', '30', '德钦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc406b1ae2', '402881ec3f74d2d5013f74dc405b1adf', '35', '维西傈僳族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc406b1ae3', '402881ea3f5b1d14013f5b1fdc080006', '150', '西藏自治区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc407a1ae4', '402881ec3f74d2d5013f74dc406b1ae3', '25', '拉萨市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1ae6', '402881ec3f74d2d5013f74dc407a1ae4', '30', '城关区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1ae7', '402881ec3f74d2d5013f74dc407a1ae4', '35', '林周县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1ae8', '402881ec3f74d2d5013f74dc407a1ae4', '40', '当雄县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1ae9', '402881ec3f74d2d5013f74dc407a1ae4', '45', '尼木县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1aea', '402881ec3f74d2d5013f74dc407a1ae4', '50', '曲水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1aeb', '402881ec3f74d2d5013f74dc407a1ae4', '55', '堆龙德庆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1aec', '402881ec3f74d2d5013f74dc407a1ae4', '60', '达孜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1aed', '402881ec3f74d2d5013f74dc407a1ae4', '65', '墨竹工卡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1aee', '402881ec3f74d2d5013f74dc406b1ae3', '30', '昌都地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1aef', '402881ec3f74d2d5013f74dc408a1aee', '25', '昌都县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af0', '402881ec3f74d2d5013f74dc408a1aee', '30', '江达县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af1', '402881ec3f74d2d5013f74dc408a1aee', '35', '贡觉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af2', '402881ec3f74d2d5013f74dc408a1aee', '40', '类乌齐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af3', '402881ec3f74d2d5013f74dc408a1aee', '45', '丁青县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af4', '402881ec3f74d2d5013f74dc408a1aee', '50', '察雅县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af5', '402881ec3f74d2d5013f74dc408a1aee', '55', '八宿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af6', '402881ec3f74d2d5013f74dc408a1aee', '60', '左贡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af7', '402881ec3f74d2d5013f74dc408a1aee', '65', '芒康县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af8', '402881ec3f74d2d5013f74dc408a1aee', '70', '洛隆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1af9', '402881ec3f74d2d5013f74dc408a1aee', '75', '边坝县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc408a1afa', '402881ec3f74d2d5013f74dc406b1ae3', '35', '山南地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1afb', '402881ec3f74d2d5013f74dc408a1afa', '25', '乃东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1afc', '402881ec3f74d2d5013f74dc408a1afa', '30', '扎囊县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1afd', '402881ec3f74d2d5013f74dc408a1afa', '35', '贡嘎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1afe', '402881ec3f74d2d5013f74dc408a1afa', '40', '桑日县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1aff', '402881ec3f74d2d5013f74dc408a1afa', '45', '琼结县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b00', '402881ec3f74d2d5013f74dc408a1afa', '50', '曲松县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b01', '402881ec3f74d2d5013f74dc408a1afa', '55', '措美县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b02', '402881ec3f74d2d5013f74dc408a1afa', '60', '洛扎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b03', '402881ec3f74d2d5013f74dc408a1afa', '65', '加查县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b04', '402881ec3f74d2d5013f74dc408a1afa', '70', '隆子县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b05', '402881ec3f74d2d5013f74dc408a1afa', '75', '错那县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b06', '402881ec3f74d2d5013f74dc408a1afa', '80', '浪卡子县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc409a1b07', '402881ec3f74d2d5013f74dc406b1ae3', '40', '日喀则地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b08', '402881ec3f74d2d5013f74dc409a1b07', '25', '日喀则市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b09', '402881ec3f74d2d5013f74dc409a1b07', '30', '南木林县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b0a', '402881ec3f74d2d5013f74dc409a1b07', '35', '江孜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b0b', '402881ec3f74d2d5013f74dc409a1b07', '40', '定日县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b0c', '402881ec3f74d2d5013f74dc409a1b07', '45', '萨迦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b0d', '402881ec3f74d2d5013f74dc409a1b07', '50', '拉孜县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b0e', '402881ec3f74d2d5013f74dc409a1b07', '55', '昂仁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b0f', '402881ec3f74d2d5013f74dc409a1b07', '60', '谢通门县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b10', '402881ec3f74d2d5013f74dc409a1b07', '65', '白朗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b11', '402881ec3f74d2d5013f74dc409a1b07', '70', '仁布县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b12', '402881ec3f74d2d5013f74dc409a1b07', '75', '康马县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b13', '402881ec3f74d2d5013f74dc409a1b07', '80', '定结县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b14', '402881ec3f74d2d5013f74dc409a1b07', '85', '仲巴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b15', '402881ec3f74d2d5013f74dc409a1b07', '90', '亚东县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b16', '402881ec3f74d2d5013f74dc409a1b07', '95', '吉隆县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b17', '402881ec3f74d2d5013f74dc409a1b07', '100', '聂拉木县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b18', '402881ec3f74d2d5013f74dc409a1b07', '105', '萨嘎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b19', '402881ec3f74d2d5013f74dc409a1b07', '110', '岗巴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40a91b1a', '402881ec3f74d2d5013f74dc406b1ae3', '45', '那曲地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b1b', '402881ec3f74d2d5013f74dc40a91b1a', '25', '那曲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b1c', '402881ec3f74d2d5013f74dc40a91b1a', '30', '嘉黎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b1d', '402881ec3f74d2d5013f74dc40a91b1a', '35', '比如县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b1e', '402881ec3f74d2d5013f74dc40a91b1a', '40', '聂荣县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b1f', '402881ec3f74d2d5013f74dc40a91b1a', '45', '安多县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b20', '402881ec3f74d2d5013f74dc40a91b1a', '50', '申扎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b21', '402881ec3f74d2d5013f74dc40a91b1a', '55', '索　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b22', '402881ec3f74d2d5013f74dc40a91b1a', '60', '班戈县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b23', '402881ec3f74d2d5013f74dc40a91b1a', '65', '巴青县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b24', '402881ec3f74d2d5013f74dc40a91b1a', '70', '尼玛县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b25', '402881ec3f74d2d5013f74dc406b1ae3', '50', '阿里地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b26', '402881ec3f74d2d5013f74dc40b91b25', '25', '普兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b27', '402881ec3f74d2d5013f74dc40b91b25', '30', '札达县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b28', '402881ec3f74d2d5013f74dc40b91b25', '35', '噶尔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b29', '402881ec3f74d2d5013f74dc40b91b25', '40', '日土县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b2a', '402881ec3f74d2d5013f74dc40b91b25', '45', '革吉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b2b', '402881ec3f74d2d5013f74dc40b91b25', '50', '改则县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b2c', '402881ec3f74d2d5013f74dc40b91b25', '55', '措勤县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40b91b2d', '402881ec3f74d2d5013f74dc406b1ae3', '55', '林芝地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b2e', '402881ec3f74d2d5013f74dc40b91b2d', '25', '林芝县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b2f', '402881ec3f74d2d5013f74dc40b91b2d', '30', '工布江达县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b30', '402881ec3f74d2d5013f74dc40b91b2d', '35', '米林县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b31', '402881ec3f74d2d5013f74dc40b91b2d', '40', '墨脱县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b32', '402881ec3f74d2d5013f74dc40b91b2d', '45', '波密县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b33', '402881ec3f74d2d5013f74dc40b91b2d', '50', '察隅县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b34', '402881ec3f74d2d5013f74dc40b91b2d', '55', '朗　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40c81b35', '402881ea3f5b1d14013f5b1fdc080006', '155', '陕西省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b36', '402881ec3f74d2d5013f74dc40c81b35', '25', '西安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b38', '402881ec3f74d2d5013f74dc40d81b36', '30', '新城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b39', '402881ec3f74d2d5013f74dc40d81b36', '35', '碑林区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b3a', '402881ec3f74d2d5013f74dc40d81b36', '40', '莲湖区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b3b', '402881ec3f74d2d5013f74dc40d81b36', '45', '灞桥区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b3c', '402881ec3f74d2d5013f74dc40d81b36', '50', '未央区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b3d', '402881ec3f74d2d5013f74dc40d81b36', '55', '雁塔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b3e', '402881ec3f74d2d5013f74dc40d81b36', '60', '阎良区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b3f', '402881ec3f74d2d5013f74dc40d81b36', '65', '临潼区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b40', '402881ec3f74d2d5013f74dc40d81b36', '70', '长安区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b41', '402881ec3f74d2d5013f74dc40d81b36', '75', '蓝田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b42', '402881ec3f74d2d5013f74dc40d81b36', '80', '周至县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b43', '402881ec3f74d2d5013f74dc40d81b36', '85', '户　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b44', '402881ec3f74d2d5013f74dc40d81b36', '90', '高陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40d81b45', '402881ec3f74d2d5013f74dc40c81b35', '30', '铜川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40e81b47', '402881ec3f74d2d5013f74dc40d81b45', '30', '王益区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40e81b48', '402881ec3f74d2d5013f74dc40d81b45', '35', '印台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40e81b49', '402881ec3f74d2d5013f74dc40d81b45', '40', '耀州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40e81b4a', '402881ec3f74d2d5013f74dc40d81b45', '45', '宜君县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40e81b4b', '402881ec3f74d2d5013f74dc40c81b35', '35', '宝鸡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b4d', '402881ec3f74d2d5013f74dc40e81b4b', '30', '渭滨区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b4e', '402881ec3f74d2d5013f74dc40e81b4b', '35', '金台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b4f', '402881ec3f74d2d5013f74dc40e81b4b', '40', '陈仓区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b50', '402881ec3f74d2d5013f74dc40e81b4b', '45', '凤翔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b51', '402881ec3f74d2d5013f74dc40e81b4b', '50', '岐山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b52', '402881ec3f74d2d5013f74dc40e81b4b', '55', '扶风县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b53', '402881ec3f74d2d5013f74dc40e81b4b', '60', '眉　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b54', '402881ec3f74d2d5013f74dc40e81b4b', '65', '陇　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b55', '402881ec3f74d2d5013f74dc40e81b4b', '70', '千阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b56', '402881ec3f74d2d5013f74dc40e81b4b', '75', '麟游县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b57', '402881ec3f74d2d5013f74dc40e81b4b', '80', '凤　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b58', '402881ec3f74d2d5013f74dc40e81b4b', '85', '太白县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b59', '402881ec3f74d2d5013f74dc40c81b35', '40', '咸阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b5b', '402881ec3f74d2d5013f74dc40f71b59', '30', '秦都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b5c', '402881ec3f74d2d5013f74dc40f71b59', '35', '杨凌区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b5d', '402881ec3f74d2d5013f74dc40f71b59', '40', '渭城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b5e', '402881ec3f74d2d5013f74dc40f71b59', '45', '三原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b5f', '402881ec3f74d2d5013f74dc40f71b59', '50', '泾阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b60', '402881ec3f74d2d5013f74dc40f71b59', '55', '乾　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b61', '402881ec3f74d2d5013f74dc40f71b59', '60', '礼泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b62', '402881ec3f74d2d5013f74dc40f71b59', '65', '永寿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b63', '402881ec3f74d2d5013f74dc40f71b59', '70', '彬　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b64', '402881ec3f74d2d5013f74dc40f71b59', '75', '长武县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b65', '402881ec3f74d2d5013f74dc40f71b59', '80', '旬邑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b66', '402881ec3f74d2d5013f74dc40f71b59', '85', '淳化县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b67', '402881ec3f74d2d5013f74dc40f71b59', '90', '武功县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b68', '402881ec3f74d2d5013f74dc40f71b59', '95', '兴平市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc40f71b69', '402881ec3f74d2d5013f74dc40c81b35', '45', '渭南市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b6b', '402881ec3f74d2d5013f74dc40f71b69', '30', '临渭区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b6c', '402881ec3f74d2d5013f74dc40f71b69', '35', '华　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b6d', '402881ec3f74d2d5013f74dc40f71b69', '40', '潼关县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b6e', '402881ec3f74d2d5013f74dc40f71b69', '45', '大荔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b6f', '402881ec3f74d2d5013f74dc40f71b69', '50', '合阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b70', '402881ec3f74d2d5013f74dc40f71b69', '55', '澄城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b71', '402881ec3f74d2d5013f74dc40f71b69', '60', '蒲城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b72', '402881ec3f74d2d5013f74dc40f71b69', '65', '白水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b73', '402881ec3f74d2d5013f74dc40f71b69', '70', '富平县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b74', '402881ec3f74d2d5013f74dc40f71b69', '75', '韩城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b75', '402881ec3f74d2d5013f74dc40f71b69', '80', '华阴市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41071b76', '402881ec3f74d2d5013f74dc40c81b35', '50', '延安市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b78', '402881ec3f74d2d5013f74dc41071b76', '30', '宝塔区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b79', '402881ec3f74d2d5013f74dc41071b76', '35', '延长县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b7a', '402881ec3f74d2d5013f74dc41071b76', '40', '延川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b7b', '402881ec3f74d2d5013f74dc41071b76', '45', '子长县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b7c', '402881ec3f74d2d5013f74dc41071b76', '50', '安塞县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b7d', '402881ec3f74d2d5013f74dc41071b76', '55', '志丹县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b7e', '402881ec3f74d2d5013f74dc41071b76', '60', '吴旗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b7f', '402881ec3f74d2d5013f74dc41071b76', '65', '甘泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b80', '402881ec3f74d2d5013f74dc41071b76', '70', '富　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b81', '402881ec3f74d2d5013f74dc41071b76', '75', '洛川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b82', '402881ec3f74d2d5013f74dc41071b76', '80', '宜川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b83', '402881ec3f74d2d5013f74dc41071b76', '85', '黄龙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b84', '402881ec3f74d2d5013f74dc41071b76', '90', '黄陵县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41261b85', '402881ec3f74d2d5013f74dc40c81b35', '55', '汉中市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b87', '402881ec3f74d2d5013f74dc41261b85', '30', '汉台区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b88', '402881ec3f74d2d5013f74dc41261b85', '35', '南郑县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b89', '402881ec3f74d2d5013f74dc41261b85', '40', '城固县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b8a', '402881ec3f74d2d5013f74dc41261b85', '45', '洋　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b8b', '402881ec3f74d2d5013f74dc41261b85', '50', '西乡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b8c', '402881ec3f74d2d5013f74dc41261b85', '55', '勉　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b8d', '402881ec3f74d2d5013f74dc41261b85', '60', '宁强县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b8e', '402881ec3f74d2d5013f74dc41261b85', '65', '略阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b8f', '402881ec3f74d2d5013f74dc41261b85', '70', '镇巴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b90', '402881ec3f74d2d5013f74dc41261b85', '75', '留坝县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b91', '402881ec3f74d2d5013f74dc41261b85', '80', '佛坪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41361b92', '402881ec3f74d2d5013f74dc40c81b35', '60', '榆林市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b94', '402881ec3f74d2d5013f74dc41361b92', '30', '榆阳区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b95', '402881ec3f74d2d5013f74dc41361b92', '35', '神木县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b96', '402881ec3f74d2d5013f74dc41361b92', '40', '府谷县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b97', '402881ec3f74d2d5013f74dc41361b92', '45', '横山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b98', '402881ec3f74d2d5013f74dc41361b92', '50', '靖边县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b99', '402881ec3f74d2d5013f74dc41361b92', '55', '定边县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b9a', '402881ec3f74d2d5013f74dc41361b92', '60', '绥德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b9b', '402881ec3f74d2d5013f74dc41361b92', '65', '米脂县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b9c', '402881ec3f74d2d5013f74dc41361b92', '70', '佳　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b9d', '402881ec3f74d2d5013f74dc41361b92', '75', '吴堡县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b9e', '402881ec3f74d2d5013f74dc41361b92', '80', '清涧县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451b9f', '402881ec3f74d2d5013f74dc41361b92', '85', '子洲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41451ba0', '402881ec3f74d2d5013f74dc40c81b35', '65', '安康市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba2', '402881ec3f74d2d5013f74dc41451ba0', '30', '汉滨区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba3', '402881ec3f74d2d5013f74dc41451ba0', '35', '汉阴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba4', '402881ec3f74d2d5013f74dc41451ba0', '40', '石泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba5', '402881ec3f74d2d5013f74dc41451ba0', '45', '宁陕县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba6', '402881ec3f74d2d5013f74dc41451ba0', '50', '紫阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba7', '402881ec3f74d2d5013f74dc41451ba0', '55', '岚皋县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba8', '402881ec3f74d2d5013f74dc41451ba0', '60', '平利县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551ba9', '402881ec3f74d2d5013f74dc41451ba0', '65', '镇坪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551baa', '402881ec3f74d2d5013f74dc41451ba0', '70', '旬阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551bab', '402881ec3f74d2d5013f74dc41451ba0', '75', '白河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41551bac', '402881ec3f74d2d5013f74dc40c81b35', '70', '商洛市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bae', '402881ec3f74d2d5013f74dc41551bac', '30', '商州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641baf', '402881ec3f74d2d5013f74dc41551bac', '35', '洛南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bb0', '402881ec3f74d2d5013f74dc41551bac', '40', '丹凤县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bb1', '402881ec3f74d2d5013f74dc41551bac', '45', '商南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bb2', '402881ec3f74d2d5013f74dc41551bac', '50', '山阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bb3', '402881ec3f74d2d5013f74dc41551bac', '55', '镇安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bb4', '402881ec3f74d2d5013f74dc41551bac', '60', '柞水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bb5', '402881ea3f5b1d14013f5b1fdc080006', '160', '甘肃省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41641bb6', '402881ec3f74d2d5013f74dc41641bb5', '25', '兰州市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bb8', '402881ec3f74d2d5013f74dc41641bb6', '30', '城关区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bb9', '402881ec3f74d2d5013f74dc41641bb6', '35', '七里河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bba', '402881ec3f74d2d5013f74dc41641bb6', '40', '西固区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bbb', '402881ec3f74d2d5013f74dc41641bb6', '45', '安宁区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bbc', '402881ec3f74d2d5013f74dc41641bb6', '50', '红古区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bbd', '402881ec3f74d2d5013f74dc41641bb6', '55', '永登县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bbe', '402881ec3f74d2d5013f74dc41641bb6', '60', '皋兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bbf', '402881ec3f74d2d5013f74dc41641bb6', '65', '榆中县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41741bc0', '402881ec3f74d2d5013f74dc41641bb5', '30', '嘉峪关市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41841bc2', '402881ec3f74d2d5013f74dc41641bb5', '35', '金昌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41931bc4', '402881ec3f74d2d5013f74dc41841bc2', '30', '金川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41931bc5', '402881ec3f74d2d5013f74dc41841bc2', '35', '永昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41931bc6', '402881ec3f74d2d5013f74dc41641bb5', '40', '白银市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41a31bc8', '402881ec3f74d2d5013f74dc41931bc6', '30', '白银区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41a31bc9', '402881ec3f74d2d5013f74dc41931bc6', '35', '平川区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41a31bca', '402881ec3f74d2d5013f74dc41931bc6', '40', '靖远县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41a31bcb', '402881ec3f74d2d5013f74dc41931bc6', '45', '会宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41a31bcc', '402881ec3f74d2d5013f74dc41931bc6', '50', '景泰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41a31bcd', '402881ec3f74d2d5013f74dc41641bb5', '45', '天水市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bcf', '402881ec3f74d2d5013f74dc41a31bcd', '30', '秦城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bd0', '402881ec3f74d2d5013f74dc41a31bcd', '35', '北道区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bd1', '402881ec3f74d2d5013f74dc41a31bcd', '40', '清水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bd2', '402881ec3f74d2d5013f74dc41a31bcd', '45', '秦安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bd3', '402881ec3f74d2d5013f74dc41a31bcd', '50', '甘谷县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bd4', '402881ec3f74d2d5013f74dc41a31bcd', '55', '武山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bd5', '402881ec3f74d2d5013f74dc41a31bcd', '60', '张家川回族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41b21bd6', '402881ec3f74d2d5013f74dc41641bb5', '50', '武威市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41c21bd8', '402881ec3f74d2d5013f74dc41b21bd6', '30', '凉州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41c21bd9', '402881ec3f74d2d5013f74dc41b21bd6', '35', '民勤县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41c21bda', '402881ec3f74d2d5013f74dc41b21bd6', '40', '古浪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41c21bdb', '402881ec3f74d2d5013f74dc41b21bd6', '45', '天祝藏族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41c21bdc', '402881ec3f74d2d5013f74dc41641bb5', '55', '张掖市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41d21bde', '402881ec3f74d2d5013f74dc41c21bdc', '30', '甘州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41d21bdf', '402881ec3f74d2d5013f74dc41c21bdc', '35', '肃南裕固族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41d21be0', '402881ec3f74d2d5013f74dc41c21bdc', '40', '民乐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41d21be1', '402881ec3f74d2d5013f74dc41c21bdc', '45', '临泽县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41d21be2', '402881ec3f74d2d5013f74dc41c21bdc', '50', '高台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41d21be3', '402881ec3f74d2d5013f74dc41c21bdc', '55', '山丹县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41d21be4', '402881ec3f74d2d5013f74dc41641bb5', '60', '平凉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11be6', '402881ec3f74d2d5013f74dc41d21be4', '30', '崆峒区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11be7', '402881ec3f74d2d5013f74dc41d21be4', '35', '泾川县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11be8', '402881ec3f74d2d5013f74dc41d21be4', '40', '灵台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11be9', '402881ec3f74d2d5013f74dc41d21be4', '45', '崇信县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11bea', '402881ec3f74d2d5013f74dc41d21be4', '50', '华亭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11beb', '402881ec3f74d2d5013f74dc41d21be4', '55', '庄浪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11bec', '402881ec3f74d2d5013f74dc41d21be4', '60', '静宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41e11bed', '402881ec3f74d2d5013f74dc41641bb5', '65', '酒泉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bef', '402881ec3f74d2d5013f74dc41e11bed', '30', '肃州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf0', '402881ec3f74d2d5013f74dc41e11bed', '35', '金塔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf1', '402881ec3f74d2d5013f74dc41e11bed', '40', '安西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf2', '402881ec3f74d2d5013f74dc41e11bed', '45', '肃北蒙古族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf3', '402881ec3f74d2d5013f74dc41e11bed', '50', '阿克塞哈萨克族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf4', '402881ec3f74d2d5013f74dc41e11bed', '55', '玉门市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf5', '402881ec3f74d2d5013f74dc41e11bed', '60', '敦煌市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf6', '402881ec3f74d2d5013f74dc41641bb5', '70', '庆阳市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf8', '402881ec3f74d2d5013f74dc41f11bf6', '30', '西峰区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bf9', '402881ec3f74d2d5013f74dc41f11bf6', '35', '庆城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bfa', '402881ec3f74d2d5013f74dc41f11bf6', '40', '环　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bfb', '402881ec3f74d2d5013f74dc41f11bf6', '45', '华池县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bfc', '402881ec3f74d2d5013f74dc41f11bf6', '50', '合水县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bfd', '402881ec3f74d2d5013f74dc41f11bf6', '55', '正宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bfe', '402881ec3f74d2d5013f74dc41f11bf6', '60', '宁　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11bff', '402881ec3f74d2d5013f74dc41f11bf6', '65', '镇原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc41f11c00', '402881ec3f74d2d5013f74dc41641bb5', '75', '定西市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c02', '402881ec3f74d2d5013f74dc41f11c00', '30', '安定区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c03', '402881ec3f74d2d5013f74dc41f11c00', '35', '通渭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c04', '402881ec3f74d2d5013f74dc41f11c00', '40', '陇西县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c05', '402881ec3f74d2d5013f74dc41f11c00', '45', '渭源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c06', '402881ec3f74d2d5013f74dc41f11c00', '50', '临洮县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c07', '402881ec3f74d2d5013f74dc41f11c00', '55', '漳　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c08', '402881ec3f74d2d5013f74dc41f11c00', '60', '岷　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42001c09', '402881ec3f74d2d5013f74dc41641bb5', '80', '陇南市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c0b', '402881ec3f74d2d5013f74dc42001c09', '30', '武都区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c0c', '402881ec3f74d2d5013f74dc42001c09', '35', '成　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c0d', '402881ec3f74d2d5013f74dc42001c09', '40', '文　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c0e', '402881ec3f74d2d5013f74dc42001c09', '45', '宕昌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c0f', '402881ec3f74d2d5013f74dc42001c09', '50', '康　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c10', '402881ec3f74d2d5013f74dc42001c09', '55', '西和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c11', '402881ec3f74d2d5013f74dc42001c09', '60', '礼　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c12', '402881ec3f74d2d5013f74dc42001c09', '65', '徽　县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c13', '402881ec3f74d2d5013f74dc42001c09', '70', '两当县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c14', '402881ec3f74d2d5013f74dc41641bb5', '85', '临夏回族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c15', '402881ec3f74d2d5013f74dc42101c14', '25', '临夏市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c16', '402881ec3f74d2d5013f74dc42101c14', '30', '临夏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c17', '402881ec3f74d2d5013f74dc42101c14', '35', '康乐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c18', '402881ec3f74d2d5013f74dc42101c14', '40', '永靖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c19', '402881ec3f74d2d5013f74dc42101c14', '45', '广河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c1a', '402881ec3f74d2d5013f74dc42101c14', '50', '和政县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c1b', '402881ec3f74d2d5013f74dc42101c14', '55', '东乡族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c1c', '402881ec3f74d2d5013f74dc42101c14', '60', '积石山保安族东乡族撒拉族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42101c1d', '402881ec3f74d2d5013f74dc41641bb5', '90', '甘南藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c1e', '402881ec3f74d2d5013f74dc42101c1d', '25', '合作市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c1f', '402881ec3f74d2d5013f74dc42101c1d', '30', '临潭县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c20', '402881ec3f74d2d5013f74dc42101c1d', '35', '卓尼县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c21', '402881ec3f74d2d5013f74dc42101c1d', '40', '舟曲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c22', '402881ec3f74d2d5013f74dc42101c1d', '45', '迭部县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c23', '402881ec3f74d2d5013f74dc42101c1d', '50', '玛曲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c24', '402881ec3f74d2d5013f74dc42101c1d', '55', '碌曲县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c25', '402881ec3f74d2d5013f74dc42101c1d', '60', '夏河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c26', '402881ea3f5b1d14013f5b1fdc080006', '165', '青海省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42201c27', '402881ec3f74d2d5013f74dc42201c26', '25', '西宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c29', '402881ec3f74d2d5013f74dc42201c27', '30', '城东区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c2a', '402881ec3f74d2d5013f74dc42201c27', '35', '城中区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c2b', '402881ec3f74d2d5013f74dc42201c27', '40', '城西区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c2c', '402881ec3f74d2d5013f74dc42201c27', '45', '城北区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c2d', '402881ec3f74d2d5013f74dc42201c27', '50', '大通回族土族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c2e', '402881ec3f74d2d5013f74dc42201c27', '55', '湟中县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c2f', '402881ec3f74d2d5013f74dc42201c27', '60', '湟源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc422f1c30', '402881ec3f74d2d5013f74dc42201c26', '30', '海东地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc423f1c31', '402881ec3f74d2d5013f74dc422f1c30', '25', '平安县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc423f1c32', '402881ec3f74d2d5013f74dc422f1c30', '30', '民和回族土族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc423f1c33', '402881ec3f74d2d5013f74dc422f1c30', '35', '乐都县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc423f1c34', '402881ec3f74d2d5013f74dc422f1c30', '40', '互助土族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc423f1c35', '402881ec3f74d2d5013f74dc422f1c30', '45', '化隆回族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc423f1c36', '402881ec3f74d2d5013f74dc422f1c30', '50', '循化撒拉族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc423f1c37', '402881ec3f74d2d5013f74dc42201c26', '35', '海北藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c38', '402881ec3f74d2d5013f74dc423f1c37', '25', '门源回族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c39', '402881ec3f74d2d5013f74dc423f1c37', '30', '祁连县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c3a', '402881ec3f74d2d5013f74dc423f1c37', '35', '海晏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c3b', '402881ec3f74d2d5013f74dc423f1c37', '40', '刚察县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c3c', '402881ec3f74d2d5013f74dc42201c26', '40', '黄南藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c3d', '402881ec3f74d2d5013f74dc424e1c3c', '25', '同仁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c3e', '402881ec3f74d2d5013f74dc424e1c3c', '30', '尖扎县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c3f', '402881ec3f74d2d5013f74dc424e1c3c', '35', '泽库县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c40', '402881ec3f74d2d5013f74dc424e1c3c', '40', '河南蒙古族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc424e1c41', '402881ec3f74d2d5013f74dc42201c26', '45', '海南藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc425e1c42', '402881ec3f74d2d5013f74dc424e1c41', '25', '共和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc425e1c43', '402881ec3f74d2d5013f74dc424e1c41', '30', '同德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc425e1c44', '402881ec3f74d2d5013f74dc424e1c41', '35', '贵德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc425e1c45', '402881ec3f74d2d5013f74dc424e1c41', '40', '兴海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc425e1c46', '402881ec3f74d2d5013f74dc424e1c41', '45', '贵南县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc425e1c47', '402881ec3f74d2d5013f74dc42201c26', '50', '果洛藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c48', '402881ec3f74d2d5013f74dc425e1c47', '25', '玛沁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c49', '402881ec3f74d2d5013f74dc425e1c47', '30', '班玛县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c4a', '402881ec3f74d2d5013f74dc425e1c47', '35', '甘德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c4b', '402881ec3f74d2d5013f74dc425e1c47', '40', '达日县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c4c', '402881ec3f74d2d5013f74dc425e1c47', '45', '久治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c4d', '402881ec3f74d2d5013f74dc425e1c47', '50', '玛多县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c4e', '402881ec3f74d2d5013f74dc42201c26', '55', '玉树藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c4f', '402881ec3f74d2d5013f74dc426e1c4e', '25', '玉树县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c50', '402881ec3f74d2d5013f74dc426e1c4e', '30', '杂多县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c51', '402881ec3f74d2d5013f74dc426e1c4e', '35', '称多县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c52', '402881ec3f74d2d5013f74dc426e1c4e', '40', '治多县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c53', '402881ec3f74d2d5013f74dc426e1c4e', '45', '囊谦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c54', '402881ec3f74d2d5013f74dc426e1c4e', '50', '曲麻莱县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc426e1c55', '402881ec3f74d2d5013f74dc42201c26', '60', '海西蒙古族藏族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc428d1c56', '402881ec3f74d2d5013f74dc426e1c55', '25', '格尔木市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc428d1c57', '402881ec3f74d2d5013f74dc426e1c55', '30', '德令哈市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc428d1c58', '402881ec3f74d2d5013f74dc426e1c55', '35', '乌兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc428d1c59', '402881ec3f74d2d5013f74dc426e1c55', '40', '都兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc428d1c5a', '402881ec3f74d2d5013f74dc426e1c55', '45', '天峻县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc428d1c5b', '402881ea3f5b1d14013f5b1fdc080006', '170', '宁夏回族自治区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc428d1c5c', '402881ec3f74d2d5013f74dc428d1c5b', '25', '银川市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc429c1c5e', '402881ec3f74d2d5013f74dc428d1c5c', '30', '兴庆区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc429c1c5f', '402881ec3f74d2d5013f74dc428d1c5c', '35', '西夏区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc429c1c60', '402881ec3f74d2d5013f74dc428d1c5c', '40', '金凤区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc429c1c61', '402881ec3f74d2d5013f74dc428d1c5c', '45', '永宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc429c1c62', '402881ec3f74d2d5013f74dc428d1c5c', '50', '贺兰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc429c1c63', '402881ec3f74d2d5013f74dc428d1c5c', '55', '灵武市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc429c1c64', '402881ec3f74d2d5013f74dc428d1c5b', '30', '石嘴山市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ac1c66', '402881ec3f74d2d5013f74dc429c1c64', '30', '大武口区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ac1c67', '402881ec3f74d2d5013f74dc429c1c64', '35', '惠农区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ac1c68', '402881ec3f74d2d5013f74dc429c1c64', '40', '平罗县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ac1c69', '402881ec3f74d2d5013f74dc428d1c5b', '35', '吴忠市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c6b', '402881ec3f74d2d5013f74dc42ac1c69', '30', '利通区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c6c', '402881ec3f74d2d5013f74dc42ac1c69', '35', '盐池县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c6d', '402881ec3f74d2d5013f74dc42ac1c69', '40', '同心县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c6e', '402881ec3f74d2d5013f74dc42ac1c69', '45', '青铜峡市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c6f', '402881ec3f74d2d5013f74dc428d1c5b', '40', '固原市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c71', '402881ec3f74d2d5013f74dc42bc1c6f', '30', '原州区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c72', '402881ec3f74d2d5013f74dc42bc1c6f', '35', '西吉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c73', '402881ec3f74d2d5013f74dc42bc1c6f', '40', '隆德县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c74', '402881ec3f74d2d5013f74dc42bc1c6f', '45', '泾源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c75', '402881ec3f74d2d5013f74dc42bc1c6f', '50', '彭阳县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c76', '402881ec3f74d2d5013f74dc42bc1c6f', '55', '海原县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42bc1c77', '402881ec3f74d2d5013f74dc428d1c5b', '45', '中卫市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42db1c79', '402881ec3f74d2d5013f74dc42bc1c77', '30', '沙坡头区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42db1c7a', '402881ec3f74d2d5013f74dc42bc1c77', '35', '中宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42db1c7b', '402881ea3f5b1d14013f5b1fdc080006', '175', '新疆维吾尔自治区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c7c', '402881ec3f74d2d5013f74dc42db1c7b', '25', '乌鲁木齐市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c7e', '402881ec3f74d2d5013f74dc42ea1c7c', '30', '天山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c7f', '402881ec3f74d2d5013f74dc42ea1c7c', '35', '沙依巴克区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c80', '402881ec3f74d2d5013f74dc42ea1c7c', '40', '新市区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c81', '402881ec3f74d2d5013f74dc42ea1c7c', '45', '水磨沟区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c82', '402881ec3f74d2d5013f74dc42ea1c7c', '50', '头屯河区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c83', '402881ec3f74d2d5013f74dc42ea1c7c', '55', '达坂城区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c84', '402881ec3f74d2d5013f74dc42ea1c7c', '60', '东山区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c85', '402881ec3f74d2d5013f74dc42ea1c7c', '65', '乌鲁木齐县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42ea1c86', '402881ec3f74d2d5013f74dc42db1c7b', '30', '克拉玛依市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42fa1c88', '402881ec3f74d2d5013f74dc42ea1c86', '30', '独山子区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42fa1c89', '402881ec3f74d2d5013f74dc42ea1c86', '35', '克拉玛依区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42fa1c8a', '402881ec3f74d2d5013f74dc42ea1c86', '40', '白碱滩区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42fa1c8b', '402881ec3f74d2d5013f74dc42ea1c86', '45', '乌尔禾区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc42fa1c8c', '402881ec3f74d2d5013f74dc42db1c7b', '35', '吐鲁番地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c8d', '402881ec3f74d2d5013f74dc42fa1c8c', '25', '吐鲁番市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c8e', '402881ec3f74d2d5013f74dc42fa1c8c', '30', '鄯善县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c8f', '402881ec3f74d2d5013f74dc42fa1c8c', '35', '托克逊县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c90', '402881ec3f74d2d5013f74dc42db1c7b', '40', '哈密地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c91', '402881ec3f74d2d5013f74dc430a1c90', '25', '哈密市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c92', '402881ec3f74d2d5013f74dc430a1c90', '30', '巴里坤哈萨克自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c93', '402881ec3f74d2d5013f74dc430a1c90', '35', '伊吾县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc430a1c94', '402881ec3f74d2d5013f74dc42db1c7b', '45', '昌吉回族自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c95', '402881ec3f74d2d5013f74dc430a1c94', '25', '昌吉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c96', '402881ec3f74d2d5013f74dc430a1c94', '30', '阜康市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c97', '402881ec3f74d2d5013f74dc430a1c94', '35', '米泉市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c98', '402881ec3f74d2d5013f74dc430a1c94', '40', '呼图壁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c99', '402881ec3f74d2d5013f74dc430a1c94', '45', '玛纳斯县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c9a', '402881ec3f74d2d5013f74dc430a1c94', '50', '奇台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c9b', '402881ec3f74d2d5013f74dc430a1c94', '55', '吉木萨尔县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c9c', '402881ec3f74d2d5013f74dc430a1c94', '60', '木垒哈萨克自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c9d', '402881ec3f74d2d5013f74dc42db1c7b', '50', '博尔塔拉蒙古自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43191c9e', '402881ec3f74d2d5013f74dc43191c9d', '25', '博乐市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291c9f', '402881ec3f74d2d5013f74dc43191c9d', '30', '精河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca0', '402881ec3f74d2d5013f74dc43191c9d', '35', '温泉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca1', '402881ec3f74d2d5013f74dc42db1c7b', '55', '巴音郭楞蒙古自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca2', '402881ec3f74d2d5013f74dc43291ca1', '25', '库尔勒市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca3', '402881ec3f74d2d5013f74dc43291ca1', '30', '轮台县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca4', '402881ec3f74d2d5013f74dc43291ca1', '35', '尉犁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca5', '402881ec3f74d2d5013f74dc43291ca1', '40', '若羌县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca6', '402881ec3f74d2d5013f74dc43291ca1', '45', '且末县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca7', '402881ec3f74d2d5013f74dc43291ca1', '50', '焉耆回族自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca8', '402881ec3f74d2d5013f74dc43291ca1', '55', '和静县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291ca9', '402881ec3f74d2d5013f74dc43291ca1', '60', '和硕县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291caa', '402881ec3f74d2d5013f74dc43291ca1', '65', '博湖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43291cab', '402881ec3f74d2d5013f74dc42db1c7b', '60', '阿克苏地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cac', '402881ec3f74d2d5013f74dc43291cab', '25', '阿克苏市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cad', '402881ec3f74d2d5013f74dc43291cab', '30', '温宿县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cae', '402881ec3f74d2d5013f74dc43291cab', '35', '库车县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381caf', '402881ec3f74d2d5013f74dc43291cab', '40', '沙雅县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cb0', '402881ec3f74d2d5013f74dc43291cab', '45', '新和县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cb1', '402881ec3f74d2d5013f74dc43291cab', '50', '拜城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cb2', '402881ec3f74d2d5013f74dc43291cab', '55', '乌什县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cb3', '402881ec3f74d2d5013f74dc43291cab', '60', '阿瓦提县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cb4', '402881ec3f74d2d5013f74dc43291cab', '65', '柯坪县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43381cb5', '402881ec3f74d2d5013f74dc42db1c7b', '65', '克孜勒苏柯尔克孜自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43481cb6', '402881ec3f74d2d5013f74dc43381cb5', '25', '阿图什市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43481cb7', '402881ec3f74d2d5013f74dc43381cb5', '30', '阿克陶县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43481cb8', '402881ec3f74d2d5013f74dc43381cb5', '35', '阿合奇县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43481cb9', '402881ec3f74d2d5013f74dc43381cb5', '40', '乌恰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43481cba', '402881ec3f74d2d5013f74dc42db1c7b', '70', '喀什地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cbb', '402881ec3f74d2d5013f74dc43481cba', '25', '喀什市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cbc', '402881ec3f74d2d5013f74dc43481cba', '30', '疏附县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cbd', '402881ec3f74d2d5013f74dc43481cba', '35', '疏勒县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cbe', '402881ec3f74d2d5013f74dc43481cba', '40', '英吉沙县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cbf', '402881ec3f74d2d5013f74dc43481cba', '45', '泽普县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc0', '402881ec3f74d2d5013f74dc43481cba', '50', '莎车县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc1', '402881ec3f74d2d5013f74dc43481cba', '55', '叶城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc2', '402881ec3f74d2d5013f74dc43481cba', '60', '麦盖提县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc3', '402881ec3f74d2d5013f74dc43481cba', '65', '岳普湖县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc4', '402881ec3f74d2d5013f74dc43481cba', '70', '伽师县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc5', '402881ec3f74d2d5013f74dc43481cba', '75', '巴楚县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc6', '402881ec3f74d2d5013f74dc43481cba', '80', '塔什库尔干塔吉克自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc7', '402881ec3f74d2d5013f74dc42db1c7b', '75', '和田地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc8', '402881ec3f74d2d5013f74dc43581cc7', '25', '和田市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cc9', '402881ec3f74d2d5013f74dc43581cc7', '30', '和田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cca', '402881ec3f74d2d5013f74dc43581cc7', '35', '墨玉县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581ccb', '402881ec3f74d2d5013f74dc43581cc7', '40', '皮山县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581ccc', '402881ec3f74d2d5013f74dc43581cc7', '45', '洛浦县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581ccd', '402881ec3f74d2d5013f74dc43581cc7', '50', '策勒县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cce', '402881ec3f74d2d5013f74dc43581cc7', '55', '于田县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581ccf', '402881ec3f74d2d5013f74dc43581cc7', '60', '民丰县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43581cd0', '402881ec3f74d2d5013f74dc42db1c7b', '80', '伊犁哈萨克自治州', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd1', '402881ec3f74d2d5013f74dc43581cd0', '25', '伊宁市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd2', '402881ec3f74d2d5013f74dc43581cd0', '30', '奎屯市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd3', '402881ec3f74d2d5013f74dc43581cd0', '35', '伊宁县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd4', '402881ec3f74d2d5013f74dc43581cd0', '40', '察布查尔锡伯自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd5', '402881ec3f74d2d5013f74dc43581cd0', '45', '霍城县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd6', '402881ec3f74d2d5013f74dc43581cd0', '50', '巩留县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd7', '402881ec3f74d2d5013f74dc43581cd0', '55', '新源县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd8', '402881ec3f74d2d5013f74dc43581cd0', '60', '昭苏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cd9', '402881ec3f74d2d5013f74dc43581cd0', '65', '特克斯县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cda', '402881ec3f74d2d5013f74dc43581cd0', '70', '尼勒克县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43671cdb', '402881ec3f74d2d5013f74dc42db1c7b', '85', '塔城地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771cdc', '402881ec3f74d2d5013f74dc43671cdb', '25', '塔城市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771cdd', '402881ec3f74d2d5013f74dc43671cdb', '30', '乌苏市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771cde', '402881ec3f74d2d5013f74dc43671cdb', '35', '额敏县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771cdf', '402881ec3f74d2d5013f74dc43671cdb', '40', '沙湾县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771ce0', '402881ec3f74d2d5013f74dc43671cdb', '45', '托里县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771ce1', '402881ec3f74d2d5013f74dc43671cdb', '50', '裕民县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771ce2', '402881ec3f74d2d5013f74dc43671cdb', '55', '和布克赛尔蒙古自治县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43771ce3', '402881ec3f74d2d5013f74dc42db1c7b', '90', '阿勒泰地区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ce4', '402881ec3f74d2d5013f74dc43771ce3', '25', '阿勒泰市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ce5', '402881ec3f74d2d5013f74dc43771ce3', '30', '布尔津县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ce6', '402881ec3f74d2d5013f74dc43771ce3', '35', '富蕴县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ce7', '402881ec3f74d2d5013f74dc43771ce3', '40', '福海县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ce8', '402881ec3f74d2d5013f74dc43771ce3', '45', '哈巴河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ce9', '402881ec3f74d2d5013f74dc43771ce3', '50', '青河县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961cea', '402881ec3f74d2d5013f74dc43771ce3', '55', '吉木乃县', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ceb', '402881ec3f74d2d5013f74dc42db1c7b', '95', '省直辖行政单位', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961cec', '402881ec3f74d2d5013f74dc43961ceb', '25', '石河子市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961ced', '402881ec3f74d2d5013f74dc43961ceb', '30', '阿拉尔市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961cee', '402881ec3f74d2d5013f74dc43961ceb', '35', '图木舒克市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961cef', '402881ec3f74d2d5013f74dc43961ceb', '40', '五家渠市', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43961cf0', '402881ea3f5b1d14013f5b1fdc080006', '180', '台湾省', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43a61cf1', '402881ea3f5b1d14013f5b1fdc080006', '185', '香港特别行政区', null);
INSERT INTO `sy_district` VALUES ('402881ec3f74d2d5013f74dc43a61cf2', '402881ea3f5b1d14013f5b1fdc080006', '190', '澳门特别行政区', null);

-- ----------------------------
-- Table structure for sy_log
-- ----------------------------
DROP TABLE IF EXISTS `sy_log`;
CREATE TABLE `sy_log` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '用户id',
  `action_time` datetime NOT NULL COMMENT '操作时间',
  `action_content` varchar(20) DEFAULT '' COMMENT '操作内容',
  `action_ip` varchar(50) DEFAULT '' COMMENT 'ip地址',
  `action_ip_info` varchar(200) DEFAULT '' COMMENT 'ip地址信息',
  `action_desc` varchar(100) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `sy_log_ibfk_1` (`user_id`),
  KEY `action_time` (`action_time`),
  CONSTRAINT `sy_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统重要操作日志';

-- ----------------------------
-- Records of sy_log
-- ----------------------------
INSERT INTO `sy_log` VALUES ('40288082452148530145218f7b910026', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 16:30:22', '修改菜单', '127.0.0.1', '中国 山东省 济南市 联通', '菜单名:居民论坛');
INSERT INTO `sy_log` VALUES ('40288082452148530145219182ea0029', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 16:32:35', '修改菜单', '127.0.0.1', '中国 山东省 济南市 联通', '菜单名:居民答疑');
INSERT INTO `sy_log` VALUES ('40288082452520230145255897ea0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 10:08:54', '修改菜单', '127.0.0.1', '中国 山东省 济南市 联通', '菜单名:居民论坛');
INSERT INTO `sy_log` VALUES ('402880824525676701452567ca0d0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 10:25:30', '修改菜单', '127.0.0.1', '中国 山东省 济南市 联通', '菜单名:居民论坛');
INSERT INTO `sy_log` VALUES ('40288082452573cd01452575d1b90003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 10:40:49', '修改菜单', '127.0.0.1', '中国 山东省 济南市 联通', '菜单名:居民论坛');
INSERT INTO `sy_log` VALUES ('40288082452573cd0145257b1bba000c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 10:46:36', '修改菜单', '127.0.0.1', '中国 山东省 济南市 联通', '菜单名:居民答疑');
INSERT INTO `sy_log` VALUES ('4028808245447c2a0145447f210a0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 11:19:13', '修改菜单', '127.0.0.1', '中国 山东省 济南市 联通', '菜单名:居民论坛');
INSERT INTO `sy_log` VALUES ('402880854507e032014507e6c5ec0007', '402881f73e1c4ba4013e1c4c08470001', '2014-03-28 16:55:35', '删除操作日志', '192.168.0.5', '中国 山东省 济南市 联通', '删除1条');
INSERT INTO `sy_log` VALUES ('402880854526481201452699a35a0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 15:59:34', '添加个人求职', '192.168.0.5', '中国 山东省 济南市 联通', '人员ID:1188802F-5443-4020-AAC4-72B0ADF9AA92');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b5e94590002', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:05:18', '删除个人气质信息', '127.0.0.1', '中国 山东省 济南市 联通', '删除人员ID:64613e5e-504d-4f4a-9f99-4c25d7ea8e7f');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b5e94780003', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:05:18', '删除个人气质信息', '127.0.0.1', '中国 山东省 济南市 联通', '删除人员ID:8ad4c825-4196-41e4-ba1f-e34ae02c0b4d');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b5ee47d0004', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:05:39', '添加个人求职', '127.0.0.1', '中国 山东省 济南市 联通', '人员ID:801A880B-A5C8-4BB3-849D-4FAC8EBDA72C');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b5f2dbb0005', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:05:58', '添加个人求职', '127.0.0.1', '中国 山东省 济南市 联通', '人员ID:D6DA41CB-45F1-467F-901A-EE91630AF290');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b6005cb0006', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:06:53', '删除单位招聘信息', '127.0.0.1', '中国 山东省 济南市 联通', '单位名称:中软');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b6005ea0007', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:06:53', '删除单位招聘信息', '127.0.0.1', '中国 山东省 济南市 联通', '单位名称:中创');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b6062530008', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:07:17', '添加招聘', '127.0.0.1', '中国 山东省 济南市 联通', '公司名称:中国');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b60c0220009', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:07:41', '添加招聘', '127.0.0.1', '中国 山东省 济南市 联通', '公司名称:美国');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b670a4d000a', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:14:33', '删除养老', '127.0.0.1', '中国 山东省 济南市 联通', '删除名称:D6DA41CB-45F1-467F-901A-EE91630AF290');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b671b16000b', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:14:37', '删除养老', '127.0.0.1', '中国 山东省 济南市 联通', '删除名称:801A880B-A5C8-4BB3-849D-4FAC8EBDA72C');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b68627b000c', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:16:01', '删除计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '删除妇女编号:2');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b68627b000d', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:16:01', '删除计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '删除妇女编号:1');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b697439000e', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:17:11', '添加计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '编码:1');
INSERT INTO `sy_log` VALUES ('40288088450b51f601450b6a275c000f', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:17:57', '添加计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '编码:2');
INSERT INTO `sy_log` VALUES ('40288088450c704401450c859902002e', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:27:33', '添加计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '编码:1');
INSERT INTO `sy_log` VALUES ('40288088450c704401450c875315002f', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:29:26', '删除计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '删除妇女编号:1');
INSERT INTO `sy_log` VALUES ('40288088450c704401450c87c1be0030', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:29:54', '添加计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '编码:111');
INSERT INTO `sy_log` VALUES ('40288088450c704401450c89a2b30031', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:31:57', '添加计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '编码:111');
INSERT INTO `sy_log` VALUES ('40288088450c8cef01450c8de3ee0002', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:36:36', '添加计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '编码:888');
INSERT INTO `sy_log` VALUES ('40288088450c8cef01450c9105d00003', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:40:02', '删除养老', '127.0.0.1', '中国 山东省 济南市 联通', '删除名称:D6DA41CB-45F1-467F-901A-EE91630AF290');
INSERT INTO `sy_log` VALUES ('40288088450c8cef01450c9105d00004', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:40:02', '删除养老', '127.0.0.1', '中国 山东省 济南市 联通', '删除名称:801A880B-A5C8-4BB3-849D-4FAC8EBDA72C');
INSERT INTO `sy_log` VALUES ('40288088450c939501450ca2eb5b0002', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:59:34', '删除养老', '127.0.0.1', '中国 山东省 济南市 联通', '删除名称:F9D53831-92F7-4F06-BA5D-D23F76F72190');
INSERT INTO `sy_log` VALUES ('40288088451afdfc01451aff478c0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 09:55:08', '添加计生人员', '127.0.0.1', '中国 山东省 济南市 联通', '编码:');
INSERT INTO `sy_log` VALUES ('40288088452bdf0001452bf24be10002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:54:30', '添加招聘', '127.0.0.1', '中国 山东省 济南市 联通', '公司名称:浪潮集团');
INSERT INTO `sy_log` VALUES ('40288088452bdf0001452bf2d44a0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:55:05', '添加招聘', '127.0.0.1', '中国 山东省 济南市 联通', '公司名称:山东金现代');
INSERT INTO `sy_log` VALUES ('402880884550247801455030434d0006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 17:48:31', '添加用户', '127.0.0.1', '中国 山东省 济南市 联通', '账号:zhanggong');

-- ----------------------------
-- Table structure for sy_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sy_login_log`;
CREATE TABLE `sy_login_log` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '用户id',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) DEFAULT '' COMMENT 'ip地址',
  `ip_info_country` varchar(50) DEFAULT '' COMMENT 'ip地址所在国家',
  `ip_info_region` varchar(30) DEFAULT '' COMMENT 'ip地址所在省份',
  `ip_info_city` varchar(30) DEFAULT '' COMMENT 'ip所属城市',
  `ip_info_isp` varchar(20) DEFAULT '' COMMENT 'ip地址所属运营商',
  `login_type` varchar(50) DEFAULT '' COMMENT '日志',
  PRIMARY KEY (`id`),
  KEY `sy_login_log_ibfk_1` (`user_id`),
  KEY `login_time` (`login_time`),
  CONSTRAINT `sy_login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统登录日志';

-- ----------------------------
-- Records of sy_login_log
-- ----------------------------
INSERT INTO `sy_login_log` VALUES ('40288082450b468001450b49bf760001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 08:42:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b5f5d01450b60beda0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:07:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b654601450b661f510001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:13:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b733801450b73a3470001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:28:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b759a01450b75d5890001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:30:42', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b77a201450b77bb120001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:32:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b7a4c01450b7a639c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:35:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b843101450b84632e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:46:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b851101450b852c1c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:47:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b886c01450b88e9d00001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:51:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b94c201450b9547760001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:05:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450b9c0501450b9c74210001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:12:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450ba02601450ba192cd0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:18:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450ba42601450ba479b80001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:21:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450bb7ec01450bb8204c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:43:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450bbaa401450bbafd740001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:46:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450bc32e01450bc363e70001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:55:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450bc40101450bc49a450001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:56:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450bc55901450bc610890001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:58:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450bf0e501450bf273930001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:46:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450c602b01450c606d810001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 13:46:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450c936301450c9448f40001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:43:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082450cd72101450cd79a7a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 15:57:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824515a673014515a71ed40001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 09:00:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824515be96014515bef82d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 09:26:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824515c96f014515c9ff2c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 09:38:50', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824515cd61014515cdaa520001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 09:42:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824515d128014515d141d10001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 09:46:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824515d128014515f051d80006', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 09:46:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(03-31 10:20:42)');
INSERT INTO `sy_login_log` VALUES ('402880824515d12801451614b3cf0007', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:00:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245161a280145161a56ec0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:06:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451621d30145162203e30001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:14:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451625a801451625e3190001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:19:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245162fa10145162fde660001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:30:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451639ed0145163a1e9b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:41:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245163e3c0145163e791b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:46:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245163e3c0145165aa65d0004', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 11:46:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(03-31 12:16:50)');
INSERT INTO `sy_login_log` VALUES ('4028808245167fff01451680db7e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 12:58:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451696f60145169736350001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 13:22:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451699ac0145169a3d5b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 13:26:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245169ee00145169efc420001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 13:31:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824516bce1014516bd0f4b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 14:04:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824516c2a9014516c478440001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 14:12:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824516c790014516c884860001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 14:16:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824516effb014516f02feb0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 15:00:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824516f1fc014516f2190e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 15:02:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824516f1fc014517043827001a', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 15:22:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824517120d0145171245330001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 15:37:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245172f270145172f59d70001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:09:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451737140145173734080001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:17:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245173b130145173b58c30001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:22:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245173d740145173dad810001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:24:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245173fcd0145173ff7520001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:27:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824517435f0145174390090001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:31:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245174c7f0145174ca56a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:41:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451756b001451756f0ba0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:52:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245175ad60145175b0ece0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 16:56:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245175ebd0145175ef5180001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:01:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245175fff014517603b440001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:02:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824517627f014517636c580001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:06:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824517642801451764eacb0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:07:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451768b401451769c0090001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:12:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245176dd10145176dfa210001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:17:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451771d00145177242bf0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:22:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451774470145177475000001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:24:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451779c20145177b47090001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:32:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245177cf60145177e83670001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:35:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245178d070145178da5ea0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:52:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245178ffb0145179031960001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 17:54:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451ac0d901451ac21f8b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 08:48:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451ac0d901451aecd7650007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 08:48:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(04-01 09:35:00)');
INSERT INTO `sy_login_log` VALUES ('40288082451b2bfa01451b2c27d50001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 10:44:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b348201451b3554570001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 10:54:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b429901451b42da8f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:08:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b4a1301451b4a5b360001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:17:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b532501451b5373280001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:27:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b581501451b592b830001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:33:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b5be101451b5c0f130001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:36:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b6b8a01451b6beca80001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:53:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b6d0d01451b6d3fc50001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:55:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451b6d0d01451b8a62050006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:55:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(04-01 12:27:05)');
INSERT INTO `sy_login_log` VALUES ('40288082451b6d0d01451bafc08d0007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 13:07:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451bb94401451bb9b1690001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 13:18:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451bc54d01451bc57c640001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 13:31:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451bdde001451bde23fa0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 13:58:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451bdfcd01451bdff56e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 14:00:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451bebbe01451bebde610001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 14:13:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451bf38501451bf4461d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 14:22:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c4c3b01451c4c685f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:59:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c528d01451c52b6b00001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 16:05:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c5c7e01451c5d70a90001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 16:17:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c5c7e01451c5ddec50002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 16:18:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c6ec601451c6f32020001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 16:37:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c72dd01451c7315010001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 16:41:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c7f2901451c7f82470001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 16:54:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c824701451c8285750001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 16:58:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c84d701451c8532f20001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 17:01:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451c877401451c87f59c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 17:04:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082451fe76c01451ff12a520001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 08:57:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452006910145200a722f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:25:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824520924b014520941a1d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 11:55:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824520950f014520954c050001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 11:57:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824520950f014520b523e0000c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 11:57:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(04-02 12:31:53)');
INSERT INTO `sy_login_log` VALUES ('402880824520950f014520d873ac000d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:10:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824520950f014520f451b40011', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:10:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(04-02 13:40:53)');
INSERT INTO `sy_login_log` VALUES ('402880824520f4b8014520f5dd070001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:42:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452106cd01452106f9d40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 14:01:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245210ea60145210f74aa0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 14:10:32', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245211153014521121c3b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 14:13:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452122250145212252ae0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 14:31:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452122250145213e8fee0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 14:31:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(04-02 15:01:59)');
INSERT INTO `sy_login_log` VALUES ('40288082452148530145214a650b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 15:14:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245219d440145219d72840001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 16:45:37', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824521bb7f014521bb9ef20001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 17:18:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824521c672014521c6f2aa0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 17:30:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824521ca66014521caa62c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 17:35:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824521d113014521d133aa0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 17:42:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824521d454014521d4df6c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 17:46:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824521d640014521d673f60001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 17:47:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824521dcef014521dd1eef0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 17:55:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452508ee014525093ab60001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 08:42:13', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824525202301452520a6230001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 09:07:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452567670145256779ba0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 10:25:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452573cd0145257428300001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 10:39:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245257b740145257ba2ec0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 10:47:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245258d280145258d511b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 11:06:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245258f4e0145258f72450001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 11:08:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245259ab90145259ad4460001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 11:21:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824525be2e014525be72310001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 12:00:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824525be2e014526277a310011', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 13:54:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526300c0145263075340001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:04:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526338c0145263403ca0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:08:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245264551014526457b1a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:27:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452647db014526483aa70001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:30:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245264beb0145264c25f30001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:34:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526578001452657bcfd0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:47:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245265e9c0145265ed5170001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:55:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245267b010145267b32140001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 15:26:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452686f10145268761670001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 15:39:37', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452697cd0145269a858c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:00:32', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526a2a6014526a2cd4c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:09:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526a42b014526a445370001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:11:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526af51014526b529bd0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:29:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526b7f8014526b814230001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:32:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526b942014526b96a9b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:34:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526bb96014526bbc5830001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:36:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526bcd4014526bd24a50001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:38:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526bf97014526bfbc480001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:41:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526c170014526c19c620001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:43:13', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526c44e014526c659750001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 16:48:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526eeb8014526ef0a730001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 17:32:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824526f072014526f0d09d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 17:34:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a33b501452a3443000001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 08:47:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a391c01452a3bbbb90001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 08:55:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a3e4001452a3e75e70001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 08:58:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a3fde01452a4021260001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 09:00:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a477001452a478ba60001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 09:08:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a4c2701452a4c4e750001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 09:13:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a56bd01452a56f44a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 09:25:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452a59ce01452a5a19190001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 09:28:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452ab9ae01452ab9dd650001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:13:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452abba501452abbe3090001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:15:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452abd0401452abd370f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:16:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452abf8201452ac034710001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:20:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452ac51b01452ac552410001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:25:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452ac8ac01452acf10b40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:36:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452adc5a01452adc894f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:51:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452ae04601452ae080150001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 11:55:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b2c2301452b2c85720001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 13:18:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b4ce801452b4d162d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 13:54:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b4e5201452b4e7bc80001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 13:55:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b4f9601452b4fd1460001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 13:57:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b517c01452b51bdb40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 13:59:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b769201452b77167f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 14:39:56', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b7cb501452b7ccfd40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 14:46:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b83ca01452b840f2d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 14:54:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452b94bb01452b94e27c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:12:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452baf0901452baf3e790001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:41:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bb30401452bb34e830001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:45:42', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bc03001452bc05e810001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:59:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bc72001452bc7577a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:07:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bc84901452bc9e3a40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:10:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bcc3101452bcc605c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:13:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bd0ac01452bd0fd340001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:18:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bd5d701452bd607fa0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:23:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bd6ca01452bd702870001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:24:42', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452bd94301452bd970e70001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:27:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452be5cb01452be5f7720001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:41:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082452c02b201452c02de7e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 17:12:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453eef4801453eef891c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 09:24:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453ef3db01453ef4c6f80001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 09:30:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f041001453f0443050001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 09:46:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f064301453f0673330001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 09:49:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f47a801453f48a2310001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:01:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f4ad901453f4bbbc60001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:04:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f4e6001453f4ecdc80001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:08:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f55ef01453f5649ad0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:16:30', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f5e0e01453f5e38ed0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:25:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f605f01453f60905a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:27:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f69f501453f6a20690001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:38:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f754d01453f75cf320001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:50:56', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453f9bb301453f9c24bc0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 12:32:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fa27a01453fa2c67d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 12:40:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fa7e501453fa82e850001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 12:45:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fbe1701453fbe8b500001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 13:10:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fc09201453fc0e51f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 13:12:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fc4f001453fc534d10001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 13:17:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fd23101453fd277880001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 13:32:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fdf5401453fdfa4a40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 13:46:32', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453fe12801453fe157650001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 13:48:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453ff9cb01453ffa12730001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:15:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082453ffd8601453ffdaa6e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:19:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454001ac01454001f60a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:24:01', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245400b1e0145400b53ee0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:34:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454017a201454017d78b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:47:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245401aeb0145401b3af90001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:51:37', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245401e5d0145401e94940001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:55:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824540207d01454020a4f60001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:57:32', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824540269501454026dffe0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:04:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245402f930145402fc8440001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:14:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454033d40145403412d60001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:18:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824540357f014540359f910001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:20:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454043f601454045f5060001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:38:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454061a201454061c8310001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:08:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454066e00145406715010001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:14:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454068d20145406917e50001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:16:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454084e9014540851c330001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:47:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245408b250145408b58830001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:54:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245409427014540945c400001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 17:03:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454097df0145409813da0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 17:07:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824540b523014540b5ad0f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 17:40:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824540b8c8014540b8f8330001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 17:43:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824540c3c8014540c413c40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 17:56:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824540c6d3014540c7033b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 17:59:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454403d20145441378730001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 09:21:37', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245441f54014544210e2c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 09:36:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824544229901454422f0880001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 09:38:31', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454428960145442910870001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 09:45:13', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245442a100145442a52000001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 09:46:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245442e960145442ec20c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 09:51:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824544352f0145443884370001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:02:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454455c401454455e94d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:34:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245445c250145445c50850001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:41:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454465ea01454466067c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:51:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454469d80145446a590d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:56:31', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245446c430145446c60d90001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:58:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245446ef30145446f2c4e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 11:01:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880824544707d0145447098890001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 11:03:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245447c2a0145447cdb790001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 11:16:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808245447c2a01454539c2620005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 14:43:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454939a1014549a22caa0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 11:15:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454e81d101454e88b9560001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 10:05:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454e8e0a01454e923e2a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 10:16:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454ea76001454ea85cd30001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 10:40:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454eaa9801454eabae7f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 10:44:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454ebfa701454ec0b7710001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:07:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454ec92401454ec954080001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:16:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454ee4f901454ee56e8d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:47:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454ee94f01454ee9aedf0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:51:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454ee94f01454f2878e80002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:00:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f435101454f43f6330001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:30:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f6d2b01454f6df2db0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:16:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f6d2b01454f85f0850002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:42:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f6d2b01454f8a904b0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:47:32', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f8e7d01454f8eb47a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:52:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f90ea01454f9121630001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:54:42', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f93af01454f9447d80001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:58:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f99e201454f99fda30001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 15:04:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454f9d3501454f9d87750001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 15:08:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454fa52d01454fa564470001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 15:16:50', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288082454fac4301454facee540001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 15:25:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880854507e032014508181c5b0008', '402881f73e1c4ba4013e1c4c08470001', '2014-03-28 16:53:43', '192.168.0.5', '中国', '山东省', '济南市', '联通', '非正常退出(03-28 17:49:29)');
INSERT INTO `sy_login_log` VALUES ('40288085450c542701450c54659c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 13:33:48', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451c215a01451c21c5160001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:12:26', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451c215a01451c2f340d0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:27:06', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451c215a01451c3141040005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:29:21', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451c215a01451c31cbcf0006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:29:56', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451c34a501451c4857a90001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:54:34', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451c34a501451c4998760002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 15:55:56', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451ffc47014520029e760001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:16:53', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085451ffc470145200cc2390002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:27:58', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880854520146601452014d2400001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:36:46', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808545201bc10145201be6040001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:44:30', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452024570145202b3eca0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 10:01:16', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452035b901452035fb240001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 10:12:59', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880854520e016014520ffe11d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:53:31', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808545210fda01452122a7660001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 14:31:30', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808545210fda0145212deda10002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 14:43:49', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452578680145263af4470001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:16:09', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880854526481201452650873a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:39:42', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452b239301452b82b4bd0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 14:52:37', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452b239301452b8333340002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 14:53:09', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452b892401452b8bb08b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:02:26', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452b90e101452b9241350001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:09:36', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452b90e101452b9784dd0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:15:21', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452b9c9501452b9cf39c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:21:17', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452b9ec101452b9f3a210001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:23:46', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288085452bc9f101452c1f1e5d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 17:43:28', '192.168.0.5', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288086451affba01451b002ad80001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 09:56:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288086451affba01451c7381670002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 09:56:07', '127.0.0.1', '中国', '山东省', '济南市', '联通', '非正常退出(04-01 16:41:43)');
INSERT INTO `sy_login_log` VALUES ('40288088450b51f601450b58137e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 08:58:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450b6f5401450b6fecf60001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:24:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450b7b6701450b7b95460001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:36:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450b7ee501450b7f88620001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 09:41:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450ba7a701450bb2b0e10001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 10:37:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450bccdb01450bcd1fba0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:06:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450bce5901450bce90220001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:07:37', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450bd8b401450bdb12580001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:21:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450bdc2601450bdc518f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:22:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450bdd1701450bdd34ab0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:23:37', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450be18501450be1c53f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:28:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450be68301450be6c97d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:34:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450bf9b101450bf9e2680001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 11:54:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450c01b701450c0227c60001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 12:03:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450c5c7e01450c5ca28e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 13:42:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450c5e6f01450c6525730001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 13:52:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450c6a7b01450c6a9a1e0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 13:58:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450c704401450c706da20001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:04:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450c8cef01450c8d433a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:35:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450c939501450c93bba90001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 14:42:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450ca80001450ca82c050001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 15:05:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088450cd3b201450cd410590001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-29 15:53:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884515acef014515ae30950001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 09:08:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884515dfc4014515e0bdce0001', '402881f73e1c4ba4013e1c4c08470001', '2014-03-31 10:03:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088451afdfc01451afeaa420001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 09:54:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088451b124c01451b12792f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 10:16:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088451b1cf801451b1d2b290001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 10:27:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088451b21d701451b21f53c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 10:33:01', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088451b21d701451b4c702c0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-01 11:19:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845200219014520027dce0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:16:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884520120c01452015283f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:37:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088452017c90145201f0ebc0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 09:47:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884520cc37014520d15fa90001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:02:43', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884520e0d9014520e2bde30001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:21:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884520e9a9014520ea028b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:29:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845261d780145262b87ca0005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 13:59:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088452633d20145263452c40001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:08:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845265aaa014526630c700003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:59:56', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845268d990145268f2b9a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 15:48:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088452a545f01452a7303c30003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 09:55:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088452b7d2701452b828dbd0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 14:52:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088452b8aa601452b8d4cf50001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:04:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088452b91f901452b94539a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 15:11:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088452bdf0001452bf1388c0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-04 16:53:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088453f46d601453f671c130001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 11:34:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845400fd001454021e6210001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:58:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454435450145443955af0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:02:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845443f0d0145443f74260001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:09:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454443230145444364f00001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:13:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454467bf0145446f32800001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 11:01:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454474970145449465d10001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 11:42:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884544a582014544e35fc60001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 13:08:43', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845454b8c01454556979f0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 15:14:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a16d701454a1852350001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 13:24:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a16d701454a1872600002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 13:24:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 13:24:47)');
INSERT INTO `sy_login_log` VALUES ('40288088454a16d701454a1bd35d0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 13:28:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a273e01454a276a870001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 13:41:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a7f1301454a7f5abc0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:17:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a8f5d01454a950daa0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:40:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a8f5d01454a95b5250002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:40:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 15:41:36)');
INSERT INTO `sy_login_log` VALUES ('40288088454a8f5d01454a95eaeb0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:41:50', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a9eda01454aa0966d0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:53:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454a9eda01454aa36f8d0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:53:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 15:56:36)');
INSERT INTO `sy_login_log` VALUES ('40288088454a9eda01454aa39eea0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:56:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aa4ac330001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:57:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aa4db710002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:57:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 15:58:09)');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aa506880003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:58:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aa5a3260004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 15:59:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aa6b2d10005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:00:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aa93b030006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:00:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:02:55)');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aad3b3e0007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:07:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aae99470008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:07:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:08:47)');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454aaec24b0009', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:08:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454ab81736000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:08:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:19:09)');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454ab85539000b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:19:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454ab89714000c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:19:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:19:42)');
INSERT INTO `sy_login_log` VALUES ('40288088454aa45e01454abb60b3000d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:22:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ac18101454ac377ee0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:31:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ac18101454ac497580002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:32:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ac18101454ac5473f0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:32:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:33:34)');
INSERT INTO `sy_login_log` VALUES ('40288088454ac18101454ac57c0b0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:33:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ac72d01454ac77c010001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:35:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ac72d01454ac853d30002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:35:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:36:53)');
INSERT INTO `sy_login_log` VALUES ('40288088454ac72d01454ac885150003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:37:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454acb75660001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:40:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454acc5b900002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:40:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:41:17)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454acc80200003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:41:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ace4cb20004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:41:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:43:25)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ace79020005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:43:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454acedc7e0006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:43:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:44:02)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454acf18200007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:44:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454acf74b70008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:44:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:44:41)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454acf9add0009', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:44:50', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad1f99d000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:44:50', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:47:26)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad23157000b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:47:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad31667000c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:47:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:48:39)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad33e71000d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:48:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad38e37000e', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:48:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:49:09)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad3b8f1000f', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:49:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad4506e0010', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:49:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad474ee0011', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:49:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:50:08)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad5b9f10012', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:51:31', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad688f90013', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:51:31', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:52:24)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad6aec10014', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:52:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad72e700015', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:52:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:53:07)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454ad77dd80016', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:53:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adb35430017', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:53:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:57:31)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adb57610018', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:57:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adbf15f0019', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:58:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adcbe44001a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:59:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adcdd07001b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:59:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:59:19)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adcfec8001c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:59:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454add61a8001d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 16:59:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 16:59:53)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454add87af001e', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:00:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adec35b001f', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:00:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:01:24)');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adee8580020', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:01:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454acb3001454adf644e0021', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:02:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ae15a01454ae5f0640001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:09:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ae15a01454ae6d5360002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:10:13', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ae15a01454ae726640003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:10:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ae15a01454ae7a0e30004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:10:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:11:05)');
INSERT INTO `sy_login_log` VALUES ('40288088454aeda701454aee8e920001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:18:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aeda701454aef03540002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:18:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:19:09)');
INSERT INTO `sy_login_log` VALUES ('40288088454aeda701454aef307f0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:19:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454aeda701454af649930004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:19:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:27:05)');
INSERT INTO `sy_login_log` VALUES ('40288088454af8b401454af915450001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:30:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454af8b401454aface6f0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:30:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:32:02)');
INSERT INTO `sy_login_log` VALUES ('40288088454af8b401454afaf1970003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:32:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454af8b401454afb57560004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:32:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:32:37)');
INSERT INTO `sy_login_log` VALUES ('40288088454af8b401454afb7acc0005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:32:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b03748b0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:41:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b03dcda0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:41:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:41:55)');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0514410003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:43:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b05496b0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:43:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:43:28)');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b056ea60005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:43:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0736370006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:43:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:45:35)');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b075ac60007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:45:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0860300008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:46:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b093da00009', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:46:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:47:48)');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b098305000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:48:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0a862d000b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:49:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0b7fee000c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:50:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0c1b92000d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:50:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0c93fe000e', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:51:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0d57eb000f', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:52:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0db1d20010', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:52:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-10 17:52:39)');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0dd6df0011', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:52:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0ef2900012', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:54:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b0fc7b20013', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:54:56', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b1080630014', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:55:43', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b1186c70015', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:56:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b12f4220016', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:58:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b1388060017', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:59:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b031b01454b13db560018', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 17:59:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454b14c701454b153bf00001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-10 18:00:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e50f101454e54afdd0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 09:09:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454e50f101454e573cd20004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 09:11:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454e50f101454e57558a0005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 09:11:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454e50f101454e580e6a0006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 09:12:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e50f101454e582bc50007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 09:12:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 09:12:52)');
INSERT INTO `sy_login_log` VALUES ('40288088454e50f101454e5b04c60008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 09:15:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e6a4601454e6ae9610001', '40288088454e50f101454e55511f0002', '2014-04-11 09:33:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '首次登录系统');
INSERT INTO `sy_login_log` VALUES ('40288088454e6a4601454e6bec790002', '40288088454e50f101454e55511f0002', '2014-04-11 09:33:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 09:34:26)');
INSERT INTO `sy_login_log` VALUES ('40288088454e6a4601454e6c24520003', '40288088454e50f101454e55511f0002', '2014-04-11 09:34:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e6a4601454e6e1eca0004', '40288088454e50f101454e55511f0002', '2014-04-11 09:36:50', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e6a4601454e6f02250005', '40288088454e50f101454e55511f0002', '2014-04-11 09:37:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e8dfadb0001', '40288088454e50f101454e55511f0002', '2014-04-11 10:11:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e8efa0b0002', '40288088454e50f101454e55511f0002', '2014-04-11 10:12:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e900baa0003', '40288088454e50f101454e55511f0002', '2014-04-11 10:13:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e9084d20004', '40288088454e50f101454e55511f0002', '2014-04-11 10:14:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e92d5880005', '40288088454e50f101454e55511f0002', '2014-04-11 10:16:56', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e939e660006', '40288088454e50f101454e55511f0002', '2014-04-11 10:16:56', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 10:17:48)');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e93d5840007', '40288088454e50f101454e55511f0002', '2014-04-11 10:18:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e93fb4b0008', '40288088454e50f101454e55511f0002', '2014-04-11 10:18:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 10:18:12)');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e946d100009', '40288088454e50f101454e55511f0002', '2014-04-11 10:18:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e8dad01454e94d9c5000a', '40288088454e50f101454e55511f0002', '2014-04-11 10:19:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e966901454e96c70e0001', '40288088454e50f101454e55511f0002', '2014-04-11 10:21:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454e97c901454e981d570001', '40288088454e50f101454e55511f0002', '2014-04-11 10:22:43', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ea04d01454ea34bb40001', '40288088454e50f101454e55511f0002', '2014-04-11 10:34:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ea04d01454ea4f4ff0002', '40288088454e50f101454e55511f0002', '2014-04-11 10:36:44', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ea04d01454ea7a7db0003', '40288088454e50f101454e55511f0002', '2014-04-11 10:39:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ea83901454ea8a1bc0001', '40288088454e50f101454e55511f0002', '2014-04-11 10:40:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ea83901454ea8c8bc0002', '40288088454e50f101454e55511f0002', '2014-04-11 10:40:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 10:40:55)');
INSERT INTO `sy_login_log` VALUES ('40288088454ea92801454ea997280001', '40288088454e50f101454e55511f0002', '2014-04-11 10:41:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ea92801454eaa040b0002', '40288088454e50f101454e55511f0002', '2014-04-11 10:42:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eaab701454eab0ca10001', '40288088454e50f101454e55511f0002', '2014-04-11 10:43:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eacb801454ead1b2e0001', '40288088454e50f101454e55511f0002', '2014-04-11 10:45:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eae4201454eae72de0001', '40288088454e50f101454e55511f0002', '2014-04-11 10:47:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eae4201454eaf6acb0002', '40288088454e50f101454e55511f0002', '2014-04-11 10:48:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eae4201454eb22c7b0003', '40288088454e50f101454e55511f0002', '2014-04-11 10:48:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 10:51:10)');
INSERT INTO `sy_login_log` VALUES ('40288088454eae4201454eb255dd0004', '40288088454e50f101454e55511f0002', '2014-04-11 10:51:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb2f801454eb3434a0001', '40288088454e50f101454e55511f0002', '2014-04-11 10:52:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb40e01454eb4a0d70001', '40288088454e50f101454e55511f0002', '2014-04-11 10:53:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb40e01454eb5127c0002', '40288088454e50f101454e55511f0002', '2014-04-11 10:54:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb40e01454eb598460003', '40288088454e50f101454e55511f0002', '2014-04-11 10:54:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb6bb01454eb72b890001', '40288088454e50f101454e55511f0002', '2014-04-11 10:56:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb88d01454eb8c18a0001', '40288088454e50f101454e55511f0002', '2014-04-11 10:58:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb9ae01454eb9f3920001', '40288088454e50f101454e55511f0002', '2014-04-11 10:59:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb9ae01454ebb2b370002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:01:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eb9ae01454ebb3c7d0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:01:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:01:04)');
INSERT INTO `sy_login_log` VALUES ('40288088454eb9ae01454ebc4bab0004', '40288088454e50f101454e55511f0002', '2014-04-11 11:02:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ebde501454ec0a0110001', '40288088454e50f101454e55511f0002', '2014-04-11 11:06:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ec26001454ec2b8520001', '40288088454e50f101454e55511f0002', '2014-04-11 11:09:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ec3ce01454ec3ff780001', '40288088454e50f101454e55511f0002', '2014-04-11 11:10:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ec3ce01454ec4db030002', '40288088454e50f101454e55511f0002', '2014-04-11 11:11:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ec3ce01454ec60c400003', '40288088454e50f101454e55511f0002', '2014-04-11 11:12:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ec80201454ec89bd40001', '40288088454e50f101454e55511f0002', '2014-04-11 11:15:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ec80201454ec9845f0002', '40288088454e50f101454e55511f0002', '2014-04-11 11:16:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454eca5001454eca862f0001', '40288088454e50f101454e55511f0002', '2014-04-11 11:17:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ecafd01454ecb60c10001', '40288088454e50f101454e55511f0002', '2014-04-11 11:18:42', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ecafd01454ecbfa220002', '40288088454e50f101454e55511f0002', '2014-04-11 11:19:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ecafd01454ecc4dd00003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:19:43', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ecafd01454ecd12b60004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:19:43', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:20:33)');
INSERT INTO `sy_login_log` VALUES ('40288088454ecafd01454ecd41a60005', '40288088454e50f101454e55511f0002', '2014-04-11 11:20:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ecafd01454ece9f320006', '40288088454e50f101454e55511f0002', '2014-04-11 11:22:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ecafd01454ecf93760007', '40288088454e50f101454e55511f0002', '2014-04-11 11:23:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed18201454ed1f1b90001', '40288088454e50f101454e55511f0002', '2014-04-11 11:25:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed18201454ed2a0f40002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:26:37', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed38f01454ed43ddb0001', '40288088454e50f101454e55511f0002', '2014-04-11 11:28:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed4f001454ed550550001', '40288088454e50f101454e55511f0002', '2014-04-11 11:29:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed4f001454ed707e80002', '40288088454e50f101454e55511f0002', '2014-04-11 11:31:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed7fe01454eda432d0001', '40288088454e50f101454e55511f0002', '2014-04-11 11:34:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed7fe01454edf14260002', '40288088454e50f101454e55511f0002', '2014-04-11 11:34:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:40:13)');
INSERT INTO `sy_login_log` VALUES ('40288088454ed7fe01454edf9eb30003', '40288088454e50f101454e55511f0002', '2014-04-11 11:40:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ed7fe01454ee0279a0004', '40288088454e50f101454e55511f0002', '2014-04-11 11:40:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:41:24)');
INSERT INTO `sy_login_log` VALUES ('40288088454ed7fe01454ee0b0420005', '40288088454e50f101454e55511f0002', '2014-04-11 11:41:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee1fab40001', '40288088454e50f101454e55511f0002', '2014-04-11 11:43:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee26a850002', '40288088454e50f101454e55511f0002', '2014-04-11 11:43:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:43:52)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee28d3f0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:44:01', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee3af590004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 11:44:01', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:45:15)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee3dbf70005', '40288088454e50f101454e55511f0002', '2014-04-11 11:45:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee59b2b0006', '40288088454e50f101454e55511f0002', '2014-04-11 11:45:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:47:21)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee5cd570007', '40288088454e50f101454e55511f0002', '2014-04-11 11:47:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee783250008', '40288088454e50f101454e55511f0002', '2014-04-11 11:47:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:49:26)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee7b2440009', '40288088454e50f101454e55511f0002', '2014-04-11 11:49:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee82447000a', '40288088454e50f101454e55511f0002', '2014-04-11 11:49:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:50:07)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ee8bc32000b', '40288088454e50f101454e55511f0002', '2014-04-11 11:50:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454eeb21c8000c', '40288088454e50f101454e55511f0002', '2014-04-11 11:50:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:53:23)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454eeb5599000d', '40288088454e50f101454e55511f0002', '2014-04-11 11:53:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454eec1bc8000e', '40288088454e50f101454e55511f0002', '2014-04-11 11:53:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:54:27)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454eef6e9c000f', '40288088454e50f101454e55511f0002', '2014-04-11 11:58:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454eeff33d0010', '40288088454e50f101454e55511f0002', '2014-04-11 11:58:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:58:39)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ef01a1f0011', '40288088454e50f101454e55511f0002', '2014-04-11 11:58:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ef05fc30012', '40288088454e50f101454e55511f0002', '2014-04-11 11:58:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:59:07)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ef087020013', '40288088454e50f101454e55511f0002', '2014-04-11 11:59:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ef0e1570014', '40288088454e50f101454e55511f0002', '2014-04-11 11:59:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 11:59:40)');
INSERT INTO `sy_login_log` VALUES ('40288088454ee19301454ef10d0a0015', '40288088454e50f101454e55511f0002', '2014-04-11 11:59:51', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f2c2d01454f2eb73c0001', '40288088454e50f101454e55511f0002', '2014-04-11 13:07:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f2c2d01454f370c890002', '40288088454e50f101454e55511f0002', '2014-04-11 13:07:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:16:18)');
INSERT INTO `sy_login_log` VALUES ('40288088454f386401454f39f21c0001', '40288088454e50f101454e55511f0002', '2014-04-11 13:19:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f406301454f41c9500001', '40288088454e50f101454e55511f0002', '2014-04-11 13:28:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f406301454f44e8630002', '40288088454e50f101454e55511f0002', '2014-04-11 13:28:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:31:27)');
INSERT INTO `sy_login_log` VALUES ('40288088454f4be301454f4fbdd30001', '40288088454e50f101454e55511f0002', '2014-04-11 13:43:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f4be301454f50083a0002', '40288088454e50f101454e55511f0002', '2014-04-11 13:43:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:43:36)');
INSERT INTO `sy_login_log` VALUES ('40288088454f4be301454f5033dd0003', '40288088454e50f101454e55511f0002', '2014-04-11 13:43:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f4be301454f5105b40004', '40288088454e50f101454e55511f0002', '2014-04-11 13:43:47', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:44:41)');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f5524d20001', '40288088454e50f101454e55511f0002', '2014-04-11 13:49:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f5559300002', '40288088454e50f101454e55511f0002', '2014-04-11 13:49:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:49:24)');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f557f070003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:49:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f5599170004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:49:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:49:41)');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f55dfa60005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:49:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f55f7540006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:50:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f567c820007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:50:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f568de70008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:50:39', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:50:43)');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f572f190009', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:51:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f575a40000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:51:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f576675000b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:51:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:51:39)');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f579ad3000c', '40288088454e50f101454e55511f0002', '2014-04-11 13:51:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f57b4e3000d', '40288088454e50f101454e55511f0002', '2014-04-11 13:51:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454f54a201454f57c696000e', '40288088454e50f101454e55511f0002', '2014-04-11 13:52:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f5b5601454f5bb79e0001', '40288088454e50f101454e55511f0002', '2014-04-11 13:56:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f5b5601454f5ca3f20002', '40288088454e50f101454e55511f0002', '2014-04-11 13:56:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 13:57:22)');
INSERT INTO `sy_login_log` VALUES ('40288088454f5b5601454f5cccb80003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:57:32', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f5b5601454f6195150004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 13:57:32', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 14:02:46)');
INSERT INTO `sy_login_log` VALUES ('40288088454f5b5601454f61ce460005', '40288088454e50f101454e55511f0002', '2014-04-11 14:03:01', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f643901454f64d9ff0001', '40288088454e50f101454e55511f0002', '2014-04-11 14:06:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f6a6e01454f6ddcc30001', '40288088454e50f101454e55511f0002', '2014-04-11 14:16:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f6a6e01454f6de6c50002', '40288088454e50f101454e55511f0002', '2014-04-11 14:16:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 14:16:13)');
INSERT INTO `sy_login_log` VALUES ('40288088454f6a6e01454f6e195e0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:16:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f863cb10001', '40288088454e50f101454e55511f0002', '2014-04-11 14:42:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f869ec60002', '40288088454e50f101454e55511f0002', '2014-04-11 14:42:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 14:43:13)');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f86cae70003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:43:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f8a2caf0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:43:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 14:47:06)');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f8a5dc20005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:47:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f8b94ea0006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:48:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f8c7da40007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:49:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f851701454f8ccc610008', '40288088454e50f101454e55511f0002', '2014-04-11 14:49:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f8e9401454f8f89ea0001', '40288088454e50f101454e55511f0002', '2014-04-11 14:52:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f8e9401454f8feb250002', '40288088454e50f101454e55511f0002', '2014-04-11 14:53:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f924b01454f92b3f90001', '40288088454e50f101454e55511f0002', '2014-04-11 14:56:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f924b01454f930f190002', '40288088454e50f101454e55511f0002', '2014-04-11 14:56:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f924b01454f937b8f0003', '40288088454e50f101454e55511f0002', '2014-04-11 14:57:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f924b01454f93c6e00004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:57:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f924b01454f93d3730005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 14:57:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 14:57:39)');
INSERT INTO `sy_login_log` VALUES ('40288088454f924b01454f93fc580006', '40288088454e50f101454e55511f0002', '2014-04-11 14:57:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454f9e9c210001', '40288088454e50f101454e55511f0002', '2014-04-11 15:09:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454f9f57b10002', '40288088454e50f101454e55511f0002', '2014-04-11 15:10:13', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa01e6c0003', '40288088454e50f101454e55511f0002', '2014-04-11 15:11:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa038da0004', '40288088454e50f101454e55511f0002', '2014-04-11 15:11:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa0a84d0005', '40288088454e50f101454e55511f0002', '2014-04-11 15:11:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa3de720006', '40288088454e50f101454e55511f0002', '2014-04-11 15:15:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa5593a0007', '40288088454e50f101454e55511f0002', '2014-04-11 15:15:10', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 15:16:47)');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa5883a0008', '40288088454e50f101454e55511f0002', '2014-04-11 15:16:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa697390009', '40288088454e50f101454e55511f0002', '2014-04-11 15:18:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa702b4000a', '40288088454e50f101454e55511f0002', '2014-04-11 15:18:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa82163000b', '40288088454e50f101454e55511f0002', '2014-04-11 15:18:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 15:19:49)');
INSERT INTO `sy_login_log` VALUES ('40288088454f9da901454fa84a48000c', '40288088454e50f101454e55511f0002', '2014-04-11 15:20:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fac1901454facb0900001', '40288088454e50f101454e55511f0002', '2014-04-11 15:24:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fad3f01454fadfe4d0001', '40288088454e50f101454e55511f0002', '2014-04-11 15:26:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454faea201454fb1c72d0001', '40288088454e50f101454e55511f0002', '2014-04-11 15:30:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fb27c01454fb5bbee0001', '40288088454e50f101454e55511f0002', '2014-04-11 15:34:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fb27c01454fb699cb0002', '40288088454e50f101454e55511f0002', '2014-04-11 15:35:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fb27c01454fb7385d0003', '40288088454e50f101454e55511f0002', '2014-04-11 15:36:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fb8e401454fb912da0001', '40288088454e50f101454e55511f0002', '2014-04-11 15:38:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fb8e401454fbdaec80002', '40288088454e50f101454e55511f0002', '2014-04-11 15:43:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fb8e401454fc015b60003', '40288088454e50f101454e55511f0002', '2014-04-11 15:45:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fc0d101454fc3440b0001', '40288088454e50f101454e55511f0002', '2014-04-11 15:49:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fc0d101454fc48cd70002', '40288088454e50f101454e55511f0002', '2014-04-11 15:50:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fc0d101454fc4f5060003', '40288088454e50f101454e55511f0002', '2014-04-11 15:50:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 15:51:19)');
INSERT INTO `sy_login_log` VALUES ('40288088454fc0d101454fc520d90004', '40288088454e50f101454e55511f0002', '2014-04-11 15:51:30', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fc5bf01454fc6beab0001', '40288088454e50f101454e55511f0002', '2014-04-11 15:53:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fc5bf01454fcb0fa60002', '40288088454e50f101454e55511f0002', '2014-04-11 15:57:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fc5bf01454fcb35000003', '40288088454e50f101454e55511f0002', '2014-04-11 15:57:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 15:58:08)');
INSERT INTO `sy_login_log` VALUES ('40288088454fc5bf01454fcb62c70004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 15:58:20', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fccc701454fcd18850001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:00:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd13801454fd1942a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:05:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd13801454fd1a5120002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:05:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 16:05:10)');
INSERT INTO `sy_login_log` VALUES ('40288088454fd13801454fd1d28b0003', '40288088454e50f101454e55511f0002', '2014-04-11 16:05:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd33f01454fd38ec20001', '40288088454e50f101454e55511f0002', '2014-04-11 16:07:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd33f01454fd48ebd0002', '40288088454e50f101454e55511f0002', '2014-04-11 16:08:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fd589b70001', '40288088454e50f101454e55511f0002', '2014-04-11 16:09:25', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fd5f8500002', '40288088454e50f101454e55511f0002', '2014-04-11 16:09:54', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fd927310003', '40288088454e50f101454e55511f0002', '2014-04-11 16:13:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fdb99d70004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:16:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fdba9190005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:16:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 16:16:06)');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fdbe3440006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:16:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fdc8a130007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:17:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fdeeac70008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:19:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe079850009', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:21:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe12371000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:22:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe19640000b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:22:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe3f771000c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:25:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe423e0000d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:25:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 16:25:22)');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe4586d000e', '40288088454e50f101454e55511f0002', '2014-04-11 16:25:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe4e655000f', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:26:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe525710010', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:26:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 16:26:28)');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe560670011', '40288088454e50f101454e55511f0002', '2014-04-11 16:26:43', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe66e0e0012', '40288088454e50f101454e55511f0002', '2014-04-11 16:27:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454fd53001454fe9649a0013', '40288088454e50f101454e55511f0002', '2014-04-11 16:31:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454febd401454fec55d60001', '40288088454e50f101454e55511f0002', '2014-04-11 16:34:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454febd401454fee09810002', '40288088454e50f101454e55511f0002', '2014-04-11 16:36:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ff3df01454ff6114a0001', '40288088454e50f101454e55511f0002', '2014-04-11 16:44:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ff3df01454ff7f06b0002', '40288088454e50f101454e55511f0002', '2014-04-11 16:44:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 16:47:00)');
INSERT INTO `sy_login_log` VALUES ('40288088454ff3df01454ff81fd70003', '40288088454e50f101454e55511f0002', '2014-04-11 16:47:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ff3df01454ff9cc100004', '40288088454e50f101454e55511f0002', '2014-04-11 16:49:01', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ff3df01454ffa91b20005', '40288088454e50f101454e55511f0002', '2014-04-11 16:49:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ffcc401454ffcfc690001', '40288088454e50f101454e55511f0002', '2014-04-11 16:52:30', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ffd7901454ffdda360001', '40288088454e50f101454e55511f0002', '2014-04-11 16:53:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ffd7901454ffe0eb30002', '40288088454e50f101454e55511f0002', '2014-04-11 16:53:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 16:53:41)');
INSERT INTO `sy_login_log` VALUES ('40288088454ffd7901454ffe39da0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 16:53:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088454ffd7901454fff71120004', '40288088454e50f101454e55511f0002', '2014-04-11 16:55:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845500f170145500fa0cf0001', '40288088454e50f101454e55511f0002', '2014-04-11 17:12:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884550102b01455010d3a20001', '40288088454e50f101454e55511f0002', '2014-04-11 17:14:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884550102b014550113f0e0002', '40288088454e50f101454e55511f0002', '2014-04-11 17:14:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 17:14:38)');
INSERT INTO `sy_login_log` VALUES ('402880884550102b014550116d900003', '40288088454e50f101454e55511f0002', '2014-04-11 17:14:50', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845501203014550127ef10001', '40288088454e50f101454e55511f0002', '2014-04-11 17:16:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884550247801455024fd410001', '40288088454e50f101454e55511f0002', '2014-04-11 17:36:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455024780145502590f50002', '40288088454e50f101454e55511f0002', '2014-04-11 17:36:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 17:36:50)');
INSERT INTO `sy_login_log` VALUES ('402880884550247801455025c64e0003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 17:37:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录密码错误');
INSERT INTO `sy_login_log` VALUES ('402880884550247801455025dd120004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 17:37:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455024780145503060c80007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 17:37:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 17:48:38)');
INSERT INTO `sy_login_log` VALUES ('402880884550326001455032bead0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 17:51:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455032600145503458f50003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 17:51:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 17:52:59)');
INSERT INTO `sy_login_log` VALUES ('4028808845503260014550348b5f0004', '402880884550247801455030434d0005', '2014-04-11 17:53:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '首次登录系统');
INSERT INTO `sy_login_log` VALUES ('40288088455032600145503553330005', '402880884550247801455030434d0005', '2014-04-11 17:53:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-11 17:54:03)');
INSERT INTO `sy_login_log` VALUES ('4028808845503260014550365c180006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-11 17:55:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553727401455373a5460001', '40288088454e50f101454e55511f0002', '2014-04-12 09:00:59', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845537274014553748ae30002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:01:57', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455386fa014553892cee0001', '40288088454e50f101454e55511f0002', '2014-04-12 09:24:30', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845538aad0145538aecde0001', '40288088454e50f101454e55511f0002', '2014-04-12 09:26:24', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845538aad0145538b97e30002', '40288088454e50f101454e55511f0002', '2014-04-12 09:27:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845538aad0145538cc8550003', '40288088454e50f101454e55511f0002', '2014-04-12 09:28:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845538aad0145538d787a0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:29:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845538e8c0145538eda7b0001', '40288088454e50f101454e55511f0002', '2014-04-12 09:30:42', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455392a2014553930bd90001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:35:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455392a20145539328f60002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:35:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:35:24)');
INSERT INTO `sy_login_log` VALUES ('40288088455392a201455393564f0003', '40288088454e50f101454e55511f0002', '2014-04-12 09:35:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455392a20145539377250004', '40288088454e50f101454e55511f0002', '2014-04-12 09:35:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:35:44)');
INSERT INTO `sy_login_log` VALUES ('40288088455392a201455393a1b00005', '40288088454e50f101454e55511f0002', '2014-04-12 09:35:55', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455392a20145539407ec0006', '40288088454e50f101454e55511f0002', '2014-04-12 09:36:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455392a20145539417ea0007', '40288088454e50f101454e55511f0002', '2014-04-12 09:36:21', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:36:25)');
INSERT INTO `sy_login_log` VALUES ('40288088455392a2014553943fc50008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:36:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455395c20145539646530001', '40288088454e50f101454e55511f0002', '2014-04-12 09:38:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455395c20145539654e90002', '40288088454e50f101454e55511f0002', '2014-04-12 09:38:48', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:38:52)');
INSERT INTO `sy_login_log` VALUES ('40288088455395c2014553968c840003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:39:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455395c201455396fb6a0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:39:06', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:39:34)');
INSERT INTO `sy_login_log` VALUES ('40288088455395c2014553973fe50005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:39:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455395c2014553974d720006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:39:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:39:55)');
INSERT INTO `sy_login_log` VALUES ('40288088455395c201455397eadb0007', '40288088454e50f101454e55511f0002', '2014-04-12 09:40:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('40288088455395c2014553994c010008', '40288088454e50f101454e55511f0002', '2014-04-12 09:40:36', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:42:06)');
INSERT INTO `sy_login_log` VALUES ('4028808845539a300145539a73a90001', '40288088454e50f101454e55511f0002', '2014-04-12 09:43:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845539a300145539a800d0002', '40288088454e50f101454e55511f0002', '2014-04-12 09:43:22', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:43:25)');
INSERT INTO `sy_login_log` VALUES ('4028808845539b5e0145539c671c0001', '40288088454e50f101454e55511f0002', '2014-04-12 09:45:30', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845539e6a0145539ec07d0001', '40288088454e50f101454e55511f0002', '2014-04-12 09:48:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845539e6a0145539ecd7d0002', '40288088454e50f101454e55511f0002', '2014-04-12 09:48:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:48:07)');
INSERT INTO `sy_login_log` VALUES ('4028808845539e6a0145539fba4e0003', '40288088454e50f101454e55511f0002', '2014-04-12 09:49:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('4028808845539e6a0145539febce0004', '40288088454e50f101454e55511f0002', '2014-04-12 09:49:08', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:49:20)');
INSERT INTO `sy_login_log` VALUES ('402880884553a073014553a0e15a0001', '40288088454e50f101454e55511f0002', '2014-04-12 09:50:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a073014553a0ecb40002', '40288088454e50f101454e55511f0002', '2014-04-12 09:50:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:50:26)');
INSERT INTO `sy_login_log` VALUES ('402880884553a073014553a11b550003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:50:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a073014553a17e070004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:50:38', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:51:03)');
INSERT INTO `sy_login_log` VALUES ('402880884553a073014553a1b8ed0005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:51:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a073014553a242610006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:51:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a40a014553a4665a0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:54:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a40a014553a470ca0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:54:14', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:54:16)');
INSERT INTO `sy_login_log` VALUES ('402880884553a40a014553a498950003', '40288088454e50f101454e55511f0002', '2014-04-12 09:54:27', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a40a014553a4fa3d0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:54:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a40a014553a5024c0005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 09:54:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 09:54:54)');
INSERT INTO `sy_login_log` VALUES ('402880884553a40a014553a5294c0006', '40288088454e50f101454e55511f0002', '2014-04-12 09:55:04', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a73f014553a78c420001', '40288088454e50f101454e55511f0002', '2014-04-12 09:57:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553a970014553a9e18d0001', '40288088454e50f101454e55511f0002', '2014-04-12 10:00:13', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553abc34d0001', '40288088454e50f101454e55511f0002', '2014-04-12 10:02:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553abccb30002', '40288088454e50f101454e55511f0002', '2014-04-12 10:02:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:02:19)');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553ac31c60003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:02:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553accd990004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:02:45', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:03:24)');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553acf7680005', '40288088454e50f101454e55511f0002', '2014-04-12 10:03:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553adfcc20006', '40288088454e50f101454e55511f0002', '2014-04-12 10:03:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:04:42)');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553ae24200007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:04:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553af846c0008', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:04:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:06:22)');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553afac950009', '40288088454e50f101454e55511f0002', '2014-04-12 10:06:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553b129bf000a', '40288088454e50f101454e55511f0002', '2014-04-12 10:06:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:08:10)');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553b14b12000b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:08:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553b153ad000c', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:08:19', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:08:21)');
INSERT INTO `sy_login_log` VALUES ('402880884553ab2c014553b179a4000d', '40288088454e50f101454e55511f0002', '2014-04-12 10:08:31', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553b4ab060001', '40288088454e50f101454e55511f0002', '2014-04-12 10:12:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553b4b7c80002', '40288088454e50f101454e55511f0002', '2014-04-12 10:12:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:12:03)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553b4dac10003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:12:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553b7f6d60004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:12:12', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:15:36)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553b81ed00005', '40288088454e50f101454e55511f0002', '2014-04-12 10:15:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553ba34620006', '40288088454e50f101454e55511f0002', '2014-04-12 10:15:46', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:18:03)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553ba715b0007', '40288088454e50f101454e55511f0002', '2014-04-12 10:18:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553ba82240008', '40288088454e50f101454e55511f0002', '2014-04-12 10:18:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:18:23)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bab21d0009', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:18:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bb0acd000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:18:35', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:18:58)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bb3efc000b', '40288088454e50f101454e55511f0002', '2014-04-12 10:19:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bbe36a000c', '40288088454e50f101454e55511f0002', '2014-04-12 10:19:11', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:19:53)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bc079b000d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:20:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bc0fd9000e', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:20:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:20:04)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bc3989000f', '40288088454e50f101454e55511f0002', '2014-04-12 10:20:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bcd4030010', '40288088454e50f101454e55511f0002', '2014-04-12 10:20:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:20:55)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bcf5660011', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:21:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bcfd170012', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:21:03', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:21:05)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bd237b0013', '40288088454e50f101454e55511f0002', '2014-04-12 10:21:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553be805c0014', '40288088454e50f101454e55511f0002', '2014-04-12 10:21:15', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:22:44)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bea26a0015', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:22:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553bea9bd0016', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:22:53', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:22:55)');
INSERT INTO `sy_login_log` VALUES ('402880884553b2d7014553becfe30017', '40288088454e50f101454e55511f0002', '2014-04-12 10:23:05', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553c334014553c47a730001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:29:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553c334014553c48ed60002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:29:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:29:21)');
INSERT INTO `sy_login_log` VALUES ('402880884553c334014553c4be520003', '40288088454e50f101454e55511f0002', '2014-04-12 10:29:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553c334014553c76b9f0004', '40288088454e50f101454e55511f0002', '2014-04-12 10:29:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:32:29)');
INSERT INTO `sy_login_log` VALUES ('402880884553c334014553c7984d0005', '40288088454e50f101454e55511f0002', '2014-04-12 10:32:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553c334014553c7bab90006', '40288088454e50f101454e55511f0002', '2014-04-12 10:32:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:32:49)');
INSERT INTO `sy_login_log` VALUES ('402880884553c334014553c7dc7a0007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:32:58', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ca3b014553ca83cc0001', '40288088454e50f101454e55511f0002', '2014-04-12 10:35:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ca3b014553ca9c650002', '40288088454e50f101454e55511f0002', '2014-04-12 10:35:52', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:35:58)');
INSERT INTO `sy_login_log` VALUES ('402880884553ca3b014553cac5f60003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:36:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ca3b014553cba6240004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:36:09', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:37:06)');
INSERT INTO `sy_login_log` VALUES ('402880884553ca3b014553cbd3010005', '40288088454e50f101454e55511f0002', '2014-04-12 10:37:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553ca3b014553d06d490006', '40288088454e50f101454e55511f0002', '2014-04-12 10:37:17', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:42:19)');
INSERT INTO `sy_login_log` VALUES ('402880884553ca3b014553d091e80007', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:42:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d11d014553d165550001', '40288088454e50f101454e55511f0002', '2014-04-12 10:43:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d11d014553d16e1f0002', '40288088454e50f101454e55511f0002', '2014-04-12 10:43:23', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:43:25)');
INSERT INTO `sy_login_log` VALUES ('402880884553d11d014553d191380003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:43:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d11d014553d2659f0004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:43:34', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:44:28)');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d3a0bf0001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:45:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d3ac670002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:45:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:45:52)');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d3d3580003', '40288088454e50f101454e55511f0002', '2014-04-12 10:46:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d41a630004', '40288088454e50f101454e55511f0002', '2014-04-12 10:46:02', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:46:20)');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d44e250005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:46:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d6a67d0006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:46:33', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:49:07)');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d6ca600007', '40288088454e50f101454e55511f0002', '2014-04-12 10:49:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d8af3d0008', '40288088454e50f101454e55511f0002', '2014-04-12 10:49:16', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:51:20)');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d8d2750009', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:51:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d8db10000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:51:29', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:51:31)');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553d900c8000b', '40288088454e50f101454e55511f0002', '2014-04-12 10:51:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553dab752000c', '40288088454e50f101454e55511f0002', '2014-04-12 10:51:41', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:53:33)');
INSERT INTO `sy_login_log` VALUES ('402880884553d374014553dada5b000d', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:53:42', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553dc08c80001', '40288088454e50f101454e55511f0002', '2014-04-12 10:55:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553dc55ee0002', '40288088454e50f101454e55511f0002', '2014-04-12 10:55:00', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:55:20)');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553dc6f430003', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:55:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553dd78080004', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 10:55:26', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 10:56:34)');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553e0e2f80005', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 11:00:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553e0ec300006', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 11:00:18', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 11:00:20)');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553e1094d0007', '40288088454e50f101454e55511f0002', '2014-04-12 11:00:28', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553e139c30008', '40288088454e50f101454e55511f0002', '2014-04-12 11:00:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553e140990009', '40288088454e50f101454e55511f0002', '2014-04-12 11:00:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 11:00:42)');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553e15b16000a', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 11:00:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553ea409d000b', '402881f73e1c4ba4013e1c4c08470001', '2014-04-12 11:00:49', '127.0.0.1', '中国', '山东省', '济南市', '联通', '正常退出(04-12 11:10:32)');
INSERT INTO `sy_login_log` VALUES ('402880884553dbb5014553ea6368000c', '40288088454e50f101454e55511f0002', '2014-04-12 11:10:40', '127.0.0.1', '中国', '山东省', '济南市', '联通', '登录成功');

-- ----------------------------
-- Table structure for sy_menu
-- ----------------------------
DROP TABLE IF EXISTS `sy_menu`;
CREATE TABLE `sy_menu` (
  `id` char(32) NOT NULL,
  `menu_super_id` char(32) DEFAULT '' COMMENT '上级菜单id',
  `menu_status` tinyint(4) DEFAULT '1' COMMENT '菜单状态：1：可用，0：不可用',
  `menu_sort` smallint(6) DEFAULT '1' COMMENT '菜单排序号，范围1-999',
  `menu_name` varchar(20) DEFAULT NULL COMMENT '菜单名称',
  `menu_icon` varchar(100) DEFAULT NULL COMMENT '菜单显示的图片路径',
  `menu_url` varchar(50) DEFAULT NULL COMMENT '链接url',
  `menu_target` varchar(10) DEFAULT 'navTab' COMMENT '打开位置',
  `menu_rel` varchar(20) DEFAULT '' COMMENT 'dwz 标签id,指定在哪个标签打开',
  `menu_open` char(5) DEFAULT 'false' COMMENT '是否打开true;false',
  `menu_external` char(5) DEFAULT 'false' COMMENT 'dwz参数,是否以iframe方式引入,',
  `menu_fresh` char(5) DEFAULT 'true' COMMENT 'dwz参数，表示重复打开navTab时是否重新加载数据',
  PRIMARY KEY (`id`),
  KEY `menu_status` (`menu_status`),
  KEY `menu_super_id` (`menu_super_id`),
  KEY `menu_sort` (`menu_sort`),
  CONSTRAINT `sy_menu_ibfk_1` FOREIGN KEY (`menu_super_id`) REFERENCES `sy_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of sy_menu
-- ----------------------------
INSERT INTO `sy_menu` VALUES ('4028808244dd2b620144dd39a1e80005', '4028808544d44b730144d4539379000a', '1', '1', '居民论坛', 'resource/images/menu/24005_s.gif', 'forum/load.do?rel=sqfw_jmlt', 'navTab', 'sqfw_jmlt', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808244dd2b620144dd67e6440008', '4028808544d44b730144d4539379000a', '1', '3', '居民答疑', 'resource/images/menu/xtgg.png', 'jmdy/load.do?rel=sqfw_jmdy', 'navTab', 'sqfw_jmdy', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544d44b730144d45106460002', '402881f73e86b4e6013e86c9d4960003', '1', '10', '人员管理', 'resource/images/menu/gstxl.png', 'person/RKJBList.do?rel=ggpt_rygl', 'navTab', 'ggpt_rygl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544d44b730144d4517cce0004', '402881f73e86b4e6013e86c9d4960003', '1', '15', '计生管理', 'resource/images/menu/grsz.png', 'Familyplan/load.do?rel=ggpt_jsgl', 'navTab', 'ggpt_jsgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544d44b730144d45203a20006', '402881f73e86b4e6013e86c9d4960003', '1', '20', '养老管理', 'resource/images/menu/flow.gif', 'pension/load.do?rel=ggpt_shyl', 'navTab', 'ggpt_shyl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544d44b730144d4526d290008', '402881f73e86b4e6013e86c9d4960003', '1', '25', '劳动保障管理', 'resource/images/menu/rsgl.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544d44b730144d4539379000a', '402881ea3f227e74013f2280351f0002', '1', '15', '社区服务', 'resource/images/menu/30.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de3306140002', '4028808544d44b730144d4526d290008', '1', '10', '退休人员', 'resource/images/menu/ldbz.png', 'txry/txryList.do?rel=ggpt_txry', 'navTab', 'ggpt_txry', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de33a4e40004', '4028808544d44b730144d4526d290008', '1', '20', '劳动监察', 'resource/images/menu/jmdy.png', 'ldjc/ldjcList.do?rel=ggpt_ldjc', 'navTab', 'ggpt_ldjc', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de3452a80006', '4028808544d44b730144d4526d290008', '1', '30', '职业介绍', 'resource/images/menu/cgx.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de3503e70008', '4028808544de2fbc0144de3452a80006', '1', '1', '单位招聘', 'resource/images/menu/rygl.png', 'dwzp/load.do?rel=ggpt_dwzp', 'navTab', 'ggpt_dwzp', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de359039000a', '4028808544de2fbc0144de3452a80006', '1', '20', '个人求职', 'resource/images/menu/grsz.png', 'grqz/load.do?rel=ggpt_grqz', 'navTab', 'ggpt_grqz', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de36893f000c', '4028808544d44b730144d4526d290008', '1', '40', '小额贷款发放', 'resource/images/menu/9.png', 'xedkffqk/xedkffqkList.do?rel=ggpt_xedkffqk', 'navTab', 'gpt_xedkffqk', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de36f97d000e', '4028808544d44b730144d4526d290008', '1', '50', '技能创业培训', 'resource/images/menu/jsgl.png', 'cypx/load.do?rel=ggpt_ldbz_cypx', 'navTab', 'ggpt_ldbz_cypx', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de3773120010', '4028808544d44b730144d4526d290008', '1', '60', '失业人员管理', 'resource/images/menu/Icon_10101_s.gif', 'sygl/load.do?rel=ggpt_ldbz_syry', 'navTab', 'ggpt_ldbz_syry', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808544de2fbc0144de3826260012', '4028808544d44b730144d4526d290008', '1', '35', '就业援助', 'resource/images/menu/jmdy.png', 'jyyz/jyyzList.do?rel=ggpt_jyyz', 'navTab', 'ggpt_jyyz', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('4028808844dd23b90144dd449be80004', '4028808544d44b730144d4539379000a', '1', '2', '社区留言板', 'resource/images/menu/msg.gif', 'message/load.do?rel=sqfw_sqly', 'navTab', 'sqfw_sqly', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402880e63f384d56013f384e413a0002', '402881f73eb50cf5013eb5240c4f0014', '1', '10', '修改密码', 'resource/images/menu/18.png', 'user/updateMyPwPage.do?rel=grsz_xgmm', 'navTab', 'grsz_xgmm', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881e63f502ae1013f502d7dff0002', '402881f73e39afbd013e39b48d2e0003', '1', '45', '打印导出自定义管理', 'resource/images/menu/1_open.png', 'tableCustom/dev/load.do?rel=xtgl_dydczdysz', 'navTab', 'xtgl_dydczdysz', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881e83eca193c013eca1ceb6a0002', '402881f73ea22a57013ea23438ea000e', '1', '3', '消息提醒', 'resource/images/menu/reply.gif', 'msgwarn/load.do?rel=grbg_xxtx', 'navTab', 'grbg_xxtx', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881ea3f227e74013f2280351f0002', '402881ea3f227e74013f2280351f0002', '0', '1', '系统菜单', 'resource/images/menu/1_close.png', '', 'navTab', '', 'true', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881ea3f59ec45013f59ef5dc00004', '402881f73e3fbaee013e3fefed61000c', '1', '44', '登陆日志设置', 'resource/images/menu/yzsz.png', 'tableCustom/load.do?type=1&rel=xtgl_dlrzzdysz', 'navTab', 'xtgl_dlrzzdysz', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881eb3ee3fba3013ee3fcd72d0002', '402881f73eb1d487013eb1e89eb70006', '1', '1', '写信', 'resource/images/menu/xxx.png', 'email/addPage.do?rel=grbg_nbyj_xx', 'navTab', 'grbg_nbyj_xx', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881eb3ee3fba3013ee3fd05e50004', '402881f73eb1d487013eb1e89eb70006', '1', '2', '收件箱', 'resource/images/menu/cgx.png', 'email/loadIn.do?rel=grbg_nbyj_sjx', 'navTab', 'grbg_nbyj_sjx', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881eb3ee3fba3013ee3fd53d00006', '402881f73eb1d487013eb1e89eb70006', '1', '3', '发件箱', 'resource/images/menu/fjx.png', 'email/loadOut.do?rel=grbg_nbyj_fjx', 'navTab', 'grbg_nbyj_fjx', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881eb3ee3fba3013ee3fd8d660008', '402881f73eb1d487013eb1e89eb70006', '1', '4', '草稿箱', 'resource/images/menu/mail_edit.png', 'email/loadDraft.do?rel=grbg_nbyj_cgx', 'navTab', 'grbg_nbyj_cgx', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881ec3f7960cb013f796260390002', '402881f73e39afbd013e39b48d2e0003', '1', '333', '系统设置', 'resource/images/menu/22.png', 'systemSet/updatePage.do?rel=xtgl_xtsz', 'navTab', 'xtgl_xtsz', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e39afbd013e39b48d2e0003', '402881ea3f227e74013f2280351f0002', '1', '200', '系统管理', 'resource/images/menu/1.png', '', '', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e39afbd013e39b7e93a0005', '402881ea3f227e74013f2280351f0002', '1', '190', '文档管理', 'resource/images/menu/wdgl.gif', '', '', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e39eba8013e39fbbf220003', '402881ea3f227e74013f2280351f0002', '1', '30', '协同办公', 'resource/images/menu/24.png', '', '', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3a15ee013e3a18f23b0002', '402881f73e39afbd013e39b48d2e0003', '1', '1', '组织机构', 'resource/images/menu/flow.gif', '', '', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3fe8dae50002', '402881f73e3a15ee013e3a18f23b0002', '1', '1', '社区管理', 'resource/images/menu/gstxl.png', 'dept/load.do?rel=stgl_jg_bmgl', 'navTab', 'stgl_jg_bmgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3fe9a8e30004', '402881f73e3a15ee013e3a18f23b0002', '1', '2', '用户管理', 'resource/images/menu/grsz.png', 'user/load.do?rel=stgl_jg_yhgl', 'navTab', 'stgl_jg_yhgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3fedf99f0008', '402881f73e3a15ee013e3a18f23b0002', '1', '3', '角色管理', 'resource/images/menu/Icon_10101_s.gif', 'role/load.do?rel=stgl_jg_jsgl', 'navTab', 'stgl_jg_jsgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3fefed61000c', '402881f73e39afbd013e39b48d2e0003', '1', '2', '系统日志', 'resource/images/menu/hysz.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ff73351000e', '402881f73e3fbaee013e3fefed61000c', '1', '1', '登录日志', 'resource/images/menu/30.png', 'log/login.do?rel=xtrz_login_log', 'navTab', 'xtrz_login_log', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ff7c58f0010', '402881f73e3fbaee013e3fefed61000c', '1', '2', '操作日志', 'resource/images/menu/gz.png', 'log/action.do?rel=xtrz_action_log', 'navTab', 'xtrz_action_log', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ff8caf90014', '402881f73e39afbd013e39b48d2e0003', '1', '3', '字典管理', 'resource/images/menu/13.png', 'list/load.do?rel=xtgl_zdgl', 'navTab', 'xtgl_zdgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ff93b470016', '402881f73e39afbd013e39b48d2e0003', '1', '4', '菜单管理', 'resource/images/menu/tpgl.png', 'menu/load.do?rel=xtgl_cdgl', 'navTab', 'xtgl_cdgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ff9e8300018', '402881f73e39afbd013e39b48d2e0003', '1', '300', '服务器信息', 'resource/images/menu/fwqxx.png', 'servlet/info.do', 'navTab', 'xtgl_fwqxx', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ffc8ec70020', '402881f73e39afbd013e39b7e93a0005', '1', '1', '个人文档', 'resource/images/menu/26.png', 'personalFiles/load.do?rel=dwgl_grwd', 'navTab', 'dwgl_grwd', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ffd3d470024', '402881f73e39afbd013e39b7e93a0005', '1', '2', '共享文档', 'resource/images/menu/sjx.png', 'shareFiles/load.do?rel=dwgl_gxwd', 'navTab', 'dwgl_gxwd', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ffde7fe0026', '402881f73e39afbd013e39b7e93a0005', '1', '3', '公司文档', 'resource/images/menu/24002_s.gif', 'companyFiles/load.do?rel=dwgl_gswd', 'navTab', 'dwgl_gswd', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e3fbaee013e3ffede450028', '402881f73e39eba8013e39fbbf220003', '1', '1', '通知管理', 'resource/images/menu/xtgg.png', 'notice/load.do?rel=xzbg_ggtzgl', 'navTab', 'xzbg_ggtzgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73e86b4e6013e86c9d4960003', '402881ea3f227e74013f2280351f0002', '1', '20', '公共平台', 'resource/images/menu/ggpt.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73ea22a57013ea23438ea000e', '402881ea3f227e74013f2280351f0002', '1', '10', '个人办公', 'resource/images/menu/grbg.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73ea22a57013ea2357c180015', '402881f73ea22a57013ea23438ea000e', '1', '3', '通知', 'resource/images/menu/Icon_24006_s.gif', 'notice/loadtome.do?rel=xzbg_tztm', 'navTab', 'xzbg_tztm', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb1853c013eb1ac06e00006', '402881f73e86b4e6013e86c9d4960003', '1', '112', '公告管理', 'resource/images/menu/xtgg.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb1853c013eb1ac49290008', '402881f73eb1853c013eb1ac06e00006', '1', '1', '系统公告', 'resource/images/menu/xtgg.png', 'affiche/load.do?rel=gtpt_xtgg_gl', 'navTab', 'gtpt_xtgg_gl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb1853c013eb1acb679000b', '402881f73eb1853c013eb1ac06e00006', '1', '2', '部门公告', 'resource/images/menu/xtgg.png', 'affiche/dept/load.do?rel=gtpt_bbgg_gl', 'navTab', 'gtpt_bbgg_gl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb1853c013eb1ad4a7c000d', '402881f73e86b4e6013e86c9d4960003', '1', '300', '社区新闻', 'resource/images/menu/24301_s.gif', 'news/loadnews.do?rel=ggpt_xwgl', 'navTab', 'ggpt_xwgl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb1d487013eb1e89eb70006', '402881f73ea22a57013ea23438ea000e', '1', '500', '内部邮件', 'resource/images/menu/25102_s.gif', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb50cf5013eb51095a50002', '402881f73ea22a57013ea23438ea000e', '1', '600', '通讯录', 'resource/images/menu/27.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb50cf5013eb510db780004', '402881f73eb50cf5013eb51095a50002', '1', '3', '个人通讯录', 'resource/images/menu/27.png', 'personal/load.do?rel=grbg_grtxl', 'navTab', 'grbg_grtxl', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb50cf5013eb511679b0006', '402881f73eb50cf5013eb51095a50002', '1', '30', '公司通讯簿', 'resource/images/menu/gstxl.png', 'public/load.do?rel=grbg_gstxl', 'navTab', 'grbg_gs', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb50cf5013eb5240c4f0014', '402881f73ea22a57013ea23438ea000e', '1', '999', '个人设置', 'resource/images/menu/yzsz.png', '', 'navTab', '', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb50cf5013eb524b30f0016', '402881f73eb50cf5013eb5240c4f0014', '1', '3', '登录日志', 'resource/images/menu/dlrz.png', 'log/login/my.do?rel=grbg_grse_log', 'navTab', 'grbg_grse_log', 'false', 'false', 'true');
INSERT INTO `sy_menu` VALUES ('402881f73eb50cf5013eb5339e94001f', '402881f73ea22a57013ea23438ea000e', '1', '400', '即时沟通', 'resource/images/menu/25008_s.gif', 'instantMessage/load.do?rel=grbg_jsgt', 'navTab', 'grbg_jsxgt', 'false', 'false', 'true');

-- ----------------------------
-- Table structure for sy_role
-- ----------------------------
DROP TABLE IF EXISTS `sy_role`;
CREATE TABLE `sy_role` (
  `id` char(32) NOT NULL,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(50) DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sy_role
-- ----------------------------
INSERT INTO `sy_role` VALUES ('4028808544fbf0e00144fc268b370027', '测试', '');
INSERT INTO `sy_role` VALUES ('4028808844f6cfd70144f6d5b6e70002', '居民', '居民注册');
INSERT INTO `sy_role` VALUES ('402881e63ff5a608013ff5b0b5ab0003', '书记', '书记');
INSERT INTO `sy_role` VALUES ('402881ea3f22b327013f22b4c9040004', '工作人员', '工作人员');
INSERT INTO `sy_role` VALUES ('402881ea3f26a313013f26b734e8005c', '开发测试', '用户开发阶段测试使用');
INSERT INTO `sy_role` VALUES ('402881f73e4f9ae9013e4fa2cb080003', '系统管理员', '拥有系统所有权限');

-- ----------------------------
-- Table structure for sy_role_action
-- ----------------------------
DROP TABLE IF EXISTS `sy_role_action`;
CREATE TABLE `sy_role_action` (
  `id` char(32) NOT NULL,
  `role_id` char(32) NOT NULL COMMENT '角色id',
  `action_id` char(32) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `sy_role_action_ibfk_1` (`role_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `sy_role_action_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sy_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sy_role_action_ibfk_2` FOREIGN KEY (`action_id`) REFERENCES `sy_action` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色--操作  关联表';

-- ----------------------------
-- Records of sy_role_action
-- ----------------------------
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c53930008', '402881f73e4f9ae9013e4fa2cb080003', '40287d8140755d68014075675f5c0009');
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c53930009', '402881f73e4f9ae9013e4fa2cb080003', '40287d8140755d6801407567d8da000a');
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c5393000a', '402881f73e4f9ae9013e4fa2cb080003', '40287d8140755d680140756875e5000b');
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c5393000b', '402881f73e4f9ae9013e4fa2cb080003', '40287d8140755d6801407568f505000c');
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c53940015', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f5b1d14013f5b21e9ad0009');
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c53940016', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f5b1d14013f5b225989000a');
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c53940017', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f5b1d14013f5b22ac5a000b');
INSERT INTO `sy_role_action` VALUES ('40287d81407f874b01407f8c53950018', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f5b1d14013f5b22f772000c');
INSERT INTO `sy_role_action` VALUES ('40287d81407faa8401407fbeee1c000a', '402881f73e4f9ae9013e4fa2cb080003', '40287d81407faa8401407fb757650008');
INSERT INTO `sy_role_action` VALUES ('4028808544fbf0e00144fc27f6fc002d', '4028808544fbf0e00144fc268b370027', '402881e63f404f96013f40c3868a0004');
INSERT INTO `sy_role_action` VALUES ('4028808544fbf0e00144fc27f6fc002e', '4028808544fbf0e00144fc268b370027', '402881e53f091a2e013f0936f5140002');
INSERT INTO `sy_role_action` VALUES ('4028808544fbf0e00144fc3f37610036', '4028808544fbf0e00144fc268b370027', '4028808544fbf0e00144fc3e580d0033');
INSERT INTO `sy_role_action` VALUES ('4028808644fc44080144fc45aaa00008', '4028808544fbf0e00144fc268b370027', '4028808544fbf0e00144fc168db60005');
INSERT INTO `sy_role_action` VALUES ('4028808644fc44080144fc45aaa00009', '4028808544fbf0e00144fc268b370027', '4028808544fbf0e00144fc16de760006');
INSERT INTO `sy_role_action` VALUES ('4028808644fc44080144fc45aaa0000a', '4028808544fbf0e00144fc268b370027', '4028808544fbf0e00144fc172e1c0007');
INSERT INTO `sy_role_action` VALUES ('4028808644fc44080144fc45aaa0000b', '4028808544fbf0e00144fc268b370027', '4028808544fbf0e00144fc40b67f003e');
INSERT INTO `sy_role_action` VALUES ('402880e63f320964013f32198d1f0013', '402881ea3f26a313013f26b734e8005c', '402881e53f091a2e013f0936f5140002');
INSERT INTO `sy_role_action` VALUES ('402880e63f320964013f32198d1f0014', '402881ea3f26a313013f26b734e8005c', '402881e53f091a2e013f093768710003');
INSERT INTO `sy_role_action` VALUES ('402880e63f320964013f32198d1f0015', '402881ea3f26a313013f26b734e8005c', '402881e53f091a2e013f093847180004');
INSERT INTO `sy_role_action` VALUES ('402880e63f320964013f32198d1f0016', '402881ea3f26a313013f26b734e8005c', '402881e53f091a2e013f093a96680005');
INSERT INTO `sy_role_action` VALUES ('402880e63f320964013f32198d1f0017', '402881ea3f26a313013f26b734e8005c', '402881e53f091a2e013f093c5d050006');
INSERT INTO `sy_role_action` VALUES ('402880e63f320964013f32198d1f0018', '402881ea3f26a313013f26b734e8005c', '402881e53f091a2e013f093d70d70007');
INSERT INTO `sy_role_action` VALUES ('402880e63f320964013f32198d1f0019', '402881ea3f26a313013f26b734e8005c', '402881e53f091a2e013f093f0a120008');
INSERT INTO `sy_role_action` VALUES ('402880e73f435b0d013f435e59780008', '402881ea3f26a313013f26b734e8005c', '402881e63f421408013f421d8cac0017');
INSERT INTO `sy_role_action` VALUES ('402880e73f435b0d013f435e59780009', '402881ea3f26a313013f26b734e8005c', '402881e63f421408013f421eff180018');
INSERT INTO `sy_role_action` VALUES ('402880e73f435b0d013f435e5978000b', '402881ea3f26a313013f26b734e8005c', '402881e63f421408013f421fef33001a');
INSERT INTO `sy_role_action` VALUES ('402880e73f435b0d013f435e5978000c', '402881ea3f26a313013f26b734e8005c', '402881e63f421408013f4220dd9d001c');
INSERT INTO `sy_role_action` VALUES ('402880e73f435b0d013f435e5978000d', '402881ea3f26a313013f26b734e8005c', '402881e63f421408013f422108d4001d');
INSERT INTO `sy_role_action` VALUES ('402880e73f435b0d013f435e5978000f', '402881ea3f26a313013f26b734e8005c', '402881e63f421408013f4221da1b001f');
INSERT INTO `sy_role_action` VALUES ('402880e73f435b0d013f436300bc001c', '402881ea3f26a313013f26b734e8005c', '402880e73f435b0d013f4361592d001b');
INSERT INTO `sy_role_action` VALUES ('402881e63f404f96013f40d20c91000e', '402881ea3f26a313013f26b734e8005c', '402881e63f404f96013f40c3868a0004');
INSERT INTO `sy_role_action` VALUES ('402881e64003d8940140046321580011', '402881e63ff5a608013ff5b0b5ab0003', '402881e53f091a2e013f0936f5140002');
INSERT INTO `sy_role_action` VALUES ('402881ea3f26a313013f26b14ac1003f', '402881ea3f22b327013f22b4c9040004', '402881e53f091a2e013f0936f5140002');
INSERT INTO `sy_role_action` VALUES ('402881ea3f26a313013f26b14ac10040', '402881ea3f22b327013f22b4c9040004', '402881e53f091a2e013f093768710003');
INSERT INTO `sy_role_action` VALUES ('402881ea3f26a313013f26b14ac10041', '402881ea3f22b327013f22b4c9040004', '402881e53f091a2e013f093847180004');
INSERT INTO `sy_role_action` VALUES ('402881ea3f26a313013f26b14ac10042', '402881ea3f22b327013f22b4c9040004', '402881e53f091a2e013f093a96680005');
INSERT INTO `sy_role_action` VALUES ('402881ea3f26a313013f26b14ac10043', '402881ea3f22b327013f22b4c9040004', '402881e53f091a2e013f093c5d050006');
INSERT INTO `sy_role_action` VALUES ('402881ea3f26a313013f26b14ac10044', '402881ea3f22b327013f22b4c9040004', '402881e53f091a2e013f093d70d70007');
INSERT INTO `sy_role_action` VALUES ('402881ea3f26a313013f26b14ac10045', '402881ea3f22b327013f22b4c9040004', '402881e53f091a2e013f093f0a120008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e2370057', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3270ae8b003e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e2370058', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f32714796003f');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e2370059', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3271b0b00040');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e237005a', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f32549d7c0038');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e238005b', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3255b1f0003a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e238005c', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3255fa36003b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e2380063', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f32b9f9013f32bbfb090002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e2380064', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f32b9f9013f32becabe0003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e2390065', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f32b9f9013f32bf3ae90004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e2390066', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f32b9f9013f32d8c3080010');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23a0067', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f421408013f421d8cac0017');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23a0068', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f421408013f421eff180018');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23a0069', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f421408013f421fef33001a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23a006a', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f421408013f4220dd9d001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23a006b', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f421408013f422108d4001d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23a006c', '402881f73e4f9ae9013e4fa2cb080003', '402880e73f435b0d013f4361592d001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23a006d', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f421408013f4221da1b001f');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b006e', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f418fe4f30010');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b006f', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f419029100011');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0070', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f41908a590012');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0071', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f4190cc280013');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0072', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f41916b0b0014');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0073', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f4191e6970015');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0074', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f4192390b0016');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0075', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f41929c920017');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0076', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f4192fcbf0018');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0077', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f419341110019');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0078', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f4193890b001a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23b0079', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f41490b013f4193bcf9001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23c007a', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f388a66013f388c67350005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23d0088', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f321590cb0002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23d0089', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f321619ac0003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23d008a', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3216872d0004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23d008b', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3216c71b0005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23d008c', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f321761a50006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23d008d', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3217b8f70007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23d008e', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f3218d4b90008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23e008f', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f320964013f321918d40009');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23e0098', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f404f96013f40c3868a0004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f0099', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f404f96013f40cb352d0005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f009a', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f404f96013f40cb895d0006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f009b', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f404f96013f40cbcd880007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f009c', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f404f96013f40cc26350008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f009d', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f404f96013f40cc53c20009');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f009e', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f404f96013f40cd435a000a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f009f', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f27d27d013f27d3cb140002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f00a0', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f27d27d013f27e74ff70003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f00a1', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f27d27d013f27e8bdde0004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f00a2', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f27d27d013f27e93b0f0005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e23f00a3', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f27d27d013f27ea0f500007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24000a4', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f27d27d013f27eaffcf0008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24200c1', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22d5fa013f230e4178001a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24200c2', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4a2cc5013e4a46ae1b0002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24200c3', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22d5fa013f230f0239001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24200c4', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4a2cc5013e4a47a1350003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24200c5', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4a2cc5013e4a483b520004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24200c6', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22d5fa013f230fb564001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300c7', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4a2cc5013e4a4ac71e0006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300c8', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22d5fa013f22ea3048000c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300c9', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e8fb130001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300ca', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22d5fa013f22eb6c13000d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300cb', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9139c4001d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300cc', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e917d55001e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300cd', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22d5fa013f22ed8c3d000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300ce', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9360da0020');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300cf', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22b327013f22b723c70006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300d0', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e94524f0021');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24300d1', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22b327013f22b8800f0007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d2', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9492f10022');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d3', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e94f4e80023');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d4', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f22b327013f22b9bc600008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d5', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9591a50025');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d6', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1cac7e013f1cc456b20009');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d7', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e96fbf30026');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d8', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e98aadb0028');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400d9', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9a27790029');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400da', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dba2656000a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400db', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9d5f05002a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24400dc', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9dced6002b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700dd', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4e9f6e4d002c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700de', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dc37c8f000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700df', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dc57ece000f');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700e0', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dd692c1001e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700e1', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dcb86d10018');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700e2', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dcbc8080019');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700e3', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dcc3084001a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700e4', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dcccff3001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24700e5', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dceb70f001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800e6', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dd2fc59001d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800e7', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1dde719d002a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800e8', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4ea2229f002f');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800e9', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1db56c013f1de053e10031');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800ea', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4ea265560030');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800eb', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1cac7e013f1cb9ff4e0008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800ec', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4951dc013e497b27810005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800ed', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4951dc013e497e6fc60006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24800ee', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4951dc013e498b3d9b0007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24a00ff', '402881f73e4f9ae9013e4fa2cb080003', '402881e53f091a2e013f0936f5140002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24a0100', '402881f73e4f9ae9013e4fa2cb080003', '402881e53f091a2e013f093768710003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24a0101', '402881f73e4f9ae9013e4fa2cb080003', '402881e53f091a2e013f093847180004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24a0102', '402881f73e4f9ae9013e4fa2cb080003', '402881e53f091a2e013f093a96680005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24a0103', '402881f73e4f9ae9013e4fa2cb080003', '402881e53f091a2e013f093c5d050006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24a0104', '402881f73e4f9ae9013e4fa2cb080003', '402881e53f091a2e013f093d70d70007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f73e10b013f73e7e24a0105', '402881f73e4f9ae9013e4fa2cb080003', '402881e53f091a2e013f093f0a120008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fc7f9fa000d', '402881ea3f26a313013f26b734e8005c', '402881ea3f1db56c013f1dba2656000a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fc7f9fa000e', '402881ea3f26a313013f26b734e8005c', '402881ea3f1db56c013f1dc37c8f000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fc7f9fa000f', '402881ea3f26a313013f26b734e8005c', '402881ea3f1db56c013f1dd692c1001e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fc7f9fa0010', '402881ea3f26a313013f26b734e8005c', '402881ea3f1db56c013f1dcccff3001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fc7f9fa0011', '402881ea3f26a313013f26b734e8005c', '402881ea3f1db56c013f1dd2fc59001d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fc7f9fa0012', '402881ea3f26a313013f26b734e8005c', '402881ea3f1db56c013f1dceb70f001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fc7f9fa0013', '402881ea3f26a313013f26b734e8005c', '402881ec3f74e4bc013f751014dd000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fdbe87b0016', '402881ea3f26a313013f26b734e8005c', '402881ea3f1de78f013f1dea9f130003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f7f9910013f7fe5acb90018', '402881ea3f26a313013f26b734e8005c', '402881f73e4e11dd013e4ea662160033');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed6f0038', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3270ae8b003e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed6f0039', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f32714796003f');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed6f003a', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3271b0b00040');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed6f003b', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f32549d7c0038');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed70003c', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3255b1f0003a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed70003d', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3255fa36003b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed710046', '402881ea3f22b327013f22b4c9040004', '402880e63f32b9f9013f32bbfb090002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed710047', '402881ea3f22b327013f22b4c9040004', '402880e63f32b9f9013f32becabe0003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed720048', '402881ea3f22b327013f22b4c9040004', '402880e63f32b9f9013f32bf3ae90004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed720049', '402881ea3f22b327013f22b4c9040004', '402880e63f32b9f9013f32d8c3080010');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed72004a', '402881ea3f22b327013f22b4c9040004', '402881e63f421408013f421d8cac0017');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed72004b', '402881ea3f22b327013f22b4c9040004', '402881e63f421408013f421eff180018');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed72004c', '402881ea3f22b327013f22b4c9040004', '402881e63f421408013f421fef33001a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed72004d', '402881ea3f22b327013f22b4c9040004', '402881e63f421408013f4220dd9d001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed72004e', '402881ea3f22b327013f22b4c9040004', '402881e63f421408013f422108d4001d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed72004f', '402881ea3f22b327013f22b4c9040004', '402880e73f435b0d013f4361592d001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed720050', '402881ea3f22b327013f22b4c9040004', '402881e63f421408013f4221da1b001f');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730051', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f418fe4f30010');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730052', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f419029100011');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730053', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f41908a590012');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730054', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f4190cc280013');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730055', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f41916b0b0014');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730056', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f4191e6970015');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730057', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f4192390b0016');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730058', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f41929c920017');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed730059', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f4192fcbf0018');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed73005a', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f419341110019');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed73005b', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f4193890b001a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed73005c', '402881ea3f22b327013f22b4c9040004', '402881e63f41490b013f4193bcf9001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed73005d', '402881ea3f22b327013f22b4c9040004', '402880e63f388a66013f388c67350005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed74006b', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f321590cb0002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed74006c', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f321619ac0003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed74006d', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3216872d0004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed74006e', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3216c71b0005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed74006f', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f321761a50006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed740070', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3217b8f70007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed740071', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f3218d4b90008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed740072', '402881ea3f22b327013f22b4c9040004', '402880e63f320964013f321918d40009');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed750082', '402881ea3f22b327013f22b4c9040004', '402881ea3f27d27d013f27d3cb140002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed750083', '402881ea3f22b327013f22b4c9040004', '402881ea3f27d27d013f27e74ff70003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed750084', '402881ea3f22b327013f22b4c9040004', '402881ea3f27d27d013f27e8bdde0004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed750085', '402881ea3f22b327013f22b4c9040004', '402881ea3f27d27d013f27e93b0f0005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed760086', '402881ea3f22b327013f22b4c9040004', '402881ea3f27d27d013f27ea0f500007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed760087', '402881ea3f22b327013f22b4c9040004', '402881ea3f27d27d013f27eaffcf0008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7800b7', '402881ea3f22b327013f22b4c9040004', '402881ea3f22d5fa013f230e4178001a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7800b8', '402881ea3f22b327013f22b4c9040004', '402881f73e4a2cc5013e4a46ae1b0002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7800b9', '402881ea3f22b327013f22b4c9040004', '402881ea3f22d5fa013f230f0239001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7800ba', '402881ea3f22b327013f22b4c9040004', '402881f73e4a2cc5013e4a47a1350003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900bb', '402881ea3f22b327013f22b4c9040004', '402881f73e4a2cc5013e4a483b520004');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900bc', '402881ea3f22b327013f22b4c9040004', '402881ea3f22d5fa013f230fb564001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900bd', '402881ea3f22b327013f22b4c9040004', '402881f73e4a2cc5013e4a4ac71e0006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900be', '402881ea3f22b327013f22b4c9040004', '402881ea3f22d5fa013f22ea3048000c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900bf', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e8fb130001c');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c0', '402881ea3f22b327013f22b4c9040004', '402881ea3f22d5fa013f22eb6c13000d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c1', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e9139c4001d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c2', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e917d55001e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c3', '402881ea3f22b327013f22b4c9040004', '402881ea3f22d5fa013f22ed8c3d000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c4', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e9360da0020');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c5', '402881ea3f22b327013f22b4c9040004', '402881ea3f22b327013f22b723c70006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c6', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e94524f0021');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c7', '402881ea3f22b327013f22b4c9040004', '402881ea3f22b327013f22b8800f0007');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c8', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e9492f10022');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900c9', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e94f4e80023');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900ca', '402881ea3f22b327013f22b4c9040004', '402881ea3f22b327013f22b9bc600008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7900cb', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4e9591a50025');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00cc', '402881ea3f22b327013f22b4c9040004', '402881ea3f1cac7e013f1cc456b20009');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00cd', '402881ea3f22b327013f22b4c9040004', '402881ea3f1db56c013f1dba2656000a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00ce', '402881ea3f22b327013f22b4c9040004', '402881ea3f1db56c013f1dc37c8f000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00cf', '402881ea3f22b327013f22b4c9040004', '402881ea3f1db56c013f1dd692c1001e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00d0', '402881ea3f22b327013f22b4c9040004', '402881ea3f1db56c013f1dcccff3001b');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00d1', '402881ea3f22b327013f22b4c9040004', '402881ea3f1db56c013f1dd2fc59001d');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00d2', '402881ea3f22b327013f22b4c9040004', '402881ea3f1db56c013f1dde719d002a');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00d3', '402881ea3f22b327013f22b4c9040004', '402881ea3f1db56c013f1de053e10031');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00d4', '402881ea3f22b327013f22b4c9040004', '402881ea3f1cac7e013f1cb9ff4e0008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f88bab9013f88c6ed7a00d6', '402881ea3f22b327013f22b4c9040004', '402881ec3f74e4bc013f751014dd000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d7342013f8d7e6802001b', '402881f73e4f9ae9013e4fa2cb080003', '402881ec3f7f9910013f7fa190720005');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d7342013f8d7e6802001c', '402881f73e4f9ae9013e4fa2cb080003', '402881ec3f7f9910013f7fa8e6920006');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d7342013f8d7e6802001d', '402881f73e4f9ae9013e4fa2cb080003', '402881ec3f7f9910013f7facf2410008');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d7342013f8d7e6802002a', '402881f73e4f9ae9013e4fa2cb080003', '402881ec3f74e4bc013f751014dd000e');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d82bc013f8d8b1a200003', '402881ea3f22b327013f22b4c9040004', '402881ea3f1de78f013f1dea9f130003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d82bc013f8d8b1a200005', '402881ea3f22b327013f22b4c9040004', '402881f73e4e11dd013e4ea662160033');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d82bc013f8d922a31000d', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f1de78f013f1dea9f130003');
INSERT INTO `sy_role_action` VALUES ('402881ec3f8d82bc013f8d922a32000e', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e4e11dd013e4ea662160033');
INSERT INTO `sy_role_action` VALUES ('402881ec3f983349013f98344e3a0002', '402881f73e4f9ae9013e4fa2cb080003', '402881ec3f8e0bc2013f8e1191a00002');
INSERT INTO `sy_role_action` VALUES ('402881ec3f983349013f98344e3a0003', '402881f73e4f9ae9013e4fa2cb080003', '402881ec3f8e0bc2013f8e11cffe0003');
INSERT INTO `sy_role_action` VALUES ('402881ed404c982701404d063c6d0034', '402881ea3f22b327013f22b4c9040004', '402881e63f404f96013f40c3868a0004');

-- ----------------------------
-- Table structure for sy_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sy_role_menu`;
CREATE TABLE `sy_role_menu` (
  `id` char(32) NOT NULL,
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `menu_id` char(32) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `sy_role_menu_ibfk_1` (`role_id`),
  KEY `sy_role_menu_ibfk_2` (`menu_id`),
  CONSTRAINT `sy_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sy_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sy_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sy_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色--权限  关联表';

-- ----------------------------
-- Records of sy_role_menu
-- ----------------------------
INSERT INTO `sy_role_menu` VALUES ('40287d814032583e0140325ecd9f0008', '402881e63ff5a608013ff5b0b5ab0003', '402881f73ea22a57013ea23438ea000e');
INSERT INTO `sy_role_menu` VALUES ('40287d81407f874b01407f8c53930007', '402881f73e4f9ae9013e4fa2cb080003', '402881e63f502ae1013f502d7dff0002');
INSERT INTO `sy_role_menu` VALUES ('4028808544fbf0e00144fc27f6fc002a', '4028808544fbf0e00144fc268b370027', '402881ea3f227e74013f2280351f0002');
INSERT INTO `sy_role_menu` VALUES ('4028808544fbf0e00144fc27f6fc002b', '4028808544fbf0e00144fc268b370027', '402881f73e86b4e6013e86c9d4960003');
INSERT INTO `sy_role_menu` VALUES ('4028808544fbf0e00144fc27f6fc002c', '4028808544fbf0e00144fc268b370027', '402881f73eb1853c013eb1ad4a7c000d');
INSERT INTO `sy_role_menu` VALUES ('4028808544fbf0e00144fc3f37610034', '4028808544fbf0e00144fc268b370027', '4028808544d44b730144d4539379000a');
INSERT INTO `sy_role_menu` VALUES ('4028808544fbf0e00144fc3f37610035', '4028808544fbf0e00144fc268b370027', '4028808844dd23b90144dd449be80004');
INSERT INTO `sy_role_menu` VALUES ('4028808644fc44080144fc45aaa00007', '4028808544fbf0e00144fc268b370027', '4028808544d44b730144d4517cce0004');
INSERT INTO `sy_role_menu` VALUES ('402880e63f320964013f32198d1e000a', '402881ea3f26a313013f26b734e8005c', '402881ea3f227e74013f2280351f0002');
INSERT INTO `sy_role_menu` VALUES ('402881e63f3c1f15013f3cbef6a1001d', '402881ea3f26a313013f26b734e8005c', '402881f73e86b4e6013e86c9d4960003');
INSERT INTO `sy_role_menu` VALUES ('402881e63f404f96013f40d20c91000d', '402881ea3f26a313013f26b734e8005c', '402881f73eb1853c013eb1ad4a7c000d');
INSERT INTO `sy_role_menu` VALUES ('402881e63f454102013f4552d1980005', '402881ea3f26a313013f26b734e8005c', '402881f73ea22a57013ea23438ea000e');
INSERT INTO `sy_role_menu` VALUES ('402881e63f454102013f4552d1980006', '402881ea3f26a313013f26b734e8005c', '402881f73eb1d487013eb1e89eb70006');
INSERT INTO `sy_role_menu` VALUES ('402881e63f454102013f4552d1980007', '402881ea3f26a313013f26b734e8005c', '402881eb3ee3fba3013ee3fcd72d0002');
INSERT INTO `sy_role_menu` VALUES ('402881e63f454102013f4552d1980008', '402881ea3f26a313013f26b734e8005c', '402881eb3ee3fba3013ee3fd05e50004');
INSERT INTO `sy_role_menu` VALUES ('402881e63f454102013f4552d1980009', '402881ea3f26a313013f26b734e8005c', '402881eb3ee3fba3013ee3fd53d00006');
INSERT INTO `sy_role_menu` VALUES ('402881e63f454102013f4552d198000a', '402881ea3f26a313013f26b734e8005c', '402881eb3ee3fba3013ee3fd8d660008');
INSERT INTO `sy_role_menu` VALUES ('402881e64003d89401400462b7f70008', '402881e63ff5a608013ff5b0b5ab0003', '402881ea3f227e74013f2280351f0002');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab0002d', '402881ea3f22b327013f22b4c9040004', '402881ea3f227e74013f2280351f0002');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab0002e', '402881ea3f22b327013f22b4c9040004', '402881f73ea22a57013ea23438ea000e');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab00030', '402881ea3f22b327013f22b4c9040004', '402881e83eca193c013eca1ceb6a0002');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab00031', '402881ea3f22b327013f22b4c9040004', '402881f73ea22a57013ea2357c180015');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab00036', '402881ea3f22b327013f22b4c9040004', '402881f73eb50cf5013eb5240c4f0014');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab00037', '402881ea3f22b327013f22b4c9040004', '402881f73eb50cf5013eb524b30f0016');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab00039', '402881ea3f22b327013f22b4c9040004', '402881f73e86b4e6013e86c9d4960003');
INSERT INTO `sy_role_menu` VALUES ('402881ea3f26a313013f26b14ab0003c', '402881ea3f22b327013f22b4c9040004', '402881f73e39eba8013e39fbbf220003');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f5f2501013f5f46ee240038', '402881ea3f26a313013f26b734e8005c', '402881f73e39afbd013e39b48d2e0003');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e22f000c', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f227e74013f2280351f0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e22f000d', '402881f73e4f9ae9013e4fa2cb080003', '402881f73ea22a57013ea23438ea000e');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e22f000e', '402881f73e4f9ae9013e4fa2cb080003', '402881e83eca193c013eca1ceb6a0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e22f000f', '402881f73e4f9ae9013e4fa2cb080003', '402881f73ea22a57013ea2357c180015');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e22f0013', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb50cf5013eb5339e94001f');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e22f0014', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb1d487013eb1e89eb70006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2300015', '402881f73e4f9ae9013e4fa2cb080003', '402881eb3ee3fba3013ee3fcd72d0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2300016', '402881f73e4f9ae9013e4fa2cb080003', '402881eb3ee3fba3013ee3fd05e50004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2300017', '402881f73e4f9ae9013e4fa2cb080003', '402881eb3ee3fba3013ee3fd53d00006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2300018', '402881f73e4f9ae9013e4fa2cb080003', '402881eb3ee3fba3013ee3fd8d660008');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2300019', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb50cf5013eb51095a50002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e230001a', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb50cf5013eb510db780004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e230001b', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb50cf5013eb511679b0006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e232001c', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb50cf5013eb5240c4f0014');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e232001d', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb50cf5013eb524b30f0016');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e232001f', '402881f73e4f9ae9013e4fa2cb080003', '402880e63f384d56013f384e413a0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2320020', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e86b4e6013e86c9d4960003');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2330029', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb1853c013eb1ac06e00006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e233002a', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb1853c013eb1ac49290008');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e233002b', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb1853c013eb1acb679000b');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e234002f', '402881f73e4f9ae9013e4fa2cb080003', '402881f73eb1853c013eb1ad4a7c000d');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2340030', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e39eba8013e39fbbf220003');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2340031', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ffede450028');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2360045', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e39afbd013e39b7e93a0005');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2360046', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ffc8ec70020');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2360047', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ffd3d470024');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2360048', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ffde7fe0026');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2360049', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e39afbd013e39b48d2e0003');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e236004a', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3a15ee013e3a18f23b0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e236004b', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3fe8dae50002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e236004c', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3fe9a8e30004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e236004d', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3fedf99f0008');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e236004e', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3fefed61000c');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e237004f', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ff73351000e');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2370050', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ff7c58f0010');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2370051', '402881f73e4f9ae9013e4fa2cb080003', '402881ea3f59ec45013f59ef5dc00004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2370052', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ff8caf90014');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f73e10b013f73e7e2370056', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ff9e8300018');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f7f9910013f7fc7f9fa000a', '402881ea3f26a313013f26b734e8005c', '402881f73e3a15ee013e3a18f23b0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f7f9910013f7fc7f9fa000b', '402881ea3f26a313013f26b734e8005c', '402881f73e3fbaee013e3fe9a8e30004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f7f9910013f7fc7f9fa000c', '402881ea3f26a313013f26b734e8005c', '402881f73e3fbaee013e3fedf99f0008');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f7f9910013f7fdbe87a0015', '402881ea3f26a313013f26b734e8005c', '402881f73e3fbaee013e3ff93b470016');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6b000c', '402881ea3f22b327013f22b4c9040004', '402881f73eb50cf5013eb5339e94001f');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6b000d', '402881ea3f22b327013f22b4c9040004', '402881f73eb1d487013eb1e89eb70006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6b000e', '402881ea3f22b327013f22b4c9040004', '402881eb3ee3fba3013ee3fcd72d0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6b000f', '402881ea3f22b327013f22b4c9040004', '402881eb3ee3fba3013ee3fd05e50004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6b0010', '402881ea3f22b327013f22b4c9040004', '402881eb3ee3fba3013ee3fd53d00006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6b0011', '402881ea3f22b327013f22b4c9040004', '402881eb3ee3fba3013ee3fd8d660008');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6b0012', '402881ea3f22b327013f22b4c9040004', '402881f73eb50cf5013eb51095a50002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6c0013', '402881ea3f22b327013f22b4c9040004', '402881f73eb50cf5013eb510db780004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6c0014', '402881ea3f22b327013f22b4c9040004', '402881f73eb50cf5013eb511679b0006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6c0015', '402881ea3f22b327013f22b4c9040004', '402880e63f384d56013f384e413a0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6c0019', '402881ea3f22b327013f22b4c9040004', '402881f73eb1853c013eb1ac06e00006');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6c001a', '402881ea3f22b327013f22b4c9040004', '402881f73eb1853c013eb1ac49290008');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6d001b', '402881ea3f22b327013f22b4c9040004', '402881f73eb1853c013eb1acb679000b');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6d0020', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ffede450028');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e0029', '402881ea3f22b327013f22b4c9040004', '402881f73e39afbd013e39b7e93a0005');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e002a', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ffc8ec70020');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e002b', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ffd3d470024');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e002c', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ffde7fe0026');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e002d', '402881ea3f22b327013f22b4c9040004', '402881f73e39afbd013e39b48d2e0003');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e002e', '402881ea3f22b327013f22b4c9040004', '402881f73e3a15ee013e3a18f23b0002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e002f', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3fe8dae50002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e0030', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3fe9a8e30004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6e0031', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3fedf99f0008');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6f0032', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3fefed61000c');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6f0033', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ff73351000e');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6f0034', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ff7c58f0010');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6f0035', '402881ea3f22b327013f22b4c9040004', '402881ea3f59ec45013f59ef5dc00004');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f88bab9013f88c6ed6f0036', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ff8caf90014');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f8d7342013f8d7e68020004', '402881f73e4f9ae9013e4fa2cb080003', '402881ec3f7960cb013f796260390002');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f8d82bc013f8d8b1a1f0002', '402881ea3f22b327013f22b4c9040004', '402881f73e3fbaee013e3ff93b470016');
INSERT INTO `sy_role_menu` VALUES ('402881ec3f8d82bc013f8d922a31000c', '402881f73e4f9ae9013e4fa2cb080003', '402881f73e3fbaee013e3ff93b470016');
INSERT INTO `sy_role_menu` VALUES ('402881ed404c982701404d063c670033', '402881ea3f22b327013f22b4c9040004', '402881f73eb1853c013eb1ad4a7c000d');

-- ----------------------------
-- Table structure for sy_sms_history
-- ----------------------------
DROP TABLE IF EXISTS `sy_sms_history`;
CREATE TABLE `sy_sms_history` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `sms_content` varchar(200) NOT NULL COMMENT '短信内容',
  `sms__send_id` char(32) DEFAULT NULL COMMENT '发送人id',
  `sms_create_time` datetime DEFAULT NULL COMMENT '短信发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短息发送 历史表';

-- ----------------------------
-- Records of sy_sms_history
-- ----------------------------

-- ----------------------------
-- Table structure for sy_sms_receive
-- ----------------------------
DROP TABLE IF EXISTS `sy_sms_receive`;
CREATE TABLE `sy_sms_receive` (
  `id` char(32) NOT NULL,
  `sms_id` char(32) DEFAULT NULL COMMENT '短信历史记录id',
  `receive_phone` char(11) DEFAULT NULL COMMENT '接收人手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信接收人表';

-- ----------------------------
-- Records of sy_sms_receive
-- ----------------------------

-- ----------------------------
-- Table structure for sy_table_custom
-- ----------------------------
DROP TABLE IF EXISTS `sy_table_custom`;
CREATE TABLE `sy_table_custom` (
  `id` char(32) NOT NULL,
  `tb_type` tinyint(4) NOT NULL COMMENT '类型，不同类型对应不同表',
  `field_sort` smallint(6) NOT NULL DEFAULT '1' COMMENT '顺序号',
  `field_name` varchar(30) NOT NULL COMMENT '表字段对应的javaBean属性名称',
  `field_type` tinyint(4) NOT NULL COMMENT '属性类型',
  `field_title` varchar(20) NOT NULL COMMENT '默认的显示名',
  `field_another_title` varchar(20) DEFAULT NULL COMMENT '显示的别名，如果没有则显示默认名称',
  `is_export` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否导出，1：导出，0：不导出',
  `is_print` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否打印,1:打印，0,不打印',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1：显示，0：不显示',
  PRIMARY KEY (`id`),
  KEY `tb_type` (`tb_type`),
  KEY `field_name` (`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导入导出,表的自定义设置';

-- ----------------------------
-- Records of sy_table_custom
-- ----------------------------
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bbd87c20007', '7', '1', 'deStaff', '5', '用户名', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bbe0db70008', '7', '2', 'deName', '1', '打分项名称', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bc40b630009', '7', '3', 'deMinute', '1', '分值', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bc4cdc0000a', '7', '4', 'deDate', '4', '打分日期', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bc565fb000b', '7', '5', 'deUid', '5', '打分人员', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bc5ec29000c', '7', '6', 'deCheck', '5', '审核人员', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bc681c4000d', '7', '7', 'deChdate', '4', '审核日期', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('40287d81405b94d301405bc7065c000e', '7', '8', 'deRemark', '1', '打分说明', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f513a36480003', '1', '1', 'userId', '5', '用户名', '', '1', '1', '0');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f513adbdd0004', '1', '2', 'loginTime', '4', '登陆时间', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f513b51a10005', '1', '3', 'loginIp', '1', '登陆ip', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f513e810c0006', '1', '4', 'ipInfoCountry', '1', 'ip所属国家', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f513f46b70007', '1', '5', 'ipInfoRegion', '1', 'ip所属省份', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f513fcce50008', '1', '6', 'ipInfoCity', '1', 'ip所属城市', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f514014fb0009', '1', '7', 'ipInfoIsp', '1', 'ip所属运营商', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881e63f510729013f5140e90d000a', '1', '8', 'loginType', '1', '日志', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4013a196014013abdb040002', '2', '55', 'userid', '5', '分配人', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4013a196014013ac5def0003', '2', '5', 'salesman', '5', '销售人员', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4013a196014013acd9fa0004', '2', '10', 'month', '1', '月份', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4013a196014013ad37c10005', '2', '15', 'task', '1', '任务量(万)', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4013a196014013aeb9950007', '2', '60', 'createdate', '4', '分配日期', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4013a196014013af703c0008', '2', '25', 'content', '1', '总经理评价', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4013b401014013c2bff0000e', '2', '30', 'execution', '1', '当前状态', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed40385e1c0140386f6501000a', '2', '35', 'approvednumber', '1', '完成总数(万)', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c4d3990004', '3', '1', 'deptmanagerid', '6', '部门', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c51ae40005', '3', '5', 'month', '1', '月份', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c571670006', '3', '10', 'num', '1', '任务量(万)', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c5c0cc0007', '3', '15', 'wcl', '1', '完成总数(万)', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c6be540008', '4', '1', 'salesman', '5', '销售人', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c7052d0009', '4', '5', 'task', '1', '任务量（万）', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c770f9000a', '4', '10', 'completed', '1', '完成量（万）', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed4038c205014038c7ce8c000b', '4', '15', 'wcl', '1', '完成比率(%)', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed403c8a7501403c9eaf65000c', '5', '1', 'salesman', '5', '销售人', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed403c8a7501403c9ee37a000d', '5', '5', 'task', '1', '任务量', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed403c8a7501403ca026e5000f', '5', '15', 'month', '1', '月份', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed403c8a7501403ca0ff5e0010', '5', '10', 'approvednumber', '1', '完成量', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed403c8a7501403ca531ba0015', '5', '20', 'userid', '5', '分配人', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed403c8a7501403ca5b2dc0016', '5', '25', 'createdate', '1', '分配日期', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed403caade01403cae7ec50004', '4', '25', 'month', '1', '月份', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed404becd701404c7fcf2d0050', '6', '1', 'salesman', '5', '销售人员', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed404becd701404c803c330051', '6', '5', 'rwl', '1', '任务量', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed404becd701404c807c600052', '6', '10', 'wcl', '1', '完成量', '', '1', '1', '1');
INSERT INTO `sy_table_custom` VALUES ('402881ed404becd701404c81b4210053', '6', '20', 'currentyear', '1', '年份', '', '1', '1', '1');

-- ----------------------------
-- Table structure for sy_users
-- ----------------------------
DROP TABLE IF EXISTS `sy_users`;
CREATE TABLE `sy_users` (
  `id` char(32) NOT NULL,
  `user_name` varchar(15) NOT NULL COMMENT '登陆账号',
  `user_password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT 'x.x.x.x' COMMENT '最后登录IP',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) DEFAULT '0' COMMENT '登录错误次数',
  `user_status` tinyint(1) DEFAULT '0' COMMENT '账号状态 1:正常 0 禁止登陆',
  `dept_id` varchar(50) DEFAULT NULL COMMENT '所属部门id',
  `true_name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `user_desc` varchar(50) DEFAULT '' COMMENT '用户说明',
  `user_sex` tinyint(1) DEFAULT '0' COMMENT '性别 1:男 0:女 ',
  `register_uid` char(32) DEFAULT '' COMMENT '注册人',
  `mobile_phone_number` char(11) DEFAULT NULL COMMENT '手机号',
  `xltypeid` varchar(32) DEFAULT NULL COMMENT '学历类型',
  `dytypeid` varchar(32) DEFAULT NULL COMMENT '党员类型',
  `joindate` varchar(20) DEFAULT NULL COMMENT '入职时间',
  `zwtypeid` varchar(32) DEFAULT NULL COMMENT '职务',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE,
  KEY `user_status` (`user_status`),
  KEY `register_time` (`register_time`),
  KEY `sy_users_ibfk_1` (`dept_id`),
  CONSTRAINT `sy_users_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sy_dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表; ';

-- ----------------------------
-- Records of sy_users
-- ----------------------------
INSERT INTO `sy_users` VALUES ('4028808544fbf0e00144fc2621230025', 'csy', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-03-26 10:09:21', '2014-03-26 10:44:04', '127.0.0.1', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469173', 'csy', '', '1', '402881f73e1c4ba4013e1c4c08470001', '', '402881823f1d40d8013f1dbc9bb7001f', '402881e64027f7c301402819344d0007', '2014-03-17', '402881e64027f7c30140281a4ab5000d');
INSERT INTO `sy_users` VALUES ('4028808844f72d6b0144f72df81a0002', 'qingyu', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-03-25 10:59:48', null, 'x.x.x.x', null, '0', '1', null, '请于', '', '0', '402881f73e1c4ba4013e1c4c08470001', '', '402881823f1d40d8013f1dbc63a0001d', '402881e64027f7c3014028197f3b0009', null, null);
INSERT INTO `sy_users` VALUES ('402880884540a48b014540ad8af80001', 'zzz', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-08 17:31:26', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469173', '第三方', '答复', '1', null, '', '402881823f1d40d8013f1dbc63a0001d', '402881e64027f7c3014028197f3b0009', '2014-04-08', '402881e64027f7c30140281b1fa4000f');
INSERT INTO `sy_users` VALUES ('402880884540a48b014540ae30bd0003', 'zck123', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-08 17:32:08', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469173', '第三方', '答复', '1', null, '18953132511', '402881823f1d40d8013f1dbc63a0001d', '402881e64027f7c3014028197f3b0009', '2014-04-08', '402881e64027f7c30140281b1fa4000f');
INSERT INTO `sy_users` VALUES ('402880884540a48b014540b21ab10005', 'liyang', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-08 17:36:19', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469173', '李阳', '水电费', '1', null, '', '402881823f1d40d8013f1dbc09320019', '402881e64027f7c3014028197f3b0009', '2014-04-08', '402881e64027f7c30140281b46c30011');
INSERT INTO `sy_users` VALUES ('402880884540a48b014540b414cc0007', 'zhangtao1', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-08 17:38:28', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469173', '张涛涛', '水电费答复', '1', null, '', '402881823f1d40d8013f1dbc4369001b', '402881e64027f7c301402819344d0007', '2014-04-08', '402881e64027f7c30140281b1fa4000f');
INSERT INTO `sy_users` VALUES ('402880884540a48b014540b619850009', 'xiaohong', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-08 17:40:47', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469174', '小红', '水电费的飞洒', '1', null, '', '402881823f1d40d8013f1dbc63a0001d', '402881e64027f7c3014028197f3b0009', '2014-04-08', '402881e64027f7c30140281b46c30011');
INSERT INTO `sy_users` VALUES ('402880884540a48b014540b79d75000b', 'xiaogang', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-08 17:42:26', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469173', '小刚', '答复', '1', null, '', '', '', '2014-04-08', '');
INSERT INTO `sy_users` VALUES ('402880884540bc0e014540bf19790001', '444444', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-08 17:50:36', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469172', '电饭锅', '', '1', null, '', '', '', '2014-04-08', '');
INSERT INTO `sy_users` VALUES ('40288088454407310145443116c80001', 'hongguang', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-09 09:53:58', null, 'x.x.x.x', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469172', '红豆', '山东省', '1', null, '', '402881823f1d40d8013f1dbc09320019', '402881e64027f7c3014028197f3b0009', '2014-04-09', '402881e64027f7c30140281b1fa4000f');
INSERT INTO `sy_users` VALUES ('40288088454e50f101454e55511f0002', 'limin', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-11 09:09:45', '2014-04-12 11:10:40', '127.0.0.1', '2014-04-11 15:11:04', '0', '1', 'D663C662-38E9-4078-B44C-0D081F469174', '李敏', '水电费', '0', null, '', '402881823f1d40d8013f1dbc63a0001d', '402881e64027f7c3014028197f3b0009', '2014-04-11', '402881e64027f7c30140281b46c30011');
INSERT INTO `sy_users` VALUES ('402880884550247801455030434d0005', 'zhanggong', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2014-04-11 17:48:31', '2014-04-11 17:53:12', '127.0.0.1', null, '0', '1', 'D663C662-38E9-4078-B44C-0D081F469172', '张工', '', '1', '402881f73e1c4ba4013e1c4c08470001', '', '402881823f1d40d8013f1dbc9bb7001f', '402881e64027f7c3014028197f3b0009', '2014-04-16', '402881e64027f7c30140281b46c30011');
INSERT INTO `sy_users` VALUES ('402881f73e1c4ba4013e1c4c08470001', 'admin', 'H1AF2G39C90F59F00H5DHA574BA4EE3H', '2013-04-18 16:39:04', '2014-04-12 11:00:49', '127.0.0.1', '2014-04-11 17:37:04', '0', '1', 'D663C662-38E9-4078-B44C-0D081F469177', '超级管理员', '拥有系统最高权限!', '1', '0', '18615200092', '402881823f1d40d8013f1dbc09320019', '402881e64027f7c3014028197f3b0009', '2011-07-24', '402881e64027f7c30140281b686e0013');

-- ----------------------------
-- Table structure for sy_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sy_user_role`;
CREATE TABLE `sy_user_role` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '用户id',
  `role_id` char(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `sy_user_role_ibfk_2` (`role_id`),
  CONSTRAINT `sy_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sy_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sy_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户--角色  关联表';

-- ----------------------------
-- Records of sy_user_role
-- ----------------------------
INSERT INTO `sy_user_role` VALUES ('402880884540a48b014540ad8af80002', '402880884540a48b014540ad8af80001', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('402880884540a48b014540ae30bd0004', '402880884540a48b014540ae30bd0003', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('402880884540a48b014540b28e890006', '402880884540a48b014540b21ab10005', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('402880884540a48b014540b414cc0008', '402880884540a48b014540b414cc0007', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('402880884540a48b014540b61985000a', '402880884540a48b014540b619850009', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('402880884540a48b014540b79d75000c', '402880884540a48b014540b79d75000b', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('402880884540bc0e014540bf19790002', '402880884540bc0e014540bf19790001', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('40288088454407310145443116d80002', '40288088454407310145443116c80001', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('40288088454e50f101454e55511f0003', '40288088454e50f101454e55511f0002', '4028808844f6cfd70144f6d5b6e70002');
INSERT INTO `sy_user_role` VALUES ('402880884550326001455034144a0002', '402880884550247801455030434d0005', '402881ea3f22b327013f22b4c9040004');
INSERT INTO `sy_user_role` VALUES ('402881f73e1c4ba4013e1c4c08470001', '402881f73e1c4ba4013e1c4c08470001', '402881f73e4f9ae9013e4fa2cb080003');

-- ----------------------------
-- Table structure for tb_forum
-- ----------------------------
DROP TABLE IF EXISTS `tb_forum`;
CREATE TABLE `tb_forum` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '论坛主题ID',
  `subject` varchar(255) NOT NULL COMMENT '帖子主题',
  `content` text COMMENT '贴吧帖子的内容',
  `username` varchar(50) NOT NULL COMMENT '发帖人的用户名',
  `publishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '帖子发布时间',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶, 1:置顶，0，不置顶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛帖子表';

-- ----------------------------
-- Records of tb_forum
-- ----------------------------
INSERT INTO `tb_forum` VALUES ('40288082454026950145402a439b0010', '思密达', '<p>斯蒂芬</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:08:02', '0');
INSERT INTO `tb_forum` VALUES ('40288082454026950145402dca320013', '励志', '<p>每一个不曾起舞的日子，都是对未来的一种辜负！<br/></p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:11:53', '0');
INSERT INTO `tb_forum` VALUES ('4028808245402f930145403049d80004', '第一天', '<p>first day</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:14:37', '0');
INSERT INTO `tb_forum` VALUES ('402880824540357f01454036c7e40004', '喔喔奶糖', '<p>吃多了张蛀牙</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:21:43', '0');
INSERT INTO `tb_forum` VALUES ('40288082454043f6014540463d1b0004', '还是卧', '<p>哈哈，；就</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:38:36', '0');
INSERT INTO `tb_forum` VALUES ('40288082454068d2014540734ba70005', 'Find a hole', '<p>Where&#39;s the way sir?</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:27:49', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d2014540746ac30006', '三更灯火', '<p>五更鸡<br/></p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:29:02', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454074d6fa0008', '大家好', '<p>Timi</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:29:30', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d20145407524db0009', 'Yes', '<p>Oh,yeah!</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:29:50', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454075687c000a', 'Oh,No!', '<p>Hhhhhhh</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:30:07', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d2014540764ca2000e', '1', '<p>11</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:05', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d20145407660a7000f', '22', '<p>22</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:11', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d2014540767cab0010', '333', '<p>333</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:18', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454076918b0011', '333', '<p>333</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:23', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454076a5fd0012', '444', '<p>444</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:28', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454076ba310013', '4', '<p>4</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:33', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454076cfad0014', '5', '<p>5</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:39', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454076e4000015', '12', '<p>12</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:44', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d201454076fce70016', '121', '<p>123123</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:51', null);
INSERT INTO `tb_forum` VALUES ('40288082454068d20145407714d40017', '213123', '<p>12312</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 16:31:57', null);
INSERT INTO `tb_forum` VALUES ('402880824540b8c8014540ba8ae90002', 'asdf', '<p>asdf</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 17:45:38', null);
INSERT INTO `tb_forum` VALUES ('402880824544707d01454479f93d0002', '玩家', '<p>igz</p>', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 11:13:35', null);

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question` (
  `id` varchar(32) NOT NULL COMMENT '问题ID',
  `questionType` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '问题类型',
  `fileUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文档保存路径',
  `questionContent` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '问题的文本内容',
  `questionStatus` char(2) CHARACTER SET utf8 DEFAULT '0' COMMENT '问题状态，0表示未解决的问题，1表示已解决的问题',
  `questionTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '问题标题',
  `publisher` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发布人',
  `responser` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '回复人',
  `responseTime` datetime DEFAULT NULL COMMENT '回复时间',
  `publishTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '问题发布时间',
  `responseContent` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '回复内容',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶, 1:置顶，0，不置顶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='问题表';

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES ('40288082454001ac014540029b530006', '人员管理', null, '<p>斯蒂芬</p>', '1', '斯蒂芬', '402881f73e1c4ba4013e1c4c08470001', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 14:34:21', '2014-04-08 14:24:43', '生大幅', '0');
INSERT INTO `tb_question` VALUES ('4028808245447c2a01454483a77a0003', '人员管理', 'D:\\Program Files\\apache-tomcat-7.0.52\\webapps\\sgsystem\\upfiles\\question\\48d02c6943e14066961c820a746ec8a3.txt', '<p>玩儿<br/></p>', '0', '斯蒂芬', '402881f73e1c4ba4013e1c4c08470001', null, null, '2014-04-09 11:24:09', null, null);
INSERT INTO `tb_question` VALUES ('4028808245447c2a0145448558fb0004', '人员管理', 'D:\\Program Files\\apache-tomcat-7.0.52\\webapps\\sgsystem\\upfiles\\question\\f89e14e78ebe4520bf7e0f31ccf9a253.txt', '<p>巍峨</p>', '0', '1', '402881f73e1c4ba4013e1c4c08470001', null, null, '2014-04-09 11:26:00', null, null);

-- ----------------------------
-- Table structure for tb_questiontype
-- ----------------------------
DROP TABLE IF EXISTS `tb_questiontype`;
CREATE TABLE `tb_questiontype` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '问题类型ID',
  `name` char(30) CHARACTER SET utf8 NOT NULL COMMENT '问题类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='问题类型';

-- ----------------------------
-- Records of tb_questiontype
-- ----------------------------
INSERT INTO `tb_questiontype` VALUES ('1', '计生问题');
INSERT INTO `tb_questiontype` VALUES ('2', '人员管理');
INSERT INTO `tb_questiontype` VALUES ('3', '养老管理');

-- ----------------------------
-- Table structure for tb_response
-- ----------------------------
DROP TABLE IF EXISTS `tb_response`;
CREATE TABLE `tb_response` (
  `id` char(32) CHARACTER SET utf8 NOT NULL,
  `responseContent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fileUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='问题回复';

-- ----------------------------
-- Records of tb_response
-- ----------------------------

-- ----------------------------
-- Table structure for txry
-- ----------------------------
DROP TABLE IF EXISTS `txry`;
CREATE TABLE `txry` (
  `TXRYGUID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '人口基本ID',
  `TXSJ` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '退休时间',
  `TXQDW` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '退休前单位',
  `DWDH` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位电话',
  `JTDH` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '家庭电话',
  `QSR` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '签收日',
  `TXRYBZ` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TXRYGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='退休人员';

-- ----------------------------
-- Records of txry
-- ----------------------------
INSERT INTO `txry` VALUES ('79ef4590-f931-4b70-ba96-394d57a1dab2', '801A880B-A5C8-4BB3-849D-4FAC8EBDA72C', '2014-03-04', '济南', '444', '555', '2014-03-18', '反反复复反复 D大调');
INSERT INTO `txry` VALUES ('89c19c91-ec27-437b-91cc-78d70fb93440', 'D6DA41CB-45F1-467F-901A-EE91630AF290', '2014-03-22', '答复', '答复', '3333', '2014-03-19', '大幅度  鹅鹅鹅饿饿');

-- ----------------------------
-- Table structure for wd_company_files
-- ----------------------------
DROP TABLE IF EXISTS `wd_company_files`;
CREATE TABLE `wd_company_files` (
  `id` char(32) NOT NULL,
  `wd_super_id` char(32) DEFAULT NULL COMMENT '上级文件id，0代表最顶层',
  `wd_name` varchar(50) NOT NULL COMMENT '文件名',
  `wd_user_id` char(32) DEFAULT NULL COMMENT '创建人id',
  `wd_create_time` datetime NOT NULL COMMENT '创建时间',
  `wd_type` tinyint(1) NOT NULL COMMENT '类型；0：目录，1：文件',
  `wd_desc` varchar(50) DEFAULT '' COMMENT '文件说明',
  `wd_new_name` varchar(32) DEFAULT '' COMMENT '保存时的文件名称',
  `wd_ext` varchar(10) DEFAULT '' COMMENT '文件后缀',
  `wd_size` int(11) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`),
  KEY `wd_create_time` (`wd_create_time`),
  KEY `wd_type` (`wd_type`),
  KEY `wd_super_id` (`wd_super_id`),
  KEY `wd_company_files_ibfk_1` (`wd_user_id`),
  CONSTRAINT `wd_company_files_ibfk_1` FOREIGN KEY (`wd_user_id`) REFERENCES `sy_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wd_company_files_ibfk_2` FOREIGN KEY (`wd_super_id`) REFERENCES `wd_company_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司文档';

-- ----------------------------
-- Records of wd_company_files
-- ----------------------------
INSERT INTO `wd_company_files` VALUES ('0', null, '公司文档', null, '2013-06-21 15:42:55', '0', '顶级节点不作显示', '', '', null);

-- ----------------------------
-- Table structure for wd_personal_files
-- ----------------------------
DROP TABLE IF EXISTS `wd_personal_files`;
CREATE TABLE `wd_personal_files` (
  `id` char(32) NOT NULL,
  `wd_super_id` char(32) NOT NULL COMMENT '上级文件id，0代表最顶层',
  `wd_name` varchar(50) NOT NULL COMMENT '文件名',
  `wd_user_id` char(32) NOT NULL COMMENT '创建人id',
  `wd_create_time` datetime NOT NULL COMMENT '创建时间',
  `wd_type` tinyint(1) NOT NULL COMMENT '类型；0：目录，1：文件',
  `wd_desc` varchar(50) DEFAULT '' COMMENT '文件说明',
  `wd_new_name` char(32) DEFAULT '' COMMENT '保存时的文件名称,UUID',
  `wd_ext` varchar(10) DEFAULT '' COMMENT '文件后缀',
  `wd_size` int(11) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`),
  KEY `wd_personal_files_ibfk_1` (`wd_user_id`),
  KEY `wd_create_time` (`wd_create_time`),
  KEY `wd_type` (`wd_type`),
  CONSTRAINT `wd_personal_files_ibfk_1` FOREIGN KEY (`wd_user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人文档';

-- ----------------------------
-- Records of wd_personal_files
-- ----------------------------
INSERT INTO `wd_personal_files` VALUES ('40287d8140708d3201407092f7fe0009', '0', '个人', '402881f73e1c4ba4013e1c4c08470001', '2013-08-12 11:30:14', '0', '', null, null, null);
INSERT INTO `wd_personal_files` VALUES ('40287d8140708d32014070938548000a', '40287d8140708d3201407092f7fe0009', '火狐', '402881f73e1c4ba4013e1c4c08470001', '2013-08-12 11:30:50', '1', '', 'd7e83337ffb74532bc1eeb27302d2b44', 'sql', '771912');

-- ----------------------------
-- Table structure for wd_share_files
-- ----------------------------
DROP TABLE IF EXISTS `wd_share_files`;
CREATE TABLE `wd_share_files` (
  `id` char(32) NOT NULL,
  `wd_super_id` char(32) DEFAULT NULL COMMENT '上级文件id，0代表最顶层',
  `wd_name` varchar(50) NOT NULL COMMENT '文件名',
  `wd_user_id` char(32) DEFAULT NULL COMMENT '创建人id',
  `wd_create_time` datetime NOT NULL COMMENT '创建时间',
  `wd_type` tinyint(1) NOT NULL COMMENT '类型；0：目录，1：文件',
  `wd_desc` varchar(50) DEFAULT '' COMMENT '文件说明',
  `wd_new_name` varchar(32) DEFAULT '' COMMENT '保存时的文件名称',
  `wd_ext` varchar(10) DEFAULT '' COMMENT '文件后缀',
  `wd_size` int(11) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`),
  KEY `wd_create_time` (`wd_create_time`),
  KEY `wd_type` (`wd_type`),
  KEY `wd_share_files_ibfk_1` (`wd_user_id`),
  KEY `wd_share_files_ibfk_2` (`wd_super_id`),
  CONSTRAINT `wd_share_files_ibfk_1` FOREIGN KEY (`wd_user_id`) REFERENCES `sy_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wd_share_files_ibfk_2` FOREIGN KEY (`wd_super_id`) REFERENCES `wd_share_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司文档';

-- ----------------------------
-- Records of wd_share_files
-- ----------------------------
INSERT INTO `wd_share_files` VALUES ('0', null, '共享文档', null, '2013-06-21 15:48:40', '0', '顶级节点，不做显示', '', '', null);

-- ----------------------------
-- Table structure for xedkffqk
-- ----------------------------
DROP TABLE IF EXISTS `xedkffqk`;
CREATE TABLE `xedkffqk` (
  `XEDKFFQKGUID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `RKJBGUID` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '人口基本信息',
  `FFSJ` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '发放时间',
  `DKJE` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '贷款金额',
  `HKSJ` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '还款时间',
  `XYD` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '信用度',
  `JYXM` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '经营项目',
  PRIMARY KEY (`XEDKFFQKGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='小额贷款发放情况';

-- ----------------------------
-- Records of xedkffqk
-- ----------------------------
INSERT INTO `xedkffqk` VALUES ('945fd126-8c21-45b4-bd63-15aab98590fc', '801A880B-A5C8-4BB3-849D-4FAC8EBDA72C', '2014-03-29', '111', '2014-03-29', '1', '发放111');
INSERT INTO `xedkffqk` VALUES ('e39c50fc-9c6c-48d3-9481-60da478df3ae', 'D6DA41CB-45F1-467F-901A-EE91630AF290', '2014-03-29', '777', '2014-03-11', '0', '发放222233SS');

-- ----------------------------
-- Table structure for xt_affiche
-- ----------------------------
DROP TABLE IF EXISTS `xt_affiche`;
CREATE TABLE `xt_affiche` (
  `id` char(32) NOT NULL,
  `affiche_title` varchar(50) NOT NULL COMMENT '标题',
  `affiche_type` char(32) DEFAULT NULL COMMENT '公告类型',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `user_id` char(32) DEFAULT NULL COMMENT '发布人',
  `affiche_content` text NOT NULL COMMENT '公告内容',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶, 1:置顶，0，不置顶',
  PRIMARY KEY (`id`),
  KEY `xt_affiche_ibfk_1` (`affiche_type`),
  KEY `xt_affiche_ibfk_2` (`user_id`),
  KEY `create_time` (`create_time`),
  KEY `is_top` (`is_top`),
  CONSTRAINT `xt_affiche_ibfk_1` FOREIGN KEY (`affiche_type`) REFERENCES `list_values` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Records of xt_affiche
-- ----------------------------

-- ----------------------------
-- Table structure for xt_affiche_dept
-- ----------------------------
DROP TABLE IF EXISTS `xt_affiche_dept`;
CREATE TABLE `xt_affiche_dept` (
  `id` char(32) NOT NULL,
  `affiche_title` varchar(50) NOT NULL COMMENT '标题',
  `affiche_type` char(32) DEFAULT NULL COMMENT '公告类型',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `user_id` char(32) DEFAULT NULL COMMENT '发布人',
  `affiche_content` text NOT NULL COMMENT '公告内容',
  `dept_id` char(32) NOT NULL COMMENT '部门id',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶, 1:置顶，0，不置顶',
  PRIMARY KEY (`id`),
  KEY `xt_affiche_dept_ibfk_1` (`dept_id`),
  KEY `xt_affiche_dept_ibfk_2` (`affiche_type`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`),
  KEY `is_top` (`is_top`),
  CONSTRAINT `xt_affiche_dept_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sy_dept` (`id`) ON DELETE CASCADE,
  CONSTRAINT `xt_affiche_dept_ibfk_2` FOREIGN KEY (`affiche_type`) REFERENCES `list_values` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门公告';

-- ----------------------------
-- Records of xt_affiche_dept
-- ----------------------------

-- ----------------------------
-- Table structure for xt_journal
-- ----------------------------
DROP TABLE IF EXISTS `xt_journal`;
CREATE TABLE `xt_journal` (
  `id` char(32) NOT NULL,
  `journal_type` char(32) DEFAULT NULL COMMENT '日志类型,字典值ID',
  `journal_title` varchar(100) NOT NULL COMMENT '日志主题',
  `journal_content` text COMMENT '日志内容',
  `user_id` char(32) NOT NULL COMMENT '创建者',
  `journal_time` datetime NOT NULL COMMENT '日志时间',
  PRIMARY KEY (`id`),
  KEY `xt_journal_ibfk_1` (`journal_type`),
  KEY `xt_journal_ibfk_2` (`user_id`),
  KEY `journal_time` (`journal_time`),
  CONSTRAINT `xt_journal_ibfk_1` FOREIGN KEY (`journal_type`) REFERENCES `list_values` (`id`) ON DELETE SET NULL,
  CONSTRAINT `xt_journal_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作日志;';

-- ----------------------------
-- Records of xt_journal
-- ----------------------------

-- ----------------------------
-- Table structure for xt_journal_user
-- ----------------------------
DROP TABLE IF EXISTS `xt_journal_user`;
CREATE TABLE `xt_journal_user` (
  `id` char(32) NOT NULL,
  `journal_id` char(32) NOT NULL COMMENT '日志id',
  `user_id` char(32) NOT NULL COMMENT '指定共享用户id',
  PRIMARY KEY (`id`),
  KEY `xt_journal_user_ibfk_2` (`user_id`),
  KEY `xt_journal_user_ibfk_1` (`journal_id`),
  CONSTRAINT `xt_journal_user_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `xt_journal` (`id`) ON DELETE CASCADE,
  CONSTRAINT `xt_journal_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志--共享人';

-- ----------------------------
-- Records of xt_journal_user
-- ----------------------------

-- ----------------------------
-- Table structure for xt_notice
-- ----------------------------
DROP TABLE IF EXISTS `xt_notice`;
CREATE TABLE `xt_notice` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `notice_title` varchar(100) NOT NULL COMMENT '标题',
  `notice_type` char(32) DEFAULT NULL COMMENT '通知类型,字典值id',
  `notice_send_id` char(32) NOT NULL COMMENT '发送人id',
  `notice_create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `notice_send_id` (`notice_send_id`),
  KEY `notice_create_time` (`notice_create_time`),
  KEY `notice_type` (`notice_type`),
  CONSTRAINT `xt_notice_ibfk_1` FOREIGN KEY (`notice_send_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `xt_notice_ibfk_2` FOREIGN KEY (`notice_type`) REFERENCES `list_values` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告; ';

-- ----------------------------
-- Records of xt_notice
-- ----------------------------
INSERT INTO `xt_notice` VALUES ('402880854520e01601452100b4f80002', '涉外就业业务温馨提示', '402881ea3f1dac03013f1dad000b0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-02 13:54:25');
INSERT INTO `xt_notice` VALUES ('402880854525786801452644644b0005', '关于开展2014年科技基础', '402881ea3f1dac03013f1dad000b0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:26:27');
INSERT INTO `xt_notice` VALUES ('402880854525786801452644c73b0006', '关于2014年公开招聘面试', '402881ea3f1dac03013f1dad000b0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:26:52');
INSERT INTO `xt_notice` VALUES ('40288085452578680145264536700007', '国土资源部决定挂牌督办2起国土', '402881ea3f1dac03013f1dad000b0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:27:21');
INSERT INTO `xt_notice` VALUES ('4028808545257868014526458f9c0008', '国土资源部关于开展2014年土地', '402881ea3f1dac03013f1dad000b0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-03 14:27:44');
INSERT INTO `xt_notice` VALUES ('4028808845400fd00145402460290009', '2014大学生就业问题', '402881f73ea21add013ea21c45810002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-08 15:01:36');
INSERT INTO `xt_notice` VALUES ('40288088454443230145444428020002', '国土资源部决定挂牌督办3起国土', '402881ea3f1dac03013f1dad000b0002', '402881f73e1c4ba4013e1c4c08470001', '2014-04-09 10:14:48');

-- ----------------------------
-- Table structure for xt_notice_content
-- ----------------------------
DROP TABLE IF EXISTS `xt_notice_content`;
CREATE TABLE `xt_notice_content` (
  `notice_id` char(32) NOT NULL COMMENT 'notice主表id,',
  `notice_content` text NOT NULL COMMENT '通知详细内容',
  `userIds` text COMMENT '接收用户id,多个，隔开',
  `deptIds` text COMMENT '接收部门id,多个，隔开',
  PRIMARY KEY (`notice_id`),
  CONSTRAINT `xt_notice_content_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `xt_notice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知内容表';

-- ----------------------------
-- Records of xt_notice_content
-- ----------------------------
INSERT INTO `xt_notice_content` VALUES ('402880854520e01601452100b4f80002', '<p>fq</p>', '', '');
INSERT INTO `xt_notice_content` VALUES ('402880854525786801452644644b0005', '<p><strong>、科技资源调查的主要内容&nbsp;</strong></p><p style=\"text-align:justify;\">　　原值<span lang=\"EN-US\">50万元以上大型科学仪器设备的状态、利用和共享情况，科技数据库建设和利用情况，部门批准建立的研究试验基地基本情况，法人单位概况等。</span>&nbsp;</p><p></p><p style=\"text-align:justify;\">　　调查标准时点为<span lang=\"EN-US\">2013年<span lang=\"EN-US\">12</span>月<span lang=\"EN-US\">31</span>日，时期资料为<span lang=\"EN-US\">2013</span>年度。</span>&nbsp;</p><p></p><p style=\"text-align:justify;\">　　<strong>二、科技资源调查的对象</strong>&nbsp;</p><p></p><p style=\"text-align:justify;\">　　<span lang=\"EN-US\">1</span>． 部系统内科研院所：部系统内科研院所，<span lang=\"EN-US\">23家，名单见附件<span lang=\"EN-US\">1</span>。</span>&nbsp;</p><p></p><p style=\"text-align:justify;\">　　<span lang=\"EN-US\">2</span>．部系统外科研平台：部依托省厅、属地化地勘单位、高校等，批准建设的部级重点实验室、质量监督检测中心、野外科学研究与观测基地。部系统内外科研平台名单见附件<span lang=\"EN-US\">2。</span></p><p><br/></p>', '', '');
INSERT INTO `xt_notice_content` VALUES ('402880854525786801452644c73b0006', '<p><span style=\"&#39;yes&#39;;   \">、面试人员名单</span></p><p style=\"  text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">　　根据《国土资源部信息中心201</span><span style=\"&#39;yes&#39;;   \">4</span><span style=\"&#39;yes&#39;;   \">年公开招聘工作人员公告》，分岗位按笔试成绩从高到低确定面试人员。现将面试人员名单予以公布(详见附件)。</span></p><p></p><p style=\"   text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">二、面试时间、地点</span></p><p></p><p style=\"  text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"&#39;yes&#39;;   \">面试时间：201</span><span style=\"&#39;yes&#39;;   \">4</span><span style=\"&#39;yes&#39;;   \">年4月</span><span style=\"&#39;yes&#39;;   \">8</span><span style=\"&#39;yes&#39;;   \">日（周</span><span style=\"&#39;yes&#39;;   \">二</span><span style=\"&#39;yes&#39;;   \">）全天，上午8:00开始。</span></p><p></p><p style=\"  text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">　　面试地点：国土资源部信息中心C楼一层职工会议室。</span></p><p></p><p style=\"  text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">　　</span><span style=\"&#39;yes&#39;;   \">三、注意事项</span></p><p></p><p style=\"  text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">　　1.面试时，应届毕业生须出示本人身份证、学生证原件，提供所在学校盖章的报名表、就业推荐表原件各一份。</span></p><p></p><p style=\"  text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">　　2.参加面试人员务必于面试前30分钟到场候考，面试迟到或缺席，视为自动放弃面试。</span></p><p></p><p style=\"  text-autospace:ideograph-numeric; text-autospace:ideograph-other; text-align:justify;  vertical-align:; \">　　<span style=\"&#39;yes&#39;;   \">　　3.考务电话：66558</span><span style=\"&#39;yes&#39;;   \">756</span><span style=\"&#39;yes&#39;;   \">，66558759。</span></p><p><br/></p>', '', '');
INSERT INTO `xt_notice_content` VALUES ('40288085452578680145264536700007', '<p></p><p style=\"text-align:center;\">　　<strong>河北省鸡泽县曹庄乡政府违法用地案</strong></p><p></p><p>　　2013年以来，河北省鸡泽县曹庄乡政府为建设新兴际华邯郸（鸡泽）天然气综合应用产业园，陆续铲毁麦田，平整曹庄乡正言堡村基本农田约200亩。目前已圈建围栏、建设道路、搭建工棚。</p><p></p><p style=\"text-align:center;\">　　<strong>新疆维吾尔自治区鄯善县潞安新疆煤化工（集团）</strong></p><p></p><p style=\"text-align:center;\"><strong>　　沙尔湖煤业有限公司违法采矿案</strong></p><p></p><p>　　2009年5月至2013年6月，潞安新疆煤化工（集团）沙尔湖煤业有限公司在尚未取得采矿许可证的情况下，擅自以采代探违法开采煤炭。其间，当地国土资源主管部门曾多次制止，但该企业未停止违法行为。经初步调查，该企业已违法开采煤炭50万吨以上，销售约40万吨。</p><p></p><p><br/></p>', '', '');
INSERT INTO `xt_notice_content` VALUES ('4028808545257868014526458f9c0008', '<p style=\"text-align:justify;\">各省、自治区、直辖市国土资源主管部门，新疆生产建设兵团国土资源局，解放军土地管理局，中国地质调查局及部有关直属单位，各派驻地方的国家土地督察局，部机关有关司局： &nbsp;</p><p></p><p style=\"text-align:justify;\">　　为持续加强对土地矿产开发利用情况的全面监管，充分发挥卫片执法监督检查在“尽职尽责保护国土资源、节约集约利用国土资源、尽心尽力维护群众权益”的国土资源管理工作大局中的作用，切实贯彻转变职能，“把权力和责任放下去、把监管和服务抓起来”的要求，努力推动执法监督检查方式转变，将违法行为“发现在初始、解决在萌芽”，促进各地更好地依法依规管地用地、管矿用矿，进一步规范土地、矿产保护和开发利用秩序，部决定在全国统一部署开展<span lang=\"EN-US\">2014</span>年土地矿产卫片执法监督检查工作。现将有关事项通知如下： <br/></p><p><br/></p>', '', '');
INSERT INTO `xt_notice_content` VALUES ('4028808845400fd00145402460290009', '<p>2014大学毕业生就业问题......<br/></p>', '402881f73e1c4ba4013e1c4c08470001', 'D663C662-38E9-4078-B44C-0D081F469173');
INSERT INTO `xt_notice_content` VALUES ('40288088454443230145444428020002', '<p style=\"text-align:justify;\">各省、自治区、直辖市国土资源主管部门，新疆生产建设兵团国土资源局，解放军土地管理局，中国地质调查局及部有关直属单位，各派驻地方的国家土地督察局，部机关有关司局： &nbsp;</p><p>　\r\n　为持续加强对土地矿产开发利用情况的全面监管，充分发挥卫片执法监督检查在“尽职尽责保护国土资源、节约集约利用国土资源、尽心尽力维护群众权益”的国\r\n土资源管理工作大局中的作用，切实贯彻转变职能，“把权力和责任放下去、把监管和服务抓起来”的要求，努力推动执法监督检查方式转变，将违法行为“发现在\r\n初始、解决在萌芽”，促进各地更好地依法依规管地用地、管矿用矿，进一步规范土地、矿产保护和开发利用秩序，部决定在全国统一部署开展<span lang=\"EN-US\">2014</span>年土地矿产卫片执法监督检查工作。现将有关事项通知如下：</p><p><br/></p>', '40288088454407310145443116c80001', 'D663C662-38E9-4078-B44C-0D081F469172');

-- ----------------------------
-- Table structure for xt_notice_files
-- ----------------------------
DROP TABLE IF EXISTS `xt_notice_files`;
CREATE TABLE `xt_notice_files` (
  `id` char(32) NOT NULL,
  `notice_id` char(32) NOT NULL COMMENT 'notice 通知表id',
  `file_name` varchar(50) DEFAULT NULL COMMENT '文件名',
  `file_new_name` char(32) DEFAULT NULL COMMENT '保存时的文件名称,UUID',
  `file_ext` varchar(10) DEFAULT '' COMMENT '文件后缀',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`),
  KEY `notice_id` (`notice_id`),
  CONSTRAINT `xt_notice_files_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `xt_notice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知附件';

-- ----------------------------
-- Records of xt_notice_files
-- ----------------------------
INSERT INTO `xt_notice_files` VALUES ('40288088454443230145444428020007', '40288088454443230145444428020002', '11.sql.txt', '87bd893fd2634fe2afd8f565bc24e7c0', 'txt', '277');
INSERT INTO `xt_notice_files` VALUES ('40288088454467bf0145446f641f0004', '40288088454443230145444428020002', 'sgsystem.sql', 'e18fc2ba5fe842d4aee5da1e649de2e1', 'sql', '699964');

-- ----------------------------
-- Table structure for xt_notice_receive
-- ----------------------------
DROP TABLE IF EXISTS `xt_notice_receive`;
CREATE TABLE `xt_notice_receive` (
  `id` char(32) NOT NULL,
  `notice_id` char(32) NOT NULL COMMENT '公告通知主表ID',
  `user_id` char(32) NOT NULL COMMENT '接收者id',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间,null代表还未阅读',
  PRIMARY KEY (`id`),
  KEY `xt_notice_receive_ibfk_1` (`notice_id`),
  KEY `xt_notice_receive_ibfk_2` (`user_id`),
  CONSTRAINT `xt_notice_receive_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `xt_notice` (`id`) ON DELETE CASCADE,
  CONSTRAINT `xt_notice_receive_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 通知接收人关联表';

-- ----------------------------
-- Records of xt_notice_receive
-- ----------------------------
INSERT INTO `xt_notice_receive` VALUES ('4028808845400fd00145402460290010', '4028808845400fd00145402460290009', '402881f73e1c4ba4013e1c4c08470001', null);
INSERT INTO `xt_notice_receive` VALUES ('4028808845400fd00145402460290013', '4028808845400fd00145402460290009', '4028808544fbf0e00144fc2621230025', null);
INSERT INTO `xt_notice_receive` VALUES ('40288088454467bf0145446f641f0002', '40288088454443230145444428020002', '40288088454407310145443116c80001', null);
INSERT INTO `xt_notice_receive` VALUES ('40288088454467bf0145446f641f0003', '40288088454443230145444428020002', '402880884540bc0e014540bf19790001', null);
