CREATE DATABASE  IF NOT EXISTS `acong_music_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `acong_music_db`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: acong_music_db
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admins` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminName` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` text NOT NULL,
  `dateOfBirth` int(2) unsigned zerofill DEFAULT NULL,
  `monthOfBirth` int(2) unsigned zerofill DEFAULT NULL,
  `yearOfBirth` int(4) unsigned zerofill DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '1' COMMENT '0: female\\n1: male\\n2: others',
  `creationDate` datetime NOT NULL,
  `admin_img_path` text NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_email_UNIQUE` (`email`),
  UNIQUE KEY `admin_name_UNIQUE` (`adminName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','nguyenhuuthuat09@gmail.com','$2a$10$6qHMR9ycR/4WTMXZxgHwVONsxVON6SWB5CxHJdd4j2oUhtv35Ip9C',09,10,1998,1,'2018-12-13 20:54:55','admin-avatar.png');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` text NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Việt Nam'),(2,'Âu Mỹ'),(3,'Hàn Quốc'),(4,'Trung Quốc'),(5,'Nhật Bản'),(6,'Khác');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handling_violations`
--

DROP TABLE IF EXISTS `handling_violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `handling_violations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `admin_name_handle` varchar(20) NOT NULL COMMENT 'using admin username without foregin key beacuse admin account can be delete. in that case, we still can know what admin handel this report.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handling_violations`
--

LOCK TABLES `handling_violations` WRITE;
/*!40000 ALTER TABLE `handling_violations` DISABLE KEYS */;
/*!40000 ALTER TABLE `handling_violations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_type`
--

DROP TABLE IF EXISTS `music_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music_type` (
  `music_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `music_type_name` text NOT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_type`
--

LOCK TABLES `music_type` WRITE;
/*!40000 ALTER TABLE `music_type` DISABLE KEYS */;
INSERT INTO `music_type` VALUES (1,1,'Nhạc trẻ'),(2,1,'Nhạc Trịnh'),(3,1,'Tiền chiến'),(4,1,'Thiếu nhi'),(5,1,'Hip Hop/Rap'),(6,2,'Pop'),(7,2,'Rock'),(8,2,'Electronica/Dance'),(9,2,'R&B/Hip Hop/Rap'),(10,3,'Nhạc Hàn'),(11,4,'Nhạc Trung'),(12,5,'Nhạc Nhật'),(13,6,'Không lời'),(14,6,'Nhạc Phim'),(15,6,'Beat'),(16,6,'Thể loại khác');
/*!40000 ALTER TABLE `music_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_reason`
--

DROP TABLE IF EXISTS `report_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `report_reason` (
  `report_reason_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_reason` text NOT NULL,
  PRIMARY KEY (`report_reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_reason`
--

LOCK TABLES `report_reason` WRITE;
/*!40000 ALTER TABLE `report_reason` DISABLE KEYS */;
INSERT INTO `report_reason` VALUES (1,'Vi phạm bản quyền'),(2,'Nội dung xấu'),(3,'Khác');
/*!40000 ALTER TABLE `report_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `song_id` int(10) unsigned NOT NULL,
  `user_id_request` int(11) NOT NULL,
  `email_request` varchar(255) NOT NULL,
  `report_reason_id` text NOT NULL,
  `report_reason_more` text,
  `reportDate` date NOT NULL,
  `report_reviewed` int(1) NOT NULL DEFAULT '0' COMMENT '0: not reviewed; 1: done',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singers`
--

DROP TABLE IF EXISTS `singers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `singers` (
  `singer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `singer_nick_name` text NOT NULL,
  `singer_name` text,
  `dateOfBirth` int(2) unsigned zerofill DEFAULT NULL,
  `monthOfBirth` int(2) unsigned zerofill DEFAULT NULL,
  `yearOfBirth` int(4) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '0: female\\n1: male\\n2: others',
  `singer_hometown` text,
  `singer_story` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `singer_img_path` text,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singers`
--

LOCK TABLES `singers` WRITE;
/*!40000 ALTER TABLE `singers` DISABLE KEYS */;
INSERT INTO `singers` VALUES (1,'Tôi hát','Tôi hát',NULL,NULL,NULL,NULL,NULL,'Đây là sản phẩm của những nghệ sĩ không chuyên hay đơn giản là những người yêu nhạc muốn chia sẻ sản phẩm của họ cho mọi người.','toi-hat.jpg','2018-12-14'),(2,'Vũ','Hoàng Thái Vũ',NULL,NULL,1995,1,'Hà Nội','Tôi là Vũ, đơn giản, tôi là Vũ?<br/><br/>Sinh ra rồi nợ Hà Nội một ân tình.','hoang-thai-vu.jpg','2018-12-13'),(3,'Hải Sâm','Hải Sâm',12,07,1999,1,'Quảng Ninh','Tên thật: Hải Sâm<br/>Ngày sinh: 12/07/1999<br/>Sinh ra ở Quảng Ninh, nhưng lớn lên ở Hà Nội<br/>Là một người viết bài hát. Những sáng tác ban đầu đến với Hải Sâm theo một cách đơn giản, trước khi anh kịp hiểu những quy luật phức tạp của nó là gì. Hải Sâm hát không hay, nhưng có chất riêng. “Nhạc sầu, nhạc nẫu, nhạc trẻ trâu, nhạc của Hải Sâm.” là cách mà anh thường dùng để giới thiệu về ','hai-sam.jpg','2018-12-14'),(4,'Andiez','Trương Nguyễn Hoài Nam',10,02,1995,1,'Thành phố Hồ Chí Minh','Hiện tại thì Andiez đang là sinh viên trường Nguyễn Tất Thành . Đam mê âm nhạc từ khi còn bé , và bắt đầu hát và sáng tác chuyên nghiệp vào đầu năm lớp 10 . Andiez có phong cách âm nhạc nghiêng về Ballad/RnB , đôi khi 1 chút Pop cho đổi mới . Hiện đang là Leader của Cosmo Riot hoạt động về âm nhạc underground gồm composer và beatmaker. Là thành viên của Different Team Compose & Produce : +Single : Đường Một Chiều – Huỳnh Tú The voice +Single : Anh Chờ – Anh Tú +Track : Show Me Your Love – Trà My Idol +Track : Buông (Remix) – Vũ Thảo My +OST : Người Em Thích Là Anh – MoWo','andiez.jpg','2018-12-14'),(5,'Bùi Anh Tuấn','Bùi Anh Tuấn',09,09,1991,1,'Hà Nội','Bùi Anh Tuấn sinh ra và lớn lên tại Hà Nội, anh có khuôn mặt lãng tử và một giọng hát cao, thanh.<br/>Gia đình: Tuấn là anh cả trong gia đình, sống cùng với ông bà bố mẹ. Gia đình bên nội của Tuấn không theo ngành nghệ thuật nhưng rất nhiều người có giọng hát hay, đặc biệt là bố của Tuấn. <br/>Sự nghiệp: Con đường sự nghiệp của Tuấn gặp không ít khó khăn. Vì bệnh dị ứng mũi với khí hậu lạnh miền Bắc, Tuấn đã phải khăn gói vào miền Nam tự lập từ năm lớp 10 để theo đuổi con đường nghệ thuật.Năm 18, 19 tuổi Anh Tuấn tham gia 1 số cuộc thi âm nhạc và chỉ giành giải tư (tuyển chọn giọng hát hay hàng tuần của đài phát thanh VOH TPHCM), và giải khuyến khích (tiếng ca học đường năm 2010) nhưng Tuấn không nản lòng mà vẫn tiếp tục chăm chỉ luyện tập và đến năm 20 tuổ (2011)i, Bùi Anh Tuấn đã chính thức trở thành 1 ca sĩ chuyên nghiệp lần lượt giành giải nhất trong cuộc thi CocaCola Music Award và giải nhất cuộc thi Ngôi Sao Tiếng Hát Truyền Hình.<br/>Chính nhờ sự chăm chỉ luyện tập không biết mệt mỏi đã giúp Tuấn thành công. Hiện nay Bùi Anh Tuấn đang là 1 ca sĩ tự do. Trong tương lai, khán giả trên toàn quốc sẽ có nhiều cơ hội để thưởng thức giọng hát của Tuấn.','bui-anh-tuan.jpg','2018-12-14'),(6,'DSK','Trần Đức Minh',23,11,1987,1,'Hà Nội','Rapper DSK sinh ngày 23 tháng 11 năm 1987 tại Thành phố Hà Nội, nước Việt Nam.Thời niên thiếu,anh sống và làm việc chủ yếu ở Thành phố Bad Kissingen, nước Đức.<br/><br/>DSK được cho là thần tượng của các thần tượng trong Rap Việt nhờ chất giọng và khả năng viết lyric tuyệt hảo. Anh được khán giả yêu mến qua những bản Rap chất ngầu như: Lớn Rồi, Chưa Bao Giờ, Đôi Bờ, Tự Xử, Thế Hệ Tao,... Cho đến bây giờ anh đã trở thành huyền thoại bất tử trong lòng người hâm mộ với những cống hiến to lớn cho nền Rap Việt Nam.<br/><br/>Từng được xem là King của RapViet, nhắc tới rap underground ai cũng biết DSK. Andree nói DSK là người đầu tiên anh nể trong Rap, Binz xem DSK như một tượng đài của Rap Việt. Danh tiếng của anh gắn liền với thời hoàng kim của GVR (2006-2010). Hiện tại DSK đã ít rap hơn và sinh sống tại núi AT Kong thuộc thành phố Đà Lạt.','dsk.jpg','2018-12-14'),(7,'Cam','Lê Văn Toàn',04,06,1992,1,'Thành phố Hồ Chí Minh','Lê Văn Toàn sinh ngày 4 tháng 6 năm 1992 tại thành phố Hồ Chí Minh, Việt Nam hay còn được biết với nghệ danh Cam là một rapper thuộc nhóm Harzard Clique và ca sĩ, người thể hiện giai điệu nhạc indie. Ngoài Harzard Clique anh còn là thành viên của G Family.<br/><br/>Năm 2013, anh tham gia vào Hazard Clique kết hợp cùng Blacka và Pain, tại đây Cam thay đổi phong cách âm nhạc của mình một cách mạnh mẽ.<br/><br/>Âm nhạc của Cam thường được anh thể hiện theo một phong cách đời thường, gần gũi thế mạnh của anh là giọng hát đặc trưng và lối viết lyrics như kể chuyện.<br/><br/>Một số track tiêu biểu:<br/><br/>- 100 ngày hạ<br/>- Bắt cóc<br/>- Chờ ai<br/>- Trong veo ','cam.jpg','2018-12-14'),(8,'Lê Cát Trọng Lý','Lê Cát Trọng Lý',24,08,1987,0,'Đà Nẵng','Trong năm 2007, Lê Cát Trọng Lý đoạt giải ba trong cuộc thi \"Hát cho niềm đam mê\" do Nokia tổ chức. Năm 2008, đoạt được một số giải trong cuộc thi Bài hát Việt do VTV3 tổ chức: Bài hát của tháng 12 (ca khúc \"Chênh vênh\"); Ca sĩ thể hiện ca khúc hiệu quả tháng 12, Bài hát của năm (ca khúc \"Chênh vênh\") và Nhạc sĩ trẻ triển vọng.[2]<br/><br/>Năm 2009 cô được chọn hát trong chương trình của ca sĩ Francis Cabrel tại Hà Nội. Năm 2010, biểu diễn tại Trung tâm Văn hóa Pháp L’Espace, tạo được dư luận tốt với 3 đêm diễn liên tục cháy vé. Bên cạnh đó, Lý còn tham gia Festival Huế và tham gia lưu diễn văn hóa Việt Nam ơi tại Na Uy. Tại giải Cống hiến năm 2011, Lê Cát Trọng Lý đã thắng giải Nhạc sĩ của năm.[3]<br/><br/>Ngày 20 tháng 1 năm 2011, cô phát hành album đầu tay mang tên mình. Cùng năm, Lý đã có chuyến lưu diễn xuyên Việt với chủ đề Lê Cát Trọng Lý - Vui Tour với thời gian gần 2 tháng và thu được những thành công nhất định, trong đó buổi diễn ở quê hương Đà Nẵng của cô đã cháy vé.[4] Sau khi kết thúc lưu diễn, cô quyết định dành ra hai năm để học tập tại Hà Nội. Ngày 23 tháng 11 năm 2013, cô tái xuất ở quê nhà bằng đêm nhạc Mùa thu trong em.[5]<br/><br/>Tháng 8 năm 2015 Lý phát hành album mang tên Dreamer bao gồm ba đĩa liên tiếp với chủ đề Vui Tour, Live in Church và Những kẻ mộng mơ. Album như một cuốn tuyển tập nhật ký âm nhạc trong suốt 4 năm làm việc từ năm 2011 (Vui Tour) đến năm 2015 (Live in Church), âm thanh không qua xử lý để giữ nguyên những khoảnh khắc chia sẻ cùng khán giả. ','le-cat-trong-ly.jpg','2018-12-14'),(9,'Đức Phúc','Nguyễn Đức Phúc',15,10,1996,1,'Hà Nội','Đức Phúc là con trai lớn trong một gia đình sinh sống ở khu phố trung tâm Hà Nội, có mức thu nhập bình thường và không có ai hoạt động trong lĩnh vực nghệ thuật, giải trí.<br/><br/>Anh có niềm đam mê ca hát bắt nguồn từ việc gia đình anh rất thích hát karaoke. Những năm học cấp 3 anh tham gia tất cả các buổi casting biểu diễn văn nghệ tại trường, nhưng do nhiều yếu tố khách quan anh đều không được biểu diễn. Đến lớp 12 anh mới được biểu diễn trong lễ bế giảng. Khi lên đại học anh tham gia câu lạc bộ âm nhạc của trường.<br/><br/>Năm 2015 anh tham gia cuộc thi Giọng hát Việt. Trước khi tham gia Giọng hát Việt, anh cũng đã từng tham gia hai cuộc thi khác đó là Vietnam Idol và Vietnam\'s Got Talent nhưng đều bị loại ở ngay vòng đầu.','duc-phuc.jpg','2018-12-14'),(10,'Thành Đồng',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dao-dien-thanh-dong.jpg','2018-12-14'),(11,'Đen','Nguyễn Đức Cường',13,05,1989,1,'Quảng Ninh','Tên thật là Nguyễn Đức Cường, Đen Vâu là một cái tên quen của giới Underground, với những bản Rap đầy tính tự sự, thể hiện suy nghĩ tâm tư của những bạn trẻ hiện nay, sống với đam mê và hết mình với tuổi trẻ. Mọi người biết đến với Đen Vâu qua các ca khúc như Đưa nhau đi trốn, Cô gái bàn bên, Mơ ... Anh đã từng tham gia chương trình Muôn màu showbiz và để lại nhiều ấn tượng tốt đẹp.<br/><br/>Đen sinh ra và lớn lên tại Hạ Long Quảng Ninh trong một gia đình không có ai theo nghệ thuật ngoài ra anh còn có nghệ danh là Đen Vâu.  Ca sĩ Đen sinh ngày 13-5-1989 tại Tỉnh Quảng Ninh.<br/>Đức Cường bên cạnh là một ca sĩ anh còn là một nhạc sĩ chuyên viết nhạc Rap. Anh luôn thể hiện được chất “ngông” rất nghệ sĩ trong từng ca khúc, bản rap anh viết.<br/><br/>Giải thưởng của anh:<br/><br/>Giải thưởng bài hát được khán giả yêu thích nhất Bài Hát Việt 2011.<br/><br/>Album nổi bật của anh:<br/><br/>Đưa Nhau Đi Trốn - Đen<br/>Các ca khúc ghi lại dấu ấn của anh:<br/>Đưa Nhau Đi Trốn (Chill Version) - Đen, Linh Cáo<br/>Thiêu Thân - Zephyr, Đen<br/>Chạy Trốn Mặt Trời - Đen<br/>Ngày Lang Thang - Đen<br/>Hát - Đen, JGKiD<br/>Cây Bàng - JGKiD, Đen<br/>Hoàng Hôn - Đen<br/>Nhiều Năm Nữa - Đen<br/>Forever Love - Đen<br/>Ta Và Nàng - JGKiD, Đen<br/>Đưa Nhau Đi Trốn - Đen, Linh Cáo<br/>Vợ Chồng A Phủ - Đen<br/>Ngày Lang Thang - Đen<br/>Mưa Trên Những Mái Tôn - Đen<br/>Lonely In Love (Feat. Linh Cáo)<br/>Cô Gái Bàn Bên - Đen<br/>','den-vau.jpg','2018-12-13'),(12,'Tofu','Võ Văn Đức',10,10,1994,1,'Tây Nguyên','Tofu hay còn được gọi là Tí nhà văn. Là một rapper trong nhóm Tây Nguyên Sound. Hiện anh còn là một nghê sĩ xăm hình.','tofu.jpg','2018-12-30'),(13,'PC','Nguyễn Cường',NULL,NULL,1998,1,'Tây Nguyên','Hiện chưa có thông tin.','pc-tns.jpg','2018-12-30'),(14,'Fools Garden','Nhóm nhạc Fools Garden',NULL,NULL,NULL,3,'Đức','Fools Garden là một nhóm nhạc Đức được thành lập vào năm 1991, ban đầu được đặt tên theo Fool\'s Garden, một album được ghi bởi Freudenthaler và Hinkel. Thomas Mangold, Roland Röhl và Ralf Wochele gia nhập ban nhạc ngay sau đó và một lần trong Blue Moon được phát hành bởi ban nhạc hoàn chỉnh vào năm 1993.','fools-garden.jpg','2018-12-30'),(15,'The Flob','Nhóm nhạc the Flob',NULL,NULL,NULL,3,'Việt Nam','5 thằng nhóc ác chởi thể loại nhạc gian ác.','the-flob.jpg','2018-12-30'),(18,'Táo','Võ Hồ Thanh Vi',13,06,1994,1,'Thành phố Hồ Chí Minh','Táo tên thật là Võ Hồ Thanh Vi, sinh năm 1994, sớm biết đến Rap lúc 9 tuổi khi nghe được một ca khúc từ cuốn băng cassette cha tặng. Ít năm sau, đam mê với nhạc Rap của Táo lại trỗi dậy mạnh mẽ khi anh đọc trong báo có thông tin về việc Rapper đầu tiên của Việt Nam được đứng trên một sân khấu - Lil Knight. 16 tuổi là lúc Táo mong muốn làm điều gì đó cho mình với nhạc rap. Với Táo, Rap khi ấy chỉ đơn giản là một cuộc chơi và nghệ danh đầu tiên là Green Apple (Táo xanh - PV) - tên nhân vật mà anh sử dụng trong một trò chơi điện tử. 2 năm đầu là quãng thời gian tự mày mò, làm quen với Rap của Táo.<br/><br/>Ngay từ những sản phẩm đầu tiên, những sản phẩm của Táo đã mang những màu sắc tối nhưng cho tới khi gia nhập G-Fam (một trong những cái nôi của Rap miền Nam), bản thân Táo mới đạt được những bước tiến lớn trong âm nhạc. Theo chia sẻ của Táo, Rapper Blacka (Black Murder) chính là người giúp anh thực sự biết đến sự tồn tại của Dark/Horrorcore Hiphop. Nhưng không giống như nhiều thể loại âm nhạc khác, phần lớn câu chuyện của Rap là những thứ có liên hệ với bản thân Rapper. Dark/Horrorcore Hiphop là những uẩn ức, những tâm trạng khó nói, là nỗi đau từ cuộc sống, thường trực ám ảnh tâm trí mà \"nếu không mang những tâm trạng thế, bạn không thể là một Rapper Dark/Horrorcore\" - Táo nói - \"Chính vì lẽ đó, trong thời gian đầu biết đến thể loại nhạc Rap này, Táo khá thiếu tự tin và đã có lúc dừng dự án của mình lại\".','tao-rapper.jpg','2018-12-30'),(19,'Masew','Lê Tuấn Anh',NULL,NULL,1996,1,'Thành phố Hồ Chí Minh','Masew tên thật là Lê Tuấn Anh, là cái tên quen thuộc trong giới underground. Masew bắt đầu theo đuổi và làm nhạc từ năm lớp 10, đến nay đã gắn bó với âm nhạc được gần 6 năm. Nhắc tới chàng Producer/DJ Masew khán giả nhớ ngay tới những sản phẩm triệu view bắt tai như: Điều khác lạ, B.S.M.L 2 (mix) hay Quăng tao cái boong (remix). Hiện tại, Masew là thành viên của AVN Team chuyên Rap, Hiphop, EDM.<br/><br/>Bàn tay phù phép của Masew cùng với Producer Nhật Nguyễn của biệt đội BasSmachers đã tạo ra bản phối ca khúc gây nghiện \"Túy âm\" của Xesi. \"Túy âm\" được coi là \"Despacito\" của Việt Nam bởi khiến người nghe không thể dứt ra được mà cứ nghe hàng tiếng đồng hồ. Giai điệu của \"Túy âm\" gây nghiện vì sự ma mị như đang chìm đắm trong ảo giác. \"Túy âm\" được Xesi Hải Yến sáng tác dựa trên câu chuyện của một chàng trai tình cờ gặp lại mối tình thời cấp 3. Bàn tay phù thủy của Masew và Nhật Nguyễn cùng với giọng ca mang màu sắc dân gian của Xesi đã khiến bài hát này tạo nên cơn sốt trên mạng. Ngày 25/8, bản thu âm \"Túy âm\" được đăng tải trên kênh Youtube của Masew. Kênh Youtube của Mesew nhạn được nút bạc danh giá. Bản thân Masew và ekip sản xuất cũng rất bất ngờ với sức công phá của \"Túy âm\". Ban đầu, nhóm chỉ kỳ vọng tác phẩm này có thể cán mốc 1 triệu View. Mọi chuyện ngoài sức tưởng tượng, chỉ sau 20 ngày lên sóng \"Túy âm\" đã cán mốc hơn 30 triệu view. Để ăn mừng thành công này, bộ ba Xesi Hải Yến, Nhật Nguyễn và Mesew sẽ tổ chức một buổi offline giao lưu với người hâm mộ.<br/><br/>\"Túy âm\" là sự kết hợp tình cờ của bộ ba Xesi - Masew - Nhật Nguyễn. Trước đó, Masew đã nghe một vài ca khúc của Xesi và rất thích chất giọng đi vào lòng người của cô nữ sinh chuyên hóa này. Anh ngỏ ý muốn được hợp tác với Xesi trong một vài sản phẩm âm nhạc. Sau khi nghe bản demo \"Túy âm\" nhóm chat liên tục và dốc sức hoàn thành trong 3 tháng. Có thể nói \"Túy âm\" là sản phẩm tâm huyết của bộ ba này.','masew.jpg','2018-12-30');
/*!40000 ALTER TABLE `singers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_queue`
--

DROP TABLE IF EXISTS `song_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `song_queue` (
  `song_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `song_name` text NOT NULL,
  `singer_id` text,
  `music_id` text,
  `country_id` int(11) DEFAULT NULL,
  `song_path` text,
  `song_about` longtext,
  `song_lyrics` longtext,
  `song_img_path` text,
  `listen_count_sum` text,
  `listen_count_week` text,
  `user_id_upload` int(10) unsigned NOT NULL,
  `upload_date` datetime DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_queue`
--

LOCK TABLES `song_queue` WRITE;
/*!40000 ALTER TABLE `song_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `songs` (
  `song_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `song_name` text NOT NULL,
  `singer_id` text,
  `music_id` text,
  `country_id` int(11) DEFAULT NULL,
  `song_path` text,
  `song_about` longtext,
  `song_lyrics` longtext,
  `song_img_path` text,
  `listen_count_sum` text,
  `listen_count_week` text,
  `user_id_upload` int(10) unsigned NOT NULL,
  `upload_date` datetime DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'1 phút','4','1',1,'1-phut-andiez.mp3','','Đã bao lâu, lòng này anh chẳng nói<br/>Nói với em, ngàn lời anh cất giữ trong tim<br/>Lần này đến lần khác, đôi môi cứ lãng phí chẳng nói gì<br/>Chỉ biết cạnh em, dù cho em chẳng để ý<br/><br/>Và rồi em đã có người em yêu<br/>Mỉm cười cho qua hết đi<br/>Phải chăng là do người đến sau, yêu em thật nhiều<br/>Đã nói thay anh những lời anh mong ước<br/><br/>Vẫn chúc cho em thật vui, mặc anh bên lề của hạnh phúc<br/>Những phút giây ta đã qua, anh sẽ giữ như thước phim<br/>Để khi nhớ em anh xem và ước rằng thực tế sẽ như vậy<br/>Ở nơi đó thời gian như ngừng trôi, hỡi em<br/><br/>1 phút đứng trước mặt em, 1 phút nói ra lời chưa nói<br/>1 phút mạnh mẽ từ anh, ta vẫn sẽ chung lối đi<br/>Anh chẳng thể nào quay lại, để bây giờ chẳng nói giá như<br/>Giá như em hiểu rằng, giá như em 1 lần nhìn được, từ ánh mắt anh !<br/><br/>Vì trái tim anh cần em, vì với anh em là duy nhất<br/>Thế nhưng bây giờ đây, chẳng thể đến được với nhau<br/>Anh đã sai thật rồi, anh sai thật rồi<br/>Vì cứ mãi giữ lời yêu em trong trái tim','1-phut-andiez.jpg','4','4',1,'2018-12-14 09:37:28'),(2,'100 ngày hạ','7','1',1,'100-ngay-ha-cam.mp3',NULL,'Ngày thứ 3 là ngày đầu tiên mà em quay lại<br/>Vì cả 2 hôm trưóc đó, anh toàn gọi tên em sai<br/>Và anh thì đâu dám hỏi, chiếc phù hiệu anh chẳng dám coi<br/>cả ngày thứ 4 và thứ 5 anh chỉ trao mà đâu dám nói<br/>mấy chiếc thư, tem dán vội, anh chỉ biết là trao em thôi<br/>nụ cưòi vẫn gưọng trên môi, và tim bỗng dưng hấp hối<br/>bụi đưòng và bộ đồng phục nhân viên bưu điện<br/>anh không biết, nhưng họ gọi thứ đó là duyên<br/>ngày 30, với xấp thư vẫn còn trên tay<br/>không hề vơi đi dù một chút, đong đầy theo khó khăn từng ngày<br/>ngày 34, họ đã đá anh ra ngoài đưòng<br/>vậy cũng tốt, ngưòi lãng tử đã về lại đây với chốn phong sưong<br/>như ngày trứoc, không ngưòi thưong, có thằng nhóc bụi đời vất vưởng<br/>không mẹ cha, chợ Bình Tây, lấy mái hiên nơi đây làm nhà<br/>rồi sang hạ, đó là mùa của quả chò bay<br/>và Trang Hạ, niềm hạnh phúc sớm hôm lại đầy<br/><br/>Nhìn em ngồi thu lu<br/>Em hát về giấc mơ đã mất<br/>Ai nhắc lại những cơn mộng xưa<br/>Giống như mặt trăng ai cướp đi<br/><br/>ngày 79, em hùng hổ quay lại và ném vào mặt anh<br/><br/>bức 78, bức 77, thêm một xấp anh k kịp tránh<br/><br/>em nổi đoá: \"anh có điên thì điên vừa phải thôi<br/>gửi thư k ghi ngưòi nhận, tui k giữ ngưòi ta vứt luôn rồi!\"<br/>nhưng em à, anh đâu có quan tâm ngưòi ta<br/>anh chỉ ghi nơi anh cần gửi, nên bì thư chỉ đề \"mùa hạ\"<br/>mùa hạ mà anh yêu nhất là mùa hạ mà em đi qua<br/>mùa hạ trời lên cao ngất, gay gắt thêm dặm đưòng xa nhà<br/>ngày 86 tới ngày 90 là chuỗi những ngày gắt gỏng<br/>em đạp vội qua con phố vắng, k thèm nhìn xem có thư hay không<br/>anh không biết anh làm gì sai, anh chỉ biết nơi đây còn lại<br/>96 lá thư, ngày qua ngày thật tình chẳng biết trao ai <br/>Ngày 97 anh quyết định là phải làm lành <br/>thiếu vắng những lá thư, nhưng nụ cười ấy vẫn còn xanh <br/>ngày 100, quả chò như rơi thật chậm <br/>bức thư đầu tiên em trao, là một chiếc thiệp hồng đỏ thắm <br/><br/>ngày 102, em tìm lại con phố cũ <br/>vẫn gốc chò, vẫn ngôi nhà mái hiên bây giờ đã vắng chủ <br/>bỗng vang lên tiếng gọi í ới của cô Năm hàng nứoc <br/>\"Thằng Thanh xe ôm nó kêu cô đưa con cả từ 2 ngày trứơc\" <br/>xấp thư k ngưòi nhận, nằm khó hiểu trên tay em <br/>Trong vô thức, em đã bóc một lá ra xem <br/>hết lá này đến lá khác, tất thảy 99 lá <br/>ngồi gục xuống hiên nhà, em thấy mùa hạ vừa trôi qua<br/><br/>Nhìn em ngồi thu lu <br/>em hát về giấc mơ đã mất <br/>ai có buồn, <br/>hãy nghe lời em hãy nghe lời em <br/>biết yêu trong sáng','100-ngay-ha-cam.jpg','15','15',1,'2018-12-14 09:37:28'),(3,'Ai','6','5',1,'ai-dsk.mp3',NULL,'Có những lúc thiếu 1 tí, chỉ còn thêm 1 ít nữa Đời nó đéo kiên trì thêm đc ít bữa <br/>Đôi lúc thiếu 1 chút thôi, suýt nữa là ko phải công cốc rồi <br/>Nếu giận bảo là ko phải câu trả lời <br/>Thì thôi đành châm điếu cần trước đích nhìn người ta tới Kiểu gì mà chả cay, 1 chút nữa thôi là hoàn hảo <br/>Hay...? <br/>Mình thiếu kiên trì 1 chút nữa Ko ở lại, chạy theo bầu trời trút mưa vừa chạy vừa trách sao cuộc đời tệ quá tao <br/>Chạy khắp nơi, chạy quên đường về nhà <br/>Có thể là đã quá lâu chạy trốn cái hệ quả <br/>Dù tốt dù xấu Kiếm tìm tự do mãi cái đéo gì, tao có bị nhốt tù đâu <br/>Mây đen cũng chỉ u sầu nếu nhốt mình nơi bóng mây <br/>Thu mình, coi hạt cát là lớn lao <br/>Thiếu 1 chút yên bình, để thấy vẻ đẹp của cơn bão <br/>Văn hoa xa xôi, trang hát là <br/>Lời xúc phạm của mày để gió cuốn đi <br/>Chúa tha thứ cho mày vì chính mày cũng còn đéo biết mày đang muốn gì <br/>Trong cuộc đời này, trong cuộc đời này, trong cái cuộc đời này <br/>Thị phi câu chuyện của những đôi mắt hiếu kì <br/>Đôi lúc tiền ko có nhưng chẳng thiếu gì <br/>Ăn trc mắt có nhà lo, nợ làm từ từ trả họ <br/>Miễn sao là cứ phấn đấu, nghĩ nhiều chỉ tốn calo, uh <br/>Mấy thằng nhóc có đc 5 phút vinh quang nghĩ mình đã to, gặp nhắn hộ tao là địt cả lò nhà nó <br/>Rõ ràng lên truyền hình chỉ để pha trò <br/>Để mấy thằng diễn viên hài cười vào mặt thì bó tay, <br/>Mày ko bỏ, hiphop nó cũng bỏ mày <br/>Nói thế chứ nào phải, nó đéo bỏ mà là bị đào thải, yup <br/>Tao ghét tất cả chúng mày, tao giận dữ với cả thế giới này, <br/>Trang lại hát <br/><br/>Và mấu chốt của câu chuyện nằm ở chỗ Cuộc đời này loạn lạc, ko vội đc, từ từ mày sẽ hiểu <br/>Biết đâu theo phương diện hoàn toàn khác <br/>Lời của tao cũng loạn và lạc, có mỗi chút nguyên tắc và quan điểm <br/>Còn Lời bọn mày toàn là rác <br/>Tao viết thì lời vần với đời <br/>Đời vần tao, tao vần với đời, và tao với đời vần nhau <br/>Lần này đéo thắng cứ đợi đấy còn lần sau <br/>Chill thôi, mới 30, 40 bố mày vẫn máu <br/>Thời gian vẫn còn nhiều khuyết điểm cứ từ từ khắc phục sau','ai-dsk.jpg','0','0',1,'2018-12-14 09:37:28'),(4,'Anh đếch cần gì nhiều ngoài em','11,2,10','1,5',1,'anh-dech-can-gi-nhieu-ngoai-em-den-vu-thanh-dong.mp3',NULL,'Và anh đếch cần gì nhiều ngoài em<br/>Và anh đếch cần gì nhiều ngoài em<br/>Và anh đếch cần gì nhiều ngoài em<br/>Và anh đếch cần gì nhiều ngoài em<br/><br/>Anh như con cáo em như một cành nho xanh<br/>Khi em còn trẻ và đẹp em lại không dành cho anh<br/>Trong lòng anh là kho xăng, nụ cười em là mồi lửa<br/>Em phá vỡ đi quy tắc, rồi bỏ mặc anh ngồi sửa<br/><br/>Anh như biến thành người nhện, vì trong lòng nhiều tơ vương<br/>Nhớ em tốn nhiều calo, thế nên anh gầy trơ xương<br/>Ở trong xóm anh rất ngoan, chẳng ai thấy anh say mèm<br/>Mẹ anh dặn anh đủ thứ, nhưng quên dặn đừng say em<br/><br/>Như con cuốn chiếu, anh có rất nhiều chân thật<br/>Bài hát này ngọt vì đám tụi anh rất thân mật<br/>Anh như con cáo em vẫn là cành nho xanh<br/>Nhưng mà em trẻ và đẹp, em lại không dành cho anh<br/><br/>Ta đã đi tìm về thương nhớ<br/>Ta đã đi tìm đi tìm đi tìm<br/>Ta đã đi tìm về quá khứ<br/>Ta cứ đi tìm đi tìm<br/><br/>Và anh đếch cần gì nhiều ngoài em<br/>Ôi một giấc mơ chơi vơi nhiều đêm<br/>Và anh đếch cần gì nhiều ngoài em<br/>Thương một giấc mơ ôm ta nhiều đêm<br/><br/>Một ngày cùng em uống đến thoáng say là đủ<br/>Kệ đời ngả nghiêng mình nằm dưới tán cây mà ngủ<br/>Sẽ thật là tuyệt nếu rơi vào 1 chiều thu<br/>Anh cưa em đổ em gọi anh là tiều phu<br/><br/>Anh có thể có danh tiếng nếu như mặt anh dày thêm<br/>Anh có thể có nhiều tiền nếu anh cày ngày cày đêm<br/>Nhưng như một giấc mơ bị em chối bỏ trong chiều<br/>Anh không có được em dù cho cố bỏ công nhiều<br/><br/>Nồng độ cồn em bao nhiêu sao cứ làm anh lảo đảo<br/>Em chỉ mang lại chua cay như là gói mì hảo hảo<br/>Một lần chơi lớn để xem em có trầm trồ<br/>Vì yêu em, anh như mang hết con tim đi cầm đồ.<br/><br/>Và anh đếch cần gì nhiều ngoài em<br/>Ôi một giấc mơ chơi vơi nhiều đêm<br/>Và anh đếch cần gì nhiều ngoài em<br/>Thương một giấc mơ ôm ta nhiều đêm.<br/><br/>Và anh đếch cần gì nhiều ngoài em<br/>Và anh đếch cần gì nhiều ngoài em<br/>Và anh đếch cần gì nhiều ngoài em<br/>Và anh đếch cần gì nhiều ngoài em ','anh-dech-can-gi-nhieu-ngoai-em-den-vu-thanh-dong.jpg','22','22',1,'2018-12-14 10:09:08'),(5,'Ánh nắng của anh','9','1',1,'anh-nang-cua-anh-duc-phuc.mp3',NULL,'Từ bao lâu nay anh cứ mãi cô đơn bơ vơ<br/>Bao lâu rồi ai đâu hay<br/>Ngày cứ thế trôi qua miên man<br/>Riêng anh một mình nơi đây<br/><br/>Những phút giây trôi qua tầm tay<br/>Chờ một ai đó đến bên anh<br/>Lặng nghe những tâm tư này<br/><br/>Là tia nắng ấm<br/>Là em đến bên anh<br/>Cho vơi đi ưu phiền ngày hôm qua<br/><br/>Nhẹ nhàng xóa đi bao mây đen vây quanh cuộc đời nơi anh<br/>Phút giây anh mong đến tình yêu ấy<br/>Giờ đây là em người anh mơ ước bao đêm<br/><br/>[ĐK]<br/>Sẽ luôn thật gần bên em<br/>Sẽ luôn là vòng tay ấm êm<br/>Sẽ luôn là người yêu em<br/>Cùng em đi đến chân trời<br/><br/>Lắng nghe từng nhịp tim anh<br/>Lắng nghe từng lời anh muốn nói<br/>Vì em luôn đẹp nhất khi em cười<br/>Vì em luôn là tia nắng trong anh<br/>Không xa rời.<br/><br/>Bình minh dẫn lối<br/>Ngày sau có em luôn bên anh trên con đường ta chung lối<br/>Niềm hạnh phúc như trong cơn mơ<br/>Chưa bao giờ anh nghĩ tới<br/><br/>Phút giây ta trao nhau tình yêu ấy<br/>Giờ đây là em<br/>Người anh sẽ mãi không quên','anh-nang-cua-anh-duc-phuc.jpg','9','9',1,'2018-12-14 10:09:08'),(6,'Đôi bờ','8','1',1,'doi-bo-le-cat-trong-ly.mp3',NULL,'Đêm qua anh mơ thấy em yêu đến trong mộng buồn<br/>Dĩ vãng thoáng đốt cháy trái tim thương em<br/>Khóe mắt đẫm ướt mái tóc xõa mới chấm ngang vai cho anh thương em ngàn đời<br/>Anh kêu tên em qua vùng biển sóng chân trời.<br/><br/>Bóng con thuyển vượt ngàn trùng lệ trào dâng<br/>Lời anh kêu tan trong sóng gió reo sóng dâng bao la<br/>Kể từ đây mãi mãi mất nhau, mãi mang thương đau mây đen giăng mờ<br/>Để duyên ngâu chia đôi bờ, tình mãi mong chờ.<br/><br/>Đêm qua anh mơ bóng quê xưa bước anh trở về<br/>Đứng dưới bóng mát, đến đón em khi tan trường<br/>Dáng cũ lối nhớ đã cách mấy nắng mưa<br/>Ôi trông nhau xa vời vợi<br/>Anh kêu tên em, em mừng chẳng nói nên lời.<br/><br/>Nước mắt rơi lòng bùi ngùi mình dìu nhau<br/>Nghe tin mơ say gió xoáy cuốn lá thu bay bay<br/>Chợt mộng tan gác vắng bóng em thoáng chút hiên nghe mưa rơi u hoài<br/>Buồn thương thân lang thang quê người trọn kiếp lưu đày.<br/><br/>Trong đêm đơn côi gió mưa rơi nhớ em vời vợi<br/>Thương cánh hoa xưa xa cách đã lâu không thấy nhau<br/>Qua bao thương đau bóng liễu có thắm như xuân ta trao mối duyên đầu<br/>Đôi môi son tươi qua vùng biển mắt xanh màu .<br/><br/>Nếu sớm nào ngày trở về liệu rằng em<br/>Còn yêu anh như khi chúng ta mới yêu thương nhau<br/>Ngại đôi khi bão táp đã khiến núi sông cách ngăn cho em thay lòng<br/>Tình ly tan cho ước thề mộng cũ phai tàn.<br/><br/>Hỡi non cao ôi sông sâu đời bể dâu<br/>Lòng biển sâu có biết cho nhau dấu chôn niềm đau<br/>Kể từ đây mãi mãi mất nhau, mãi mang thương đau mây đen giăng mờ<br/>Để duyên ngâu chia đôi bờ, tình mãi mong chờ.','doi-bo-le-cat-trong-ly.jpg','2','2',1,'2018-12-14 10:09:08'),(7,'Hành tinh song song','2','1',1,'Hanh-tinh-song-song-Thai-Vu.mp3','\"Hành tinh song song\" - Là bài hát cùng tên với Album gồm 8 bài mới của Vũ sẽ được ra mắt vào đầu tháng 10 tới. “Hành tinh song song”, tên Album cũng như tên Liveshow sau 1 năm vắng bóng của mình, Vũ đã trở lại với một “khuôn hình” khác. Với một tập thể các hành tinh đối nghịch nhau, một “Vũ” trụ mới mở ra trước mắt các khán giả nghe nhạc, cũng như một Vũ mới sẽ xuất hiện. ','Một giấc mơ không dài, sao vẫn phải nhung nhớ<br/>Sao vẫn phải mong ngóng ai quay về với anh<br/>Em đã từng nghe, lời yêu thương nào buồn đến thế<br/>Em có từng nghe, lời dặn dò nào đau đến thế<br/><br/>Bởi vì anh, giấu em đi khỏi tâm trí<br/>Xin cho em về, về một nơi rất xa loài người<br/>Về một nơi phía sau mặt trời có anh đi cạnh em<br/><br/>Xin cho em về, về một nơi rất xa cuộc đời<br/>Về một nơi phía sau bộn bề<br/>Có anh đi cạnh em.','Hanh-tinh-song-song-Thai-Vu.jpg','7','7',1,'2018-12-14 10:09:08'),(8,'Hẹn một mai','5','1',1,'hen-mot-mai-bui-anh-tuan.mp3',NULL,'Có con đường nào bước qua<br/>Ta đến mang em món quà<br/>Hẹn hò yêu thương, ta say đến già<br/>Nắng mưa là chuyện nắng mưa<br/>Ai biết con tim đã vừa chạm đến hạnh phúc hay là chưa.<br/><br/>Vô tình là cơn gió mang yêu thương tới gần bên<br/>Giữ gìn là trọng trách đôi vai anh thêm sức mạnh<br/>Tin tưởng vào lời hứa xa bao lâu vẫn tìm nhau<br/>Anh chẳng hứa sẽ sang giàu<br/>Chỉ hứa yêu dài lâu<br/>Lỡ mai rời xa, ai biết được<br/>Chợt biến mất hay vội lạc những nốt yêu thương<br/>Mất nhau ngoài kia, không với kịp<br/>Vẽ ánh hoàng hôn nơi có đôi tim cùng nhịp<br/><br/>Có nhau là chuyện sớm thôi,<br/>Anh biết yêu thương đến rồi<br/>Ngần ngại đôi môi ai chưa ngỏ lời<br/>Nếu như chậm chạp đến sau<br/>Ký ức nơi kia có nhau<br/>Thì nắng mới ấm áp hãy đợi nhau','hen-mot-mai-bui-anh-tuan.jpg','1','1',1,'2018-12-14 10:09:08'),(9,'Một điều mà anh rất ngại nói ra','3','1',1,'mot-dieu-ma-anh-rat-ngai-noi-ra-hai-sam.mp3',NULL,'Và bao nhiêu đêm dài, anh mong có em ở lạ<br/>Ϲhẳng chi trông mong ở nơi hư không cho anh giấc ngủ của ngài<br/>Phải chăng anh biết đường, tìm ra những lẽ thường<br/>Phải chăng anh biết đường đi tìm em giữa bốn phương.<br/><br/>Ϲhiếc hôn thật xinh xắn, những nụ cười tươi tắn<br/>Thế nhưng thời gian với nhau của anh với em là hơi ngắn<br/>Hãу ở lại đâу, vòng taу bên anh ấm ôm tràn đầу.<br/>Ϲho dù anh chẳng chắc mình có chỉ ôm em ngủ saу.<br/><br/>Vì một điều mà anh rất ngại nói ra, không em ơi anh không có người thứ ba<br/>Ϲhỉ là điều mà anh rất ngại nói ra, với em.<br/>Mùa đông cho đêm naу thêm xanh, bao nhiêu câu ca trong anh<br/>Ɗa di da di con đường về phải đi bao nhiêu phố phường<br/><br/>Thôi em ơi, con đường xa, anh cũng ngại phải đưa em về nhà<br/>Anh cũng ngại phải chào ông chào bà, và anh cũng ngại phải cô đơn tại gia.<br/>Ɲhiều ngàу rồi mình có nhau, nhưng em thì nào có biết đâu<br/>Ɲhững suу nghĩ ở trong đầu, chẳng thể nói được ra cho quá mau.<br/><br/>Để rồi lại mong cho đêm mai em sang, cho dù anh chẳng dám le lám bẽ bàng nàу<br/>Ϲho dù anh, cho dù chắc mình có chỉ ôm em ngủ saу<br/>Và anh biết, chẳng cần thiết, phải như thế nếu vẫn muốn bên nhau<br/><br/>Một điều mà ai đã từng, một điều chẳng ai muốn dừng lại đâu<br/>Vì một điều mà anh rất ngại nói ra, không em ơi anh không có người thứ ba<br/>Ϲhỉ là điều mà anh rất ngại nói ra ','mot-dieu-ma-anh-rat-ngai-noi-ra-hai-sam.jpg','0','0',1,'2018-12-14 10:09:08'),(10,'Một ngày như hôm nay','3','1',1,'mot-ngay-nhu-hom-nay-hai-sam-khoa-vu.mp3',NULL,'Một ngày, như hôm nay, anh muốn nghe tiếng đàn.<br/>Một ngày, như hôm nay, anh muốn đi với nàng.<br/>Trên cao, là mây trắng, hồn bay theo gió thu.<br/>Anh viết lên những lời, hát ru.<br/>Một ngày, như hôm nay, chiếc lá rơi trên đầu.<br/>Vội vàng, anh nắm lấy, chiếc lá rơi thay màu.<br/>Theo em, bàn chân bước, cùng anh với tiếng cười.<br/>Anh tiếc phút giây này, mãi thôi.<br/><br/>Dù không gian có đứng lại, cho phút giây ngừng trôi.<br/>Dù em yêu chiếc lá vàng, đông vẫn sang mà thôi.<br/>Dù yêu nhau, ta biết rằng, ngày nào đó trong đời.<br/><br/>Chẳng ai biết được ngày mai, người ơi.<br/><br/>Một ngày, như hôm nay, chiếc lá rơi trên đầu.<br/>Vội vàng, anh nắm lấy, chiếc lá rơi thay màu.<br/>Theo em, bàn chân bước, cùng anh với tiếng cười.<br/>Anh tiếc phút giây này, mãi thôi.<br/><br/>Anh yêu em.','mot-ngay-nhu-hom-nay-hai-sam-khoa-vu.jpg','3','3',1,'2018-12-14 10:09:08'),(12,'temp1','1','3',1,'bai-hat-temp.mp3',NULL,'ac','bai-hat-img-default.jpg','1','1',11,'2018-12-14 10:28:20'),(18,'Qua những tiếng ve','12,13','1,5',1,'Qua-Nhung-Tieng-Ve-Tofu-Urabe-Xesi-VoVanDuc-5014360.mp3','Hiện chưa có thông tin.','[Tofu]:<br /><br />Vào những ngày đầu phượng nở<br />Anh thường bắt gặp những tiếng ve ở 1 nơi là ngõ nhà em...<br />Và có thể là bắt đầu từ hôm nay<br />Anh không lui tới đây nữa<br />Mùa hạ đã rơi bên thềm<br />Em nghe tiếng ve sầu hay chưa? <br />Du dương trong nắng êm đềm<br />Từ lúc nào đó, anh biết là nhớ<br />Tiếc là có gì đâu? <br />Chỉ là anh còn chút cảm xúc là yêu...<br />Mình cũng vì nhau mà đã đổi thay<br />Học cách yêu mỗi ngày, học cách để hiểu nhau<br />Từng ấy lựa chọn bình yên mình lại chọn chung lấy 1 kiểu đau...<br />Đến tháng 5...<br />Phượng vỹ khoe màu<br />Em chọn mùa hạ riêng nơi phương đó<br />Anh ở lại với tiếng ve sầu...<br />Khi nào mới vơi thương nhớ?<br />Chiều nay, nghe râm ran...<br />Lòng anh ngập đầy lá rụng cô đơn bỗng hóa thành giai điệu<br />Kìa em, ngân nga âm vang có tiếng ve mang tâm tư mùa hạ<br />Anh thấy buồn thương những ngày nắng đổ<br />Mùa hạ đó, thành phố nào mang em đi khỏi thị trấn nhỏ?<br />Nhiều đổi thay vòng quay cuộc sống<br />Em nồng say bên vòng tay ai đó giữa lòng thành phố<br />Giữa 1 mùa cánh phượng hồng bay có biết hôm nay lại 1 lần nhớ<br />Anh muốn cùng em đối thoại<br />Đành gửi qua những tiếng ve rồi bay về bên em nói lại<br />Em!<br />Hôm nay muôn trùng mây làm nắng vơi rồi<br />Anh muốn ngắm môi cười, anh muốn nhắn đôi lời:<br />\"Xin hãy mãi là những gì đẹp nhất trọn vẹn trong đôi mắt anh<br />Hãy giữ cho mình bình yên vì thời con gái sẽ trôi rất nhanh\"<br />Hạ nhớ em mái tóc trầm hương<br />Anh nhắn gửi lại trong vần dương <br />Em có nghe những tiếng ve buồn đau <br />Chỉ sau có 1 lần thương vương trên lối?<br />Tạm biệt!<br />Yêu dấu hôm qua gói lại<br />Anh đâu nói chuyện một mình, hôm nay Hạ cùng anh đối thoại!<br /><br />[Xesi]:<br /><br />Hạ bừng lên trong màu nắng<br />Âm vang cả trời xanh<br />Tiếng ve mang cả lời anh theo và nhắn đôi câu tình yêu<br />Mang bình yên bay về em giữa tháng 5 dài<br />Lặng những cơn mưa một chiều cao nguyên<br />Anh nghe thấy chỉ còn nhớ thương, hạ ơi...<br /><br />[Urabe]:<br /><br />Mưa mang về hơi đất phả<br />Khẽ rơi tiếng yêu đầu đời đến người ta xem là tất cả<br />Chắc đã không còn bóng ai đứng đợi một người nào đó giữa khoảng sân<br />Anh yêu em yêu cả mùa hạ<br />Tất cả đều xuất phát từ bản thân<br />Một màu rực cháy phía bên đường chiếu sang đỏ hoe mắt<br />Hạ cũ còn vương, mùa mới vừa tới phượng đã vội khoe sắc<br />E ấp trong từng tán lá là những tiếng ve mỗi lúc một cao giọng<br />Che lấp đôi mắt sầu nỗi buồn bắt đầu khi tim mình dao động<br />Và điều tuyệt vời nhất là được biết em thế nhưng mà đôi lúc<br />Chẳng thể nào nói những điều muốn nói dù tim mình thôi thúc<br />Chọn cách mang theo nỗi niềm về chân trời xa không trông thấy rõ<br />Mong cháy đỏ một màu phượng vĩ ươm cho tình em bên trong đấy nở<br />Rồi lúc nào đấy hãy về cùng anh đi qua đất trời trập trùng đồi nương<br />Về những ngày ta còn thơ bé, anh chẳng muốn mình ngập ngừng lời thương<br />Để phải giữ riêng mình mùa hạ xanh đó<br />Anh chỉ có thể yêu em, bằng tất cả những gì mà anh có<br /><br />[Xesi]:<br /><br />Hạ về đâu, đợi chờ ai, mà sao nghe tiếng ve u sầu<br />Chiều đã rơi, nằm nghiêng góc sân<br />Mong có đôi giữa 1 khung trời<br />Tìm làn mây trôi về miền xa, chuyện ngày qua đã chia đôi đường<br />Có đêm mơ nào quay về, xin để tâm hồn tôi nhớ em','qua-nhung-tieng-ve-tns.jpg','22','22',1,'2018-12-14 10:28:20'),(19,'Lemon Tree','14','6',2,'Lemon-Tree -Fools-Garden.mp3','Hiện chưa có thông tin.','Hiện chưa có lời.','lemon-tree.jpg','0','0',1,'2018-12-14 10:28:20'),(20,'Mấy Khi','15','1',1,'May-khi-the-flob.mp3','Hiện chưa có thông tin.','Hiện chưa có lời.','may-khi-the-flob-band.jpg','11','11',1,'2018-12-14 10:28:20'),(21,'25','18,19','1,5',1,'25Remix-TaoMasew-5181304_hq.mp3','Hiện chưa có thông tin.','Lần đầu tiên anh mong tìm ra cho riêng mình<br/>Một ai quan tâm và nghe lời anh hát<br/>Ngồi kề bên đưa anh bờ vai khi anh buồn<br/>Lặng im em khâu lành tim từng vỡ nát.<br/>Có những lúc cô đơn nhưng anh không nói<br/>Lê đôi bàn chân bâng khuâng tìm đâu yên vui ngày xưa vẫn đong đầy<br/>Nếu kí ức hôm qua tan như mây khói,<br/>xin em đừng đi ngang qua đường chúng ta thường đan tay bước qua.<br/>Bóng tối khiến đôi ta về ngược lối<br/>Có những thứ anh chưa từng được nói<br/>Nếu biết trước anh không thể dừng lại<br/>Thì anh cũng đã chẳng đi.<br/>Một ngày khác đã đến hôm nay<br/>Căn phòng anh cô đơn chẳng còn chút nắng<br/>Sau ô cửa, giam mình trong những tiếng mơ hồ<br/>Anh nghe lời em thoáng qua, nghe thời gian đứng yên nghiêng mình<br/>Nhìn mọi thứ trống vắng mông lung<br/>Xung quanh tường cao nên anh nhìn sao chẳng thấy<br/>Em ơi mình xa bao lâu rồi đã trôi đi<br/>Đôi mi của em đã khô, con tim của anh tan vỡ<br/>Anh còn không nhớ nổi ngày cuối cùng trời nắng hay mưa<br/>Bên nhau hôm đó mình có nắm tay chưa<br/>Nếu chưa cho anh xin của em thêm chỉ một ngày nữa<br/>Để anh an tâm rời bỏ em, không một chút dây dưa<br/>Anh không biết trước chuyện hôm nay em ơi,xa là không gần<br/>Chắc em không đợi, còn chân anh bị bong gân<br/>Đẩy xe về, thành phố trên lưng anh nặng lắm<br/>Anh yêu em được hai năm,giờ anh bệnh thì ai thăm ?<br/>Chắc đơn giản phần của anh là sai lầm<br/>Dù cho sâu trong thâm tâm anh nghĩ mình lâu hơn trăm năm<br/>Những thứ anh tặng em, xin em giữ đừng bụi bặm<br/>Vì mình cũ kĩ được rồi nhiều vạn *** xa xăm<br/>Anh đã khóc, cười, khô cả nước mắt<br/>Nhưng thực tế, chia tay nhau là bước ngoặc<br/>Để mình hoàn thành trọn vẹn lí do sống trên đời<br/>Dù những thứ mình mong đợi không được bên nhau, em ơi.<br/>Có những lúc cô đơn nhưng anh không nói<br/>Lê đôi bàn chân bâng khuâng tìm đâu yên vui ngày xưa vẫn đong đầy<br/>Nếu kí ức hôm qua tan như mây khói,<br/>xin em đừng đi ngang qua đường chúng ta thường đan tay bước qua.<br/>Một ngày khác đã đến hôm nay<br/>Căn phòng anh cô đơn chẳng còn chút nắng<br/>Sau ô cửa, giam mình trong những tiếng mơ hồ<br/>Anh nghe lời em thoáng qua, nghe thời gian đứng yên nghiêng mình<br/>Nhìn mọi thứ trống vắng mông lung<br/>Xung quanh tường cao nên anh nhìn sao chẳng thấy<br/>Em ơi mình xa bao lâu rồi đã trôi đi<br/>Đôi mi của em đã khô, con tim của anh tan vỡ ','25-tao-rapper.jpg','25','25',1,'2018-12-14 10:28:20');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` text NOT NULL,
  `dateOfBirth` int(2) unsigned zerofill NOT NULL,
  `monthOfBirth` int(2) unsigned zerofill NOT NULL,
  `yearOfBirth` int(4) unsigned NOT NULL,
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '0: female\n1: male\n2: others',
  `creationDate` date DEFAULT NULL,
  `user_img_path` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ACongMusic','nguyenhuuthuat09@gmail.com','$2a$10$a/5ub7Lz6jRZH79lI8nZ0ez9oB5nz5tTC0pgNjGlXfv.L0vY35iCW',09,10,1998,1,'2018-12-20','ACongMusic-avatar.png'),(2,'user1','user1@gmail.com','$2a$10$mFWenW2rdNRU.Z/Azj.Cs.gjbzs3cOuJjg3tBQYHMObbn9/Un.wSy',01,02,1995,1,'2018-12-20','avatar-user-default.png'),(3,'user2','user2@gmail.com','$2a$10$NlHnOfiUT2lUIz9u5FogneMArumsutYC.GNouy1BxetAV3QzCMBEe',01,02,1995,2,'2018-12-20','avatar-user-default.png'),(4,'user3','user3@gmail.com','$2a$10$fB0s3QqwW2V/3ueqa6ZHL.ec1mG/qGt5ROHCufBfTjSSoA4/VRXdG',01,02,1995,1,'2018-12-20','avatar-user-default.png'),(5,'user4','user4@gmail.com','$2a$10$IOuSrElOxqkweLNugM.hSet41ByVqQrYvddGQVtpQD4QfmeXHa53W',01,02,1995,2,'2018-12-20','avatar-user-default.png'),(6,'user5','user5@gmail.com','$2a$10$z3NY2bnPqkewFT92LQlvq.tnPTEkRrvajsum9/3Es7lmX8zlOY.EW',01,02,1995,1,'2018-12-20','avatar-user-default.png'),(7,'user6','user6@gmail.com','$2a$10$I7qRaiqUUAgSaH35AVH07Ox6RAShdOI9bY5aC57B1rJ84kQab4Pou',01,02,1995,2,'2018-12-20','avatar-user-default.png'),(8,'user7','user7@gmail.com','$2a$10$8Qpn/FIgyWSGBD9zamTso.vChUrnnD8mVW5CR2g.RSTI2ua5t5L.O',01,02,1995,1,'2018-12-20','avatar-user-default.png'),(9,'user8','user8@gmail.com','$2a$10$8Qpn/FIgyWSGBD9zamTso.vChUrnnD8mVW5CR2g.RSTI2ua5t5L.O',01,02,1995,0,'2018-12-20','avatar-user-default.png'),(11,'user10','user10@gmail.com','$2a$10$YBJUQZVNawzsj1O5B/f0LuQmw.nDEQyrJRfQBdPZ9JksC/.WMMIhG',01,02,1995,1,'2018-12-20','avatar-user-default.png'),(14,'user13','user13@gmail.com','$2a$10$Fiy2zQFCQxltCbur6rmhAODRLDd/eEPEmMDOoZ2ulxgBTqx7QU6Aa',11,10,1995,0,'2018-12-20','avatar-user-default.png'),(15,'user14','user14@gmail.com','$2a$10$duAEA85IxgPAOAd4MxdoJuOggt7AQhacLQR6sGktVSkbcDuycmQze',11,02,1991,0,'2018-12-21','avatar-user-default.png'),(17,'user15','user15@gmail.com','$2a$10$Pgds.IQslVFhdojeExRazuwMprt5K40L7ruTeytJjZWxBbbB.rBCu',11,09,1989,0,'2018-12-23','avatar-user-default.png'),(18,'TranKhanhHuyen','huyentran290598@gmai.com','$2a$10$5YMDanLF9Md3tDYc3oys7uWhwQj85PQglKEgmefNPYHn//AQPksEy',29,05,1998,0,'2018-12-23','TranKhanhHuyen-avatar.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-04 22:46:18
