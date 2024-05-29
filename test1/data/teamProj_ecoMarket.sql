-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.36 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- test 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test`;

-- 이벤트 test.DELETE_USER_DATA_EVENT 구조 내보내기
DELIMITER //
CREATE EVENT `DELETE_USER_DATA_EVENT` ON SCHEDULE EVERY 1 DAY STARTS '2024-03-16 00:00:00' ON COMPLETION PRESERVE ENABLE DO DELETE FROM ECO_USER_DELETE WHERE DELETE_DATE <= NOW() - INTERVAL 6 MONTH//
DELIMITER ;

-- 이벤트 test.DELETE_USER_DATA_EVENT1 구조 내보내기
DELIMITER //
CREATE EVENT `DELETE_USER_DATA_EVENT1` ON SCHEDULE EVERY 1 DAY STARTS '2024-03-16 00:00:00' ON COMPLETION PRESERVE ENABLE DO DELETE FROM ECO_USER WHERE DELETE_DATE <= NOW() - INTERVAL 3 MONTH//
DELIMITER ;

-- 테이블 test.eco_addr 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_addr` (
  `ADDRNO` int NOT NULL AUTO_INCREMENT,
  `USERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `ADDRDETAIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ZIPCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `ADDRREQUEST` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ADDRNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ISDEFAULT` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ADDRNO`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_addr:~19 rows (대략적) 내보내기
INSERT INTO `eco_addr` (`ADDRNO`, `USERID`, `ADDR`, `ADDRDETAIL`, `ZIPCODE`, `NAME`, `PHONE`, `ADDRREQUEST`, `ADDRNAME`, `ISDEFAULT`) VALUES
	(25, 'user1', '서울 구로구 연동로13길 18-38', '102동 102호  (항동, 동보수목원아파트)', '08360', 'asfasf', '01029594125', '배송전 연락', '회사', 'Y'),
	(26, 'user1', '인천 중구 내항로 2-45', '여기  (항동7가)', '22345', '김승인', '01029594125', '', '집', 'N'),
	(27, 'user1', '인천 중구 내항로 2-45', '102동 102호  (항동7가)', '22345', '고말숙', '01029594125', '', '집', 'N'),
	(28, 'hong123', '인천 중구 내항로 2-45', '102호  (항동7가)', '22345', '나', '01029594125', '', '집', 'Y'),
	(29, 'dong123', '인천 부평구 마장로272번길 76', '311-703  (산곡동, 경남아파트)', '21376', '김동휘', '01072082755', NULL, '집', 'N'),
	(30, 'admin', '경기 부천시 오정구 고강로 3', '우리집  (원종동)', '14403', '김은석', '01065363310', '안녕하세요ㅁㄴㅇㅁㄴㅇ', '집', 'Y'),
	(31, 'a123123', '경기 성남시 분당구 대왕판교로606번길 45', '202-101  (삼평동)', '13524', '에이', '01011112222', NULL, '집', 'Y'),
	(32, 'temp123', '경기 성남시 분당구 대왕판교로 477', '11  (판교동)', '13480', '김임시', '01010101010', NULL, '집', 'N'),
	(33, 'test123', '서울 구로구 연동로13길 18-38', '102동 102호  (항동, 동보수목원아파트)', '08360', '김승인', '01029594125', NULL, '집', 'N'),
	(34, 'test123', '인천 부평구 길주로 지하 379', 'ㅂㄹㅈ  (산곡동)', '21313', '길막숙', '01029594125', '없어', '라라라?', 'Y'),
	(37, 'hommefatale01', '부산 수영구 망미동 802-33', '102동 102호 ', '48236', 'The bed is my stage', '01029594125', NULL, '집', 'Y'),
	(38, 'admin', '경기 부천시 오정구 고강로 3', '멋진 (원종동)', '14403', '내가받을꺼야', '01051515152', '배송와아ㅏ아아아ㅋㅋㅋ', '지구', 'N'),
	(40, 'hommefatale', '서울 구로구 연동로13길 18-38', '102동 102호  (항동, 동보수목원아파트)', '08360', '김승인', '01029594125', NULL, '집', 'N'),
	(41, 'kfkmds', '경기 부천시 오정구 고강로 3', '1112233  (원종동)', '14403', '김은석', '01055551111', NULL, '집', 'N'),
	(42, 'tmep111', '경기 성남시 분당구 대왕판교로 477', '11  (판교동)', '13480', '임시', '01011111111', NULL, '집', 'N'),
	(44, 'test12', '인천 부평구 가재울로 129', '사무실  (십정동)', '21449', '김동휘', '01011111111', '조심히와주세요', '회사사무실', 'Y'),
	(45, 'test0101', '부산 중구 부평1길 4', '테스트주소  (부평동2가)', '48979', '테스트이름', '01068899070', NULL, '집', 'N'),
	(47, 'admin', '인천 남동구 백범로 455-1', 'ㅋㅋㅋ  (간석동)', '21504', 'test', '01012341234', 'zzz', '집', 'N'),
	(48, 'test001', '부산 중구 부평1길 4', '201호  (부평동2가)', '48979', '김철수', '01068899070', NULL, '집', 'N');

-- 테이블 test.eco_admin_qa 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_admin_qa` (
  `BOARDNO` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `QA_CONTENTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `USERID` varchar(30) DEFAULT NULL,
  `DELETEYN` char(1) DEFAULT 'N',
  `DELETEDATE` datetime DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  `SECRETYN` char(1) DEFAULT NULL,
  `ITEM_NO` int DEFAULT NULL,
  PRIMARY KEY (`BOARDNO`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_admin_qa:~16 rows (대략적) 내보내기
INSERT INTO `eco_admin_qa` (`BOARDNO`, `TITLE`, `QA_CONTENTS`, `USERID`, `DELETEYN`, `DELETEDATE`, `CDATETIME`, `UDATETIME`, `SECRETYN`, `ITEM_NO`) VALUES
	(1, '지금 서버가 이상한 건가요?', '사이트가 좀 느린 듯합니다.', 'temp123', 'N', NULL, '2024-03-14 14:51:37', '2024-03-14 14:51:38', NULL, 43),
	(2, '등급을 올리려면 어떻게 해야 하나요?', '알려주세요.', 'hong123', 'N', NULL, '2024-03-14 15:08:08', '2024-03-14 15:08:08', NULL, 43),
	(3, '문의등록테스트', '등록한 문의 내용 테스트', 'hong123', 'N', NULL, '2024-03-14 17:15:29', '2024-03-14 17:15:29', NULL, 45),
	(4, '문의등록테스트2', '등록한 문의 내용 테스트2', 'hong123', 'N', NULL, '2024-03-14 17:17:53', '2024-03-14 17:17:53', NULL, 44),
	(30, '물건이 아직 안 왔는데요', '아직 배송이 안 된 건가요?', 'hong123', 'N', NULL, '2024-03-14 18:25:06', '2024-03-14 18:25:06', NULL, 62),
	(32, '귤이 상했어요', '환불이나 교환 빠르게 해주세요', 'hong123', 'N', NULL, '2024-03-14 18:31:58', '2024-03-14 18:31:58', NULL, 62),
	(33, '꺼져', '흥', 'test123', 'N', NULL, '2024-03-18 15:01:06', '2024-03-18 15:01:06', NULL, 62),
	(34, '문의 남겨봅니다', '흑흑흑 문의요', 'temp123', 'N', NULL, '2024-03-19 20:56:59', '2024-03-19 20:56:59', NULL, 50),
	(35, '상품 썸네일이 안나와요', '고쳐 주세요', 'admin', 'N', NULL, '2024-03-19 21:53:17', '2024-03-19 21:53:17', NULL, 63),
	(38, '정말 무항생제 계란이 맞나요??', '무항상제 계란이 맞는지 궁금합니다.', 'temp123', 'N', NULL, '2024-03-21 10:29:18', '2024-03-21 10:29:18', NULL, 68),
	(39, '자연 방식으로 얻은 계란이 맞나요?', '자연 방식으로 생산된 계란이 맞는지 궁금합니다.', 'hong123', 'N', NULL, '2024-03-21 15:17:05', '2024-03-21 15:17:06', NULL, 68),
	(40, '이거 맛이 안 좋아요', '교환 부탁드립니다.', 'admin', 'N', NULL, '2024-04-16 03:55:36', '2024-04-16 03:55:36', NULL, 68),
	(41, '유기농 케일인가요?', '유기농 케일인가요???', 'a123123', 'N', NULL, '2024-04-16 03:57:11', '2024-04-16 03:57:11', NULL, 62),
	(42, '계란 1알 당 단백질 함유량이 어떻게 되나요?', '식단에서 단백질 대체를 닭가슴살에서 계란으로 바꿀 예정이어서 단백질 함유량이 궁금해요', 'a123123', 'N', NULL, '2024-04-16 04:04:55', '2024-04-16 04:04:55', NULL, 68),
	(43, '진짜 비건인가요?', '제가 잠시 채식 식단을 경험하고 싶은데 진짜 비건 콩불고기인가요?', 'a123123', 'N', NULL, '2024-04-16 04:05:54', '2024-04-16 04:05:54', NULL, 67),
	(44, '문의', '문의', 'admin', 'N', NULL, '2024-05-28 08:03:34', '2024-05-28 08:03:34', NULL, 2);

-- 테이블 test.eco_admin_qa_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_admin_qa_image` (
  `FILENO` int NOT NULL,
  `BOARDNO` int DEFAULT NULL,
  `FILEPATH` varchar(200) DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  `FILEORGNAME` varchar(200) DEFAULT NULL,
  `FILESIZE` varchar(20) DEFAULT NULL,
  `FILEETC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_admin_qa_image:~0 rows (대략적) 내보내기

-- 테이블 test.eco_admin_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_admin_review` (
  `REVIEW_NO` int NOT NULL,
  `ITEM_NO` varchar(100) DEFAULT NULL,
  `USERID` varchar(20) DEFAULT NULL,
  `R_CONTENTS` varchar(200) DEFAULT NULL,
  `SCORE` decimal(5,2) DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  `DELETEYN` char(1) DEFAULT 'N',
  `DELETEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`REVIEW_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_admin_review:~3 rows (대략적) 내보내기
INSERT INTO `eco_admin_review` (`REVIEW_NO`, `ITEM_NO`, `USERID`, `R_CONTENTS`, `SCORE`, `CDATETIME`, `UDATETIME`, `DELETEYN`, `DELETEDATE`) VALUES
	(1, '62', 'temp123', '너무 좋아요!', 3.00, '2024-03-14 11:02:04', '2024-03-14 11:02:05', 'N', NULL),
	(2, '62', 'hong123', '너무 안 좋아요!', 5.00, '2024-03-14 11:31:14', '2024-03-14 11:31:15', 'N', NULL),
	(3, '68', 'temp123', '계란이 신선해서 너무 좋아요', 5.00, '2024-03-14 11:31:42', '2024-03-14 11:31:43', 'N', NULL);

-- 테이블 test.eco_admin_review_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_admin_review_image` (
  `FILENO` int NOT NULL,
  `BOARDNO` int DEFAULT NULL,
  `FILEPATH` varchar(200) DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  `FILEORGNAME` varchar(200) DEFAULT NULL,
  `FILESIZE` varchar(20) DEFAULT NULL,
  `FILEETC` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FILENO`),
  KEY `BOARDNO` (`BOARDNO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_admin_review_image:~0 rows (대략적) 내보내기

-- 테이블 test.eco_admin_review_imagefile 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_admin_review_imagefile` (
  `FILENO` int NOT NULL,
  `BOARDNO` int DEFAULT NULL,
  `FILEPATH` varchar(200) DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  `FILEORGNAME` varchar(200) DEFAULT NULL,
  `FILESIZE` varchar(20) DEFAULT NULL,
  `FILEETC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_admin_review_imagefile:~0 rows (대략적) 내보내기

-- 테이블 test.eco_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_board` (
  `BOARDNO` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `USERID` varchar(30) DEFAULT NULL,
  `HITS` int DEFAULT '0',
  `DELETEYN` char(1) DEFAULT NULL,
  `DELETEDATE` datetime DEFAULT NULL,
  `KIND` varchar(20) DEFAULT NULL,
  `REPORTCNT` int DEFAULT '0',
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  `KCAL` int DEFAULT NULL,
  PRIMARY KEY (`BOARDNO`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_board:~23 rows (대략적) 내보내기
INSERT INTO `eco_board` (`BOARDNO`, `TITLE`, `CONTENTS`, `USERID`, `HITS`, `DELETEYN`, `DELETEDATE`, `KIND`, `REPORTCNT`, `CDATETIME`, `UDATETIME`, `KCAL`) VALUES
	(18, '비건메뉴추천', '<p>ㄱ강추ㅋㅋㅋㅋㅋ</p>', 'temp123', 65, 'N', NULL, '2', 0, '2024-03-07 15:06:01', '2024-03-18 16:11:37', 2500),
	(43, '1주일 째 배송이 되지 않아요', '제가 1주일 넘게 기다리고 있습니다.. 배송이 되지 않네요 확인 부탁드립니다.ㅠ', 'hong123', 11, 'N', NULL, '3', 0, '2024-03-08 12:31:03', '2024-04-18 09:13:28', 3000),
	(45, '조금은 낯선 얼굴의 라디치오!', '<p>어떻게 먹어야 할지 고민되신다면 이렇게 드셔보세요. 라디치오 이외에도 양배추, 쌈채소 등의 샐러드채소로 만들어도 맛있어요. 양념에 약간의 변화를 주면 한 가지 채소도 매우 다양하게 먹을 수 있어요 :)</p>', 'admin', 106, 'N', NULL, '2', 0, '2024-03-08 14:32:24', '2024-03-08 17:03:39', 3000),
	(48, 'test04', '<p>test</p>', 'user1', 6, 'N', NULL, '3', 0, '2024-03-08 14:52:47', '2024-03-08 14:52:47', 3000),
	(49, '2222222222', '<p>222222222222</p>', 'user1', 14, 'N', NULL, '3', 0, '2024-03-08 14:55:46', '2024-03-08 14:55:46', 3000),
	(70, '문의하기!!', '<p>0000000000000000000000000000000</p>', 'temp123', 3, 'N', NULL, '3', 0, '2024-03-12 14:33:12', '2024-03-12 19:21:53', 2500),
	(83, '작성', '수정하겠읍니다.', 'temp123', 7, 'N', NULL, NULL, 0, '2024-03-12 19:20:37', '2024-03-13 15:52:38', 2500),
	(91, '글로만 적는 레시피.txt', '<p>test</p>', 'hong123', 11, 'N', NULL, '2', 0, '2024-03-13 12:34:07', '2024-04-19 01:01:53', 3000),
	(106, '가격 인상 안내', '<p>안녕하세요. 에코마켓입니다.</p><p><br></p><p>에코마켓을 사랑해주시는 고객님께 진심으로 감사의 말씀드립니다.</p><p>채소 및 원재료 변동으로 인해 2024년 5월 2일부터 일부 제품 가격이 조정됨을 안내드립니다.</p><p><br></p><p>가격 인상 및 인하 제품은 아래와 같습니다.</p><p><br></p><p>*조정 판매가 적용 시기 : 2024년 5월 2일 ~</p><p><br></p><p>제품명&nbsp;</p><p>기존 판매가&nbsp;</p><p>조정 판매가&nbsp;</p><p><br></p><p>난각번호1 자연방사 동물복지 유정란 (당일 낳은 달걀 동물복지인증 무항생제인증 HACCP인증)[삼초계란], 30구, 1개</p><p>22,000원&nbsp;</p><p>18,000원&nbsp;</p><p><br></p><p>유기농마루 듬뿍두유 무가당, 190ml 24개</p><p><span style="color: rgb(111, 111, 111);">18,000원&nbsp;&nbsp;</span></p><p>25,000원&nbsp;</p><p><br></p><p>언버든 스트레스 릴리프 밤</p><p>22,000원&nbsp;</p><p>28,000원&nbsp;</p><p><br></p><p>에코마켓 상품에 많은 관심과 응원 부탁드리며,</p><p>언제나 더 좋은 제품을 제공할 수 있도록 최선을 다하겠습니다.</p><p><br></p><p>감사합니다.</p>', 'admin', 33, 'N', NULL, '1', 0, '2024-03-14 09:28:05', '2024-04-17 07:50:54', 3000),
	(107, '오늘 저녁은 맛있는 샐러드 추천', '<p>매번 닭가슴살을 다이어트 식단에만 활용해 오셨다고요? 그런 분들을 위해, 레시피 공유하겠습니다!</p>', 'hong123', 18, 'N', NULL, '2', 0, '2024-03-14 09:31:13', '2024-03-14 09:31:13', 3000),
	(108, '비건 | 식물성 닭가슴살 숙주 볶음', '<p>식물성 닭가슴살과 숙주로 만든 초간단 레시피 공유해요 간단한 조리과정에 비해 정말 맛있고, 크게 다르지 않으면서도 이색적인 느낌을 파프리카를 그냥 먹는 것도 좋지만 운동 후라서 남은 양파와 함께 먹을 수 있는</p>', 'kfkmds', 24, 'N', NULL, '2', 0, '2024-03-14 10:07:07', '2024-03-14 10:07:07', 2500),
	(115, '글루텐프리로 건강해지자', '<p>에코마켓에서 다양한 야채를 다양한 방법으로 먹어보고자 채소박스를 처음 시켜봤습니다. 소량의 야채들이 다양하게 와서 좋았고 레시피가 있어서 생소한 야채들도 쉽게 먹을 수 있어서 좋네요. 비빔밥은 생각했던 것보다 훨씬 맛있었습니다. 만족스러워서 앞으로도 계속 배송받을 생각이에요.</p>', 'admin', 24, 'N', NULL, '2', 0, '2024-03-14 12:40:21', '2024-03-14 12:40:21', 2500),
	(116, '두번째 구매하는데 채소가 너무 좋아요', '<p>쑥이랑 달래는 잎이 시들어서 물러진 채로 배송이 와서 빨리 해치웠는데요! 다 넘 넘 맛있게 먹구 있습니당 특히 청경채는 유기농인 거 자랑하는건가용? 애벌레도 함께 왔는데 재밌었어용</p>', 'temp123', 26, 'N', NULL, '2', 0, '2024-03-14 18:17:00', '2024-03-14 18:17:00', 2500),
	(117, '글루텐프리도 맛있다', '<p>간단한 조리과정에 비해 정말 맛있고, 크게 다르지 않으면서도 이색적인 느낌을 건강하게 먹으려 노력하는편인데 이번엔 버섯조림 레시피대로 따라해봤어요~^^ 달큰해서 아이들이 좋아하네요^^ 다음 채소박스도 기대할께요~!!</p>', 'hommefatale', 144, 'N', NULL, '2', 0, '2024-03-14 18:22:36', '2024-03-14 18:22:36', 2500),
	(120, '상큼하고 맛있는 - 연어 포케 비건 샐러드 파스타', '<p>간단한 조리과정에 비해 정말 맛있고, 크게 다르지 않으면서도 이색적인 느낌을</p>', 'kfkmds', 31, 'N', NULL, '2', 0, '2024-03-15 16:56:12', '2024-03-15 16:56:12', 2500),
	(121, '비건샐러드식단을 공유합니다', '<p><span style="color: rgb(31, 41, 55);">에코 마켓은 신선하고 꼼꼼히 포장돼왔어요</span></p><p><span style="color: rgb(31, 41, 55);">토마토 마리네이드만 활용하여 샐러드로 먹어도 좋아요. 그맘때</span></p><p><span style="color: rgb(31, 41, 55);">가장 맛이 있는 다양한 잎채소와 함께하세요.</span></p>', 'kfkmds', 49, 'N', NULL, '2', 0, '2024-03-15 17:04:45', '2024-03-21 15:19:25', 2500),
	(122, '압축랩 포장지 변경 안내', '<p class="ql-align-center">안녕하세요. 에코마켓입니다.</p><p class="ql-align-center"><br></p><p class="ql-align-center">압축랩 포장지인 티트리 밸런싱이 리뉴얼 되어 9월경 출시됨을 알려드립니다.</p><p class="ql-align-center">티트리 밸런싱을 기다려주시는 고객님들께 양해의 말씀 드립니다.</p><p class="ql-align-center"><br></p><p class="ql-align-center">좋은 제품으로 보답하는 에코마켓이 되겠습니다.</p><p class="ql-align-center">감사합니다.</p><p><br></p>', 'admin', 84, 'N', NULL, '1', 0, '2024-03-15 18:15:55', '2024-04-17 08:44:07', 2500),
	(123, '믿고 먹는 유기농 에코마켓 채소들!', '<p>유기농 채소와 신선하고 다양한 채소들에 행복했어요 저녁으로 먹기 좋은 메뉴 추천합니다! 간단한 조리과정에 비해 정말 맛있고, 크게 다르지 않으면서도 기존 마트만 이용하다가 다양한 야채를 다양한 방법으로 먹어보고자 채소박스를 처음 시켜봤습니다. 소량의 야채들이 다양하게 와서 좋았고 레시피가 있어서 생소한 야채들도 쉽게 먹을 수 있어서 좋네요. 비빔밥은 생각했던 것보다 훨씬 맛있었습니다. 만족스러워서 앞으로도 계속 배송받을 생각이에요.</p>', 'kfkmds', 180, 'N', NULL, '2', 0, '2024-03-18 09:32:52', '2024-03-18 09:32:52', 2500),
	(130, '패밀리 위크 할인 안내', '<p>안녕하세요, 에코 마켓 고객 여러분!</p><p>5월이 오면서 가정의 달을 맞아, 에코 마켓에서 특별한 할인 행사를 준비했습니다. 이번 가정의 달, 가족들과 함께 건강한 식단을 즐기고 싶은 분들을 위해 준비한 특별한 혜택을 소개합니다.</p><p><br></p><p><span style="color: var(--tw-prose-bold);">☝ 할인 품목</span>: 다양한 신선한 채소들이 특별 가격으로 만나보실 수 있습니다.</p><p><span style="color: rgb(111, 111, 111);">✌ </span><span style="color: var(--tw-prose-bold);">기간</span>: 4월22일부터 5월 10일까지</p><p><span style="color: rgb(111, 111, 111);">👌 </span><span style="color: var(--tw-prose-bold);">혜택</span>: 행사 기간 동안 구매하신 모든 상품에 대해 추가 할인 혜택을 제공합니다.</p><p><br></p><p>가정의 달을 맞아, 가족들과 함께 건강한 식단을 준비하는 것은 더 나은 삶의 시작입니다. 우리는 여러분의 건강과 행복을 응원하며, 이번 특별한 할인 행사로 여러분의 삶에 작은 변화를 가져다줄 수 있기를 기대합니다.</p><p>더 많은 정보 및 할인 혜택을 확인하시려면 저희 홈페이지를 방문해주세요. 언제든지 문의 사항이 있으시면 저희에게 연락해주세요. </p><p>여러분의 가정이 더 행복하고 에코마켓과 함께 건강하길 바랍니다!</p><p><br></p>', 'admin', 62, 'N', NULL, '1', 0, '2024-03-19 10:46:45', '2024-04-17 08:48:00', 2500),
	(139, '유기농이자 무농약 제품을 싱싱하게 제철아이들로 받는다는것. 매력적이네요!', '<p>오랜만에 잔뜩 추가해서 주문해봤어요. 알록달록 푸릇하게 모아 놓으니 마음이 무척 풍족해요 국산콩두부는 늘 주문하는데 마트 국산콩두부보다 저렴해서 좋아요. 사보이 양배추는 처음 받아보는데 기대돼요. 작고 못생겼다는데 받을 때마다 크고 예뻐서 놀라요. 이번엔 파프리카와 배가 참 커다랬어요. 봄을 맞아 냉이와 달래를 담아봤는데 달래가 손질되어서 오니 편하네요! 당장 달래장 만들 거예요. 에코마켓에서 주문하면 해먹을 요리 리스트 짜는 게 큰 즐거움이에요.</p>', 'temp123', 178, 'N', NULL, '2', 0, '2024-03-19 18:17:12', '2024-03-19 18:17:12', 2500),
	(142, '오늘 홈페이지 리뉴얼 오픈합니다.', '<p><span style="color: var(--tw-prose-bold);">홈페이지 리뉴얼 오픈 소식!</span></p><p>안녕하세요, 에코마켓의 새로운 홈페이지가 리뉴얼 되어 개장했습니다!  새롭게 갈아입은 홈페이지로 여러분을 초대합니다.</p><p><br></p><p><span style="color: var(--tw-prose-bold);">1️⃣새로운 콘텐츠와 서비스!</span></p><p>새로운 홈페이지에서는 최신 소식, 이벤트, 제품 정보 등 다양한 콘텐츠를 제공할 예정입니다. 또한, 고객 서비스를 더욱 향상시켜 여러분의 편의를 높일 것입니다. 저희와 함께 더 나은 서비스를 경험해보세요.</p><p><br></p><p><span style="color: rgb(111, 111, 111);">2️⃣</span><span style="color: var(--tw-prose-bold);">새로운 디자인과 기능!</span></p><p>우리의 홈페이지는 더욱 사용자 친화적인 디자인과 향상된 기능을 갖추고 있습니다. 사용자들이 원하는 정보를 쉽고 빠르게 찾을 수 있도록 더욱 간결하고 직관적인 레이아웃으로 구성되어 있습니다.</p><p><br></p><p><span style="color: rgb(111, 111, 111);">3️⃣</span><span style="color: var(--tw-prose-bold);">참여와 피드백 환영합니다!</span></p><p>여러분의 소중한 의견과 피드백은 저희에게 큰 도움이 됩니다. 언제든지 홈페이지에 방문하여 의견을 남겨주세요. 저희는 항상 여러분의 목소리를 듣고 더 나은 서비스를 제공하기 위해 노력하겠습니다.</p><p><br></p><p><span style="color: var(--tw-prose-bold);">4️⃣방문해보세요!</span></p><p>지금 바로 새로워진 에코마켓의 홈페이지를 방문해보세요! 새로운 경험과 다양한 혜택을 만나보실 수 있습니다.</p><p><br></p><p>감사합니다.</p>', 'admin', 323, 'N', NULL, '1', 0, '2024-03-20 17:42:04', '2024-04-17 07:54:44', 2500),
	(157, '단종 예정상품 안내', '<p class="ql-align-center">안녕하세요. 에코마켓입니다.</p><p class="ql-align-center">&nbsp;</p><p class="ql-align-center">에코마켓에서 정성을 담아 선보였던 제품들 중 일부 제품들의 단종 예정 소식을 안내드립니다.</p><p class="ql-align-center">&nbsp;</p><p class="ql-align-center">하기 제품을 사랑해주신 고객님들께 구매에 불편을 드리는 점 양해 부탁드리며,</p><p class="ql-align-center">&nbsp;추후 더 나은 제품으로 에코마켓만의 고유의 가치를 담은 제품으로</p><p class="ql-align-center">&nbsp;보답드릴 수 있도록 노력하겠습니다.</p><p class="ql-align-center"><br></p><p><span style="color: black;">아로마티카 라이프 순비누 손빨래세제&nbsp;500ML</span></p><p><span style="color: black;">재고 소진 후 단종</span></p><p><span style="color: black;">헤어케어</span></p><p><span style="color: black;">퀴노아 프로틴 트리트먼트마스크&nbsp;300ml</span></p><p><span style="color: black;">로즈마리 솔트 스크럽 샴푸&nbsp;500g</span></p><p><span style="color: black;">아로마테라피</span></p><p><span style="color: black;">서렌 아로마테라피 미스트 라벤더&amp;마조람&nbsp;200ml</span></p><p><span style="color: black;">메디테이트 시너지 오일&nbsp;10ml</span></p><p><span style="color: black;">스킨케어</span></p><p><span style="color: black;">티트리53&nbsp;블레미쉬 스팟&nbsp;10ml</span></p><p><span style="color: black;">티트리 포어 퓨리파잉 젤크림&nbsp;100ml</span></p><p><span style="color: black;">티트리 밸런싱 에멀전&nbsp;100ml</span></p><p><span style="color: black;">컴포팅 카렌듈라 쥬시크림&nbsp;150ml</span></p><p><span style="color: black;">유기농 골든 호호바오일&nbsp;30ml</span></p><p><span style="color: black;">수딩 알로에 미네랄 선스크린&nbsp;50ml</span></p><p><span style="color: black;">바이탈라이징로즈마리 컨센트레이티드 에센스&nbsp;200ml</span></p><p><span style="color: black;">바이탈라이징 로즈마리 클렌징 오일&nbsp;200ml</span></p><p><span style="color: black;">바이탈라이징 로즈마리 디콕션 토너리필&nbsp;300ml</span></p><p><span style="color: black;">바이탈라이징 로즈마리 디콕션 토너&nbsp;300ml</span></p><p><span style="color: black;">브랜드 굿즈</span></p><p><span style="color: black;">아로마테라피 헴프버킷백</span></p><p><span style="color: black;">다회용 대나무 화장솜</span></p><p><span style="color: black;">100%&nbsp;순면 목화씨 화장솜</span></p><p><span style="color: black;">100%&nbsp;무표백&nbsp;3겹 화장솜</span></p><p class="ql-align-center">&nbsp;</p><p class="ql-align-center"><br></p><p class="ql-align-center">단종 예정인 상품의 재고가 소진되는 시점은 별도의 고지 없이</p><p class="ql-align-center">판매량에 따라 판매 종료 시점이 상이한 부분이 있는 점 구매 시 참고 부탁 드립니다.</p><p class="ql-align-center"><br></p><p class="ql-align-center">&nbsp;궁금하신 사항은 고객센터를 통해 문의 주시면 순차적으로 안내 도와 드리겠습니다.</p><p class="ql-align-center">감사합니다.</p><p><br></p>', 'admin', 53, 'N', NULL, '1', 0, '2024-04-18 09:19:30', '2024-04-18 09:19:30', 2500),
	(158, '주문에 대해 문의할 게 있습니다.', '어떻게 주문하는지 문의합니다', 'a123123', 0, 'N', NULL, '3', 0, '2024-04-18 09:20:12', '2024-04-18 09:20:12', 2500);

-- 테이블 test.eco_board_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_board_image` (
  `FILENO` int NOT NULL AUTO_INCREMENT,
  `BOARDNO` int DEFAULT NULL,
  `FILEPATH` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FILENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FILEORGNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FILESIZE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FILEETC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `KIND` int DEFAULT NULL,
  PRIMARY KEY (`FILENO`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_board_image:~28 rows (대략적) 내보내기
INSERT INTO `eco_board_image` (`FILENO`, `BOARDNO`, `FILEPATH`, `FILENAME`, `FILEORGNAME`, `FILESIZE`, `FILEETC`, `KIND`) VALUES
	(31, 121, '..\\img\\', '202422031022193.jpg', '레시피2.jpg', '141154', '.jpg', 1),
	(32, 45, '..\\img\\', 'chicken.jpg', '글루텐프리.jpg', '33622', '.jpg', 1),
	(34, 45, '..\\img\\', 'chicken.jpg', '2.jpg', '5829', '.jpg', 2),
	(53, 106, '..\\img\\', '20242149287998.jpg', '2.jpg', '5829', '.jpg', 1),
	(54, 106, '..\\img\\', '20242149288104.jpg', 'recipe5.jpg', '12945918', '.jpg', 2),
	(55, 106, '..\\img\\', '20242149288144.jpg', 'recipe4.jpg', '18952741', '.jpg', 2),
	(56, 107, '..\\img\\', 'chicken.jpg', 'recipe5.jpg', '12945918', '.jpg', 1),
	(57, 107, '..\\img\\', 'chicken.jpg', 'recipe4.jpg', '18952741', '.jpg', 2),
	(58, 107, '..\\img\\', 'noodle2.jpg', 'recipe3.jpg', '25393417', '.jpg', 2),
	(59, 108, '..\\img\\', '202421893256625.jpg', 'recipe5.jpg', '5829', '.jpg', 1),
	(60, 108, '..\\img\\', '202421493114587.jpg', 'recipe3.jpg', '12945918', '.jpg', 2),
	(61, 108, '..\\img\\', '20242141077902.jpg', 'recipe4.jpg', '18952741', '.jpg', 2),
	(72, 116, '..\\img\\', 'noodle2.jpg', '2캡처.JPG', '16500', '.JPG', 2),
	(73, 116, '..\\img\\', 'orangeSalad.jpg', 'recipe5.jpg', '5829', '.jpg', 1),
	(74, 116, '..\\img\\', 'chicken.jpg', 'recipe5.jpg', '12945918', '.jpg', 2),
	(75, 117, '..\\img\\', 'VeganFriedRice.jpg', 'recipe5.jpg', '12945918', '.jpg', 2),
	(76, 117, '..\\img\\', 'VeganFriedRice.jpg', 'recipe4.jpg', '18952741', '.jpg', 1),
	(80, 120, '..\\img\\', '202421545614107.JPG', '5.JPG', '19471', '.JPG', 2),
	(81, 120, '..\\img\\', '202421493114587.jpg', 'recipe3.jpg', '3680', '.JPG', 2),
	(82, 120, '..\\img\\', '202421462237714.jpg', 'recipe4.jpg', '141154', '.jpg', 1),
	(83, 123, '..\\img\\', 'KoreanRadish.jpg', 'recipe5.jpg', '12945918', '.jpg', 2),
	(84, 123, '..\\img\\', 'KoreanRadish.jpg', 'recipe3.jpg', '25393417', '.jpg', 1),
	(90, 123, '..\\img\\', 'orangeSalad.jpg', 'bg0.jpg', '528000', '.jpg', 2),
	(95, 139, '..\\img\\', 'salmonPoke.jpg', 'salmonPoke.jpg', '141154', '.jpg', 1),
	(96, 108, '..\\img\\', '202422031022193.jpg', 'recipe3.jpg', '246430', '.jpg', 2),
	(97, 115, '..\\img\\', 'noodle.jpg', 'recipe3.jpg', '141154', '.jpg', 2),
	(98, 115, '..\\img\\', 'noodle.jpg', 'recipe5.jpg', '12945918', '.jpg', 1),
	(99, 139, '..\\img\\', 'salmonPoke.jpg', 'orangeSalad.jpg', '27028', '.jpg', 2);

-- 테이블 test.eco_cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_cart` (
  `CART_NO` int NOT NULL AUTO_INCREMENT,
  `USERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ITEM_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CDATETIME` datetime NOT NULL,
  `IS_FAVORITE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N',
  `SELECTCNT` int DEFAULT '0',
  PRIMARY KEY (`CART_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_cart:~16 rows (대략적) 내보내기
INSERT INTO `eco_cart` (`CART_NO`, `USERID`, `ITEM_NO`, `CDATETIME`, `IS_FAVORITE`, `SELECTCNT`) VALUES
	(1, 'hong123', '4', '2024-03-06 10:06:34', 'N', 1),
	(99, 'test123', '51', '2024-03-18 10:21:58', 'N', 1),
	(105, 'hommefatale01', '49', '2024-03-18 18:10:23', 'N', 1),
	(106, 'hommefatale01', '49', '2024-03-18 18:10:26', 'N', 1),
	(107, 'hommefatale01', '51', '2024-03-18 18:10:27', 'N', 1),
	(108, 'hommefatale01', '50', '2024-03-18 18:10:29', 'N', 1),
	(109, 'hommefatale01', '59', '2024-03-18 18:10:31', 'N', 1),
	(110, 'hommefatale01', '55', '2024-03-18 18:10:33', 'N', 1),
	(220, 'temp123', '68', '2024-03-21 11:13:23', 'N', 4),
	(221, 'temp123', '66', '2024-03-21 11:15:05', 'N', 1),
	(223, 'temp123', '65', '2024-03-21 11:15:18', 'N', 1),
	(258, 'kfkmds', '68', '2024-03-21 15:10:52', 'N', 0),
	(260, 'kfkmds', '68', '2024-03-21 15:11:00', 'Y', 1),
	(261, 'kfkmds', '66', '2024-03-21 15:13:02', 'N', 0),
	(262, 'kfkmds', '65', '2024-03-21 15:13:04', 'N', 0),
	(263, 'temp123', '67', '2024-03-21 15:38:21', 'Y', 1);

-- 테이블 test.eco_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_code` (
  `KIND` varchar(20) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `CODE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_code:~9 rows (대략적) 내보내기
INSERT INTO `eco_code` (`KIND`, `NAME`, `CODE`) VALUES
	('product', 'gluten', 'gluten'),
	('product', 'local', 'local'),
	('product', 'organic', 'org'),
	('product', '\r\nvegan', 'vegan'),
	('board', '공지사항', '1'),
	('board', '레시피 갤러리', '2'),
	('board', '문의 게시판', '3'),
	('boardFile', '썸네일', '1'),
	('boardFile', '내용', '2');

-- 테이블 test.eco_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_comment` (
  `COMMENTNO` int NOT NULL AUTO_INCREMENT,
  `BOARDNO` int DEFAULT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  `USERID` varchar(30) DEFAULT NULL,
  `DELETEYN` char(1) DEFAULT NULL,
  `PCOMMENTNO` int DEFAULT NULL,
  `REGDATE` datetime DEFAULT NULL,
  `UPDATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`COMMENTNO`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_comment:~23 rows (대략적) 내보내기
INSERT INTO `eco_comment` (`COMMENTNO`, `BOARDNO`, `COMMENT`, `USERID`, `DELETEYN`, `PCOMMENTNO`, `REGDATE`, `UPDATEDATE`) VALUES
	(12, 42, '3123123', 'admin', '0', NULL, '2024-03-12 19:04:49', '2024-03-12 19:04:49'),
	(13, 8, '12312321312321321', 'admin', '0', NULL, '2024-03-12 19:05:05', '2024-03-12 19:05:05'),
	(14, 51, '메롱', 'admin', '0', NULL, '2024-03-12 19:07:45', '2024-03-12 19:07:45'),
	(15, 52, '너무 좋아요', 'temp123', '0', NULL, '2024-03-14 10:40:29', '2024-03-14 10:40:30'),
	(16, 82, '답변을 남겨보겠습니다!', 'admin', '0', NULL, '2024-03-14 12:34:14', '2024-03-14 12:34:14'),
	(21, 30, '집에보내주세요!', 'admin', '0', NULL, '2024-03-15 14:47:59', '2024-03-15 14:47:59'),
	(23, 118, '답변테스트', 'admin', '0', NULL, '2024-03-15 14:50:45', '2024-03-15 14:50:45'),
	(24, 30, '꺼져', 'test123', '0', NULL, '2024-03-18 15:00:51', '2024-03-18 15:00:51'),
	(25, 127, '확인 끝', 'admin', '0', NULL, '2024-03-18 16:00:03', '2024-03-18 16:00:03'),
	(26, 81, '답변 확인 테스트', 'admin', '0', NULL, '2024-03-18 16:05:58', '2024-03-18 16:05:58'),
	(27, 34, '답변이용', 'admin', '0', NULL, '2024-03-19 21:01:30', '2024-03-19 21:01:30'),
	(28, 35, '나도 몰라 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ히히히히히히히히히히히히히히히히회히히ㅣㅎ', 'admin', '0', NULL, '2024-03-19 21:53:38', '2024-03-19 21:53:38'),
	(29, 68, '문의하지마마마마마마마마마마!!', 'admin', '0', NULL, '2024-03-19 22:06:03', '2024-03-19 22:06:03'),
	(30, 38, '네 항생제를 사용하지 않고 방목하여 키운 닭에서 생산된 계란입니다.', 'admin', '0', NULL, '2024-03-21 15:19:06', '2024-03-21 15:19:06'),
	(31, 147, '답변입니다.', 'admin', '0', NULL, '2024-03-21 16:52:14', '2024-03-21 16:52:14'),
	(32, 40, '어쩔', 'admin', '0', NULL, '2024-04-16 03:56:00', '2024-04-16 03:56:00'),
	(33, 127, '확인하였습니다', 'admin', '0', NULL, '2024-04-18 08:47:48', '2024-04-18 08:47:48'),
	(34, 147, '답변', 'admin', '0', NULL, '2024-04-18 08:48:08', '2024-04-18 08:48:08'),
	(35, 154, '잘 담아보시는 걸 추천합니다', 'admin', '0', NULL, '2024-04-18 08:48:46', '2024-04-18 08:48:46'),
	(37, 154, 'ㅎㅎㅎㅎㅎ', 'admin', '0', NULL, '2024-04-18 08:49:04', '2024-04-18 08:49:04'),
	(38, 153, 'ㅂㅈㄷㅂㅈㄷㅂㅈㄷ', 'admin', '0', NULL, '2024-04-18 08:49:46', '2024-04-18 08:49:46'),
	(40, 22, '답변 테스트', 'admin', '0', NULL, '2024-04-18 08:54:39', '2024-04-18 08:54:39'),
	(41, 43, '죄송합니다, 고객님. 바로 확인하고 처리해드리겠습니다.', 'admin', '0', NULL, '2024-04-19 01:00:57', '2024-04-19 01:00:57');

-- 테이블 test.eco_famer_qa 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_famer_qa` (
  `BOARDNO` int NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(1000) DEFAULT NULL,
  `USERID` varchar(30) DEFAULT NULL,
  `DELETEYN` char(1) DEFAULT 'N',
  `DELETEDATE` datetime DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  `SECRETYN` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_famer_qa:~0 rows (대략적) 내보내기

-- 테이블 test.eco_famer_qa_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_famer_qa_image` (
  `FILENO` int NOT NULL,
  `BOARDNO` int DEFAULT NULL,
  `FILEPATH` varchar(200) DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  `FILEORGNAME` varchar(200) DEFAULT NULL,
  `FILESIZE` varchar(20) DEFAULT NULL,
  `FILEETC` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FILENO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_famer_qa_image:~0 rows (대략적) 내보내기

-- 테이블 test.eco_famer_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_famer_review` (
  `REVIEW_NO` int NOT NULL,
  `ITEM_NO` varchar(100) DEFAULT NULL,
  `USERID` varchar(20) DEFAULT NULL,
  `R_CONTENTS` varchar(200) DEFAULT NULL,
  `SCORE` decimal(5,2) DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  `DELETEYN` char(1) DEFAULT 'N',
  `DELETEDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_famer_review:~0 rows (대략적) 내보내기

-- 테이블 test.eco_famer_review_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_famer_review_image` (
  `FILENO` int NOT NULL,
  `BOARDNO` int DEFAULT NULL,
  `FILEPATH` varchar(200) DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  `FILEORGNAME` varchar(200) DEFAULT NULL,
  `FILESIZE` varchar(20) DEFAULT NULL,
  `FILEETC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_famer_review_image:~0 rows (대략적) 내보내기

-- 테이블 test.eco_payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_payment` (
  `PAYMENT_NO` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) NOT NULL,
  `PAYMENT_KEY` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '카카오페이 결제시 생성된 코드',
  `USE_POINT` int NOT NULL DEFAULT '0' COMMENT '결제에 사용한 포인트',
  `REWARD_POINT` int NOT NULL DEFAULT '0' COMMENT '적립된 포인트',
  `SUM_PRICE` int NOT NULL COMMENT '실제 결제 가격(할인가+쿠폰가 다 적용된 거)',
  `PAYTIME` datetime DEFAULT NULL COMMENT '결제된 날짜(시간)',
  `ADDRNO` int NOT NULL,
  PRIMARY KEY (`PAYMENT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_payment:~2 rows (대략적) 내보내기
INSERT INTO `eco_payment` (`PAYMENT_NO`, `USER_ID`, `PAYMENT_KEY`, `USE_POINT`, `REWARD_POINT`, `SUM_PRICE`, `PAYTIME`, `ADDRNO`) VALUES
	(1, 'admin', '1698395680718051612639732028603988742607160021995563894726776986998251801391108647968944387209344350', 0, 99, 9405, '2024-05-21 16:12:25', 38),
	(2, 'admin', '5690615939432022385740289738533341413875987304921677916851024756411184362641967334606697489813073058', 0, 2660, 210300, '2024-05-28 08:05:41', 30);

-- 테이블 test.eco_payment_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_payment_detail` (
  `PAYMENT_NO` int DEFAULT NULL,
  `ITEM_NO` int DEFAULT NULL,
  `SELLCNT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_payment_detail:~10 rows (대략적) 내보내기
INSERT INTO `eco_payment_detail` (`PAYMENT_NO`, `ITEM_NO`, `SELLCNT`) VALUES
	(NULL, 66, 1),
	(1, 66, 1),
	(2, 53, 1),
	(2, 55, 1),
	(2, 54, 1),
	(2, 61, 1),
	(2, 60, 1),
	(2, 59, 1),
	(2, 66, 1),
	(2, 68, 2);

-- 테이블 test.eco_product 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_product` (
  `ITEM_NO` int NOT NULL AUTO_INCREMENT,
  `ITEM_NAME` varchar(100) NOT NULL,
  `PRICE` int NOT NULL DEFAULT (0),
  `S_RATE` float NOT NULL DEFAULT (0),
  `P_RATE` float NOT NULL DEFAULT (0),
  `CONTENTS` varchar(1000) NOT NULL,
  `TRANS_INFO` varchar(255) DEFAULT NULL,
  `SELLYN` char(1) NOT NULL,
  `CDATETIME` datetime NOT NULL,
  `UDATETIME` datetime NOT NULL,
  `CNT` int DEFAULT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `SELLCNT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ITEM_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_product:~16 rows (대략적) 내보내기
INSERT INTO `eco_product` (`ITEM_NO`, `ITEM_NAME`, `PRICE`, `S_RATE`, `P_RATE`, `CONTENTS`, `TRANS_INFO`, `SELLYN`, `CDATETIME`, `UDATETIME`, `CNT`, `CODE`, `SELLCNT`) VALUES
	(49, '양배추 3kg', 20000, 35, 10, '<p>테스트지롱</p>', '유료배송', 'N', '2024-03-13 18:17:55', '2024-03-22 10:13:59', 399, 'org', 101),
	(50, '비건 상품1', 150000, 5, 1, '<p>비건테스트지만 이미지는 채소죠</p>', '유료배송', 'N', '2024-03-14 09:36:37', '2024-03-18 10:51:27', 300, 'vegan', 200),
	(51, '감자 5kg', 10000, 10, 5, '<p>내요내용</p>', '무료배송', 'N', '2024-03-14 16:21:05', '2024-03-21 09:47:21', 842, 'org', 158),
	(52, '유기농 브로콜리', 1000, 1, 1, '<p>브로콜리에여</p>', '무료배송', 'N', '2024-03-15 12:34:25', '2024-03-21 09:55:22', 0, 'org', 1500),
	(53, '양배추', 1000, 1, 1, '<p>123</p>', '무료배송', 'N', '2024-03-15 12:34:51', '2024-03-21 09:44:20', 991, 'vegan', 9),
	(54, '파프리카', 1000, 1, 1, '<p>123</p>', '무료배송', 'N', '2024-03-15 12:35:01', '2024-03-21 09:57:21', 993, 'local', 7),
	(55, '토마토 단품', 1000, 10, 1, '<p>123</p>', '무료배송', 'N', '2024-03-15 12:35:09', '2024-03-21 14:45:03', 985, 'gluten', 15),
	(59, '[KF365] 친환경 브로콜리', 6750, 10, 2, '<p>무농약으로 재배한 브로콜리입니다.</p><p>건강에도 아주 좋습니다.</p>', '무료배송', 'N', '2024-03-18 11:20:12', '2024-03-21 09:51:31', 1491, 'local', 9),
	(60, '당근 10kg', 150000, 1, 1, '<p>123</p>', '무료배송', 'N', '2024-03-18 11:31:57', '2024-03-21 09:49:33', 1482, 'gluten', 18),
	(61, '오이 5kg', 30000, 0, 0, '<p>잘 될까?</p>', '무료배송', 'N', '2024-03-19 14:30:39', '2024-03-21 09:50:41', 1484, 'gluten', 16),
	(62, '케일', 15000, 5, 5, '123213123312', '무료배송', 'N', '2024-03-19 14:53:53', '2024-03-21 09:56:14', 0, 'org', 100),
	(65, '채소묶음', 15000, 1, 1, '<p>테스트합니다.</p>', '무료배송', 'N', '2024-03-20 10:29:46', '2024-03-21 09:50:57', 0, 'gluten', 11),
	(66, '비건햄 (Vegan Ham) 500g - 무오신채', 9900, 5, 1, '<p>맛있어요</p>', '무료배송', 'N', '2024-03-21 09:52:10', '2024-03-21 09:52:10', 985, 'vegan', 15),
	(67, '비건 콩불구이 250g (Vegan Soy Bulgogi)', 5500, 1, 1, '<p>콩불고기에요</p>', '무료배송', 'N', '2024-03-21 09:53:44', '2024-03-21 09:53:44', 0, 'vegan', 1500),
	(68, '[무항생제] 신선 계란', 8960, 25, 5, '<p><strong style="background-color: rgb(255, 255, 255); color: rgb(51, 51, 51);">1등급 깨끗한 계란 (국내산) 15입(특란)</strong></p>', '무료배송', 'N', '2024-03-21 10:20:51', '2024-03-21 10:26:06', 134, 'org', 16),
	(78, '유기농TEST', 1, 1, 1, '<p>test</p>', '무료배송', 'N', '2024-05-28 08:10:35', '2024-05-28 08:10:35', 123, 'local', 0);

-- 테이블 test.eco_product_chart 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_product_chart` (
  `ITEM_NO` int NOT NULL,
  `VALUE` int DEFAULT '0',
  `MONTH` int DEFAULT NULL,
  CONSTRAINT `ECO_PRODUCT_CHART_chk_1` CHECK ((`MONTH` between 1 and 12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_product_chart:~75 rows (대략적) 내보내기
INSERT INTO `eco_product_chart` (`ITEM_NO`, `VALUE`, `MONTH`) VALUES
	(49, 0, 6),
	(45, 0, 1),
	(43, 0, 7),
	(44, 0, 3),
	(51, 30, 7),
	(55, 0, 1),
	(52, 0, 2),
	(54, 0, 1),
	(53, 30, 1),
	(52, 1001, 6),
	(52, 0, 4),
	(52, 0, 5),
	(52, 1200, 6),
	(52, 30, 7),
	(52, 0, 8),
	(52, 1333, 9),
	(52, 3333, 10),
	(52, 1111, 11),
	(52, 1111, 12),
	(52, 1400, 1),
	(53, 0, 2),
	(53, 8, 4),
	(53, 1201, 5),
	(53, 0, 6),
	(53, 0, 7),
	(53, 0, 8),
	(53, 1222, 9),
	(53, 2222, 10),
	(53, 0, 11),
	(53, 1, 3),
	(53, 30, 12),
	(54, 0, 2),
	(54, 1406, 4),
	(54, 1401, 5),
	(54, 0, 6),
	(54, 0, 7),
	(54, 30, 8),
	(54, 30, 9),
	(54, 30, 10),
	(54, 30, 11),
	(54, 1111, 12),
	(54, 0, 3),
	(55, 30, 2),
	(55, 14, 4),
	(55, 1, 5),
	(55, 0, 6),
	(55, 0, 7),
	(55, 0, 8),
	(55, 1800, 9),
	(55, 1111, 10),
	(55, 1111, 11),
	(55, 1111, 12),
	(55, 1000, 2),
	(45, 0, 3),
	(49, 975, 3),
	(43, 0, 3),
	(50, 21, 3),
	(51, 31, 3),
	(63, 50, 3),
	(68, 12, 3),
	(67, 1500, 3),
	(62, 100, 3),
	(65, 11, 4),
	(68, 2, 4),
	(66, 12, 4),
	(59, 8, 4),
	(51, 8, 4),
	(49, 1, 4),
	(61, 15, 4),
	(60, 17, 4),
	(66, 3, 5),
	(60, 1, 5),
	(59, 1, 5),
	(61, 1, 5),
	(68, 2, 5);

-- 테이블 test.eco_product_famer 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_product_famer` (
  `ITEM_NO` int NOT NULL AUTO_INCREMENT,
  `ITEM_NAME` varchar(100) NOT NULL,
  `PRICE` int NOT NULL DEFAULT (0),
  `S_RATE` float NOT NULL DEFAULT (0),
  `P_RATE` float NOT NULL DEFAULT (0),
  `CONTENTS` varchar(1000) NOT NULL,
  `TRANS_INFO` varchar(255) DEFAULT NULL,
  `SELLYN` char(1) NOT NULL,
  `CDATETIME` datetime NOT NULL,
  `UDATETIME` datetime NOT NULL,
  `CNT` int DEFAULT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `SELLCNT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ITEM_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_product_famer:~1 rows (대략적) 내보내기
INSERT INTO `eco_product_famer` (`ITEM_NO`, `ITEM_NAME`, `PRICE`, `S_RATE`, `P_RATE`, `CONTENTS`, `TRANS_INFO`, `SELLYN`, `CDATETIME`, `UDATETIME`, `CNT`, `CODE`, `SELLCNT`) VALUES
	(4, '친환경 브로콜리', 1000, 10, 1, '<p>브로콜리입니다.</p>', '무료배송', 'N', '2024-05-29 09:47:01', '2024-05-29 09:47:01', 50000, 'org', 0);

-- 테이블 test.eco_product_famer_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_product_famer_image` (
  `FILENO` int NOT NULL AUTO_INCREMENT,
  `BOARDNO` int DEFAULT NULL,
  `FILEPATH` varchar(200) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `FILEORGNAME` varchar(200) NOT NULL,
  `FILESIZE` varchar(20) NOT NULL,
  `FILEETC` varchar(20) NOT NULL,
  PRIMARY KEY (`FILENO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_product_famer_image:~0 rows (대략적) 내보내기

-- 테이블 test.eco_product_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_product_image` (
  `FILENO` int NOT NULL AUTO_INCREMENT,
  `ITEM_NO` int DEFAULT NULL,
  `FILEPATH` varchar(200) DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  `FILEORGNAME` varchar(200) DEFAULT NULL,
  `FILESIZE` varchar(20) DEFAULT NULL,
  `FILEETC` varchar(20) DEFAULT NULL,
  `KIND` int DEFAULT NULL,
  PRIMARY KEY (`FILENO`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_product_image:~187 rows (대략적) 내보내기
INSERT INTO `eco_product_image` (`FILENO`, `ITEM_NO`, `FILEPATH`, `FILENAME`, `FILEORGNAME`, `FILESIZE`, `FILEETC`, `KIND`) VALUES
	(116, 43, '..\\img\\', '2024213104725716.gif', 'dog.gif', '58772', '.gif', 1),
	(117, 43, '..\\img\\adminProduct\\2024313\\', '2024213104725717.jpg', 'cup-2.jpg', '21789', '.jpg', 2),
	(118, 43, '..\\img\\adminProduct\\2024313\\', '2024213104725729.jpg', 'cup-7.jpg', '16841', '.jpg', 2),
	(119, 43, '..\\img\\adminProduct\\2024313\\', '2024213104725717.jpg', 'cup-5.jpg', '11372', '.jpg', 2),
	(120, 44, '..\\img\\', '2024213105248904.jpg', 'icon-3.jpg', '8206', '.jpg', 1),
	(121, 44, '..\\img\\adminProduct\\2024313\\', '2024213105248904.jpg', 'cup-3.jpg', '14613', '.jpg', 2),
	(122, 44, '..\\img\\adminProduct\\2024313\\', '2024213105248905.jpg', 'cup-4.jpg', '16245', '.jpg', 2),
	(123, 44, '..\\img\\adminProduct\\2024313\\', '2024213105248927.jpg', 'cup-7.jpg', '16841', '.jpg', 2),
	(124, 44, '..\\img\\adminProduct\\2024313\\', '2024213105248907.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(125, 44, '..\\img\\adminProduct\\2024313\\', '2024213105248930.jpg', 'cup-8.jpg', '13133', '.jpg', 2),
	(126, 44, '..\\img\\adminProduct\\2024313\\', '2024213105248929.gif', 'dog.gif', '58772', '.gif', 2),
	(127, 45, '..\\img\\', '2024213104882.gif', 'dog.gif', '58772', '.gif', 1),
	(128, 45, '..\\img\\adminProduct\\2024313\\', '2024213104882.jpg', 'cup-2.jpg', '21789', '.jpg', 2),
	(129, 45, '..\\img\\adminProduct\\2024313\\', '2024213104882.jpg', 'cup-4.jpg', '16245', '.jpg', 2),
	(130, 46, '..\\img\\adminProduct\\2024313\\', '202421344434350.jpg', 'img1.jpg', '43724', '.jpg', 2),
	(131, 46, '..\\img\\', '202421344434350.jpg', 'img.jpg', '4855', '.jpg', 1),
	(132, 46, '..\\img\\adminProduct\\2024313\\', '202421344434350.jpg', 'img.jpg', '4855', '.jpg', 2),
	(133, 47, '..\\img\\adminProduct\\2024313\\', '20242134466782.jpg', 'img.jpg', '4855', '.jpg', 2),
	(134, 47, '..\\img\\', '20242134466782.jpg', 'img1.jpg', '43724', '.jpg', 1),
	(135, 47, '..\\img\\adminProduct\\2024313\\', '20242134466785.jpg', 'img1.jpg', '43724', '.jpg', 2),
	(136, 47, '..\\img\\adminProduct\\2024313\\', '20242134466788.jpg', 'vegetable.jpg', '59812', '.jpg', 2),
	(137, 48, '..\\img\\adminProduct\\2024313\\', '202421361714474.jpg', 'vegetable.jpg', '59812', '.jpg', 2),
	(138, 48, '..\\img\\', '202421361714483.jpg', 'img.jpg', '4855', '.jpg', 1),
	(139, 49, '..\\img\\adminProduct\\2024313\\', '202421361756337.jpg', 'img.jpg', '4855', '.jpg', 2),
	(141, 49, '..\\img\\adminProduct\\2024313\\', '202421361756345.jpg', 'vegetable.jpg', '59812', '.jpg', 2),
	(142, 50, '..\\img\\', '202421493638289.jpg', 'vegetable.jpg', '59812', '.jpg', 1),
	(143, 50, '..\\img\\adminProduct\\2024314\\', '202421493638289.jpg', 'vegetable4.jpg', '70556', '.jpg', 2),
	(144, 50, '..\\img\\adminProduct\\2024314\\', '202421493638295.jpg', 'vegetable.jpg', '59812', '.jpg', 2),
	(146, 51, '..\\img\\adminProduct\\2024314\\', '20242144216260.jpg', 'bg0.jpg', '528000', '.jpg', 2),
	(147, 51, '..\\img\\adminProduct\\2024314\\', '20242144216260.jpg', 'cup-4.jpg', '16245', '.jpg', 2),
	(148, 51, '..\\img\\adminProduct\\2024314\\', '20242144216260.jpg', 'bg3.jpg', '27028', '.jpg', 2),
	(149, 51, '..\\img\\adminProduct\\2024314\\', '20242144216290.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(150, 51, '..\\img\\adminProduct\\2024314\\', '20242144216260.jpg', 'bg2.jpg', '161195', '.jpg', 2),
	(151, 51, '..\\img\\adminProduct\\2024314\\', '20242144216291.jpg', 'cup-5.jpg', '11372', '.jpg', 2),
	(152, 52, '..\\img\\adminProduct\\2024315\\', '202421503427510.jpg', 'cup-3.jpg', '14613', '.jpg', 2),
	(155, 53, '..\\img\\adminProduct\\2024315\\', '20242150345216.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(156, 54, '..\\img\\adminProduct\\2024315\\', '20242150352311.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(159, 55, '..\\img\\adminProduct\\2024315\\', '202421503510317.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(160, 56, '..\\img\\adminProduct\\2024318\\', '2024218111045965.jpg', 'cup-5.jpg', '11372', '.jpg', 2),
	(161, 56, '..\\img\\adminProduct\\2024318\\', '2024218111045965.jpg', 'cup-4.jpg', '16245', '.jpg', 2),
	(162, 56, '..\\img\\', '2024218111045965.jpg', 'prod1.jpg', '22302', '.jpg', 1),
	(163, 56, '..\\img\\adminProduct\\2024318\\', '2024218111045965.jpg', 'cup-3.jpg', '14613', '.jpg', 2),
	(164, 57, '..\\img\\adminProduct\\2024318\\', '202421811132624.jpg', 'bg3.jpg', '27028', '.jpg', 2),
	(165, 57, '..\\img\\adminProduct\\2024318\\', '202421811132621.png', 'book-icon.png', '1061', '.png', 2),
	(166, 57, '..\\img\\', '202421811132621.jpg', 'cup-7.jpg', '16841', '.jpg', 1),
	(167, 57, '..\\img\\adminProduct\\2024318\\', '202421811132625.jpg', 'bg1.jpg', '123979', '.jpg', 2),
	(168, 57, '..\\img\\adminProduct\\2024318\\', '202421811132633.jpg', 'cup-4.jpg', '16245', '.jpg', 3),
	(169, 57, '..\\img\\adminProduct\\2024318\\', '202421811132643.jpg', 'cup-6.jpg', '12919', '.jpg', 3),
	(170, 57, '..\\img\\adminProduct\\2024318\\', '202421811132633.jpg', 'cup-3.jpg', '14613', '.jpg', 3),
	(171, 58, '..\\img\\', '2024218111420224.jpg', 'bg2.jpg', '161195', '.jpg', 1),
	(172, 58, '..\\img\\adminProduct\\2024318\\', '2024218111420226.jpg', 'bg2.jpg', '161195', '.jpg', 2),
	(173, 58, '..\\img\\adminProduct\\2024318\\', '2024218111420225.jpg', 'bg0.jpg', '528000', '.jpg', 2),
	(174, 58, '..\\img\\adminProduct\\2024318\\', '2024218111420234.jpg', 'cup-4.jpg', '16245', '.jpg', 3),
	(175, 58, '..\\img\\adminProduct\\2024318\\', '2024218111420238.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(176, 58, '..\\img\\adminProduct\\2024318\\', '2024218111420225.jpg', 'bg1.jpg', '123979', '.jpg', 2),
	(177, 58, '..\\img\\adminProduct\\2024318\\', '2024218111420244.jpg', 'cup-5.jpg', '11372', '.jpg', 3),
	(178, 58, '..\\img\\adminProduct\\2024318\\', '2024218111420245.jpg', 'cup-6.jpg', '12919', '.jpg', 3),
	(183, 59, '..\\img\\adminProduct\\2024318\\', '2024218112016439.jpg', 'bg1.jpg', '123979', '.jpg', 3),
	(184, 59, '..\\img\\adminProduct\\2024318\\', '2024218112016446.jpg', 'bg2.jpg', '161195', '.jpg', 3),
	(185, 59, '..\\img\\adminProduct\\2024318\\', '2024218112016448.jpg', 'cup-5.jpg', '11372', '.jpg', 3),
	(186, 59, '..\\img\\adminProduct\\2024318\\', '2024218112016453.jpg', 'cup-6.jpg', '12919', '.jpg', 3),
	(188, 60, '..\\img\\adminProduct\\2024318\\ContentsDetail\\', '202421811320967.jpg', 'icon-3.jpg', '8206', '.jpg', 3),
	(189, 60, '..\\img\\adminProduct\\2024318\\ContentsThumbnail\\', '202421811320968.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(191, 61, '..\\img\\adminProduct\\2024319\\ContentsThumbnail\\', '202421923040492.jpg', 'bg3.jpg', '27028', '.jpg', 2),
	(192, 61, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '202421923040492.jpg', 'icon-3.jpg', '8206', '.jpg', 3),
	(193, 62, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '202421925354987.jpg', 'TestImg1.jpg', '667333', '.jpg', 3),
	(196, 62, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '202421925354985.jpg', 'TestImg2.jpg', '198314', '.jpg', 3),
	(197, 62, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '202421925354988.jpg', 'TestImg3.jpg', '963255', '.jpg', 3),
	(198, 63, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '202421991257973.jpg', 'food2.jpg', '63361', '.jpg', 3),
	(199, 63, '..\\img\\adminProduct\\2024319\\ContentsThumbnail\\', '202421991257973.jpg', 'food3.jpg', '50019', '.jpg', 2),
	(200, 63, '..\\img\\adminProduct\\2024319\\ListThumbnail\\', '202421991257973.jpg', 'food1.jpg', '10306', '.jpg', 1),
	(201, 63, '..\\img\\adminProduct\\2024319\\ContentsThumbnail\\', '202421991257973.jpg', 'food2.jpg', '63361', '.jpg', 2),
	(202, 63, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '202421991257973.jpg', 'food1.jpg', '10306', '.jpg', 3),
	(203, 63, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '202421991257981.jpg', 'food3.jpg', '50019', '.jpg', 3),
	(204, 63, '..\\img\\adminProduct\\2024319\\ContentsDetail\\', '2024219912583.jpg', 'food4.jpg', '139959', '.jpg', 3),
	(205, 64, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '2024220102845433.jpg', 'TestImg1.jpg', '667333', '.jpg', 3),
	(207, 64, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '2024220102845433.jpg', 'vegetable4.jpg', '70556', '.jpg', 2),
	(208, 64, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '2024220102845433.jpg', 'vegetable.jpg', '59812', '.jpg', 2),
	(209, 64, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '2024220102845433.jpg', 'vegetable3.jpg', '111612', '.jpg', 2),
	(210, 64, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '2024220102845467.jpg', 'TestImg2.jpg', '198314', '.jpg', 3),
	(211, 64, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '2024220102845482.jpg', 'TestImg3.jpg', '963255', '.jpg', 3),
	(212, 65, '..\\img\\adminProduct\\2024320\\ListThumbnail\\', '2024220102948938.jpg', 'vegetable.jpg', '59812', '.jpg', 1),
	(213, 65, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '2024220102948938.jpg', 'vegetable.jpg', '59812', '.jpg', 2),
	(214, 65, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '2024220102948939.jpg', 'vegetable3.jpg', '111612', '.jpg', 2),
	(215, 65, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '2024220102948941.jpg', 'vegetable.jpg', '59812', '.jpg', 3),
	(216, 65, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '2024220102948940.jpg', 'vegetable2.jpg', '10057', '.jpg', 3),
	(217, 65, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '2024220102948939.jpg', 'vegetable2.jpg', '10057', '.jpg', 2),
	(218, 65, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '2024220102948960.jpg', 'vegetable3.jpg', '111612', '.jpg', 3),
	(219, 65, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '2024220102948960.jpg', 'vegetable4.jpg', '70556', '.jpg', 3),
	(221, 62, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '202422043514870.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(222, 62, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '202422043514873.jpg', 'bg1.jpg', '123979', '.jpg', 3),
	(223, 62, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '202422043514872.jpg', 'bg1.jpg', '123979', '.jpg', 2),
	(224, 62, '..\\img\\adminProduct\\2024320\\ContentsThumbnail\\', '202422043514869.jpg', 'bg2.jpg', '161195', '.jpg', 2),
	(225, 62, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '202422043514895.jpg', 'cup-5.jpg', '11372', '.jpg', 3),
	(226, 62, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '202422043514896.jpg', 'bg2.jpg', '161195', '.jpg', 3),
	(227, 62, '..\\img\\adminProduct\\2024320\\ContentsDetail\\', '202422043514901.jpg', 'cup-6.jpg', '12919', '.jpg', 3),
	(228, 53, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422194423761.jpg', 'whole-fresh-savoy-cabbage-on-wooden-surface.jpg', '958678', '.jpg', 1),
	(229, 49, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422194540130.png', '양배추.png', '864910', '.png', 1),
	(230, 51, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422194657414.png', '감자.png', '659001', '.png', 1),
	(231, 55, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422194845734.png', '토마토.png', '486054', '.png', 1),
	(232, 60, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422194936497.png', '당근.png', '734814', '.png', 1),
	(233, 61, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422195044115.png', '오이.png', '375190', '.png', 1),
	(234, 59, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422195133146.jpg', 'thumb_productDetail_256420_1_20220313122424.jpg', '213245', '.jpg', 3),
	(235, 59, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422195133145.jpg', 'hgfood_fresh_caution.jpg', '81827', '.jpg', 3),
	(236, 59, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422195133146.jpg', '20158.jpg', '851586', '.jpg', 2),
	(237, 59, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422195133145.jpg', 'broccoli-4.jpg', '131759', '.jpg', 2),
	(238, 59, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422195133178.jpg', 'fresh-broccoli-vegetable.jpg', '5243174', '.jpg', 2),
	(239, 59, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422195133178.jpg', 'fresh-broccoli-vegetable.jpg', '5243174', '.jpg', 1),
	(240, 66, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422195213279.jpg', '비건햄.jpg', '37817', '.jpg', 2),
	(241, 66, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422195213279.jpg', '비건햄.jpg', '37817', '.jpg', 3),
	(242, 66, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422195213279.jpg', '비건햄.jpg', '37817', '.jpg', 1),
	(243, 67, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422195347394.png', '비건 콩불고기.png', '271001', '.png', 3),
	(244, 67, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422195347393.png', '비건 콩불고기.png', '271001', '.png', 2),
	(245, 67, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422195347393.png', '비건 콩불고기.png', '271001', '.png', 1),
	(246, 52, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422195510829.png', '브로콜리.png', '798872', '.png', 1),
	(247, 62, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422195617238.png', '케일.png', '516002', '.png', 1),
	(248, 54, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422195724288.png', '파프리카.png', '514345', '.png', 1),
	(249, 68, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422110205331.jpg', '230105_370.jpg', '86791', '.jpg', 3),
	(250, 68, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422110205331.jpg', '11633686_6_960.jpg', '77906', '.jpg', 2),
	(251, 68, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422110205331.jpg', 'EGG.jpg', '51532', '.jpg', 1),
	(252, 68, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422110205345.jpg', '230105_372-.jpg', '269745', '.jpg', 3),
	(253, 68, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422110224768.jpg', '230105_370.jpg', '86791', '.jpg', 2),
	(254, 68, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422110267182.jpg', '230105_371.jpg', '122470', '.jpg', 3),
	(255, 1, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422134043931.jpg', 'cup-6.jpg', '12919', '.jpg', 3),
	(256, 1, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422134043931.jpg', 'cup-2.jpg', '21789', '.jpg', 1),
	(257, 1, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422134043931.jpg', 'cup-3.jpg', '14613', '.jpg', 2),
	(258, 69, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422134328188.jpg', 'cup-8.jpg', '13133', '.jpg', 2),
	(259, 69, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422134328188.jpg', 'icon-2.jpg', '11401', '.jpg', 1),
	(260, 69, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422134328188.jpg', 'icon-2.jpg', '11401', '.jpg', 3),
	(261, 70, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '202422134329120.jpg', 'icon-2.jpg', '11401', '.jpg', 3),
	(262, 70, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '202422134329120.jpg', 'cup-8.jpg', '13133', '.jpg', 2),
	(263, 70, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '202422134329120.jpg', 'icon-2.jpg', '11401', '.jpg', 1),
	(264, 71, '..\\img\\adminProduct\\2024321\\ContentsThumbnail\\', '20242214555721.jpg', 'cat-4.jpg', '39994', '.jpg', 2),
	(265, 71, '..\\img\\adminProduct\\2024321\\ContentsDetail\\', '20242214555721.jpg', 'cat-5.jpg', '16199', '.jpg', 3),
	(266, 71, '..\\img\\adminProduct\\2024321\\ListThumbnail\\', '20242214555721.jpg', 'cat-4.jpg', '39994', '.jpg', 1),
	(267, 72, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '2024222101628505.jpg', 'vegetable3.jpg', '111612', '.jpg', 3),
	(268, 72, '..\\img\\adminProduct\\2024322\\ContentsThumbnail\\', '2024222101628505.jpg', 'vegetable3.jpg', '111612', '.jpg', 2),
	(269, 72, '..\\img\\adminProduct\\2024322\\ListThumbnail\\', '2024222101628505.jpg', 'vegetable.jpg', '59812', '.jpg', 1),
	(270, 72, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '2024222101628505.jpg', 'vegetable4.jpg', '70556', '.jpg', 3),
	(271, 72, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '2024222101628505.jpg', 'vegetable2.jpg', '10057', '.jpg', 3),
	(272, 73, '..\\img\\adminProduct\\2024322\\ContentsThumbnail\\', '202422210195459.jpg', 'vegetable4.jpg', '70556', '.jpg', 2),
	(273, 73, '..\\img\\adminProduct\\2024322\\ListThumbnail\\', '202422210195461.jpg', 'vegetable.jpg', '59812', '.jpg', 1),
	(274, 73, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '202422210195461.jpg', 'vegetable2.jpg', '10057', '.jpg', 3),
	(275, 73, '..\\img\\adminProduct\\2024322\\ContentsThumbnail\\', '202422210195460.jpg', 'vegetable3.jpg', '111612', '.jpg', 2),
	(276, 73, '..\\img\\adminProduct\\2024322\\ContentsThumbnail\\', '202422210195458.jpg', 'vegetable2.jpg', '10057', '.jpg', 2),
	(277, 73, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '202422210195462.jpg', 'vegetable.jpg', '59812', '.jpg', 3),
	(278, 73, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '202422210195478.jpg', 'vegetable4.jpg', '70556', '.jpg', 3),
	(279, 74, '..\\img\\adminProduct\\2024322\\ContentsThumbnail\\', '2024222102325166.jpg', 'vegetable.jpg', '59812', '.jpg', 2),
	(280, 74, '..\\img\\adminProduct\\2024322\\ListThumbnail\\', '2024222102325166.jpg', 'vegetable.jpg', '59812', '.jpg', 1),
	(281, 74, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '2024222102325168.jpg', 'vegetable.jpg', '59812', '.jpg', 3),
	(282, 74, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '2024222102325170.jpg', 'vegetable3.jpg', '111612', '.jpg', 3),
	(283, 74, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '2024222102325175.jpg', 'vegetable4.jpg', '70556', '.jpg', 3),
	(284, 74, '..\\img\\adminProduct\\2024322\\ContentsDetail\\', '2024222102325168.jpg', 'vegetable2.jpg', '10057', '.jpg', 3),
	(285, 75, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '2024316086879.jpg', '230105_366.jpg', '90606', '.jpg', 3),
	(286, 75, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '2024316086879.jpg', '230105_368.jpg', '83601', '.jpg', 3),
	(287, 75, '..\\img\\adminProduct\\2024416\\ContentsThumbnail\\', '2024316086879.jpg', '230105_368.jpg', '83601', '.jpg', 2),
	(288, 75, '..\\img\\adminProduct\\2024416\\ContentsThumbnail\\', '2024316086879.jpg', '230105_370.jpg', '86791', '.jpg', 2),
	(289, 75, '..\\img\\adminProduct\\2024416\\ContentsThumbnail\\', '2024316086879.jpg', '230105_366.jpg', '90606', '.jpg', 2),
	(290, 75, '..\\img\\adminProduct\\2024416\\ListThumbnail\\', '2024316086879.jpg', '230105_366.jpg', '90606', '.jpg', 1),
	(291, 75, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '2024316086908.jpg', '230105_370.jpg', '86791', '.jpg', 3),
	(292, 75, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '2024316086910.jpg', '230105_371.jpg', '122470', '.jpg', 3),
	(293, 75, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '2024316086915.jpg', '230105_372-.jpg', '269745', '.jpg', 3),
	(294, 76, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601141873.jpg', '230105_368.jpg', '83601', '.jpg', 3),
	(295, 76, '..\\img\\adminProduct\\2024416\\ContentsThumbnail\\', '202431601141872.jpg', '230105_370.jpg', '86791', '.jpg', 2),
	(296, 76, '..\\img\\adminProduct\\2024416\\ListThumbnail\\', '202431601141871.jpg', '230105_366.jpg', '90606', '.jpg', 1),
	(297, 76, '..\\img\\adminProduct\\2024416\\ContentsThumbnail\\', '202431601141871.jpg', '230105_366.jpg', '90606', '.jpg', 2),
	(298, 76, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601141873.jpg', '230105_370.jpg', '86791', '.jpg', 3),
	(299, 76, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601141881.jpg', '230105_371.jpg', '122470', '.jpg', 3),
	(300, 76, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601141897.jpg', '230105_372-.jpg', '269745', '.jpg', 3),
	(301, 77, '..\\img\\adminProduct\\2024416\\ListThumbnail\\', '202431601529745.jpg', '230105_366.jpg', '90606', '.jpg', 1),
	(302, 77, '..\\img\\adminProduct\\2024416\\ContentsThumbnail\\', '202431601529748.jpg', '230105_370.jpg', '86791', '.jpg', 2),
	(303, 77, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601529749.jpg', '230105_368.jpg', '83601', '.jpg', 3),
	(304, 77, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601529750.jpg', '230105_370.jpg', '86791', '.jpg', 3),
	(305, 77, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601529755.jpg', '230105_371.jpg', '122470', '.jpg', 3),
	(306, 77, '..\\img\\adminProduct\\2024416\\ContentsDetail\\', '202431601529758.jpg', '230105_372-.jpg', '269745', '.jpg', 3),
	(307, 2, '..\\img\\adminProduct\\2024528\\ContentsDetail\\', '20244288058489.jpg', 'cup-7.jpg', '16841', '.jpg', 3),
	(308, 2, '..\\img\\adminProduct\\2024528\\ContentsThumbnail\\', '20244288058489.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(309, 2, '..\\img\\adminProduct\\2024528\\ListThumbnail\\', '20244288058489.jpg', 'bg0.jpg', '528000', '.jpg', 1),
	(310, 3, '..\\img\\adminProduct\\2024528\\ContentsDetail\\', '2024428811328.jpg', 'cup-7.jpg', '16841', '.jpg', 3),
	(311, 3, '..\\img\\adminProduct\\2024528\\ContentsThumbnail\\', '2024428811328.jpg', 'cup-6.jpg', '12919', '.jpg', 2),
	(312, 3, '..\\img\\adminProduct\\2024528\\ListThumbnail\\', '2024428811332.jpg', 'bg0.jpg', '528000', '.jpg', 1),
	(313, 78, '..\\img\\adminProduct\\2024528\\ContentsThumbnail\\', '202442881035847.jpg', 'cup-5.jpg', '11372', '.jpg', 2),
	(314, 78, '..\\img\\adminProduct\\2024528\\ListThumbnail\\', '202442881035848.jpg', '300.jpg', '60462', '.jpg', 1),
	(315, 78, '..\\img\\adminProduct\\2024528\\ContentsDetail\\', '202442881035853.jpg', 'cup-6.jpg', '12919', '.jpg', 3),
	(316, 4, '..\\img\\adminProduct\\2024529\\ListThumbnail\\', '20244299471816.jpg', 'test 브로콜리.jpg', '5243174', '.jpg', 1),
	(317, 4, '..\\img\\adminProduct\\2024529\\ContentsDetail\\', '20244299471816.jpg', 'test 브로콜리.jpg', '5243174', '.jpg', 3),
	(318, 4, '..\\img\\adminProduct\\2024529\\ContentsThumbnail\\', '20244299471816.jpg', 'test 브로콜리.jpg', '5243174', '.jpg', 2);

-- 테이블 test.eco_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_user` (
  `USERID` varchar(20) NOT NULL,
  `USERPW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `NICKNAME` varchar(20) DEFAULT NULL,
  `GENDER` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PHONE1` varchar(20) DEFAULT NULL,
  `PHONE2` varchar(20) DEFAULT NULL,
  `PHONE3` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `BIRTH` varchar(20) DEFAULT NULL,
  `USER_GRADE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AUTHYN` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EVENTYN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `LOGINCNT` int DEFAULT NULL,
  `POINT` int DEFAULT NULL,
  `TOTALPAY` int DEFAULT NULL,
  `USERTYPE` varchar(10) DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `DELETE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_user:~138 rows (대략적) 내보내기
INSERT INTO `eco_user` (`USERID`, `USERPW`, `NAME`, `NICKNAME`, `GENDER`, `PHONE1`, `PHONE2`, `PHONE3`, `EMAIL`, `BIRTH`, `USER_GRADE`, `AUTHYN`, `EVENTYN`, `LOGINCNT`, `POINT`, `TOTALPAY`, `USERTYPE`, `CDATETIME`, `UDATETIME`, `START_DATE`, `END_DATE`, `DELETE_DATE`) VALUES
	('a123123', 'a123123!', '에이', '에이', '남성', '010', '1111', '2222', 'a123123@gmail.com', '19910101', 'SILVER', 'Y', 'N', 0, 0, 0, 'F', '2024-03-15 17:16:45', '2024-04-17 03:57:58', NULL, NULL, NULL),
	('admin', 'admin', '어드민', '어드민', '남성', '010', '6536', '3310', 'admin@naver.com', '20000706', 'PLATINUM', 'Y', 'Y', 0, 789452, 41629885, 'A', '2024-03-04 11:28:57', '2024-03-18 09:46:34', '2024-03-04 11:28:57', '2024-06-04 11:28:57', NULL),
	('dong123', 'qjsgh12!', '김동휘', '동휘', '남성', '010', '7208', '2755', 'dong123@gmail.com', '19940418', 'SILVER', 'Y', 'N', 0, 0, 0, 'A', '2024-03-14 15:59:02', '2024-03-14 15:59:02', '2024-03-14 15:59:02', '2024-06-14 15:59:02', '2024-06-16 16:46:27'),
	('farmer123', 'test123', '박농부', '파머', '남성', '010', '2959', '4125', 'hommefatale01@naver.com', '19960115', 'SILVER', 'Y', 'Y', 0, 0, 0, 'F', '2024-03-18 09:56:32', '2024-03-18 09:56:32', NULL, NULL, NULL),
	('hommefatale', 'rlatmddls1!', '김승인', 'The bed is my stage', '남성', '010', '2959', '4125', 'hommefatale01@naver.com', '19960115', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-21 10:19:01', '2024-03-21 10:19:01', NULL, NULL, NULL),
	('hommefatale01', 'rlatmddls1!', 'The bed is my stage', 'The bed is my stage', '남성', '010', '2959', '4125', 'hommefatale01@naver.com', '19960115', 'SILVER', 'N', 'N', 0, 250000, 0, 'U', '2024-03-18 18:07:56', '2024-03-18 18:07:56', NULL, NULL, NULL),
	('hong123', 'qjsgh12!', '홍길동', '길동', '기타', '010', '1234', '5678', 'hong123@naver.com', '19991231', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-05 18:11:19', '2024-03-05 18:11:19', '2024-03-05 18:11:19', '2024-06-05 18:11:19', NULL),
	('kfkmds', 'dms3131@', '김은석', '유지혜', '남성', '010', '5555', '1111', 'kakkimok@naver.com', '20000706', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-21 15:07:46', '2024-03-21 15:07:46', NULL, NULL, NULL),
	('temp111', 'temp111!', '임시', '임시', '남성', '010', '1111', '1111', 'asasd@gmail.com', '19900101', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-21 16:03:34', '2024-03-21 16:03:34', NULL, NULL, NULL),
	('temp123', 'temp123!', '김임시', '임시', '남성', '010', '1010', '1010', 'asdas@gmail.com', '19910101', 'GOLD', 'Y', 'N', 0, 0, 1000000, 'U', '2024-03-18 09:49:28', '2024-03-18 09:49:28', NULL, NULL, NULL),
	('test001', 'test1234!', '김철수', '철수킴', '남성', '010', '6889', '9070', 'koreaok01@gmail.com', '19920630', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-04-19 01:37:45', '2024-04-19 01:37:45', NULL, NULL, NULL),
	('test0101', 'test0101!', '테스트이름', '테스트닉네임', '남성', '010', '6889', '9070', 'testemail@gmail.com', '19920630', 'SILVER', 'Y', 'N', 0, 896, 13440, 'U', '2024-03-22 10:01:11', '2024-03-22 10:01:11', NULL, NULL, NULL),
	('test12', 'test123@', '테스트', '테스트', '남성', '010', '6536', '3310', 'kakk@naver.com', '20000706', 'SILVER', 'Y', 'N', 0, 161980, 9659700, 'F', '2024-03-21 16:41:46', '2024-03-21 16:53:57', NULL, NULL, NULL),
	('user001', '551205091d68d333f6ed56768ef79f45', 'User001', 'Nickname001', '남성', '010', '1234', '5678', 'user001@example.com', '20240606', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user002', '67fb0144038ca286e0555ca7461e662e', 'User002', 'Nickname002', '남성', '010', '1234', '5678', 'user002@example.com', '19850905', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user003', '1ee86cbe20d57304d0a85db0c8ca5576', 'User003', 'Nickname003', '남성', '010', '1234', '5678', 'user003@example.com', '19970624', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user004', '8aeb79feea97934f5ea9851995965788', 'User004', 'Nickname004', '여성', '010', '1234', '5678', 'user004@example.com', '20010314', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user005', 'a1c9f37a41dc4db1f562ef41a3a1c39d', 'User005', 'Nickname005', '남성', '010', '1234', '5678', 'user005@example.com', '20230805', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user006', 'de985da38e0587c954bc15f62baccb32', 'User006', 'Nickname006', '여성', '010', '1234', '5678', 'user006@example.com', '20120220', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user007', 'cc65e4bd4a1c1476d7116e44054dcdf9', 'User007', 'Nickname007', '여성', '010', '1234', '5678', 'user007@example.com', '19850624', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user008', 'bd671de0e29b555bcc8223331070d9a5', 'User008', 'Nickname008', '여성', '010', '1234', '5678', 'user008@example.com', '19961002', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user009', '643d0b82a031c8ed52e20e83563d2836', 'User009', 'Nickname009', '여성', '010', '1234', '5678', 'user009@example.com', '20231111', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user010', '57e8550133b1f33b588b2e228bb33271', 'User010', 'Nickname010', '여성', '010', '1234', '5678', 'user010@example.com', '19950503', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user011', '3417e427408e2bd03c6a196f0de247b5', 'User011', 'Nickname011', '남성', '010', '1234', '5678', 'user011@example.com', '20140427', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user012', 'e9eae3f703ccf95d68d2a9096e7b49a7', 'User012', 'Nickname012', '남성', '010', '1234', '5678', 'user012@example.com', '19931224', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user013', '7e2da9434f210146bafa29d10cd342de', 'User013', 'Nickname013', '여성', '010', '1234', '5678', 'user013@example.com', '19780220', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user014', '0e2b45e8ad708972ac01f84b914b6114', 'User014', 'Nickname014', '남성', '010', '1234', '5678', 'user014@example.com', '19960723', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user015', 'aa2ae2c7ec188c56849f4378081c12f5', 'User015', 'Nickname015', '여성', '010', '1234', '5678', 'user015@example.com', '19930727', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user016', '0fd80f3c65e75150e42cf8a86a3b8f61', 'User016', 'Nickname016', '여성', '010', '1234', '5678', 'user016@example.com', '20130724', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user017', '6b9cf87cb4833ee8303a3363d2274537', 'User017', 'Nickname017', '남성', '010', '1234', '5678', 'user017@example.com', '19790307', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user018', '84973ca695f1e7b6a90bb5b483d7a12c', 'User018', 'Nickname018', '여성', '010', '1234', '5678', 'user018@example.com', '19950705', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user019', 'a3b42796a471dfbadb819275991f6687', 'User019', 'Nickname019', '남성', '010', '1234', '5678', 'user019@example.com', '20161008', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user020', '57c6fbe695c2b2180bb7c090d7e11bfd', 'User020', 'Nickname020', '여성', '010', '1234', '5678', 'user020@example.com', '19820618', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user021', 'a61d847aa1be8372b59503827be74e13', 'User021', 'Nickname021', '남성', '010', '1234', '5678', 'user021@example.com', '20120220', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user022', '0a6162ce3a75562519e415f6629ea588', 'User022', 'Nickname022', '남성', '010', '1234', '5678', 'user022@example.com', '19921227', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user023', 'fb65fb120569435dfd149af933e01324', 'User023', 'Nickname023', '여성', '010', '1234', '5678', 'user023@example.com', '20090804', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user024', 'e12c1dbb655ad91e0ccbc7a0e49a6abf', 'User024', 'Nickname024', '남성', '010', '1234', '5678', 'user024@example.com', '20161213', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user025', 'e1c77733edeb0856c2228e97588ef38a', 'User025', 'Nickname025', '남성', '010', '1234', '5678', 'user025@example.com', '19780226', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user026', 'bb689a45d42bd8f70a872aeea0f7713a', 'User026', 'Nickname026', '여성', '010', '1234', '5678', 'user026@example.com', '20071109', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user027', '2ef74bbc2d0f2b6cc62cbbbe605bf217', 'User027', 'Nickname027', '여성', '010', '1234', '5678', 'user027@example.com', '19890126', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user028', '263fb27bc768580dcdaf0caa1a5eb78b', 'User028', 'Nickname028', '남성', '010', '1234', '5678', 'user028@example.com', '20230916', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user029', 'ccec6b5cbe51a154e868332d7a692e18', 'User029', 'Nickname029', '남성', '010', '1234', '5678', 'user029@example.com', '19931004', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user030', 'e50c789603c686fe28a0a77c896d3462', 'User030', 'Nickname030', '여성', '010', '1234', '5678', 'user030@example.com', '20180817', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user031', 'f6c7bfabf29f941120f0f5e4c3427156', 'User031', 'Nickname031', '여성', '010', '1234', '5678', 'user031@example.com', '20200209', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user032', '7cf806d0f21d8e0dd708bb349a18f860', 'User032', 'Nickname032', '여성', '010', '1234', '5678', 'user032@example.com', '20210410', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user033', 'b50baf23684e5b5933ab7f1de33602d9', 'User033', 'Nickname033', '여성', '010', '1234', '5678', 'user033@example.com', '19780922', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user034', '00bd5f1c8a43abdc44b473df350bfa24', 'User034', 'Nickname034', '여성', '010', '1234', '5678', 'user034@example.com', '19910716', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user035', 'b0c805e04d216fb5485a3618189f6a46', 'User035', 'Nickname035', '여성', '010', '1234', '5678', 'user035@example.com', '20211027', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user036', 'dad81d8d4718ed7c120e9116c3c71e41', 'User036', 'Nickname036', '남성', '010', '1234', '5678', 'user036@example.com', '20121224', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user037', 'cd9574045533a05d22b986ce54e721d3', 'User037', 'Nickname037', '여성', '010', '1234', '5678', 'user037@example.com', '19770223', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user038', 'd19f31217fdb61041540be6ab7e5be70', 'User038', 'Nickname038', '남성', '010', '1234', '5678', 'user038@example.com', '19970228', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user039', 'e488fb29a9d53f264df56e9fa13bd2d6', 'User039', 'Nickname039', '여성', '010', '1234', '5678', 'user039@example.com', '20161008', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user040', '75174c80944e1b157fef5eca8748d1d9', 'User040', 'Nickname040', '남성', '010', '1234', '5678', 'user040@example.com', '20230719', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user041', 'fc91a30df385084962451964a423dae9', 'User041', 'Nickname041', '여성', '010', '1234', '5678', 'user041@example.com', '19940417', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user042', 'f0212f412914f0748ad2fa4ff266f8d1', 'User042', 'Nickname042', '여성', '010', '1234', '5678', 'user042@example.com', '20010510', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user043', '197b9e9319e7c2c4598feb22b9b52246', 'User043', 'Nickname043', '여성', '010', '1234', '5678', 'user043@example.com', '19880324', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user044', '2b0ccf097327e24b623b14d6d744ed84', 'User044', 'Nickname044', '남성', '010', '1234', '5678', 'user044@example.com', '19780116', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user045', 'cb47418207db11e5e29f88afaeebe93b', 'User045', 'Nickname045', '남성', '010', '1234', '5678', 'user045@example.com', '19921118', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user046', 'e1c45450f111dc9fafd22cc12a5906a2', 'User046', 'Nickname046', '남성', '010', '1234', '5678', 'user046@example.com', '20131014', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user047', '900ad9e8d29d8b7edc42446cb95d1b15', 'User047', 'Nickname047', '남성', '010', '1234', '5678', 'user047@example.com', '20211019', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user048', '79bce4ae01f8b33321c76028adeb3d61', 'User048', 'Nickname048', '남성', '010', '1234', '5678', 'user048@example.com', '19831207', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user049', '3e40cb06e8f7cfb0608bc745b15d9fc5', 'User049', 'Nickname049', '여성', '010', '1234', '5678', 'user049@example.com', '20040914', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user050', 'ab08f572bb542786b6100556d02d55c2', 'User050', 'Nickname050', '남성', '010', '1234', '5678', 'user050@example.com', '19770505', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user051', 'e67e8ad0cff74c239a5cd0518f209225', 'User051', 'Nickname051', '여성', '010', '1234', '5678', 'user051@example.com', '20220804', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user052', '6e386819525e52e67b7a57ea94e3f3bb', 'User052', 'Nickname052', '남성', '010', '1234', '5678', 'user052@example.com', '20090721', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user053', 'dc41e1df58503afabbfbb9a51285ee19', 'User053', 'Nickname053', '여성', '010', '1234', '5678', 'user053@example.com', '19840407', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user054', 'a4fcb47f1506fb49f9659f3a09eea8ac', 'User054', 'Nickname054', '여성', '010', '1234', '5678', 'user054@example.com', '19850901', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user055', 'fbb1c305b5e269dbb1df82efa04c84b4', 'User055', 'Nickname055', '여성', '010', '1234', '5678', 'user055@example.com', '20021016', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user056', '51b11df3afb3a466467502af17ab0bc3', 'User056', 'Nickname056', '남성', '010', '1234', '5678', 'user056@example.com', '20130222', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user057', 'b98517469d03624d14a628574cfac858', 'User057', 'Nickname057', '남성', '010', '1234', '5678', 'user057@example.com', '19770701', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user058', '13700f1e660a1b1b32a50995f5b73f44', 'User058', 'Nickname058', '여성', '010', '1234', '5678', 'user058@example.com', '20020903', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-12 12:18:30', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user059', '97b9a53d841e25bec0f29c726170a413', 'User059', 'Nickname059', '남성', '010', '1234', '5678', 'user059@example.com', '19900918', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user060', 'cfd47d6e2a8658c12e621471714149ae', 'User060', 'Nickname060', '남성', '010', '1234', '5678', 'user060@example.com', '20200317', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user061', 'ebc921a8fa947a3ffb3c7060ec4a1c36', 'User061', 'Nickname061', '여성', '010', '1234', '5678', 'user061@example.com', '20240107', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user062', 'd5d581b91f39aca3bb77c2a335f5a531', 'User062', 'Nickname062', '남성', '010', '1234', '5678', 'user062@example.com', '19991017', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user063', '247b15393c2b9d5b2376af2fddb98509', 'User063', 'Nickname063', '남성', '010', '1234', '5678', 'user063@example.com', '19760605', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user064', 'c4507e60749eb4ab41eeab15ac930201', 'User064', 'Nickname064', '남성', '010', '1234', '5678', 'user064@example.com', '20121207', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user065', '574d4e6f69cfa9bf2fe7ffb8a4362bf7', 'User065', 'Nickname065', '남성', '010', '1234', '5678', 'user065@example.com', '19820405', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user066', '9fe9943d98bea2d17713846232543e1f', 'User066', 'Nickname066', '여성', '010', '1234', '5678', 'user066@example.com', '19960118', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user067', 'be29b239b946ad34f16f4d2a04141c3c', 'User067', 'Nickname067', '남성', '010', '1234', '5678', 'user067@example.com', '19970706', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user068', '71461f40f260fb464dc06b0986dee4e0', 'User068', 'Nickname068', '여성', '010', '1234', '5678', 'user068@example.com', '19801123', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user069', '353736e0481540b34f85947c41e63553', 'User069', 'Nickname069', '남성', '010', '1234', '5678', 'user069@example.com', '19920522', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user070', '9465a6ac7ec49657b0a53e5a800a4e6e', 'User070', 'Nickname070', '여성', '010', '1234', '5678', 'user070@example.com', '19880606', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user071', '23ecf96151ed1c4a153c18333dd3611a', 'User071', 'Nickname071', '여성', '010', '1234', '5678', 'user071@example.com', '19930109', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user072', '5aa89c3be300f804d3975e1110f53deb', 'User072', 'Nickname072', '남성', '010', '1234', '5678', 'user072@example.com', '20050324', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user073', '39898913c64478b9f50eab9c532117b3', 'User073', 'Nickname073', '남성', '010', '1234', '5678', 'user073@example.com', '19900413', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user074', '30b62443adc8e7622d3c7b90ae3347e7', 'User074', 'Nickname074', '남성', '010', '1234', '5678', 'user074@example.com', '20240413', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user075', '27475202c1c82c0cd36e6d1c17770f02', 'User075', 'Nickname075', '여성', '010', '1234', '5678', 'user075@example.com', '20170209', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user076', '23af8d3488388851a0f129bbb6c015b4', 'User076', 'Nickname076', '여성', '010', '1234', '5678', 'user076@example.com', '19791003', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user077', 'd92465c3341b0c2d46bf1198ce1a73d4', 'User077', 'Nickname077', '여성', '010', '1234', '5678', 'user077@example.com', '20111111', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user078', 'd7486b7ca267d3f714aa2490a63cfe07', 'User078', 'Nickname078', '남성', '010', '1234', '5678', 'user078@example.com', '19860513', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user079', 'ed91f6caf017be88eb7461e474fe77c8', 'User079', 'Nickname079', '남성', '010', '1234', '5678', 'user079@example.com', '19960203', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user080', '16e7ad1ce78c9852b4cd308b5c8d6b19', 'User080', 'Nickname080', '여성', '010', '1234', '5678', 'user080@example.com', '19830709', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user081', 'e7e9c308f9bdf1a29cbf5a329913f68f', 'User081', 'Nickname081', '여성', '010', '1234', '5678', 'user081@example.com', '20080604', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user082', '1032d8b3f8e8314f37234a5e44719267', 'User082', 'Nickname082', '여성', '010', '1234', '5678', 'user082@example.com', '19970706', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user083', '7082adcc7680dfc6c022d669e30ea8dc', 'User083', 'Nickname083', '여성', '010', '1234', '5678', 'user083@example.com', '20130614', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user084', '3e96b845fdd8d16d429a4e1e52907949', 'User084', 'Nickname084', '남성', '010', '1234', '5678', 'user084@example.com', '19810706', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user085', 'f3a7b2b091806479ea53ef1c63dc2b26', 'User085', 'Nickname085', '여성', '010', '1234', '5678', 'user085@example.com', '19750216', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user086', '9f15d9dda571e0209f983756ec41bf8b', 'User086', 'Nickname086', '여성', '010', '1234', '5678', 'user086@example.com', '20060527', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user087', '661f7d9ff1295e90371a77600e1ef6ac', 'User087', 'Nickname087', '여성', '010', '1234', '5678', 'user087@example.com', '20040410', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user088', '352b43c7e4f534916eaf27d507d18e61', 'User088', 'Nickname088', '남성', '010', '1234', '5678', 'user088@example.com', '19960304', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user089', 'c40959b954f831418c75ad561b6932e8', 'User089', 'Nickname089', '남성', '010', '1234', '5678', 'user089@example.com', '20000619', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user090', '632386e38932e9147b4bbba95c1f1ef9', 'User090', 'Nickname090', '남성', '010', '1234', '5678', 'user090@example.com', '20150510', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user091', 'a2c71a4fce206408b7c5ef6dfa4daa87', 'User091', 'Nickname091', '여성', '010', '1234', '5678', 'user091@example.com', '20130312', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user092', 'c099a7989f80e2a6a0b009b76c0af025', 'User092', 'Nickname092', '여성', '010', '1234', '5678', 'user092@example.com', '20200516', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user093', '9c15fb4f034d0c91102ad7f196e1c9dd', 'User093', 'Nickname093', '여성', '010', '1234', '5678', 'user093@example.com', '19890412', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user094', 'ffece41159b4f192385ae697411fdcec', 'User094', 'Nickname094', '여성', '010', '1234', '5678', 'user094@example.com', '19800510', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user095', 'e1f0ef214521e02eb3f240ef4ce89412', 'User095', 'Nickname095', '여성', '010', '1234', '5678', 'user095@example.com', '19780111', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user096', 'd240dc5906258eb3f9e8d02b3028054d', 'User096', 'Nickname096', '남성', '010', '1234', '5678', 'user096@example.com', '20030711', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user097', 'acf7369646b1d1b7e74c1fbf11bd5a00', 'User097', 'Nickname097', '남성', '010', '1234', '5678', 'user097@example.com', '19970808', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user098', 'f31c638bdbd21eaf1129994396d32070', 'User098', 'Nickname098', '여성', '010', '1234', '5678', 'user098@example.com', '19970922', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user099', 'da06d9fb7d173354f4775af3334d6e1a', 'User099', 'Nickname099', '남성', '010', '1234', '5678', 'user099@example.com', '20030716', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user100', 'c4a3fc6d9846deb818afaa384438889c', 'User100', 'Nickname100', '여성', '010', '1234', '5678', 'user100@example.com', '19840622', 'SILVER', 'Y', 'N', 0, 0, 0, 'F', '2024-03-08 17:16:17', '2024-03-21 16:53:33', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user101', '516a65127868e14e4d59a427a317b7cf', 'User101', 'Nickname101', '여성', '010', '1234', '5678', 'user101@example.com', '20220213', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user102', 'de89a1b99c4777d8c029889e0a4f2116', 'User102', 'Nickname102', '여성', '010', '1234', '5678', 'user102@example.com', '20160619', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user103', '2615228d58ff160a3e5c135ba6096e9a', 'User103', 'Nickname103', '여성', '010', '1234', '5678', 'user103@example.com', '19890212', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user104', 'e2b90a3e940ed0449238f0d7a0253457', 'User104', 'Nickname104', '여성', '010', '1234', '5678', 'user104@example.com', '20200325', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user105', '382cf1934c3ad3beed2d2936bf338d30', 'User105', 'Nickname105', '여성', '010', '1234', '5678', 'user105@example.com', '19990508', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user106', '9bb919052d036750f59952c1e8a5662b', 'User106', 'Nickname106', '남성', '010', '1234', '5678', 'user106@example.com', '20150319', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user107', 'cba306d891fdec282664264e79b8ca84', 'User107', 'Nickname107', '남성', '010', '1234', '5678', 'user107@example.com', '19890805', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user108', '1ea10359e9350be5aa6e3b3f074b0050', 'User108', 'Nickname108', '여성', '010', '1234', '5678', 'user108@example.com', '20131207', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user109', 'd44a41c09c2d2bd0a7a4f1e37e4c8d5c', 'User109', 'Nickname109', '남성', '010', '1234', '5678', 'user109@example.com', '19860820', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-04-17 01:02:22', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user110', '35ed219ac290801a7223944c7cf973e9', 'User110', 'Nickname110', '여성', '010', '1234', '5678', 'user110@example.com', '19970616', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user111', '3c7fec80d60be0d8445453f3681a8ca2', 'User111', 'Nickname111', '남성', '010', '1234', '5678', 'user111@example.com', '19930810', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user112', '9881d47c06471637df040b5b53b97e3e', 'User112', 'Nickname112', '여성', '010', '1234', '5678', 'user112@example.com', '19890717', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user113', '7d6799774d5b0f8e570ea4ac49a935fc', 'User113', 'Nickname113', '여성', '010', '1234', '5678', 'user113@example.com', '20040913', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user114', 'b2eae1058decb9036c041a5935b43cca', 'User114', 'Nickname114', '여성', '010', '1234', '5678', 'user114@example.com', '20120617', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user115', '130b6ae40d4f3b6464e7ee4c2f078932', 'User115', 'Nickname115', '여성', '010', '1234', '5678', 'user115@example.com', '19780807', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user116', 'f3a901443f9e9ecc022e9c442157eca5', 'User116', 'Nickname116', '남성', '010', '1234', '5678', 'user116@example.com', '20160422', 'SILVER', 'N', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user117', '056f51d1758c562fd2fe80146828497d', 'User117', 'Nickname117', '남성', '010', '1234', '5678', 'user117@example.com', '20160707', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user118', '7e21989af84576aec427718e7b7e0134', 'User118', 'Nickname118', '여성', '010', '1234', '5678', 'user118@example.com', '20240805', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user119', '44c58dffe496d1d3d1f3f270383abd5e', 'User119', 'Nickname119', '남성', '010', '1234', '5678', 'user119@example.com', '20010127', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user120', '7f9714b283ebc33f87c79929193d3f3f', 'User120', 'Nickname120', '여성', '010', '1234', '5678', 'user120@example.com', '20210127', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user121', 'be6e804c329da4a1ba1c419b7a268ff6', 'User121', 'Nickname121', '여성', '010', '1234', '5678', 'user121@example.com', '19820508', 'SILVER', 'N', 'N', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user122', '63cdb4e4b91fbd3aeee47d7f9fa011e9', 'User122', 'Nickname122', '여성', '010', '1234', '5678', 'user122@example.com', '19780724', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user123', 'f6e717cc3eec223c9d0f953c092d035b', 'User123', 'Nickname123', '여성', '010', '1234', '5678', 'user123@example.com', '19960816', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user124', '8f954eda2f669ef13806d496f423a712', 'User124', 'Nickname124', '남성', '010', '1234', '5678', 'user124@example.com', '19900918', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL),
	('user125', '240ff9fc1c7e2bb5b70ceb51385f65c3', 'User125', 'Nickname125', '여성', '010', '1234', '5678', 'user125@example.com', '19941006', 'SILVER', 'Y', 'Y', 0, 0, 0, 'U', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-03-08 17:16:17', '2024-06-08 17:16:17', NULL);

-- 테이블 test.eco_usergrade_bmi 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_usergrade_bmi` (
  `GRADEBMI` varchar(20) NOT NULL,
  `LOBMI` decimal(10,0) NOT NULL,
  `HIBMI` decimal(10,0) NOT NULL,
  `USERID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`GRADEBMI`),
  KEY `USERID` (`USERID`),
  CONSTRAINT `ECO_USERGRADE_BMI_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `eco_user` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_usergrade_bmi:~0 rows (대략적) 내보내기

-- 테이블 test.eco_usergrade_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_usergrade_history` (
  `GRADE` varchar(20) NOT NULL,
  `LOPRICE` decimal(10,0) NOT NULL,
  `HIPRICE` decimal(10,0) NOT NULL,
  `USERID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`GRADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_usergrade_history:~0 rows (대략적) 내보내기

-- 테이블 test.eco_user_delete 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_user_delete` (
  `USERID` varchar(20) NOT NULL,
  `USERPW` varchar(100) DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `NICKNAME` varchar(20) DEFAULT NULL,
  `GENDER` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PHONE1` varchar(20) DEFAULT NULL,
  `PHONE2` varchar(20) DEFAULT NULL,
  `PHONE3` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `BIRTH` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `USER_GRADE` varchar(20) DEFAULT NULL,
  `AUTHYN` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EVENTYN` char(1) DEFAULT NULL,
  `LOGINCNT` int DEFAULT '0',
  `POINT` int DEFAULT NULL,
  `TOTALPAY` int DEFAULT NULL,
  `USERTYPE` varchar(10) DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `DELETE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_user_delete:~1 rows (대략적) 내보내기
INSERT INTO `eco_user_delete` (`USERID`, `USERPW`, `NAME`, `NICKNAME`, `GENDER`, `PHONE1`, `PHONE2`, `PHONE3`, `EMAIL`, `BIRTH`, `USER_GRADE`, `AUTHYN`, `EVENTYN`, `LOGINCNT`, `POINT`, `TOTALPAY`, `USERTYPE`, `CDATETIME`, `UDATETIME`, `START_DATE`, `END_DATE`, `DELETE_DATE`) VALUES
	('temp123', 'temp123!', '김임시', '임시', '남성', '010', '1010', '1010', 'asdas@gmail.com', '19910101', 'SILVER', 'Y', 'N', 0, 0, 0, 'U', '2024-03-18 09:49:28', '2024-03-18 09:49:28', NULL, NULL, '2024-03-18 12:24:34');

-- 테이블 test.eco_user_survey 구조 내보내기
CREATE TABLE IF NOT EXISTS `eco_user_survey` (
  `USERID` varchar(20) DEFAULT NULL,
  `USERWEIGHT` varchar(20) NOT NULL,
  `USERHEIGHT` varchar(20) NOT NULL,
  `USERKCAL` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test.eco_user_survey:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
