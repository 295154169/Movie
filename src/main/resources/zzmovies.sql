/*
 Navicat Premium Data Transfer

 Source Server         : zzmovies
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : zzmovies

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 17/09/2020 16:07:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tab_category
-- ----------------------------
DROP TABLE IF EXISTS `tab_category`;
CREATE TABLE `tab_category`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `AK_nq_categoryname`(`cname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab_category
-- ----------------------------
INSERT INTO `tab_category` VALUES (6, '其他');
INSERT INTO `tab_category` VALUES (2, '动作');
INSERT INTO `tab_category` VALUES (5, '动画');
INSERT INTO `tab_category` VALUES (1, '喜剧');
INSERT INTO `tab_category` VALUES (3, '惊悚');
INSERT INTO `tab_category` VALUES (4, '科幻');

-- ----------------------------
-- Table structure for tab_comment
-- ----------------------------
DROP TABLE IF EXISTS `tab_comment`;
CREATE TABLE `tab_comment`  (
  `mid` int(0) NOT NULL,
  `date` datetime(0) NOT NULL,
  `uid` int(0) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`mid`, `uid`, `date`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `tab_comment_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `tab_movies` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tab_comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `tab_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab_comment
-- ----------------------------
INSERT INTO `tab_comment` VALUES (1, '2020-09-08 02:12:28', 10001, '2');
INSERT INTO `tab_comment` VALUES (1, '2020-09-14 02:10:43', 10001, '1');
INSERT INTO `tab_comment` VALUES (1, '2020-09-17 10:31:55', 10001, '12');
INSERT INTO `tab_comment` VALUES (5, '2020-09-17 09:38:28', 10001, '请发表评论');
INSERT INTO `tab_comment` VALUES (6, '2020-09-17 09:31:24', 10001, '12');

-- ----------------------------
-- Table structure for tab_like
-- ----------------------------
DROP TABLE IF EXISTS `tab_like`;
CREATE TABLE `tab_like`  (
  `mid` int(0) NOT NULL,
  `uid` int(0) NOT NULL,
  PRIMARY KEY (`mid`, `uid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `tab_like_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `tab_movies` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tab_like_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `tab_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab_like
-- ----------------------------
INSERT INTO `tab_like` VALUES (1, 10001);
INSERT INTO `tab_like` VALUES (6, 10001);

-- ----------------------------
-- Table structure for tab_movies
-- ----------------------------
DROP TABLE IF EXISTS `tab_movies`;
CREATE TABLE `tab_movies`  (
  `mid` int(0) NOT NULL,
  `mname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mscore` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cid` int(0) NOT NULL,
  `count` int(0) NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `actor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introduce` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int(0) NOT NULL,
  `bigimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `smallimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `tab_movies` FOREIGN KEY (`cid`) REFERENCES `tab_category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab_movies
-- ----------------------------
INSERT INTO `tab_movies` VALUES (1, '阿甘正传 Forrest Gump', '9.5', 6, 321, '1994-06-23', '美国', '汤姆·汉克斯 / 罗宾·怀特 / 加里·西尼斯 / 麦凯尔泰·威廉逊 / 莎莉·菲尔德', '公汽车站，一位跑鞋破旧但干净的中年人（汤姆·汉克斯 饰）回忆起了自己的第一双鞋。少时的 Forrest Gump（迈克·康纳·汉弗莱 饰）因身体原因必须戴着腿部支架行走，加上智商只有75，入学后免不了被欺负。在同学 Jenny Curran（汉娜·豪尔 饰）的提醒下，Forrest 奔跑起来。奇迹发生了，支架散落后，Forrest 跑得像风一样快。长大后，Forrest 更是将天赋发挥到了极致。他成了橄榄球星、大学毕业生、战争英雄、外交使者、捕虾船长、慈善家。他目睹了战友 Benjamin Buford Blue（梅克尔蒂·威廉森 饰）阵亡，Dan Taylor 中尉（加里·辛尼斯 饰）与上帝和解，母亲（萨莉·菲尔德 饰）病逝。而当夜晚来临，他总会思念 Jenny（罗宾·赖特 饰', 12, 'img/product/bigimg/1_ForrestGump_big.jpg', 'img/product/smallimg/1_ForrestGump_small.jpg', '//player.bilibili.com/player.html?aid=53957995&bvid=BV1z4411W7FY&cid=94513228&page=1');
INSERT INTO `tab_movies` VALUES (2, '楚门的世界', '9.3', 6, 234, '1998-06-05', '美国', ' 金·凯瑞 / 劳拉·琳妮 / 艾德·哈里斯 / 诺亚·艾默里奇 / 娜塔莎·麦克艾霍恩', '楚门（金•凯瑞 Jim Carrey 饰）是一个平凡得不能再平凡的人，除了一些有些稀奇的经历之外——初恋女友突然失踪、溺水身亡的父亲忽然似乎又出现在眼前，他和绝大多数30多岁的美国男人绝无异样。这令他倍感失落。他也曾试过离开自己生活了多年的地方，但总因种种理由而不能成行。', 16, 'img/product/bigimg/2_TheTrumanShow_big.jpg', 'img/product/smallimg/2_TheTrumanShow_small.jpg', '//player.bilibili.com/player.html?aid=16899710&bvid=BV1XW411a7E8&cid=27612996&page=1');
INSERT INTO `tab_movies` VALUES (3, '大话西游之大圣娶亲 西遊記大結局之仙履奇緣', '9.2', 1, 32, '1995-02-04', '中国香港 / 中国大陆', ' 周星驰 / 吴孟达 / 朱茵 / 蔡少芬 / 蓝洁瑛 ', '至尊宝（周星驰 饰）被月光宝盒带回到五百年前，遇见紫霞仙子（朱茵 饰），被对方打上烙印成为对方的人，并发觉自己已变成孙悟空。', 10, 'img/product/bigimg/3_dhxy_big.jpg', 'img/product/smallimg/3_dhxy_small.jpg', '//player.bilibili.com/player.html?aid=32719504&bvid=BV18W411S7EX&cid=57259635&page=1');
INSERT INTO `tab_movies` VALUES (4, '釜山行 부산행', '8.5', 3, 421, '2016-05-13', '韩国', '孔侑 / 郑有美 / 马东锡 / 金秀安 / 金义城 /', '证券公司基金管理人石宇（孔侑 饰）光鲜精干，却也是个重利轻义之徒。妻子为此与之决裂，女儿秀安（金秀安 饰）则对如此自私的父亲越来越失望，决定前往釜山和母亲生活。在秀安生日这天，石宇抽出时间陪伴女儿登上开往釜山的特快列车。而与此同时，城市四处出现了极为可疑的暴动事件。政府极力洗白无法掩盖丧尸肆虐的事实，即便懵然无知的列车乘客也因为不速之客的到来而堕入恐慌绝望的地狱中。开车的刹那，一名感染者冲入车厢，而她很快尸变并对目光所及之处的健康人展开血腥屠杀。未过多久，丧尸便呈几何数爆发性地增长。石宇被迫和幸存者的乘客们在逼仄的空间中奋力求生。', 18, 'img/product/bigimg/4_fsx_big.jpg', 'img/product/smallimg/4_fsx_small.jpg', '//player.bilibili.com/player.html?aid=6382859&bvid=BV1bs411t7p1&cid=10374631&page=1');
INSERT INTO `tab_movies` VALUES (5, '花木兰 Mulan', '4.9', 2, 123, '2020-09-11', '美国 / 中国大陆', '刘亦菲 / 甄子丹 / 巩俐 / 李连杰 / 李截', '迪士尼影业荣誉出品《花木兰》由备受赞誉的电影导演妮基·卡罗执导，将中国传奇战士的史诗故事全新呈现。影片讲述了一位无所畏惧的年轻女子义无反顾为家国而战，成为中国史上最著名的伟大勇士之一。当皇帝下令境内每个家庭必须有一位男丁应召出征，抵御北方来犯者入侵，出身军戎之家的长女花木兰，挺身而出，替病痛缠身的父亲应征入伍。她女扮男装化名“花军”，一路历经磨练，驾驭自己内心的力量，激发真正的潜能。通过这段传奇历程，她将成为一名光荣的勇士，不仅赢得国家的认可，更博得父亲的骄傲。', 12, 'img/product/bigimg/5_hml_big.jpg', 'img/product/smallimg/5_hml_small.jpg', '//player.bilibili.com/player.html?aid=78185056&bvid=BV1pJ411i76B&cid=133775162&page=1');
INSERT INTO `tab_movies` VALUES (6, '你的名字。 君の名は。 Mulan', '8.4', 5, 120, '2016-12-02', '日本', ' 神木隆之介 / 上白石萌音 / 长泽雅美 / 市原悦子 / 成田凌', '在远离大都会的小山村，住着巫女世家出身的高中女孩宫水三叶（上白石萌音 配音）。校园和家庭的原因本就让她充满烦恼，而近一段时间发生的奇怪事件，又让三叶摸不清头脑。不知从何时起，三叶在梦中就会变成一个住在东京的高中男孩。那里有陌生的同学和朋友，有亲切的前辈和繁华的街道，一切都是如此诱人而真实。另一方面，住在东京的高中男孩立花泷（神木隆之介 配音）则总在梦里来到陌生的小山村，以女孩子的身份过着全新的生活。许是受那颗神秘彗星的影响，立花和三叶在梦中交换了身份。他们以他者的角度体验着对方的人生，这期间有愤怒、有欢笑也有暖心。只是两人并不知道，身份交换的背后隐藏着重大而锥心的秘密……', 12, 'img/product/bigimg/6_ndmz_big.jpg', 'img/product/smallimg/6_ndmz_small.jpg', '//player.bilibili.com/player.html?aid=13245202&bvid=BV1dx411n7eT&cid=22384912&page=1');
INSERT INTO `tab_movies` VALUES (7, '泰坦尼克号 Titanic', '9.4', 2, 100, '1997-12-19', '美国', ' 莱昂纳多·迪卡普里奥 / 凯特·温丝莱特 / 比利·赞恩 / 凯西·贝茨 / 弗兰西丝·费舍 ', '1912年4月10日，号称 “世界工业史上的奇迹”的豪华客轮泰坦尼克号开始了自己的处女航，从英国的南安普顿出发驶往美国纽约。富家少女罗丝（凯特•温丝莱特）与母亲及未婚夫卡尔坐上了头等舱；另一边，放荡不羁的少年画家杰克（莱昂纳多·迪卡普里奥）也在码头的一场赌博中赢得了下等舱的船票。', 16, 'img/product/bigimg/7_titanic_big.jpg', 'img/product/smallimg/7_titanic_small.jpg', '//player.bilibili.com/player.html?aid=23771695&bvid=BV1sp411o7nn&cid=39739064&page=1');
INSERT INTO `tab_movies` VALUES (8, '我不是药神', '9.0', 1, 56, '2018-07-05', '中国大陆', '徐峥 / 王传君 / 周一围 / 谭卓 / 章宇 ', '普通中年男子程勇（徐峥 饰）经营着一家保健品店，失意又失婚。不速之客吕受益（王传君 饰）的到来，让他开辟了一条去印度买药做“代购”的新事业，虽然困难重重，但他在这条“买药之路”上发现了商机，一发不可收拾地做起了治疗慢粒白血病的印度仿制药独家代理商。赚钱的同时，他也认识了几个病患及家属，为救女儿被迫做舞女的思慧（谭卓 饰）、说一口流利“神父腔”英语的刘牧师（杨新鸣 饰），以及脾气暴烈的“黄毛”（章宇 饰），几个人合伙做起了生意，利润倍增的同时也危机四伏。程勇昔日的小舅子曹警官（周一围 饰）奉命调查仿制药的源头，假药贩子张长林（王砚辉 饰）和瑞士正牌医药代表（李乃文 饰）也对其虎视眈眈，生意逐渐变成了一场关于救赎的拉锯战。', 12, 'img/product/bigimg/8_wbsys_big.jpg', 'img/product/smallimg/8_wbsys_small.jpg', '//player.bilibili.com/player.html?aid=752522982&bvid=BV1Sk4y1d7Eu&cid=172007366&page=1');
INSERT INTO `tab_movies` VALUES (9, '星际穿越 Interstellar Mulan', '9.3', 4, 166, '2014-11-07', '美国 / 英国 / 加拿大 / 冰岛', '马修·麦康纳 / 安妮·海瑟薇 / 杰西卡·查斯坦 / 麦肯吉·弗依 / 卡西·阿弗莱克 ', '近未来的地球黄沙遍野，小麦、秋葵等基础农作物相继因枯萎病灭绝，人类不再像从前那样仰望星空，放纵想象力和灵感的迸发，而是每日在沙尘暴的肆虐下倒数着所剩不多的光景。在家务农的前NASA宇航员库珀（马修·麦康纳 Matthew McConaughey 饰）接连在女儿墨菲（麦肯吉·弗依 Mackenzie Foy 饰）的书房发现奇怪的重力场现象，随即得知在某个未知区域内前NASA成员仍秘密进行一个拯救人类的计划。多年以前土星附近出现神秘虫洞，NASA借机将数名宇航员派遣到遥远的星系寻找适合居住的星球。在布兰德教授（迈克尔·凯恩 Michael Caine 饰）的劝说下，库珀忍痛告别了女儿，和其他三名专家教授女儿艾米莉亚·布兰德（安妮·海瑟薇 Anne Hathaway 饰）、罗米利（大卫·吉雅西 David Gyasi 饰）、多伊尔（韦斯·本特利 Wes Bentley 饰）搭乘宇宙飞船前往目前已知的最有希望的三颗星球考察。', 18, 'img/product/bigimg/9_Interstellar_big.jpg', 'img/product/smallimg/9_Interstellar_small.jpg', '//player.bilibili.com/player.html?aid=38334623&bvid=BV1pt411e7gj&cid=67380030&page=1');
INSERT INTO `tab_movies` VALUES (10, '忠犬八公的故事 Hachi: A Dog s Tale', '9.4', 6, 44, '2009-06-13', '美国 / 英国', '理查·基尔 / 萨拉·罗默尔 / 琼·艾伦 / 罗比·萨布莱特 / 艾瑞克·阿瓦利 /', '八公（Forest 饰）是一条谜一样的犬，因为没有人知道它从哪里来。教授帕克（理查·基尔 Richard Gere 饰）在小镇的火车站拣到一只走失的小狗，冥冥中似乎注定小狗和帕克教授有着某种缘分，帕克一抱起这只小狗就再也放不下来，最终，帕克对小狗八公的疼爱感化了起初极力反对养狗的妻子卡特（琼·艾伦 Joan Allen 饰）。八公在帕克的呵护下慢慢长大，帕克上班时八公会一直把他送到车站，下班时八公也会早早便爬在车站等候，八公的忠诚让小镇的人家对它更加疼爱。有一天，八公在帕克要上班时表现异常，居然玩起了以往从来不会的捡球游戏，八公的表现让帕克非常满意，可是就是在那天，帕克因病去世。帕克的妻子、女儿安迪（萨拉·罗默尔 Sarah Roemer 饰）及女婿迈克尔（罗比·萨布莱特 Robbie Sublett 饰）怀着无比沉痛的心情埋葬了帕克，可是不明就里的八公却依然每天傍晚五点准时守候在小站的门前，等待着主人归来……', 12, 'img/product/bigimg/10_zqbgdgs_big.jpg', 'img/product/smallimg/10_zqbgdgs_small.jpg', '//player.bilibili.com/player.html?aid=10836390&bvid=BV1ix411Y7pN&cid=17889388&page=1');
INSERT INTO `tab_movies` VALUES (11, '这个杀手不太冷 Léon', '9.4', 2, 56, '1994-09-14', '法国 / 美国', '让·雷诺 / 娜塔莉·波特曼 / 加里·奥德曼 / 丹尼·爱罗 / 彼得·阿佩尔 /', '里昂（让·雷诺饰）是名孤独的职业杀手，受人雇佣。一天，邻居家小姑娘马蒂尔达（纳塔丽·波特曼饰)敲开他的房门，要求在他那里暂避杀身之祸。原来邻居家的主人是警方缉毒组的眼线，只因贪污了一小包毒品而遭恶警（加里·奥德曼饰）杀害全家的惩罚。马蒂尔达得到里昂的留救，幸免于难，并留在里昂那里。里昂教小女孩使枪，她教里昂法文，两人关系日趋亲密，相处融洽。', 13, 'img/product/bigimg/11_leon_big.jpg', 'img/product/smallimg/11_leon_small.jpg', '//player.bilibili.com/player.html?aid=5632288&bvid=BV14s411C7Dk&cid=9147269&page=1');
INSERT INTO `tab_movies` VALUES (12, '千与千寻 千と千尋の神隠し', '9.4', 5, 109, '2001-07-20', '日本', ' 柊瑠美 / 入野自由 / 夏木真理 / 菅原文太 / 中村彰男 /', '千寻和爸爸妈妈一同驱车前往新家，在郊外的小路上不慎进入了神秘的隧道——他们去到了另外一个诡异世界—一个中世纪的小镇。远处飘来食物的香味，爸爸妈妈大快朵颐，孰料之后变成了猪！这时小镇上渐渐来了许多样子古怪、半透明的人。', 12, 'img/product/bigimg/12_qyqx_big.jpg', 'img/product/smallimg/12_qyqx_small.jpg', '//player.bilibili.com/player.html?aid=55571607&bvid=BV1A4411N7Kb&cid=97160161&page=1');
INSERT INTO `tab_movies` VALUES (13, '辛德勒的名单 Schindler s List', '9.5', 6, 142, '1993-11-30', '美国', '连姆·尼森 / 本·金斯利 / 拉尔夫·费因斯 / 卡罗琳·古多尔 / 乔纳森·萨加尔 ', '1939年，波兰在纳粹德国的统治下，党卫军对犹太人进行了隔离统治。德国商人奥斯卡·辛德勒（连姆·尼森 Liam Neeson 饰）来到德军统治下的克拉科夫，开设了一间搪瓷厂，生产军需用品。凭着出众的社交能力和大量的金钱，辛德勒和德军建立了良好的关系，他的工厂雇用犹太人工作，大发战争财。', 16, 'img/product/bigimg/13_SchindlersList_big.jpg', 'img/product/smallimg/13_SchindlersList_small.jpg', '//player.bilibili.com/player.html?aid=5649669&bvid=BV1ks411C7uF&cid=9174916&page=1');
INSERT INTO `tab_movies` VALUES (14, '肖申克的救赎 The Shawshank Redemption', '9.7', 6, 32, '1994-09-10', '美国', '蒂姆·罗宾斯 / 摩根·弗里曼 / 鲍勃·冈顿 / 威廉姆·赛德勒 / 克兰西·布朗', '20世纪40年代末，小有成就的青年银行家安迪（蒂姆·罗宾斯 Tim Robbins 饰）因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为鲨堡的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德（摩根·弗 里曼 Morgan Freeman 饰），请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯人中间也渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进。而关于其罪行的真相，似乎更使这一切朝前推进了一步……', 16, 'img/product/bigimg/14_TheShawshankRedemption_big.jpg', 'img/product/smallimg/14_TheShawshankRedemption_small.jpg', '//player.bilibili.com/player.html?aid=5414334&bvid=BV1us41117yA&cid=8801210&page=1');
INSERT INTO `tab_movies` VALUES (15, '盗梦空间 Inception', '9.3', 4, 23, '2010-09-01', '美国 / 英国', '莱昂纳多·迪卡普里奥 / 约瑟夫·高登-莱维特 / 艾伦·佩吉 / 汤姆·哈迪 ', '道姆·柯布（莱昂纳多·迪卡普里奥 Leonardo DiCaprio 饰）与同事阿瑟（约瑟夫·戈登-莱维特 Joseph Gordon-Levitt 饰）和纳什（卢卡斯·哈斯 Lukas Haas 饰）在一次针对日本能源大亨齐藤（渡边谦 饰）的盗梦行动中失败，反被齐藤利用。齐藤威逼利诱因遭通缉而流亡海外的柯布帮他拆分他竞争对手的公司，采取极端措施在其唯一继承人罗伯特·费希尔（希里安·墨菲 Cillian Murphy 饰）的深层潜意识中种下放弃家族公司、自立门户的想法。为了重返美国，柯布偷偷求助于岳父迈尔斯（迈克尔·凯恩 Michael Caine 饰），吸收了年轻的梦境设计师艾里阿德妮（艾伦·佩吉 Ellen Page 饰）、梦境演员艾姆斯（汤姆·哈迪 Tom Hardy 饰）和药剂师约瑟夫（迪利普·劳 Dileep Rao 饰）加入行动。在一层层递进的梦境中，柯布不仅要对付费希尔潜意识的本能反抗，还必须直面已逝妻子梅尔（玛丽昂·歌迪亚 Marion Cotillard 饰）的处处破坏，实际情况远比预想危险得多…… ', 16, 'img/product/bigimg/15_Inception _big.jpg', 'img/product/smallimg/15_Inception_small.jpg', '//player.bilibili.com/player.html?aid=31578258&bvid=BV1qW411C7Da&cid=55217239&page=1');
INSERT INTO `tab_movies` VALUES (16, '疯狂动物城 Zootopia', '9.2', 5, 203, '2016-03-04', '美国', '金妮弗·古德温 / 杰森·贝特曼 / 伊德里斯·艾尔巴 / 珍妮·斯蕾特 / 内特·托伦斯 /', '故事发生在一个所有哺乳类动物和谐共存的美好世界中，兔子朱迪（金妮弗·古德温 Ginnifer Goodwin 配音）从小就梦想着能够成为一名惩恶扬善的刑警，凭借着智慧和努力，朱迪成功的从警校中毕业进入了疯狂动物城警察局，殊不知这里是大型肉食类动物的领地，作为第一只，也是唯一的小型食草类动物，朱迪会遇到怎样的故事呢？', 12, 'img/product/bigimg/16_Zootopia_big.jpg', 'img/product/smallimg/16_Zootopia_small.jpg', '//player.bilibili.com/player.html?aid=70801250&bvid=BV1HE411o7p7&cid=122666907&page=1');
INSERT INTO `tab_movies` VALUES (17, '树上有个好地方 ', '7.9', 1, 40, '2019-10-09', '中国大陆', '杜旭光 / 刘盼 / 张新锋 / 马银秀 / 许小周 /', '本故事讲述的是上世纪90年代末发生在陕西关中农村的童年故事。在以成绩高低作为评判学生好坏的环境中，小学生巴王超过在老师与家长的眼中是那种不学无术的“渣滓”。得不到家长和老师认同的巴王超过，将田野里一棵可以栖息的大树变成了自己的“好地方”，并将所有“好玩”的东西都藏在了那棵大树的上面。孩子的天性，让巴王超过与成人世界充满了斗争，直到有一天，他的处境因为前来支教的粉提老师而改变了！粉提老师让他负责班级里的图书管理员，同时他也与女老师成了好朋友，他的“好地方”也成了女老师的“好地方”。然而好景不长，他在粉提老师面前特殊的待遇，又因为粉提老师的男朋友的到来而改变了……', 12, 'img/product/bigimg/17_ssyghdf_big.jpg', 'img/product/smallimg/17_ssyghdf_small.jpg', '//player.bilibili.com/player.html?aid=457100903&bvid=BV1Q5411b7sP&cid=233624417&page=1');
INSERT INTO `tab_movies` VALUES (18, '#活着 #살아있다', '5.6', 3, 30, '2020-06-24', '韩国', '刘亚仁 / 朴信惠', '讲述突然被不明病毒感染，并失控扩散的城市中，被孤立的幸存者身上发生的故事。刘亚仁将在片中饰演因与世隔绝而幸存的游戏玩家俊宇一角，朴信惠饰演直面极端情况，寻找新的生存方式的幸存者宥彬一角。', 12, 'img/product/bigimg/18_alive_big.jpg', 'img/product/smallimg/18_alive_small.jpg', '//player.bilibili.com/player.html?aid=329103714&bvid=BV1hA411Y7tX&cid=217869759&page=1');
INSERT INTO `tab_movies` VALUES (19, '七宗罪 Se7en', '8.8', 3, 58, '1995-09-22', '美国', ' 摩根·弗里曼 / 布拉德·皮特 / 凯文·史派西 / 格温妮斯·帕特洛 / 安德鲁·凯文·沃克 /', '“暴食”、“贪婪”、“懒惰”、“嫉妒”、“骄傲”、“淫欲”、“愤怒”，这是天主教教义所指的人性七宗罪。城市中发生的连坏杀人案，死者恰好都是犯有这些教义的人。凶手故弄玄虚的作案手法，令资深冷静的警员沙摩塞（摩根•弗里曼 Morgan Freeman 饰）和血气方刚的新扎警员米尔斯（布拉德•皮特 Brad Pitt 饰）都陷入了破案的谜团中。他们去图书馆研读但丁的《神曲》，企图从人间地狱的描绘中找到线索，最后从宗教文学哲学的世界中找到了凶手作案计划和手段的蛛丝马迹。凶手前来投案自首，这令众人都松了一口气，以为案件就此结束，怎料还是逃不出七宗罪的杀人逻辑，这次凶手瞄准的目标，是那个犯了“愤怒”罪的人……', 18, 'img/product/bigimg/19_se7en_big.jpg', 'img/product/smallimg/19_se7en_small.jpg', '//player.bilibili.com/player.html?aid=15628404&bvid=BV1mx411M7Y6&cid=25425944&page=1');
INSERT INTO `tab_movies` VALUES (20, '看不见的客人 Contratiempo', '8.8', 3, 100, '2016-09-23', '西班牙', '马里奥·卡萨斯 / 阿娜·瓦格纳 / 何塞·科罗纳多 / 巴巴拉·莱涅 / 弗兰塞斯克·奥雷利亚 /', '艾德里安（马里奥·卡萨斯 Mario Casas 饰）经营着一间科技公司，事业蒸蒸日上，家中有美丽贤惠的妻子和活泼可爱的女儿，事业家庭双丰收的他是旁人羡慕的对象。然而，野心勃勃的艾德里安并未珍惜眼前来之不易的生活，一直以来，他和一位名叫劳拉（芭芭拉·蓝妮 Bárbara Lennie 饰）的女摄影师保持着肉体关系。', 18, 'img/product/bigimg/20_Contratiempo_big.jpg', 'img/product/smallimg/20_Contratiempo_small.jpg', '//player.bilibili.com/player.html?aid=25480788&bvid=BV1gs411L7Jc&cid=43362909&page=1');
INSERT INTO `tab_movies` VALUES (21, '信条 Tenet', '7.8', 4, 261, '2020-09-04', '美国 / 英国', '约翰·大卫·华盛顿 / 罗伯特·帕丁森 / 伊丽莎白·德比茨基 / 肯尼思·布拉纳 / 亚伦·泰勒-约翰逊 ', '世界存亡危在旦夕，“信条”一词是唯一的线索与武器。主人公穿梭于全球各地，开展特工活动，力求揭示“信条”之谜，并完成一项超越了真实时间的神秘任务。这项任务并非时间之旅，而是【时空逆转】。 ', 18, 'img/product/smallimg/21_tenet_big.jpg', 'img/product/smallimg/21_tenet_small.jpg', '//player.bilibili.com/player.html?aid=541867115&bvid=BV1ni4y1M7R5&cid=227597152&page=1');
INSERT INTO `tab_movies` VALUES (22, '西虹市首富', '6.6', 1, 384, '2018-07-27', '中国大陆', '沈腾 / 宋芸桦 / 张一鸣 / 张晨光 / 常远 ', '西虹市丙级球队大翔队的守门员王多鱼（沈腾 饰）因比赛失利被教练开除，一筹莫展之际王多鱼突然收到神秘人士金老板（张晨光 饰）的邀请，被告知自己竟然是保险大亨王老太爷（李立群 饰）的唯一继承人，遗产高达百亿！但是王老太爷给出了一个非常奇葩的条件，那就是要求王多鱼在一个月内花光十亿，还不能告诉身边人，否则失去继承权。王多鱼毫不犹豫签下了“军令状”，与好友庄强（张一鸣 饰）以及财务夏竹（宋芸桦 饰）一起开启了“挥金之旅”，即将成为西虹市首富的王多鱼，第一次感受到了做富人的快乐，同时也发现想要挥金如土实在没有那么简单！', 12, 'img/product/smallimg/22_big.jpg', 'img/product/smallimg/22_small.jpg', '//player.bilibili.com/player.html?aid=90976051&bvid=BV1Lj411f7Mn&cid=155354087&page=1');
INSERT INTO `tab_movies` VALUES (23, '三傻大闹宝莱坞 3 Idiots', '9.2', 1, 240, '2011-12-08', '印度', '阿米尔·汗 / 卡琳娜·卡普尔 / 马达范 / 沙尔曼·乔希 / 奥米·瓦依达', '本片根据印度畅销书作家奇坦·巴哈特（Chetan Bhagat）的处女作小说《五点人》（Five Point Someone）改编而成。法兰（马德哈万 R Madhavan 饰）、拉杜（沙曼·乔希 Sharman Joshi 饰）与兰乔（阿米尔·汗 Aamir Khan 饰）是皇家工程学院的学生，三人共居一室，结为好友。在以严格著称的学院里，兰乔是个非常与众不同的学生，他不死记硬背，甚至还公然顶撞校长“病毒”（波曼·伊拉尼 Boman Irani 饰），质疑他的教学方法。他不仅鼓动法兰与拉杜去勇敢追寻理想，还劝说校长的二女儿碧雅（卡琳娜·卡普 Kareena Kapoor 饰）离开满眼铜臭的未婚夫。兰乔的特立独行引起了模范学生“消音器”（奥米·维嘉 Omi Vaidya 饰）的不满，他约定十年后再与兰乔一决高下，看哪种生活方式更能取得成功。', 12, 'img/product/smallimg/23_big.jpg', 'img/product/smallimg/23_small.jpg', '//player.bilibili.com/player.html?aid=28678678&bvid=BV15s411g78X&cid=49670027&page=1');
INSERT INTO `tab_movies` VALUES (24, '怦然心动 Flipped', '9.1', 1, 120, ' 2010-07-26', '美国', '玛德琳·卡罗尔 / 卡兰·麦克奥利菲 / 瑞贝卡·德·莫妮 / 安东尼·爱德华兹 / 约翰·马奥尼', '布莱斯（卡兰•麦克奥利菲 Callan McAuliffe 饰）全家搬到小镇，邻家女孩朱丽（玛德琳•卡罗尔 Madeline Carroll 饰）前来帮忙。她对他一见钟情，心愿是获得他的吻。两人是同班同学，她一直想方设法接近他，但是他避之不及。她喜欢爬在高高的梧桐树上看风景。但因为施工，树被要被砍掉，她誓死捍卫，希望他并肩作战，但是他退缩了。她的事迹上了报纸，外公对她颇有好感，令他十分困惑。她凭借鸡下蛋的项目获得了科技展第一名，成了全场焦点，令他黯然失色。她把自家鸡蛋送给他，他听家人怀疑她家鸡蛋不卫生，便偷偷把鸡蛋丢掉。她得知真相，很伤心，两人关系跌入冰点。她跟家人诉说，引发争吵。原来父亲一直攒钱照顾傻弟弟，所以生活拮据。她理解了父母，自己动手，还得到了他外公的鼎力相助。他向她道歉，但是并未解决问题。他开始关注她。鸡蛋风波未平，家庭晚宴与午餐男孩评选又把两人扯在了一起', 18, 'img/product/smallimg/24_big.jpg', 'img/product/smallimg/24_small.jpg', '//player.bilibili.com/player.html?aid=15361957&bvid=BV1Tx411g72S&cid=25004188&page=1');
INSERT INTO `tab_movies` VALUES (25, '绿皮书 Green Book', '8.9', 1, 249, '2018-11-16', '美国', ' 维果·莫腾森 / 马赫沙拉·阿里 / 琳达·卡德里尼 / 塞巴斯蒂安·马尼斯科 / 迪米特·D·马里诺夫', '托尼（维果·莫腾森 Viggo Mortensen 饰）是一个吊儿郎当游手好闲的混混，在一家夜总会做侍者。这间夜总会因故要停业几个月，可托尼所要支付的房租和生活费不会因此取消，所以他的当务之急是去寻找另一份工作来填补这几个月的空缺。在这个节骨眼上，一位名叫唐雪莉（马赫沙拉·阿里 Mahershala Ali 饰）的黑人钢琴家提出雇佣托尼。 ', 18, 'img/product/smallimg/25_big.jpg', 'img/product/smallimg/25_small.jpg', '//player.bilibili.com/player.html?aid=49775530&bvid=BV1Hb411L7dk&cid=87151578&page=1');
INSERT INTO `tab_movies` VALUES (26, '唐人街探案2', '6.7', 1, 231, '2018-02-16', '中国大陆', '王宝强 / 刘昊然 / 肖央 / 刘承羽 / 尚语贤 ', '唐仁（王宝强 饰）为巨额奖金欺骗秦风（刘昊然 饰）到纽约参加世界名侦探大赛，然而随着和世界各国侦探们啼笑皆非的较量，两人却发现了隐藏在这次挑战背后的更大秘密... ', 18, 'img/product/smallimg/26_big.jpg', 'img/product/smallimg/26_small.jpg', '//player.bilibili.com/player.html?aid=18965235&bvid=BV1FW411H7Lg&cid=30932060&page=1');
INSERT INTO `tab_movies` VALUES (27, '飞驰人生', '6.9', 1, 76, '2019-02-05', '中国大陆', '沈腾 / 黄景瑜 / 尹正 / 张本煜 / 尹昉', '曾经叱咤风云的拉力赛车手张驰（沈腾 饰），五年前因私自赛车而被禁赛。从天堂跌落谷底，张驰饱尝生活的艰辛。他忍辱负重，洗心革面，终于争取到了解禁的判决。在此之后，他重新找到亲如兄弟的领航员孙宇强（尹正 饰），决心共同冲击本年度的巴音布鲁克拉力赛。然而在此之前，张驰必须重考驾照，改装赛车，拉到赞助。每一步都充满艰难，他忍受着旁人的奚落嘲讽，忍受着现实的冰冷残酷，无论如何都不改变前进的目标。当他好不容易走到了赛场，还将面对禁赛这几年崛起的新秀林臻东（黄景瑜 饰）的挑战。 ', 12, 'img/product/smallimg/27_big.jpg', 'img/product/smallimg/27_small.jpg', '//player.bilibili.com/player.html?aid=39715858&bvid=BV1dt411B7Ti&cid=69770468&page=1');
INSERT INTO `tab_movies` VALUES (28, '美丽人生 La vita è bella', '9.5', 1, 105, '2020-01-03', '意大利', '罗伯托·贝尼尼 / 尼可莱塔·布拉斯基 / 乔治·坎塔里尼 / 朱斯蒂诺·杜拉诺 / 赛尔乔·比尼·布斯特里克 ', '犹太青年圭多（罗伯托·贝尼尼）邂逅美丽的女教师多拉（尼可莱塔·布拉斯基），他彬彬有礼的向多拉鞠躬：“早安！公主！”。历经诸多令人啼笑皆非的周折后，天遂人愿，两人幸福美满的生活在一起。 ', 16, 'img/product/smallimg/28_big.jpg', 'img/product/smallimg/28_small.jpg', '//player.bilibili.com/player.html?aid=81311552&bvid=BV19J41187BD&cid=139151527&page=1');
INSERT INTO `tab_movies` VALUES (29, '初恋这件小事', '8.4', 1, 125, '2012-06-05', '泰国', '平采娜·乐维瑟派布恩 / 马里奥·毛瑞尔 / 苏达拉·布查蓬 / 雅尼卡·桑普蕾舞 / 诺特·阿查拉那·阿瑞亚卫考', '初中生小水相貌平平，家境一般，所以在学校里并不受重视。但是她心地善良，又有一群死党，日子过得倒也开心。某天，她遇见了帅气的学长阿亮（马里奥·毛瑞尔 Mario Maurer 饰），春心萌动，无 法遏制。她喜欢看他踢足球，看他拍照，如痴如狂。上英语课时，她不停地给死党传纸条 表达对阿亮的爱慕。然而，英语老师则指出她除了英语一无是处。回到家，叔叔从美国捎来了父亲的消息，说如果她能考全校第一，就可以去美国。于是，她按下决心要努力加油。某天，小水等人在买饮料时，碰到篮球队员蛮横插队。阿亮挺身而出，为她们教训了对方，并挨了校长的责骂。小水也第一次听说，阿亮的父亲因为射失点球而退役的事情，理解了他心中的隐痛。由于舞蹈队是给美女准备的，所以小水等一干姐妹准备在话剧社大展身手，没想到学长也来到这个社团。两人还扮演王子公主，他们的恋情会由此展开么？', 12, 'img/product/smallimg/29_big.jpg', 'img/product/smallimg/29_small.jpg', '//player.bilibili.com/player.html?aid=30183458&bvid=BV1KW411D7aA&cid=52630789&page=1');
INSERT INTO `tab_movies` VALUES (30, '喜剧之王', '8.7', 1, 241, '1999-02-13', '中国香港', '周星驰 / 张柏芝 / 莫文蔚 / 吴孟达 / 林子善', '尹天仇（周星驰 饰）一直醉心戏剧，想成为一名演员，平时除了做跑龙套以外，还会在街坊福利会里开设演员训练班。此时舞小姐柳飘飘在妈妈桑的带领下来到这里要求学做戏，原来柳飘飘有一段非常不愉快的经历，在尹天仇对她指导的过程中，柳飘飘对尹天仇渐生情愫，同时她也成为了夜总会里当红的小姐。尹天仇受到了极多白眼之后，终于得到了大明星鹃姐（莫文蔚 饰）的赏识，提携他担演新戏中的男主角，但没想到突然把他的角色换掉了，令他失望不已。在片场当场务的卧底警员（吴孟达 饰）身份被识穿，尹天仇阴差阳错的帮忙破了案。之后尹天仇继续活跃在街坊福利会的演员训练班里。', 12, 'img/product/smallimg/30_big.jpg', 'img/product/smallimg/30_small.jpg', '//player.bilibili.com/player.html?aid=28070187&bvid=BV1is411c7Wz&cid=48504820&page=1');
INSERT INTO `tab_movies` VALUES (31, '罗马假日 Roman Holiday', '9.0', 1, 154, '1953-08-20', '美国', '奥黛丽·赫本 / 格利高里·派克 / 埃迪·艾伯特 / 哈特利·鲍尔 / 哈考特·威廉姆斯', '欧洲某国的安妮公主（奥黛丽·赫本 Audrey Hepburn 饰）到访罗马，国务烦身，但她又厌倦繁文缛节。一天晚上，身心俱疲的她偷偷来到民间欣赏夜景，巧遇报社记者乔（格里高利·派克 Gregory Peck 饰）。二人把手同游，相当快乐。公主更是到乔的家中作客并在那过夜。 ', 12, 'img/product/smallimg/31_big.jpg', 'img/product/smallimg/31_small.jpg', '//player.bilibili.com/player.html?aid=15332350&bvid=BV1fx411u7ai&cid=24957813&page=1');
INSERT INTO `tab_movies` VALUES (32, '蝙蝠侠：黑暗骑士 The Dark Knight', '9.2', 3, 102, '2008-07-14', '美国', '克里斯蒂安·贝尔 / 希斯·莱杰 / 艾伦·艾克哈特 / 迈克尔·凯恩 / 玛吉·吉伦哈尔', '从亲眼目睹父母被人杀死的阴影中走出来的“蝙蝠侠”，经历了成长之后，已经不再是那个桀骜不的孤单英雄了。在警官吉姆·戈登和检查官哈维·登特的通力帮助下，“蝙蝠侠”无后顾之忧地继续满世界的奔波，与日益增长起来的犯罪威胁做着永无休止的争斗，而他所在的高谭市，也是进展最为明显的地方，犯罪率以一种惊人的速度持续下降着，毕竟对方是能够上天入地的“蝙蝠侠”，不借两个胆子谁还敢造次呢？不过像高谭这种科技与污秽并存的城市，平静是不可能维持太久的，果不其然，新一轮的混乱很快就席卷了整个城市，人们再一被被恐慌所笼罩着，而声称愿意为这一切负责的，自然就是所有混乱的源头以及支配者--“小丑”了。 ', 18, 'img/product/smallimg/32_big.jpg', 'img/product/smallimg/32_small.jpg', '//player.bilibili.com/player.html?aid=33537890&bvid=BV12W41117FH&cid=58715922&page=1');
INSERT INTO `tab_movies` VALUES (33, '蝴蝶效应 The Butterfly Effect', '8.8', 3, 42, '2004-01-23', '美国', '阿什顿·库彻 / 梅洛拉·沃尔特斯 /艾米·斯马特 / 埃尔登·汉森 / 威廉姆·李·斯科特 ', '伊万（艾什顿·库奇 Ashton Kutcher 饰）曾经有一个糟糕的童年，因为他行为闯下了大祸，令他童年充满不堪回忆的往事。而事实上，他确实只是依稀记得一点可怕的情景，这些情景一直纠缠着他的正常生活。伊万接受心理学家建议，把琐碎生活记在记事本里，却偶然发现通过记事本回到过去。 ', 18, 'img/product/smallimg/33_big.jpg', 'img/product/smallimg/33_small.jpg', '//player.bilibili.com/player.html?aid=30767359&bvid=BV1jW411f7CM&cid=53714397&page=1');
INSERT INTO `tab_movies` VALUES (34, '调音师 Andhadhun', '8.3', 3, 146, '2019-04-03', '印度', '阿尤斯曼·库拉纳 / 塔布 / 拉迪卡·艾普特 / 安尔·德霍万 / 马纳夫·维吉', '双目失明的钢琴家阿卡什（阿尤斯曼·库拉纳 Ayushmann Khurrana 饰）为了参加国际大赛，平日里通过私人授课赚取经费。事实上他的眼睛完全正常，只不过希望通过这种方式感受不同的生活。因为一场意外，阿卡什结识了美丽的姑娘苏菲（拉迪卡·艾普特 Radhika Apte 饰）。凭借出色的演奏技巧，阿卡什在苏菲父亲经营的西餐馆谋得兼职。他的演奏不仅令食客们倾倒，更虏获了苏菲的心。某天，阿卡什接受过气的影星普拉默（安尔·德霍万 Anil Dhawan 饰）的邀请，登门为对方的妻子西米（塔布 Tabu 饰）演奏庆生，谁知却亲眼目睹了倒在血泊中的普拉默的尸体。惊慌失措的阿卡什假装镇定，虽然暂时骗过了西米及其情夫，但是他的秘密还是慢慢被人戳穿…… ', 18, 'img/product/smallimg/34_big.jpg', 'img/product/smallimg/34_small.jpg', '//player.bilibili.com/player.html?aid=57075009&bvid=BV1qx411d7on&cid=99676253&page=1');
INSERT INTO `tab_movies` VALUES (35, '阿凡达 Avatar', '8.7', 3, 150, '2010-01-04', '美国', '萨姆·沃辛顿 / 佐伊·索尔达娜 / 西格妮·韦弗 / 史蒂芬·朗 / 米歇尔·罗德里格兹', '战斗中负伤而下身瘫痪的前海军战士杰克•萨利（萨姆•沃辛顿 Sam Worthington 饰）决定替死去的同胞哥哥来到潘多拉星操纵格蕾丝博士（西格妮•韦弗 Sigourney Weaver 饰）用人类基因与当地纳美部族基因结合创造出的 “阿凡达” 混血生物。杰克的目的是打入纳美部落，外交说服他们自愿离开世代居住的家园，从而SecFor公司可砍伐殆尽该地区的原始森林，开采地下昂贵的“不可得”矿。在探索潘多拉星的过程中，杰克遇到了纳美部落的公主娜蒂瑞（佐伊•索尔达娜 Zoe Saldana 饰），向她学习了纳美人的生存技能与对待自然的态度。与此同时，SecFor公司的经理和军方代表上校迈尔斯（史蒂芬•朗 Stephen Lang 饰）逐渐丧失耐心，决定诉诸武力驱赶纳美人', 12, 'img/product/smallimg/35_big.jpg', 'img/product/smallimg/35_small.jpg', '//player.bilibili.com/player.html?aid=29330824&bvid=BV13s411M7f8&cid=50953656&page=1\"');
INSERT INTO `tab_movies` VALUES (36, '头号玩家 Ready Player One', '8.6', 3, 142, '2018-03-30', '美国', '泰伊·谢里丹 / 奥利维亚·库克 / 本·门德尔森 / 马克·里朗斯 / 丽娜·维特', '故事发生在2045年，虚拟现实技术已经渗透到了人类生活的每一个角落。詹姆斯哈利迪（马克·里朗斯 Mark Rylance 饰）一手建造了名为“绿洲”的虚拟现实游戏世界，临终前，他宣布自己在游戏中设置了一个彩蛋，找到这枚彩蛋的人即可成为绿洲的继承人。要找到这枚彩蛋，必须先获得三把钥匙，而寻找钥匙的线索就隐藏在詹姆斯的过往之中。 ', 12, 'img/product/smallimg/36_big.jpg', 'img/product/smallimg/36_small.jpg', '//player.bilibili.com/player.html?aid=20852737&bvid=BV12W411p7zg&cid=34160777&page=1');
INSERT INTO `tab_movies` VALUES (37, '无双', '8.1', 3, 255, '2018-09-30', '中国大陆', '周润发 / 郭富城 / 张静初 / 冯文娟 / 廖启智', '身陷囹圄的李问（郭富城 饰）被引渡回港，他原本隶属于一个的跨国假钞制贩组织。该组织曾犯下过多宗恶性案件，而首脑“画家”不仅始终逍遥法外，连真面目都没人知道。为了逼迫李问吐露“画家”真实身份，警方不惜用足以判死刑的假罪证使其就范。就在此时，富有的遗孀阮文（张静初 饰）申请保释李问，而警方提出的条件依然是“画家”的真面目。 ', 12, 'img/product/smallimg/37_big.jpg', 'img/product/smallimg/37_small.jpg', '//player.bilibili.com/player.html?aid=23561977&bvid=BV1wp411f7ng&cid=56830302&page=1');
INSERT INTO `tab_movies` VALUES (38, '战狼2', '7.1', 3, 124, '2017-07-27', '中国大陆', '吴京 / 弗兰克·格里罗 / 吴刚 / 张翰 / 卢靖姗', '由于一怒杀害了强拆牺牲战友房子的恶霸，屡立功勋的冷锋（吴京 饰）受到军事法庭的判决。在押期间，亲密爱人龙小云壮烈牺牲。出狱后，冷锋辗转来到非洲，他辗转各地，只为寻找杀害小云的凶手。在此期间，冷锋逗留的国家发生叛乱，叛徒红巾军大开杀戒，血流成河。中国派出海军执行撤侨任务，期间冷锋得知有一位陈博士被困在五十五公里外的医院，而叛军则试图抓住这位博士。而从另一位华侨（于谦 饰）口中得知，杀害小云的凶手正待在这个国家。 ', 12, 'img/product/smallimg/38_big.jpg', 'img/product/smallimg/38_small.jpg', '//player.bilibili.com/player.html?aid=19675961&bvid=BV1CW411j7ib&cid=32082919&page=1');
INSERT INTO `tab_movies` VALUES (39, '蝙蝠侠：黑暗骑士 The Dark Knight', '9.2', 4, 102, '2008-07-14', '美国', '克里斯蒂安·贝尔 / 希斯·莱杰 / 艾伦·艾克哈特 / 迈克尔·凯恩 / 玛吉·吉伦哈尔', '从亲眼目睹父母被人杀死的阴影中走出来的“蝙蝠侠”，经历了成长之后，已经不再是那个桀骜不的孤单英雄了。在警官吉姆·戈登和检查官哈维·登特的通力帮助下，“蝙蝠侠”无后顾之忧地继续满世界的奔波，与日益增长起来的犯罪威胁做着永无休止的争斗，而他所在的高谭市，也是进展最为明显的地方，犯罪率以一种惊人的速度持续下降着，毕竟对方是能够上天入地的“蝙蝠侠”，不借两个胆子谁还敢造次呢？不过像高谭这种科技与污秽并存的城市，平静是不可能维持太久的，果不其然，新一轮的混乱很快就席卷了整个城市，人们再一被被恐慌所笼罩着，而声称愿意为这一切负责的，自然就是所有混乱的源头以及支配者--“小丑”了。', 18, 'img/product/smallimg/32_big.jpg', 'img/product/smallimg/32_small.jpg', '//player.bilibili.com/player.html?aid=33537890&bvid=BV12W41117FH&cid=58715922&page=1');
INSERT INTO `tab_movies` VALUES (40, '阿凡达 Avatar', '8.7', 4, 150, '2010-01-04', '美国', '萨姆·沃辛顿 / 佐伊·索尔达娜 / 西格妮·韦弗 / 史蒂芬·朗 / 米歇尔·罗德里格兹', '战斗中负伤而下身瘫痪的前海军战士杰克•萨利（萨姆•沃辛顿 Sam Worthington 饰）决定替死去的同胞哥哥来到潘多拉星操纵格蕾丝博士（西格妮•韦弗 Sigourney Weaver 饰）用人类基因与当地纳美部族基因结合创造出的 “阿凡达” 混血生物。杰克的目的是打入纳美部落，外交说服他们自愿离开世代居住的家园，从而SecFor公司可砍伐殆尽该地区的原始森林，开采地下昂贵的“不可得”矿。在探索潘多拉星的过程中，杰克遇到了纳美部落的公主娜蒂瑞（佐伊•索尔达娜 Zoe Saldana 饰），向她学习了纳美人的生存技能与对待自然的态度。与此同时，SecFor公司的经理和军方代表上校迈尔斯（史蒂芬•朗 Stephen Lang 饰）逐渐丧失耐心，决定诉诸武力驱赶纳美人', 12, 'img/product/smallimg/35_big.jpg', 'img/product/smallimg/35_small.jpg', '//player.bilibili.com/player.html?aid=29330824&bvid=BV13s411M7f8&cid=50953656&page=1\"');
INSERT INTO `tab_movies` VALUES (41, '头号玩家 Ready Player One', '8.6', 4, 142, '2018-03-30', '美国', '泰伊·谢里丹 / 奥利维亚·库克 / 本·门德尔森 / 马克·里朗斯 / 丽娜·维特', '故事发生在2045年，虚拟现实技术已经渗透到了人类生活的每一个角落。詹姆斯哈利迪（马克·里朗斯 Mark Rylance 饰）一手建造了名为“绿洲”的虚拟现实游戏世界，临终前，他宣布自己在游戏中设置了一个彩蛋，找到这枚彩蛋的人即可成为绿洲的继承人。要找到这枚彩蛋，必须先获得三把钥匙，而寻找钥匙的线索就隐藏在詹姆斯的过往之中。 ', 12, 'img/product/smallimg/36_big.jpg', 'img/product/smallimg/36_small.jpg', '//player.bilibili.com/player.html?aid=20852737&bvid=BV12W411p7zg&cid=34160777&page=1');
INSERT INTO `tab_movies` VALUES (42, '无双', '8.1', 2, 255, '2018-09-30', '中国大陆', '周润发 / 郭富城 / 张静初 / 冯文娟 / 廖启智', '身陷囹圄的李问（郭富城 饰）被引渡回港，他原本隶属于一个的跨国假钞制贩组织。该组织曾犯下过多宗恶性案件，而首脑“画家”不仅始终逍遥法外，连真面目都没人知道。为了逼迫李问吐露“画家”真实身份，警方不惜用足以判死刑的假罪证使其就范。就在此时，富有的遗孀阮文（张静初 饰）申请保释李问，而警方提出的条件依然是“画家”的真面目。 ', 12, 'img/product/smallimg/37_big.jpg', 'img/product/smallimg/37_small.jpg', '//player.bilibili.com/player.html?aid=23561977&bvid=BV1wp411f7ng&cid=56830302&page=1');

-- ----------------------------
-- Table structure for tab_score
-- ----------------------------
DROP TABLE IF EXISTS `tab_score`;
CREATE TABLE `tab_score`  (
  `mid` int(0) NOT NULL,
  `uid` int(0) NOT NULL,
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`mid`, `uid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `tab_score_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `tab_movies` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tab_score_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `tab_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab_score
-- ----------------------------
INSERT INTO `tab_score` VALUES (1, 10001, '10');

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `birthday` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `AK_nq_username`(`username`) USING BTREE,
  UNIQUE INDEX `AK_nq_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10008 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO `tab_user` VALUES (10001, '123456', '123456', 'mafan', '1999-07-15', '男', '17364524859', '295154169@qq.com', 'Y', NULL);

SET FOREIGN_KEY_CHECKS = 1;
