-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 02:10 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutterdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `apm_id` int(11) NOT NULL,
  `apm_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL,
  `apm_price` int(20) NOT NULL,
  `apm_location` varchar(300) CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL,
  `apm_phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL,
  `apm_limitedroom` varchar(100) CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL,
  `apm_facilities` varchar(50) CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL,
  `apm_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL,
  `apm_detail` text CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL,
  `apm_image` varchar(300) CHARACTER SET utf8 COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apartment`
--

INSERT INTO `apartment` (`apm_id`, `apm_name`, `apm_price`, `apm_location`, `apm_phone`, `apm_limitedroom`, `apm_facilities`, `apm_type`, `apm_detail`, `apm_image`) VALUES
(1, 'Green Residence Pattani', 5500, 'ถ.เจริญประดิษฐ์ รูสะมิแล เมืองปัตตานี ปัตตานี', '083-752484', 'ห้องพักรวม', 'Free WiFi', 'อพาร์ทเม้น', 'อพาร์ทเม้นท์รายเดือนเปิดใหม่\r\nเฟอร์นิเจอร์บิ้วอิน ห้องสวย ทำเลดี วิวทะเล สวยมาก พร้อมเข้าอยู่ !!\r\nเฟอร์นิเจอร์ เครื่องปรับอากาศ ทีวี ตู้เย็น เครื่องทำน้ำอุ่น และสิ่งอำนวยความสะดวกครบครัน\r\nอาทิเช่น ลิฟท์ อินเตอร์เน็ต เครื่องซักผ้า\r\nเข้าออกด้วยระบบคีย์การ์ด มีรปภ.ประจำการทั้งคืน กล้องวงจรปิด CCTV', 'apm1.jpg'),
(2, 'B.M.Pattani Apartment', 3500, 'ซ.เจริญประดิษฐ์ 12 รูสะมิแล เมืองปัตตานี ปัตตานี', '091-202900', 'ห้องพักรวม', 'Free WiFi', 'อพาร์ทเม้น', '-- สถานที่ใกล้เคียง ---\r\nมหาวิทยาลัยสงขลานครินทร์ วิทยาเขตปัตตานี\r\nโรงเรียนสาธิตมหาวิทยาลัยสงขลานครินทร์\r\nโรงเรียนเดชะปัตตนยานุกูล\r\nโรงเรียนเบญจมราชูทิศ จังหวัดปัตตานี\r\nโรงแรมซีแอสปัตตานี\r\nเทศบาลเมืองปัตตานี\r\nศาลากลางจังหวัดปัตตานี\r\nสำนักงานที่ดิน จังหวัดปัตตานี\r\nสำนักงานประกันสังคม จังหวัดปัตตานี', 'apm2.jpg'),
(3, 'บีโฟร์อาพาร์ทเมันท์', 4000, 'ซ.9 ถ.เจริญประดิษฐ์ รูสะมิแล เมืองปัตตานี ปัตตานี', '095-714517', 'ห้องพักรวม', 'Free WiFi', 'อพาร์ทเม้น', 'มีที่จอดรถ สะดวกสบาย', 'apm3.jpg'),
(4, 'เจริญประดิษฐ์อาพาร์ทเม้น', 4000, 'ถ.เจริญประดิษฐ์ รูสะมิแล เมืองปัตตานี ปัตตานี', '082-984332', 'ห้องพักรวม', 'Free WiFi', 'อพาร์ทเม้น', 'ที่พักสบาย และสวยงามยานจังหวัดปัตตานี', 'apm4.jpg'),
(5, 'บีทูอาพาร์ทเม้นท์', 3500, 'ซ.10 ถ.เจริญประดิษฐ์ รูสะมิแล เมืองปัตตานี ปัตตานี', '086-491723', 'ห้องพักรวม', 'Free WiFi', 'อพาร์ทเม้น', 'ตึกใหม่ พึ่งสร้างเสร็จ 1 ปี\r\nโทรมาสอบถามได้เลย', 'apm5.jpg'),
(6, 'เจ.ซี.อพาร์ทเม้นท์', 3500, 'ซ.12 ถ.เจริญประดิษฐ์ รูสะมิแล เมืองปัตตานี ปัตตานี', '089-463535', 'ห้องพักรวม', 'FreeWifi', 'อพาร์ทเม้น', 'อุปกรณ์ที่ต้องนำมาในวันเข้าพักครั้งแรก\r\n1. ชุดผ้าปูที่นอน ขนาด 6 ฟุต\r\n2. หมอน จำนวน 2 ใบ (มีจำหน่าย/ให้เช่า)\r\n\r\nข้อกำหนดในการคืนเงินประกัน\r\n1. อยู่ครบ 6 เดือน ขึ้นไป คืนเงินประกันหลังหักค่าใช้จ่าย ภายใน 5 วัน นับตั้งแต่วันย้ายออก\r\n2. อยู่ไม่ครบ 6 เดือน ไม่ได้เงินประกันคืน\r\n', 'apm6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `condo`
--

CREATE TABLE `condo` (
  `condo_id` int(11) NOT NULL,
  `condo_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `condo_price` int(11) NOT NULL,
  `condo_location` varchar(100) CHARACTER SET utf8 NOT NULL,
  `condo_phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `condo_limitedroom` varchar(30) CHARACTER SET utf8 NOT NULL,
  `condo_facilities` varchar(30) CHARACTER SET utf8 NOT NULL,
  `condo_type` varchar(30) CHARACTER SET utf8 NOT NULL,
  `condo_detail` text COLLATE utf8_thai_520_w2 NOT NULL,
  `condo_image` varchar(50) COLLATE utf8_thai_520_w2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `condo`
--

INSERT INTO `condo` (`condo_id`, `condo_name`, `condo_price`, `condo_location`, `condo_phone`, `condo_limitedroom`, `condo_facilities`, `condo_type`, `condo_detail`, `condo_image`) VALUES
(1, 'เลอ เมอริเดียน', 3180, '108 ถ. ช้างคลาน ตำบล ช้างม่อย อำเภอ เมือง เชียงใหม่ 50100', '084-9965841', 'ห้องพักรวม', 'free wifi', 'condominium', 'เลอ เมอริเดียน เชียงใหม่ มีที่ตั้งในเมือง เมืองเชียงใหม่ และเป็นที่พักโมเดิร์นพร้อมมีวิวตัวเมือง จากโรงแรมระดับ 5 ดาวแห่งนี้สามารถมองเห็นวิว ดอยสุเทพ พร้อมมีห้องเซาว์น่า และ สระว่ายน้ำกลางแจ้ง โรงแรมมีฟิตเนสเซ็นเตอร์พร้อมสระว่ายน้ำ ทางโรงแรมมีจุดเช็คอินแบบด่วนสำหรับการลงทะเบียนเข้าพักและเช็คเอาท์อย่างรวดเร็ว โรงแรมแห่งนี้บริการห้องพักโมเดิร์นซึ่งประกอบด้วย ตู้เย็น, รองเท้าแตะ และ มินิบาร์', 'condo1.jpg'),
(2, 'โลตัส ปางสวนแก้ว', 1029, '21 ถนนห้วยแก้ว, ต.สุเทพ, อ.เมือง, เชียงใหม่ 50200, ประเทศไทย', '0894816844', 'ห้องพักรวม', 'Free Wi-Fi', 'condominium', 'โรงแรมเพิ่งตกแต่งใหม่แห่งนี้บริการที่พักอบอุ่นระดับ 3 ดาวในเมือง เมืองเชียงใหม่ ที่นี่มียิม รวมทั้งห้องเซาว์น่า, ลานบนชั้นดาดฟ้า และ สระว่ายน้ำกลางแจ้ง โรงแรมบรรยากาศดั้งเดิมแห่งนี้มีสนามเด็กเล่น, ลานโบว์ลิ่ง และ ค็อฟฟี่บาร์ ที่นี่ให้บริการดูแลเด็ก, บริการแลกเปลี่ยนเงินตรา และมีแผนกต้อนรับที่เปิด 24 ชั่วโมง โรงแรมโลตัส ปางสวนแก้ว มีห้องพักติดเครื่องปรับอากาศบรรยากาศกว้างขวางพร้อมด้วยห้องน้ำส่วนตัว, มินิบาร์ และ ตู้เย็น ', 'condo2.JPG'),
(3, 'ฟูราม่า', 832, '54 ถนนห้วยแก้ว ตำบลช้างเผือก อำเภอเมือง, เชียงใหม่, เชียงใหม่ 50300, ประเทศไทย', '0941886488', 'ห้องพักรวม', 'free wifi', 'condominium', 'โรงแรมฟูราม่า เชียงใหม่ มีที่ตั้งในเมือง เมืองเชียงใหม่ และสามารถนั่งรถ วัดเจ็ดยอด และ เชียงใหม่ไนท์บาซาร์ ในระยะทางสั้น ๆ เท่านั้น นอกจากจะมีที่จอดรถยนต์สาธารณะฟรีในบริเวณแล้ว ที่โรงแรมยังบริการห้องพักแสนสบายมาตรฐานระดับ 4 ดาว และบาร์', 'condo3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `dormitory`
--

CREATE TABLE `dormitory` (
  `dm_id` int(11) NOT NULL,
  `dm_name` varchar(100) NOT NULL,
  `dm_price` int(11) NOT NULL,
  `dm_location` varchar(100) NOT NULL,
  `dm_phone` varchar(11) NOT NULL,
  `dm_limitedroom` varchar(50) NOT NULL,
  `dm_facilities` varchar(50) NOT NULL,
  `dm_type` varchar(50) NOT NULL,
  `dm_detail` text NOT NULL,
  `dm_image` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dormitory`
--

INSERT INTO `dormitory` (`dm_id`, `dm_name`, `dm_price`, `dm_location`, `dm_phone`, `dm_limitedroom`, `dm_facilities`, `dm_type`, `dm_detail`, `dm_image`) VALUES
(1, 'หอพักหญิงมารีน่า', 2800, 'ซ.- ถ.สามัคคี รูสะมิแล เมืองปัตตานี ปัตตานี', '087-9694495', 'ห้องพักหญิง', 'Free WiFi', 'หอพัก', 'ห้องพักหญิง ปลอดภัย สะดวกสบาย', 'dm1.jpg'),
(2, 'หอพักหทัยพัฒน์', 1700, 'ซ.เจริญประดิษฐ์12 ถ.เจริญประดิษฐ์ รูสะมิแล เมืองปัตตานี ปัตตานี', '091-2029009', 'ห้องพักรวม', 'Free WiFi', 'หอพัก', '- สถานที่ใกล้เคียง ---\r\nมหาวิทยาลัยสงขลานครินทร์ วิทยาเขตปัตตานี\r\nโรงเรียนสาธิตมหาวิทยาลัยสงขลานครินทร์\r\nโรงเรียนเดชะปัตตนยานุกูล\r\nโรงเรียนเบญจมราชูทิศ จังหวัดปัตตานี\r\nโรงแรมซีแอสปัตตานี\r\nเทศบาลเมืองปัตตานี\r\nศาลากลางจังหวัดปัตตานี\r\nสำนักงานที่ดิน จังหวัดปัตตานี\r\nสำนักงานประกันสังคม จังหวัดปัตตานี\r\n', 'dm2jpg'),
(3, 'เก้าสนคอร์ท', 2500, 'ซ.5 ถ.หลังมอ. รูสะมิแล เมืองปัตตานี ปัตตานี', '081-0966006', 'ห้องพักรวม', 'Free WiFi', 'หอพัก', 'หอพัก-อพาร์ตเมนต์ราคาถูก ทำเลดีมาก ใกล้มอ. สามารถเดินได้150เมตร มีความปลอดภัย มี wifi มีร้านค้าภายใน เครื่องซักผ้าหยอดเหรียญ ที่จอดรถเยอะ คีย์การ์ด กล้องวงจรปิด', 'dm3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `game_id` varchar(15) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `game_price` int(5) NOT NULL,
  `game_detail` text NOT NULL,
  `game_img` varchar(255) NOT NULL,
  `game_stock` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `game_id`, `game_name`, `game_price`, `game_detail`, `game_img`, `game_stock`) VALUES
(38, '1', '1156', 196, '8596', 'pict_20211027_103821_5e9c5298f6.jpg', 45);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `name`, `surname`) VALUES
('u1', 'p1', 'Nalinee', 'Inthamano'),
('u2', 'p2', 'Mintra', 'Deejai');

-- --------------------------------------------------------

--
-- Table structure for table `mansion`
--

CREATE TABLE `mansion` (
  `mansion_id` int(10) NOT NULL,
  `mansion_name` varchar(100) NOT NULL,
  `mansion_price` int(10) NOT NULL,
  `mansion_location` varchar(100) NOT NULL,
  `mansion_phone` int(10) NOT NULL,
  `mansion_limitedroom` varchar(100) NOT NULL,
  `mansion_facilities` varchar(100) NOT NULL,
  `mansion_type` varchar(100) NOT NULL,
  `mansion_detail` varchar(100) NOT NULL,
  `mansion_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mansion`
--

INSERT INTO `mansion` (`mansion_id`, `mansion_name`, `mansion_price`, `mansion_location`, `mansion_phone`, `mansion_limitedroom`, `mansion_facilities`, `mansion_type`, `mansion_detail`, `mansion_image`) VALUES
(1, 'วรรณศิริ แมนชั่น', 3500, 'ซ.11 ถ.ราษฎร์อุทิศ 1 บ่อยาง เมืองสงขลา สงขลา', 818975727, 'ห้องพัก', 'Free wifi', 'เเมนชั่น', 'หอพักเน้นความสะดวกสบาย ราคาประหยัด บริการห้องพักทั้งรายวัน-รายเดือน\r\nใกล้ม.ทักษิณ ม.ราชภัฏสงขลา (5 น', 'man1.jpg'),
(2, 'เพชรแมนชั่น', 3500, '356-328สข.2029ตำบลหาดใหญ่อำเภอหาดใหญ่', 831922639, 'ห้องพัก', 'Free wifi', 'เเมนชั่น', 'ห้องพักรายวันเริ่มต้น 360 บาท\r\nห้องพักรายเดือนเริ่มต้น 3,500 บาท\r\n3-5 นาที ถึงเซ็นทรัลเฟสติเวิล ไดอา', 'man2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`apm_id`);

--
-- Indexes for table `condo`
--
ALTER TABLE `condo`
  ADD PRIMARY KEY (`condo_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `mansion`
--
ALTER TABLE `mansion`
  ADD PRIMARY KEY (`mansion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartment`
--
ALTER TABLE `apartment`
  MODIFY `apm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `condo`
--
ALTER TABLE `condo`
  MODIFY `condo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `mansion`
--
ALTER TABLE `mansion`
  MODIFY `mansion_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
