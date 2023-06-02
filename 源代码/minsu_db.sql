/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : minsu_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-04-18 16:42:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `areaId` int(11) NOT NULL auto_increment COMMENT '地区id',
  `areanName` varchar(20) NOT NULL COMMENT '地区名称',
  PRIMARY KEY  (`areaId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('1', '成都');
INSERT INTO `t_area` VALUES ('2', '杭州');
INSERT INTO `t_area` VALUES ('3', '北京');
INSERT INTO `t_area` VALUES ('4', '上海');
INSERT INTO `t_area` VALUES ('5', '广州');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '评论id',
  `minsuObj` int(11) NOT NULL COMMENT '被评民宿',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `userObj` varchar(30) NOT NULL COMMENT '评论用户',
  `commentTime` varchar(20) default NULL COMMENT '评论时间',
  PRIMARY KEY  (`commentId`),
  KEY `minsuObj` (`minsuObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`minsuObj`) REFERENCES `t_minsu` (`minsuId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '很干净的住宿地方哦！', 'user1', '2017-04-04 14:15:13');
INSERT INTO `t_comment` VALUES ('2', '1', '下次还来这里住！', 'user1', '2018-04-18 00:43:00');

-- ----------------------------
-- Table structure for `t_minsu`
-- ----------------------------
DROP TABLE IF EXISTS `t_minsu`;
CREATE TABLE `t_minsu` (
  `minsuId` int(11) NOT NULL auto_increment COMMENT '民宿id',
  `areaObj` int(11) NOT NULL COMMENT '所在地区',
  `minsuName` varchar(50) NOT NULL COMMENT '民宿名称',
  `minsuPhoto` varchar(60) NOT NULL COMMENT '民宿照片',
  `price` float NOT NULL COMMENT '每日价格',
  `minsuDesc` varchar(20000) NOT NULL COMMENT '民宿介绍',
  `minsuMemo` varchar(500) default NULL COMMENT '备注信息',
  `ownerObj` varchar(30) NOT NULL COMMENT '民宿主人',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`minsuId`),
  KEY `areaObj` (`areaObj`),
  KEY `ownerObj` (`ownerObj`),
  CONSTRAINT `t_minsu_ibfk_1` FOREIGN KEY (`areaObj`) REFERENCES `t_area` (`areaId`),
  CONSTRAINT `t_minsu_ibfk_2` FOREIGN KEY (`ownerObj`) REFERENCES `t_owner` (`ownerUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_minsu
-- ----------------------------
INSERT INTO `t_minsu` VALUES ('1', '1', '新南门地铁口带阳台优居', 'upload/ce6a11fc-57b3-4217-91ad-fda7e56a641f.jpg', '248', '<p><span class=\"text-deep-grey\" style=\"box-sizing: border-box; color: rgb(151, 151, 151); font-family: &quot;SF UI Text&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Arial, X-LocaleSpecific-Sans, DroidSansFallbackFull, sans-serif; font-variant-ligatures: none; background-color: rgb(255, 255, 255);\">个人介绍：</span><span style=\"color: rgb(78, 78, 78); font-family: &quot;SF UI Text&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Arial, X-LocaleSpecific-Sans, DroidSansFallbackFull, sans-serif; font-variant-ligatures: none; background-color: rgb(255, 255, 255);\">&nbsp;我从小喜欢侦探漫画，金田一`柯南我都觉得好看,大一点后就对侦探小说非常感兴趣，阿加莎系列`福尔摩斯探案集等不仅连书就是拍的电影也不会错过。我也喜欢旅游爬山，但很少有空能去，很羡慕那些旅行家～不过现在作为民宿房东的一份，我经常能和出来旅行的朋友们交流，常能得到大家的一些经验，希望以后有机会我能用上</span></p><p><span style=\"color: rgb(78, 78, 78); font-family: &quot;SF UI Text&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Arial, X-LocaleSpecific-Sans, DroidSansFallbackFull, sans-serif; font-variant-ligatures: none; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(78, 78, 78); font-family: &quot;SF UI Text&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Arial, X-LocaleSpecific-Sans, DroidSansFallbackFull, sans-serif; font-variant-ligatures: none; background-color: rgb(255, 255, 255);\"></span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>商业繁华区、商圈环绕，香车美女帅哥如云，鲜花音乐交织</p></li><li><p>The downtown business district, business district surrounded by handsome beauty like clouds, flowers, music intertwined</p></li><li><p>火锅、串串、川菜等应有尽有，周围美食街数不胜数</p></li><li><p>Hot pot, string, Sichuan food everything, food around the street countless</p></li><li><p>身处知名景点，其余各个知名景点四面环绕，交通便利</p></li><li><p>In the famous scenic spots, the rest of the famous scenic spots around, convenient transportation</p></li><li><p>精美北欧简约，家电齐全，独立厨房，出门仍享烹饪乐趣</p></li><li><p>Exquisite Nordic simplicity, complete home appliances, independent kitchen, go out, still enjoy cooking</p></li></ul><p><span style=\"color: rgb(78, 78, 78); font-family: &quot;SF UI Text&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Arial, X-LocaleSpecific-Sans, DroidSansFallbackFull, sans-serif; font-variant-ligatures: none; background-color: rgb(255, 255, 255);\"></span><br/></p>', '好地方', 'sz001', '2018-04-07 21:47:20');
INSERT INTO `t_minsu` VALUES ('2', '2', '地铁1号线客运中心站零距离', 'upload/2fc716bd-fb2b-4b2e-9334-a1fcb8e9c2a9.jpg', '228', '<h3 style=\"box-sizing: border-box; font-family: &quot;SF UI Text&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Arial, X-LocaleSpecific-Sans, DroidSansFallbackFull, sans-serif; line-height: 1.1; color: rgb(78, 78, 78); margin-top: 0.8rem; margin-bottom: 0.2rem; font-size: 0.32rem; font-variant-ligatures: none; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 20px;\">亮点</span></h3><ul class=\"list-unstyled list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>位于杭州客运中心，地铁1号线客运中心站地铁口零距离，地铁直达西湖，全新酒店式公寓大楼，是购物休闲出行都非常便利的一个复合商业综合体楼.与机场大巴0距离，各路市外公交，地铁东城广场，直达机场，乌镇，西湖，环境温馨安静，视野好，可以洗衣做饭,可以做为正常的居家房。交通非常便利。</p></li></ul><p><br/></p>', '交通方便', 'sz001', '2018-04-17 12:41:56');
INSERT INTO `t_minsu` VALUES ('3', '1', '世纪城环球中心风情之家', 'upload/1110d7b9-b543-40d6-99fb-edc05fa076c9.jpg', '199', '<h3 style=\"box-sizing: border-box; font-family: &quot;SF UI Text&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Arial, X-LocaleSpecific-Sans, DroidSansFallbackFull, sans-serif; line-height: 1.1; color: rgb(78, 78, 78); margin-top: 0.8rem; margin-bottom: 0.2rem; font-size: 0.32rem; font-variant-ligatures: none; white-space: normal; background-color: rgb(255, 255, 255);\">亮点</h3><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>成都,不仅仅是熊猫的故乡,有老街茶社,有麻将火锅,在环球中心这里,还彰显着成都这座城市的现代与活力。</p></li><li><p>★ 位置:位于1号线世纪城地铁口附近的盛南领地,紧邻新会展中心、环球中心、锦城公园等城市新坐标,交通非常便利,步行至世纪城地铁站仅需5分钟,距离铁象寺水街也非常近。</p></li><li><p>★ 户型/屋内设施:清新温馨梦幻风格,70平米的大套一,客厅外的超大平台,可以聚会,休闲,娱乐,非常的物尽其用。智能门锁、WIFI、空调、全天热水、高清电视、电冰箱、洗衣机、厨房备有基本用品,房间里的纸巾、洗漱用品都是房东免费提供的。房东还准备了晾衣架和洗衣粉,美食盛宴之后也能轻松换洗衣物,保证您一身干净清爽</p></li></ul><section><h3 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.1; color: inherit; margin-top: 0.8rem; margin-bottom: 0.2rem; font-size: 0.32rem;\">详细介绍</h3><p class=\"multi-line-text\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">点击头像可查看其他房商场附近,步行街、小吃街(如有的话)不容错过,人群外的安静、人群中的喧嚣,随您的选择触手可及。<br/>24小时便利店、菜市场有着融入这里的氛围,不远处的体育场,让您游玩之余畅快淋漓的出一身汗,旁边的公园中深夜漫步,卸去一身的疲惫。<br/>源</p></section><p></p><section><h3 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.1; color: inherit; margin-top: 0.8rem; margin-bottom: 0.2rem; font-size: 0.32rem;\">周边介绍</h3><p class=\"multi-line-text\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">离新会展0米 下楼就到展厅啦!<br/>成都的火锅、兵哥豌豆面、老麻抄手、神户牛肉、花溪牛肉粉、冒菜等等,满足好吃嘴们的一切愿望;周围大型购物商场还有银泰城、汇锦广场、世豪广场、伊藤、环球中心等等;离奥特莱斯0米 在自家小区逛大牌哦~<br/>★ 景点:<br/>熊猫基地(位于地铁三号线熊猫大道附近,属于城北);<br/>宽窄巷子(三大历史文化保保护区之一,地铁4号线宽窄巷子站,最全成都小吃地);<br/>锦里/武侯祠(三国文化+古街+小吃,建议晚上去);<br/>杜甫草堂(周围还有浣花溪公园、青羊宫、四川省博物馆,可以一条线);<br/>文殊院(成都佛教协会驻地,有斋饭,地铁1号线文殊院站);<br/>太古里/方所(位于春熙路,方所在负一楼,方所是集书店生活美学植物于一身的文化综合体);<br/>U37创意仓库(2号线地铁牛王庙附近,文艺拍照地,咖啡西餐多肉手工等园区);<br/>小酒馆(玉林西路,一定要提前查询是否有演出)<br/>★ 吃喝:<br/>火锅:小龙坎火锅(春熙路店、盐市口店等);川西坝子火锅;牛犇犇牛杂火锅;大宅门火锅;小郡肝串串(推荐百味记)(更地道的火锅预定成功加我(SENSITIVE CONTENTS HIDDEN)再告诉你哦~)★ 交通:<br/>-800米到世纪城地铁E出口,可直达火车南站、天府广场、文殊院等;春熙路、宽窄巷子、锦里武侯祠均可地铁公交轻松达到;<br/><br/>-火车站:<br/>北站(成都站):地铁1号线直达世纪城E出口后步行可到;打车35分钟;<br/>南站:地铁1号线直达世纪城E出口后步行可到;打车20分钟左右;<br/>东站:地铁2号线在天府广场转1号线在世纪城E出口下步行可到,打车约25分钟;<br/><br/>-双流机场:13公里,打车约20分钟;<br/>-公交:“天华路”(PHONE NUMBER HIDDEN)路等</p></section><section><h3 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.1; color: inherit; margin-top: 0.8rem; margin-bottom: 0.2rem; font-size: 0.32rem;\">预订须知</h3><h4 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.1; color: rgb(153, 153, 153); margin-top: 10px; margin-bottom: 10px; font-size: 18px;\">入住时间</h4><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">15:00后（若晚于22:00请联系房东确认)</p><hr/><h4 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.1; color: rgb(153, 153, 153); margin-top: 10px; margin-bottom: 10px; font-size: 18px;\">退房时间</h4><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">12:00前</p></section><p></p><p><br/></p>', '很不错的地方', 'sz001', '2018-04-17 12:45:52');
INSERT INTO `t_minsu` VALUES ('4', '2', '西湖2站路/朝南两室一厅', 'upload/afeb187d-6162-4418-8273-89844a865a47.jpg', '428', '<p>房屋配套设施齐全，有空调、冰箱、洗衣机、电视，还有厨房，可以做饭，可以享受舒适的大床和床垫<br/></p><h4 style=\"margin: 0px; padding: 0px; font-weight: normal; font-size: 16px; line-height: 28px; color: rgb(45, 41, 38);\">交通情况</h4><p class=\"huan\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(46, 45, 43); line-height: 22px;\">地处市中心繁华路段之清静里弄。离西湖一公里，多路公交四通八达. 地铁: 距龙翔桥站(1号线)800米;距中河北路站(2号线)500米,楼下有30路公交车接驳直达地铁口。 多条公交线路通达市区各地 小区各色共享单车 距维景国际大酒店机场巴士200米 公交：庆春路皮市巷（公交站）；浙一医院（公交站）；联桥（公交站）；马市街（公交站）<br/></p><h4 style=\"margin: 0px; padding: 0px; font-weight: normal; font-size: 16px; line-height: 28px; color: rgb(45, 41, 38);\">周边情况</h4><p class=\"huan\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(46, 45, 43); line-height: 22px;\">地处市中心繁华路段之清静里弄，生活购物方便，附近有三甲浙一医院、浙二医院，杭州最大超市总店。 电影院，各大银行 有肯德基、麦当劳等快餐 也有必胜客、川味观等美食<br/></p><h4 style=\"margin: 0px; padding: 0px; font-weight: normal; font-size: 16px; line-height: 28px; color: rgb(45, 41, 38);\">其他</h4><p class=\"huan\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(46, 45, 43); line-height: 22px;\">欢迎大家入住.包含在房费内;<br/>吸烟:允许吸烟<br/>宠物:不允许带宠物<br/>做饭:允许做饭<br/>聚会:允许聚会<br/>加人:允许加人<br/>商业拍摄:不可商业拍摄</p><p><br/></p>', 'test', 'sz002', '2018-04-18 15:55:56');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '民宿网站成立了', '<p>这里你可以注册成为民宿主人，发布的你房屋住宿信息！</p><p>&nbsp; &nbsp; 也可以注册用户，寻找你的异地旅行小窝！</p>', '2018-04-07 21:48:00');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderId` int(11) NOT NULL auto_increment COMMENT '订单id',
  `minsuObj` int(11) NOT NULL COMMENT '预订民宿',
  `userObj` varchar(30) NOT NULL COMMENT '预订用户',
  `liveDate` varchar(20) default NULL COMMENT '入住日期',
  `orderDays` int(11) NOT NULL COMMENT '入住天数',
  `totalPrice` float NOT NULL COMMENT '订单总价',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  `orderState` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '预订时间',
  PRIMARY KEY  (`orderId`),
  KEY `minsuObj` (`minsuObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`minsuObj`) REFERENCES `t_minsu` (`minsuId`),
  CONSTRAINT `t_orderinfo_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('1', '1', 'user1', '2018-04-12', '3', '11', '我下午来哈！', '已付款', '2018-04-07 21:47:34');
INSERT INTO `t_orderinfo` VALUES ('2', '3', 'user1', '2018-04-27', '2', '398', '我和女朋友来这里旅游入住', '已入住', '2018-04-18 16:28:05');

-- ----------------------------
-- Table structure for `t_owner`
-- ----------------------------
DROP TABLE IF EXISTS `t_owner`;
CREATE TABLE `t_owner` (
  `ownerUserName` varchar(30) NOT NULL COMMENT 'ownerUserName',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '宿主姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `ownerPhoto` varchar(60) NOT NULL COMMENT '宿主照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  `shzt` varchar(20) NOT NULL COMMENT '审核状态',
  PRIMARY KEY  (`ownerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_owner
-- ----------------------------
INSERT INTO `t_owner` VALUES ('sz001', '123', '王继军', '男', '2018-04-03', 'upload/bc0ad1d5-c4b0-42cc-869f-84749ba990ce.jpg', '13908928524', '福建福州海阳路10号', '2018-04-07 21:46:54', '已审核');
INSERT INTO `t_owner` VALUES ('sz002', '123', '李马光', '男', '2018-04-11', 'upload/4665bafd-d009-4a22-96d6-ebe16f16f1b3.jpg', '13980930532', '四川攀枝花万明路12号', '2018-04-18 15:46:42', '已审核');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '张萌分', '女', '2018-04-04', 'upload/32d42f00-bda4-4f86-b1d2-338abaa1ddd1.jpg', '13589834234', 'mengfen@163.com', '四川成都红星路13号', '2018-04-07 21:45:58');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '王兆国', '男', '2018-04-17', 'upload/760593f8-48de-4cd0-9881-6e1531afd256.jpg', '13083941398', 'zhaoguo@163.com', '四川成都红星路10号', '2018-04-18 15:47:50');
