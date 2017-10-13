-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-08-18 15:03:14
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sweet`
--
set names utf8;
drop database if exists sweet;
create database sweet charset=utf8;
use sweet;
-- --------------------------------------------------------

--
-- 表的结构 `swt_comment`
--

CREATE TABLE `swt_comment` (
  `cid` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` smallint(6) DEFAULT NULL,
  `info` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swt_comment`
--

INSERT INTO `swt_comment` (`cid`, `product_id`, `user_id`, `score`, `info`) VALUES
(1, 1, 1, 4, '物美价廉'),
(2, 2, 2, 4, '好可爱'),
(3, 3, 2, 4, NULL),
(4, 4, 2, 5, NULL),
(5, 1, 1, 4, NULL),
(6, 5, 1, 4, NULL),
(7, 6, 1, 4, NULL),
(8, 7, 1, 3, NULL),
(9, 8, 2, 3, NULL),
(10, 9, 1, 2, NULL),
(11, 10, 1, 3, NULL),
(12, 11, 2, 5, NULL),
(13, 12, 2, 5, NULL),
(14, 13, 2, 4, NULL),
(15, 14, 1, 2, NULL),
(16, 15, 1, 1, NULL),
(17, 16, 2, 4, NULL),
(18, 17, 2, 5, NULL),
(19, 18, 2, 5, NULL),
(20, 19, 2, 4, NULL),
(21, 20, 1, 4, NULL),
(22, 21, 2, 5, NULL),
(23, 22, 1, 5, NULL),
(24, 23, 2, 5, NULL),
(25, 24, 2, 4, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `swt_order`
--

CREATE TABLE `swt_order` (
  `oid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_time` varchar(32) DEFAULT NULL,
  `pay_time` bigint(20) DEFAULT NULL,
  `orderInfo` varchar(128) NOT NULL,
  `order_price` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swt_order`
--

INSERT INTO `swt_order` (`oid`, `user_id`, `status`, `order_time`, `pay_time`, `orderInfo`, `order_price`) VALUES
(1, 1, 3, NULL, NULL, '', '0.00'),
(3, 2, NULL, '2017-08-15 11:3:4', NULL, '半点时光*1|异国之恋*2|夏日恋情*2|天使之翼*2|芝麻情缘*2|', '62.20'),
(4, 2, 1, '2017-08-15 18:43:57', NULL, '半点时光*1|异国之恋*2|夏日恋情*2|天使之翼*2|芝麻情缘*2|', '62.20'),
(5, 2, 1, '2017-08-15 18:45:17', NULL, '半点时光*1|异国之恋*2|夏日恋情*2|天使之翼*2|芝麻情缘*2|', '62.20'),
(6, 2, 1, '2017-08-15 18:46:54', NULL, '半点时光*3|异国之恋*1|天使之翼*1|浓情似墨*1|芝麻情缘*1|缤纷夏日*1|雪中精灵*1|奶油蛋糕*1|梦幻冰脆*1|', '267.60'),
(7, 2, 1, '2017-08-15 18:47:0', NULL, '半点时光*3|异国之恋*1|天使之翼*1|浓情似墨*1|芝麻情缘*1|缤纷夏日*1|雪中精灵*1|奶油蛋糕*1|梦幻冰脆*1|', '267.60'),
(8, 2, 1, '2017-08-15 19:34:44', NULL, '半点时光*3|异国之恋*1|天使之翼*1|浓情似墨*1|芝麻情缘*1|缤纷夏日*1|雪中精灵*1|奶油蛋糕*1|梦幻冰脆*1|', '267.60'),
(9, 2, 1, '2017-08-18 18:12:47', NULL, '|异国之恋*2|莓果沙拉*5|黄金玉米烙*4|', '250.00');

-- --------------------------------------------------------

--
-- 表的结构 `swt_product`
--

CREATE TABLE `swt_product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(16) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `title` varchar(258) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `onsale` decimal(2,1) DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swt_product`
--

INSERT INTO `swt_product` (`pid`, `pname`, `price`, `title`, `pic`, `onsale`, `family_id`) VALUES
(1, '半点时光', '3.00', '全手工制造的水果味冰淇淋，可以自选口味，最新添加榴莲、蔬菜口味。', 'images/2.jpg', '1.0', 1),
(2, '异国之恋', '4.50', '夏日必备小吃，现有红豆香草口味、木瓜牛奶口味、奶油口味。', 'images/lf2.jpg', '1.0', 1),
(3, '夏日恋情', '4.00', '炎炎夏日，坐在空调房里来一份满是奶油的蛋糕，想想都很美！', 'images/m4.png', '0.8', 1),
(4, '天使之翼', '10.50', '懒人必选的奶油千层蛋糕，口味多多，惊喜多多！', 'images/m4.jpg', '0.8', 2),
(5, '雪中精灵', '48.00', '满满都是水果和奶油的便当，你还在等什么？', 'images/q2.jpg', '0.9', 4),
(6, '芝麻情缘', '15.00', '源自山西的饼点之王，本来就是饼中之王。特别是经过了我们Sweet的首席烘焙师丁稳丁大厨加工之后，那美味的感觉，另万千少女嘴中流出源源不断的口水！源自山西的饼点之王，本来就是饼中之王。特别是经过了我们Sweet的首席烘焙师丁稳丁大厨加工之后，那美味的感觉，令万千少女嘴中流出源源不断的口水！', 'images/xz2.jpg', '0.9', 3),
(7, '浓情似墨', '88.00', '浓情石墨，来自sweet的浓浓的墨意，带你体会虚幻缥缈的中国风情口味的甜品，独具一格。浓情石墨，来自sweet的浓浓的墨意，带你体会虚幻缥缈的中国风情口味的甜品，独具一格。浓情石墨，来自sweet的浓浓的墨意，带你体会虚幻缥缈的中国风情口味的甜品，独具一格。浓情石墨，来自sweet的浓浓的墨意，带你体会虚幻缥缈的中国风情口味的甜品，独具一格。', 'images/g7.png', '0.2', 2),
(8, '奶油蛋糕', '66.00', '奶油蛋糕，冰爽你的夏天呀夏天呀夏天呀!我是丁稳，我是丁稳我是丁稳我是丁稳我是丁稳我是丁稳我是丁稳！啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦！', 'images/g5.png', '0.3', 4),
(9, '缤纷夏日', '10.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/gz2.jpg', '0.4', 3),
(10, '梦幻冰脆', '25.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/sl5.jpg', '0.7', 4),
(11, '粥好喝点', '15.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/yinp.jpg', '0.6', 2),
(12, '水果蛋糕', '48.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/sgdg.jpg', '0.8', 2),
(13, '夏日沙拉', '15.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/sgbs.jpg', '0.5', 1),
(14, '冰冻淇淋', '38.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/bql.jpg', '0.6', 2),
(15, '生日快乐', '188.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/srdg.jpg', '0.7', 3),
(16, '冰冰凉凉', '15.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/lf.jpg', '0.8', 1),
(17, '咕噜曲奇', '28.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/bg.jpg', '0.9', 3),
(18, '乱世佳人', '40.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/jwj.jpg', '0.4', 3),
(19, '奶香丝滑', '15.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/nc.jpg', '1.0', 2),
(20, '冰封爱恋', '15.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/sgb.jpg', '1.0', 1),
(21, '蓝色妖姬', '98.00', '“蓝色妖姬”最早来自荷兰，是一种加工花卉。它是用一种对人体无害的染色剂和助染剂调合成着色剂，等白玫瑰（或白月季）快到花期时，开始用染料浇灌花卉，让花像吸水一样，将色剂吸入进行染色。 据花卉专家介绍，目前世界上极少有自然生长的蓝色玫瑰花。经过Sweet的丁少加工之后，令万千少女沉迷于酒精无法自拔。', 'images/lsyj.jpg', '0.6', 3),
(22, '俄式风味沙拉', '66.00', '热热的天气，不想吃些煎炸油腻的东东。我就选了这道即清凉又美味的沙拉。我就要吃丁少做的美味的沙拉。令万千少女有极致的味觉享受是丁少必生的梦想！', 'images/essl.jpg', '0.6', 4),
(23, '黄金玉米烙', '10.00', '金玉满堂、团圆美满、吉祥如意的黄金玉米烙。\r\n经常有人留言问我玉米烙的做法，\r\n可见是道超人气的一道，即可当主食，也可当甜点。\r\n其实平时也经常做，因为小哲很喜欢吃，\r\n只是一直没拍详细的过程图，这次趁着做准备年菜博文的机会，\r\n仔细的拍了过程图，给大家的年夜餐桌多一道吉祥菜做参考。', 'images/hjym.jpg', '0.4', 4),
(24, '莓果沙拉', '50.00', '草莓实在太多了，丁少做草莓酱的时候顺便做了个简易的沙拉味道真的好棒，口感很清爽，因为丁少放了酸奶，沙拉对于很多女孩子而言是不可缺少的吧，因为减肥必备哈哈.... \n还有一种说法就是女人是水做的，除了每天多喝水之外就是多吃水果\n保证皮肤水当当哦！', 'images/mgsl.jpg', '0.9', 4);

-- --------------------------------------------------------

--
-- 表的结构 `swt_product_family`
--

CREATE TABLE `swt_product_family` (
  `fid` int(11) NOT NULL,
  `fname` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swt_product_family`
--

INSERT INTO `swt_product_family` (`fid`, `fname`) VALUES
(1, '沙冰系列'),
(2, '冰淇淋'),
(3, '果汁饮品'),
(4, '水果沙拉');

-- --------------------------------------------------------

--
-- 表的结构 `swt_product_pic`
--

CREATE TABLE `swt_product_pic` (
  `aid` int(11) NOT NULL,
  `sm` varchar(128) DEFAULT NULL,
  `md` varchar(128) DEFAULT NULL,
  `lg` varchar(128) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swt_product_pic`
--

INSERT INTO `swt_product_pic` (`aid`, `sm`, `md`, `lg`, `product_id`) VALUES
(1, 'img/sm/1.jpg', 'img/md/2.jpg', 'img/lg/3.jpg', 1),
(2, 'img/sm/lf1.jpg', 'img/md/lf2.jpg', 'img/lg/lf3.jpg', 2),
(3, 'img/sm/m1.png', 'img/md/m4.png', 'img/lg/m5.png', 3),
(4, 'img/sm/m1.jpg', 'img/md/m4.jpg', 'img/lg/m5.jpg', 4),
(5, 'img/sm/q1.jpg', 'img/md/q2.jpg', 'img/lg/q3.jpg', 5),
(6, 'img/sm/xz1.jpg', 'img/md/xz2.jpg', 'img/lg/xz3.jpg', 6),
(7, 'img/sm/g8.png', 'img/md/g7.png', 'img/lg/g4.png', 7),
(8, 'img/sm/g3.png', 'img/md/g5.png', 'img/lg/g6.png', 8),
(9, 'img/sm/gz.jpg', 'img/md/gz2.jpg', 'img/lg/gz3.jpg', 9),
(10, 'img/sm/sl4.jpg', 'img/md/sl5.jpg', 'img/lg/sl6.jpg', 10),
(11, 'img/sm/yinp.jpg', 'img/md/yp.jpg', 'img/lg/ypin.jpg', 11),
(12, 'img/sm/sgdg.jpg', 'img/md/sg.jpg', 'img/lg/sgdg1.jpg', 12),
(13, 'img/sm/sgbs1.jpg', 'img/md/sgbs2.jpg', 'img/lg/sgbs3.jpg', 13),
(14, 'img/sm/bql1.jpg', 'img/md/bql2.jpg', 'img/lg/bql3.jpg', 14),
(15, 'img/sm/srdg1.jpg', 'img/md/srdg2.jpg', 'img/lg/srdg3.jpg', 15),
(16, 'img/sm/lf1.jpg', 'img/md/lf2.jpg', 'img/lg/lf3.jpg', 16),
(17, 'img/sm/bg1.jpg', 'img/md/bg2.jpg', 'img/lg/bg3.jpg', 17),
(18, 'img/sm/jwj1.jpg', 'img/md/jwj2.jpg', 'img/lg/jwj3.jpg', 18),
(19, 'img/sm/nc1.jpg', 'img/md/nc2.jpg', 'img/lg/nc3.jpg', 19),
(20, 'img/sm/bs1.jpg', 'img/md/bs2.jpg', 'img/lg/bs3.jpg', 20),
(21, 'img/sm/lsyj.jpg', 'img/md/lsyj.jpg', 'img/lg/lsyj.jpg', 21),
(22, 'img/sm/essl.jpg', 'img/md/essl.jpg', 'img/lg/essl.jpg', 22),
(23, 'img/sm/hjym.jpg', 'img/md/hjym.jpg', 'img/lg/hjym.jpg', 23),
(24, 'img/sm/mgsl.jpg', 'img/md/mgsl.jpg', 'img/lg/mgsl.jpg', 24);

-- --------------------------------------------------------

--
-- 表的结构 `swt_shoppingcart`
--

CREATE TABLE `swt_shoppingcart` (
  `sid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swt_user`
--

CREATE TABLE `swt_user` (
  `uid` int(11) NOT NULL,
  `upwd` varchar(16) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `addr` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swt_user`
--

INSERT INTO `swt_user` (`uid`, `upwd`, `phone`, `addr`) VALUES
(1, '123', '12345678', '长沙市'),
(2, '123', '12345', '湘潭市'),
(3, '123', '123456', ''),
(4, '123', '123123', ''),
(5, '123', '123123123', ''),
(6, '123', '13123123', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `swt_comment`
--
ALTER TABLE `swt_comment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `swt_order`
--
ALTER TABLE `swt_order`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `swt_product`
--
ALTER TABLE `swt_product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `family_id` (`family_id`);

--
-- Indexes for table `swt_product_family`
--
ALTER TABLE `swt_product_family`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `swt_product_pic`
--
ALTER TABLE `swt_product_pic`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `swt_shoppingcart`
--
ALTER TABLE `swt_shoppingcart`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `swt_user`
--
ALTER TABLE `swt_user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `swt_comment`
--
ALTER TABLE `swt_comment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `swt_order`
--
ALTER TABLE `swt_order`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `swt_product`
--
ALTER TABLE `swt_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `swt_product_family`
--
ALTER TABLE `swt_product_family`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `swt_product_pic`
--
ALTER TABLE `swt_product_pic`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `swt_shoppingcart`
--
ALTER TABLE `swt_shoppingcart`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `swt_user`
--
ALTER TABLE `swt_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 限制导出的表
--

--
-- 限制表 `swt_comment`
--
ALTER TABLE `swt_comment`
  ADD CONSTRAINT `swt_comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `swt_product` (`pid`),
  ADD CONSTRAINT `swt_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `swt_user` (`uid`);

--
-- 限制表 `swt_order`
--
ALTER TABLE `swt_order`
  ADD CONSTRAINT `swt_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `swt_user` (`uid`);

--
-- 限制表 `swt_product`
--
ALTER TABLE `swt_product`
  ADD CONSTRAINT `swt_product_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `swt_product_family` (`fid`);

--
-- 限制表 `swt_product_pic`
--
ALTER TABLE `swt_product_pic`
  ADD CONSTRAINT `swt_product_pic_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `swt_product` (`pid`);

--
-- 限制表 `swt_shoppingcart`
--
ALTER TABLE `swt_shoppingcart`
  ADD CONSTRAINT `swt_shoppingcart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `swt_user` (`uid`),
  ADD CONSTRAINT `swt_shoppingcart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `swt_product` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
