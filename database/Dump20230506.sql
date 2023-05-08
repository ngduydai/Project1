-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  KEY `user_id_cart_idx` (`user_id`),
  KEY `product_id_cart_idx` (`product_id`),
  KEY `product_name_cart_idx` (`product_name`),
  CONSTRAINT `product_id_cart` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `user_id_cart` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Điện thoại'),(2,'Laptop'),(3,'Máy tính bảng'),(4,'Đồng hồ');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `time` datetime NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_details` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_details`),
  KEY `product_id_idx` (`product_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_details`) REFERENCES `order_details` (`id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `time` datetime NOT NULL,
  `total` int NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `category_id` int NOT NULL,
  `promotion_id` int NOT NULL,
  `product_details` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_product_idx` (`category_id`),
  KEY `promotion_id_product_idx` (`promotion_id`),
  KEY `product_details_id_idx` (`product_details`),
  CONSTRAINT `category_id_product` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `product_details_id` FOREIGN KEY (`product_details`) REFERENCES `product_details` (`id`),
  CONSTRAINT `promotion_id_product` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Điện thoại Nokia 110 4G','Nokia',1,1,1),(2,'Điện thoại Nokia C21 Plus','Nokia',1,2,2),(3,'Laptop HP 240 G8','HP',2,1,3),(4,'Laptop HP 245 G9','HP',2,1,4),(5,'Điện thoại Nokia G22','Nokia',1,1,5),(6,'Điện thoại iPhone 11','Iphone',1,10,6),(7,'Điện thoại Samsung Galaxy A33','Samsung',1,1,7),(8,'Điện thoại Samsung Galaxy A73','Samsung',1,6,8),(9,'Đồng hồ CITIZEN NH7501-85A','Citizen',4,1,9),(10,'Đồng hồ CITIZEN NK0001-84E','Citizen',4,4,10),(11,'Máy tính bảng Xiaomi Redmi Pad','Xiaomi',3,1,11),(12,'MacBook Pro 16 M1 Pro 2021','MacBook',2,8,12),(13,'Điện thoại OPPO Reno7 Z','Oppo',1,1,13),(14,'Điện thoại OPPO Reno8 Pro','Oppo',1,11,14),(15,'Điện thoại Nokia C31','Nokia',1,1,15),(16,'Đồng hồ CASIO AE-1200WHD-1AVDF','Casio',4,1,16),(17,'Máy tính bảng Samsung Galaxy Tab A7 Lite','Samsung',3,2,17),(18,'Máy tính bảng Samsung Galaxy Tab A8','Samsung',3,1,18),(19,'Điện thoại iPhone 11 Pro Max','Iphone',1,11,19),(20,'Điện thoại Xiaomi Redmi Note 11 Pro','Xiaomi',1,2,20),(21,'Laptop Dell Inspiron 14 5420','Dell',2,1,21),(22,'Laptop Dell Vostro 15 3520','Dell',2,1,22),(23,'Laptop Dell Inspiron 16 5620','Dell',2,9,23),(24,'Laptop HP Pavilion 15 eg2035TX','HP',2,1,24),(25,'MacBook Air M2 2022','MacBook',2,8,25),(26,'Laptop Asus VivoBook X515MA','Asus',2,1,26),(27,'Laptop Asus TUF Gaming F15 FX506LHB','Asus',2,1,27),(28,'MacBook Pro 16 M2 Pro 2023','MacBook',2,10,28),(29,'Laptop Asus Gaming TUF Dash F15 FX517ZC','Asus',2,5,29),(30,'Máy tính bảng Samsung Galaxy Tab S8 Ultra','Samsung',3,10,30),(31,'Máy tính bảng iPad 9','Ipad',3,1,31),(32,'Máy tính bảng iPad 10','Ipad',3,1,32),(33,'Máy tính bảng OPPO Pad Air','Oppo',3,1,33),(34,'Máy tính bảng iPad Pro M1','Ipad',3,11,34),(35,'Máy tính bảng iPad Air 5 M1','Ipad',3,9,35),(36,'Đồng hồ CITIZEN NH8391-51X','Citizen',4,1,36),(37,'Đồng hồ Casio MTD-125D-1A2VDF','Casio',4,5,37),(38,'Đồng hồ Casio LTP-VT01GL-9BUDF','Casio',4,1,38),(39,'Điện thoại iPhone 12','Iphone',1,10,39),(40,'Điện thoại iPhone 12 Pro Max','Iphone',1,11,40),(41,'Điện thoại Xiaomi Redmi Note 12 Pro','Xiaomi',1,1,41),(42,'Điện thoại Samsung Galaxy S22 Ultra','Samsung',1,3,42),(43,'Điện thoại Xiaomi 13 Pro','Xiaomi',1,7,43),(44,'Điện thoại iPhone 13','Iphone',1,10,44),(45,'Điện thoại iPhone 13 Pro Max','Iphone',1,11,45),(46,'Điện thoại Samsung Galaxy S23 Plus','Samsung',1,6,46),(47,'Điện thoại Samsung Galaxy S23 Ultra','Samsung',1,4,47),(48,'Điện thoại iPhone 14','Iphone',1,10,48),(49,'Điện thoại iPhone 14 Pro','Iphone',1,10,49),(50,'Điện thoại iPhone 14 Pro Max','Iphone',1,11,50);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `img` varchar(80) NOT NULL,
  `describe` mediumtext NOT NULL,
  `details` varchar(80) NOT NULL,
  `star` int DEFAULT NULL,
  `number_rated` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,800000,10,'nokia-110-4g.jpg','Nokia chính thức trình làng chiếc điện thoại Nokia 110 4G phiên bản nâng cấp của Nokia 110 2019 có điểm nhấn chính là công nghệ kết nối Internet 4G thỏa thích trải nghiệm mọi lúc, mọi nơi cùng với một thiết kế vô cùng mới mẻ và sang trọng.','nokia-110-4g.html',NULL,NULL),(2,4490000,12,'nokia-c21-plus.jpg','Tiếp nối sự thành công của những sản phẩm gần đây tại thị trường Việt Nam, lần này hãng Nokia đã mang đến mẫu điện thoại Nokia C21 Plus - sở hữu trong mình viên pin mang lại thời gian trải nghiệm lâu dài và sử dụng an tâm hơn với 2 năm cập nhật bảo mật.','nokia-c21-plus.html',NULL,NULL),(3,10490000,11,'hp-240-g8-i3.jpg','Vẻ ngoài thanh lịch, cấu hình ổn định cùng mức giá lý tưởng là những ưu điểm mà sinh viên hay dân văn phòng nên lựa chọn chiếc laptop HP 240 G8 i3 (6L1A1PA) làm trợ thủ đắc lực hàng đầu cho các công việc thiết yếu hằng ngày. ','hp-240-g8-i3.html',NULL,NULL),(4,12490000,11,'hp-245-g9-r5.jpg','Laptop HP 245 G9 R5 5625U (6L1N9PA) được HP ra mắt trên thị trường với nhiều cải tiến vượt trội so với thế hệ trước, nhắm trực tiếp đến đối tượng người dùng là sinh viên hay nhân viên văn phòng.','hp-245-g9-r5.html',NULL,NULL),(5,3420000,12,'nokia-g22.jpg','Nokia G22 mẫu điện thoại được Nokia cho ra mắt tại thị trường Việt Nam. Điện thoại sở hữu vẻ ngoài đơn giản, màn hình lớn kèm viên pin khủng cho trải nghiệm dài lâu, cùng một hiệu năng ổn định với các tác vụ thường ngày.','nokia-g22.html',NULL,NULL),(6,11590000,23,'iphone-11.jpg','Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.','iphone-11.html',NULL,NULL),(7,6590000,18,'samsung-galaxy-a33.jpg','Samsung Galaxy A33 5G 6GB ra mắt vào ngày 17/03, được xem là bản cập nhật khá lớn so với thế hệ tiền nhiệm Galaxy A32 về thiết kế đến thông số kỹ thuật bên trong, nhằm mang đến vẻ ngoài đẹp mắt cũng như cạnh tranh trực tiếp ở phần hiệu năng đối với các đối thủ cùng phân khúc giá.','samsung-galaxy-a33.html',NULL,NULL),(8,11990000,12,'samsung-galaxy-a73.jpg','Samsung Galaxy A73 5G 128GB được xem là sản phẩm nổi bật nhất dòng Galaxy A 2022 mới ra mắt, máy trang bị bộ thông số kỹ thuật ấn tượng về phần hiệu năng, chất lượng màn hình và nổi bật nhất trong số đó là camera khi nó đem lại bức ảnh có độ phân giải lên đến 108 MP.','samsung-galaxy-a73.html',NULL,NULL),(9,6219000,15,'citizen-nh7501-85a.jpg','Đồng hồ Citizen đến từ xứ sở hoa anh đào - Nhật Bản. Mỗi dòng đồng hồ Citizen đều có kiểu thiết kế độc đáo, nhà sản xuất luôn cập nhật các xu hướng hiện đại nhưng vẫn duy trì được nét đặc trưng riêng của mỗi dòng sản phẩm từ trước đến nay. Mẫu đồng hồ này phù hợp với những ai thích sự thanh lịch và sang trọng.','citizen-nh7501-85a.html',NULL,NULL),(10,12600000,21,'citizen-nk0001-84e.jpg','Mẫu đồng hồ đến từ thương hiệu Citizen - một trong những thương hiệu nổi tiếng và uy tín đến từ Nhật Bản. Sản phẩm với thiết kế vô cùng tinh tế và thanh lịch.','citizen-nk0001-84e.html',NULL,NULL),(11,6290000,19,'xiaomi-redmi-pad.jpg','Xiaomi Redmi Pad (3GB/64GB) là cái tên được nhắc đến khá nhiều trong giới công nghệ gần đây, máy sở hữu một mức giá bán không quá cao nhưng được trang bị bộ thông số cực kỳ xịn sò. Hứa hẹn sẽ là chiếc máy tính bảng Xiaomi đáng mong đợi trong giai đoạn nửa cuối năm 2022.','xiaomi-redmi-pad.html',NULL,NULL),(12,58490000,11,'macbook-pro-16-m1-pro-2021.jpg','MacBook Pro 16 M1 Pro 2021 không chỉ sở hữu thiết kế mới trông vuông vức hơn mà còn mang trong mình sức mạnh hiệu năng vượt trội đến từ bộ vi xử lý M1 Pro, cho mình trải nghiệm sử dụng mượt mà và ấn tượng như một dân chuyên đúng nghĩa.','macbook-pro-16-m1-pro-2021.html',NULL,NULL),(13,7490000,17,'oppo-reno7-z.jpg','OPPO đã trình làng mẫu Reno7 Z 5G với thiết kế OPPO Glow độc quyền, camera mang hiệu ứng như máy DSLR chuyên nghiệp cùng viền sáng kép, máy có một cấu hình mạnh mẽ và đạt chứng nhận xếp hạng A về độ mượt.','oppo-reno7-z.html',NULL,NULL),(14,18990000,14,'oppo-reno8-pro.jpg','OPPO Reno8 Pro 5G là chiếc điện thoại cao cấp được nhà OPPO ra mắt vào thời điểm 09/2022, máy hướng đến sự hoàn thiện cao cấp ở phần thiết kế cùng khả năng quay chụp chuyên nghiệp nhờ trang bị vi xử lý hình ảnh MariSilicon X chuyên dụng.','oppo-reno8-pro.html',NULL,NULL),(15,3190000,13,'nokia-c31.jpg','Nokia C31 (3GB/32GB) là chiếc điện thoại được nhà HMD Global ra mắt và kinh doanh chính thức tại thị trường Việt Nam vào tháng 10/2022, máy được chú trọng khá nhiều về phần dung lượng pin và màn hình, điều này nhằm mang đến cho người dùng những trải nghiệm xem phim, lướt web tốt hơn.','nokia-c31.html',NULL,NULL),(16,1272000,16,'casio-ae-1200whd-1avdf.jpg','Thương hiệu đồng hồ Casio của Nhật Bản, uy tín và chất lượng nổi tiếng thế giới','casio-ae-1200whd-1avdf.html',NULL,NULL),(17,4490000,20,'samsung-galaxy-tab-a7-lite.jpg','Máy tính bảng Samsung Galaxy Tab A7 Lite là phiên bản rút gọn của dòng tablet \"ăn khách\" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền.','samsung-galaxy-tab-a7-lite.html',NULL,NULL),(18,6990000,13,'samsung-galaxy-tab-a8.jpg','Máy tính bảng Samsung Galaxy Tab A8 (2022) có kích thước màn hình 10.5 inch, tỉ lệ 16:10 cho không gian hiển thị rộng hơn, rất lý tưởng cho người dùng trải nghiệm xem phim, live stream, chơi game. ','samsung-galaxy-tab-a8.html',NULL,NULL),(19,13490000,14,'iphone-11-pro-max.jpg','iPhone 11 Pro Max 256GB là chiếc iPhone cao cấp nhất trong bộ 3 iPhone Apple giới thiệu trong năm 2019 và quả thực chiếc smartphone này mang trong mình nhiều trang bị xứng đáng với tên gọi \"Pro\".','iphone-11-pro-max.html',NULL,NULL),(20,11000000,11,'xiaomi-redmi-note-11-pro.jpg','Xiaomi Redmi Note 11 Pro 4G mang trong mình khá nhiều những nâng cấp cực kì sáng giá. Là chiếc điện thoại có màn hình lớn, tần số quét 120 Hz, hiệu năng ổn định cùng một viên pin siêu trâu.','xiaomi-redmi-note-11-pro.html',NULL,NULL),(21,21990000,20,'dell-inspiron-14-5420.jpg','Laptop Dell Inspiron 14 5420 i5 1235U (i5U085W11SLU) là một sự lựa chọn không thể hợp lý hơn khi bạn chọn mua laptop học tập - văn phòng nhờ lối thiết kế hiện đại cùng những đường nét sang trọng, cấu hình đủ mạnh mẽ có thể vận hành mọi tác vụ văn phòng.','dell-inspiron-14-5420.html',NULL,NULL),(22,19490000,18,'dell-vostro-15-3520.jpg','Laptop Dell Vostro 15 3520 i5 1235U (5M2TT2) mới nhất đến từ nhà Dell sẽ khiến bạn thực sự ấn tượng với kiểu dáng hiện đại, sở hữu những thông số kỹ thuật mạnh mẽ có thể chạy mượt những tác vụ học tập, văn phòng.','dell-vostro-15-3520.html',NULL,NULL),(23,26590000,10,'dell-inspiron-16-5620.jpg','Laptop Dell Inspiron 16 5620 i7 1255U (N6I7009W1) sở hữu màn hình lớn 16 inch, bộ vi xử lý Intel Core i7 thế hệ 12 mạnh mẽ và bộ nhớ RAM 16 GB, những trang bị hoàn hảo cho những bạn học sinh, sinh viên và nhân viên văn phòng có thể hoàn thành tốt công việc và bài tập được giao.','dell-inspiron-16-5620.html',NULL,NULL),(24,20590000,20,'hp-pavilion-15-eg2035tx.jpg','Sự xuất hiện của con chip Intel Gen 12 đã làm cho laptop HP Pavilion 15 eg2035TX i5 (6K781PA) trở thành một trong những đối thủ đáng gờm ở phân khúc laptop học tập - văn phòng, cùng với đó là vẻ ngoài nhã nhặn và card rời MX 550 cũng là những ưu điểm đáng để sở hữu. ','hp-pavilion-15-eg2035tx.html',NULL,NULL),(25,30000000,14,'macbook-air-m2-2022.jpg','Sau 14 năm, ba lần sửa đổi và hai kiến trúc bộ vi xử lý khác nhau, kiểu dáng mỏng dần mang tính biểu tượng của MacBook Air đã đi vào lịch sử. Thay vào đó là một chiếc MacBook Air M2 với thiết kế hoàn toàn mới, độ dày không thay đổi tương tự như MacBook Pro, đánh bật mọi rào cản với con chip Apple M2 đầy mạnh mẽ.','macbook-air-m2-2022.html',NULL,NULL),(26,7890000,12,'asus-vivobook-x515ma.jpg','Chiếc laptop học tập - văn phòng trong phân khúc dưới 10 triệu đồng với thiết kế thanh lịch, hiệu năng ổn định phục vụ tốt cho nhu cầu làm việc văn phòng hằng ngày dành cho học sinh, sinh viên, đó là laptop Asus VivoBook X515MA N4020 (BR480W) sẵn sàng đồng hành cùng bạn trên một hành trình mới.','asus-vivobook-x515ma.html',NULL,NULL),(27,20990000,22,'asus-tuf-gaming-fx506lhb.jpg','Laptop Asus TUF Gaming F15 FX506LHB i5 10300H (HN188W) được trang bị bộ vi xử lý Intel dòng H mạnh mẽ, card đồ họa rời NVIDIA và ổ cứng SSD tốc độ cao, tất cả tạo nên một \"cỗ máy\" mạnh mẽ, đáp ứng tốt nhu cầu chơi game ở mức độ cấu hình cao.','asus-tuf-gaming-fx506lhb.html',NULL,NULL),(28,65990000,12,'macbook-pro-16-m2-pro-2023.jpg','Apple vừa giới thiệu đến người dùng chiếc MacBook Pro 16 inch M2 Pro 2023 có kiểu dáng mỏng nhẹ nhưng bên trong là một hiệu năng vô cùng mạnh mẽ đáp ứng được mọi tác vụ, hứa hẹn sẽ trở thành một người bạn đồng hành tuyệt vời trong công việc, học tập và giải trí. ','macbook-pro-16-m2-pro-2023.html',NULL,NULL),(29,28990000,19,'asus-tuf-gaming-fx517zc.jpg','Sở hữu ngoại hình ấn tượng thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ đến từ laptop CPU thế hệ 12 mới nhất, Asus Gaming TUF Dash F15 FX517ZC i5 (HN077W) là lựa chọn xứng tầm cho mọi nhu cầu chiến game giải trí hay đồ hoạ - kỹ thuật của người dùng.','asus-tuf-gaming-fx517zc.html',NULL,NULL),(30,30990000,14,'samsung-galaxy-tab-s8-ultra.jpg','Samsung Galaxy Tab S8 Ultra ra mắt với kích thước màn hình siêu to cùng một cấu hình mạnh mẽ, được xem là thiết bị phù hợp đối với những ai thường xuyên làm các công việc thiết kế hay thao tác trên trình duyệt web, bên cạnh đó Tab S8 Ultra còn mang đến những trải nghiệm tương tự một chiếc laptop khi sử dụng kèm với bàn phím.','samsung-galaxy-tab-s8-ultra.html',NULL,NULL),(31,9990000,8,'ipad-9.jpg','Sau thành công của iPad 8, Apple cho đã cho ra mắt máy tính bảng iPad 9 WiFi 64GB - phiên bản tiếp theo của dòng iPad 10.2 inch, về cơ bản nó kế thừa những điểm mạnh từ các phiên bản trước đó và được cải tiến thêm hiệu suất, trải nghiệm người dùng nhằm giúp nhu cầu sử dụng giải trí và làm việc tiện lợi, linh hoạt hơn.','ipad-9.html',NULL,NULL),(32,12990000,16,'ipad-10.jpg','Sau khi trình làng hàng loạt mẫu iPhone vào tháng 09/2022 thì Apple cũng đã tiếp tục giới thiệu series iPad mới cho năm 2022. Trong đó iPad 10 WiFi 64GB là cái tên được hãng chú trọng khá nhiều về việc tối ưu giá thành nhằm giúp người dùng có thể dễ dàng tiếp cận. Máy hỗ trợ hệ điều hành iPadOS 16 cùng con chip Apple A14 Bionic giúp mang lại hiệu năng vượt trội.','ipad-10.html',NULL,NULL),(33,7990000,9,'oppo-pad-air.jpg','OPPO Pad Air 128GB là một máy tính bảng đáng chú ý, được thiết kế để đáp ứng nhu cầu đa dạng của người dùng. Với một số thông tin nổi bật như màn hình lớn và hiệu năng ổn định, OPPO Pad Air có thể là lựa chọn tuyệt vời cho những người dùng cần một máy tính bảng đa năng và tiện lợi.','oppo-pad-air.html',NULL,NULL),(34,55990000,6,'ipad-pro-m1.jpg','Máy tính bảng iPad Pro M1 11 inch WiFi Cellular 2TB (2021) mang vẻ ngoài sang trọng, chắc chắn của lớp vỏ kim loại nguyên khối hoàn thiện tinh tế, thiết kế vuông vức hiện đại, kích thước màn hình 11 inch sử dụng thuận tiện như 1 chiếc laptop mini dùng cho cá nhân.','ipad-pro-m1.html',NULL,NULL),(35,19990000,10,'ipad-air-5-m1.jpg','So với chiếc iPad Air 5 M1 Wifi 64GB thì chiếc iPad Air 5 M1 Wifi Cellular 64GB đã có một điểm khác biệt đáng kể đó là phương thức kết nối khi bạn vừa có thể sử dụng Wifi và vừa sử dụng mạng di động một cách bình thường nhưng vẫn cho một trải nghiệm rất tuyệt vời.','ipad-air-5-m1.html',NULL,NULL),(36,8550000,33,'citizen-nh8391-51x.jpg','Đồng hồ Citizen đến từ xứ sở hoa anh đào - Nhật Bản. Mỗi dòng đồng hồ Citizen đều có kiểu thiết kế độc đáo, nhà sản xuất luôn cập nhật các xu hướng hiện đại nhưng vẫn duy trì được nét đặc trưng riêng của mỗi dòng sản phẩm từ trước đến nay. Mẫu đồng hồ này phù hợp với những ai thích sự thanh lịch và sang trọng.','citizen-nh8391-51x.html',NULL,NULL),(37,3555000,31,'casio-mtd-125d-1a2vdf.jpg','Thương hiệu đồng hồ nổi tiếng đến từ Nhật Bản không ngừng cải tiến và cho ra mắt những dòng sản phẩm chất lượng phù hợp với nhiều đối tượng khách hàng. Những dòng sản phẩm nổi tiếng của Casio là: G-Shock với thiết kế mạnh mẽ cùng độ bền cao, Edifice thiết kế hiện đại cùng nhiều tính năng vượt trội, Sheen với thiết kế cổ điển và sang trọng.','casio-mtd-125d-1a2vdf.html',NULL,NULL),(38,1166000,32,'casio-ltp-vt01gl-9budf.jpg','Thương hiệu đồng hồ nổi tiếng đến từ Nhật Bản không ngừng cải tiến và cho ra mắt những dòng sản phẩm chất lượng phù hợp với nhiều đối tượng khách hàng. Những dòng sản phẩm nổi tiếng của Casio là: G-Shock với thiết kế mạnh mẽ cùng độ bền cao, Edifice thiết kế hiện đại cùng nhiều tính năng vượt trội, Sheen với thiết kế cổ điển và sang trọng.','casio-ltp-vt01gl-9budf.html',NULL,NULL),(39,14990000,24,'iphone-12.jpg','Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12.','iphone-12.html',NULL,NULL),(40,16990000,20,'iphone-12-pro-max.jpg','Chiếc điện thoại iPhone 12 Pro Max 256 GB là mẫu smartphone sở hữu nhiều tính năng nổi bật với hệ thống camera chất lượng, hiệu năng vượt trội hay hỗ trợ kết nối 5G hứa hẹn sẽ là mẫu sản phẩm mang lại cảm giác trải nghiệm tối ưu cho người dùng.','iphone-12-pro-max.html',NULL,NULL),(41,9590000,17,'xiaomi-redmi-note-12-pro.jpg','Xiaomi Redmi Note 12 Pro 5G là mẫu điện thoại thuộc dòng Redmi Note được chính thức ra mắt trong năm 2023, máy mang trên mình những cải tiến vượt trội về thiết kế, camera và hiệu năng, đáp ứng mượt mà hầu hết các nhu cầu khác nhau của người dùng.','xiaomi-redmi-note-12-pro.html',NULL,NULL),(42,30990000,42,'samsung-galaxy-s22-ultra.jpg','Galaxy S22 Ultra 5G chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series mà Samsung đã cho ra mắt. Tích hợp bút S Pen hoàn hảo trong thân máy, trang bị vi xử lý mạnh mẽ cho các tác vụ sử dụng vô cùng mượt mà và nổi bật hơn với cụm camera không viền độc đáo mang đậm dấu ấn riêng.','samsung-galaxy-s22-ultra.html',NULL,NULL),(43,29990000,22,'xiaomi-13-pro.jpg','Sau biết bao thông tin rò rỉ Xiaomi 13 Pro cũng đã chính thức giới thiệu tại thị trường Việt Nam với sự háo hức đến từ các Mi fan trong nước, đây dự kiến sẽ là mẫu điện thoại quốc dân cho năm 2023 bởi máy sở hữu con chip Snapdragon 8 Gen 2 mạnh mẽ cùng với đó là sự cộng tác với nhà Leica để khiến mọi người dùng đam mê nhiếp ảnh mê hoặc.','xiaomi-13-pro.html',NULL,NULL),(44,17090000,38,'iphone-13.jpg','Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.','iphone-13.html',NULL,NULL),(45,19090000,31,'iphone-13-pro-max.jpg','iPhone 13 Pro Max 256GB - siêu phẩm mang trên mình bộ vi xử lý Apple A15 Bionic hàng đầu, màn hình Super Retina XDR 120 Hz, cụm camera khẩu độ f/1.5 cực lớn, tất cả sẽ mang lại cho bạn những trải nghiệm tuyệt vời chưa từng có.','iphone-13-pro-max.html',NULL,NULL),(46,25990000,32,'samsung-galaxy-s23-plus.jpg','Samsung Galaxy S23+ 5G 256GB là chiếc điện thoại thuộc dòng cao cấp nhất của Samsung được giới thiệu vào tháng 02/2023. Máy sở hữu một vài điểm ấn tượng như camera có khả năng quay video 8K, cùng với đó là con chip Snapdragon 8 Gen 2 mạnh mẽ hàng đầu giới điện thoại Android.','samsung-galaxy-s23-plus.html',NULL,NULL),(47,31990000,35,'samsung-galaxy-s23-ultra.jpg','Samsung Galaxy S23 Ultra 5G 256GB là chiếc smartphone cao cấp nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy và camera lên đến 200 MP, xứng danh là chiếc flagship Android được mong đợi nhất trong năm 2023.','samsung-galaxy-s23-ultra.html',NULL,NULL),(48,21990000,41,'iphone-14.jpg','iPhone 14 128GB được xem là mẫu smartphone bùng nổ của nhà táo trong năm 2022, ấn tượng với ngoại hình trẻ trung, màn hình chất lượng đi kèm với những cải tiến về hệ điều hành và thuật toán xử lý hình ảnh, giúp máy trở thành cái tên thu hút được đông đảo người dùng quan tâm tại thời điểm ra mắt.','iphone-14.html',NULL,NULL),(49,29990000,46,'iphone-14-pro.jpg','Apple trong sự kiện ngày 8/9 đã giới thiệu đến người dùng mẫu iPhone 14 Pro 256GB mang những cải tiến về mặt thiết kế cũng như cấu hình phần cứng, hứa hẹn một sản phẩm mạnh mẽ đáp ứng mọi nhu cầu của bạn.','iphone-14-pro.html',NULL,NULL),(50,32990000,50,'iphone-14-pro-max.jpg','Mới đây thì chiếc điện thoại iPhone 14 Pro Max 256GB cũng đã được chính thức lộ diện trên toàn cầu và đập tan bao lời đồn đoán bấy lâu nay, bên trong máy sẽ được trang bị con chip hiệu năng khủng cùng sự nâng cấp về camera đến từ nhà Apple.','iphone-14-pro-max.html',NULL,NULL);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `discount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'Không khuyến mãi',NULL),(2,'Khuyến mãi',50),(3,'Khuyến mãi',33),(4,'Khuyến mãi',30),(5,'Khuyến mãi',28),(6,'Khuyến mãi',25),(7,'Khuyến mãi',21),(8,'Khuyến mãi',20),(9,'Khuyến mãi',15),(10,'Khuyến mãi',12),(11,'Khuyến mãi',8),(12,'Khuyến mãi',5);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rated`
--

DROP TABLE IF EXISTS `rated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rated` (
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(15) NOT NULL,
  `star` int NOT NULL,
  `comment` mediumtext NOT NULL,
  `time` datetime NOT NULL,
  KEY `product_id_rated_idx` (`product_id`),
  KEY `user_id_rated_idx` (`user_id`),
  CONSTRAINT `product_id_rated` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `user_id_rated` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rated`
--

LOCK TABLES `rated` WRITE;
/*!40000 ALTER TABLE `rated` DISABLE KEYS */;
/*!40000 ALTER TABLE `rated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `details` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','Tất cả quyền'),(2,'Quản lý','Quyền đơn hàng'),(3,'Người dùng','Người dùng, người mua');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Admin','admin','123456','admin@mail.com','Nam','19001234','Admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-06 21:01:02
