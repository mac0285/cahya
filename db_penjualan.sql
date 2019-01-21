/*
 Navicat Premium Data Transfer

 Source Server         : datalokal
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : db_penjualan

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 10/01/2019 12:25:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_barang
-- ----------------------------
DROP TABLE IF EXISTS `tbl_barang`;
CREATE TABLE `tbl_barang`  (
  `barang_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barang_nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_satuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_harpok` double NULL DEFAULT NULL,
  `barang_harjul` double NULL DEFAULT NULL,
  `barang_harjul_grosir` double NULL DEFAULT NULL,
  `barang_stok` int(11) NULL DEFAULT 0,
  `barang_min_stok` int(11) NULL DEFAULT 0,
  `barang_tgl_input` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `barang_tgl_last_update` datetime(0) NULL DEFAULT NULL,
  `barang_kategori_id` int(11) NULL DEFAULT NULL,
  `barang_user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`barang_id`) USING BTREE,
  INDEX `barang_user_id`(`barang_user_id`) USING BTREE,
  INDEX `barang_kategori_id`(`barang_kategori_id`) USING BTREE,
  CONSTRAINT `tbl_barang_ibfk_1` FOREIGN KEY (`barang_user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tbl_barang_ibfk_2` FOREIGN KEY (`barang_kategori_id`) REFERENCES `tbl_kategori` (`kategori_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_barang
-- ----------------------------
INSERT INTO `tbl_barang` VALUES ('amp', 'kabel UTP cat 6 amp', 'Roll', 1560000, 2100000, 2000000, 17, 2, '2019-01-07 22:11:42', NULL, 41, 1);
INSERT INTO `tbl_barang` VALUES ('belden', 'kabel UTP cat 6 Belden', 'Roll', 1700000, 2200000, 2000000, 0, 2, '2019-01-07 22:11:42', NULL, 41, 1);
INSERT INTO `tbl_barang` VALUES ('kron', 'tang kron', 'Buah', 80000, 115000, 100000, 33, 3, '2019-01-07 22:13:23', NULL, 42, 1);
INSERT INTO `tbl_barang` VALUES ('rack', 'rack server', 'Buah', 2500000, 3500000, 3350000, 20, 2, '2019-01-07 22:12:41', NULL, 41, 1);

-- ----------------------------
-- Table structure for tbl_beli
-- ----------------------------
DROP TABLE IF EXISTS `tbl_beli`;
CREATE TABLE `tbl_beli`  (
  `beli_nofak` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beli_tanggal` date NULL DEFAULT NULL,
  `beli_suplier_id` int(11) NULL DEFAULT NULL,
  `beli_user_id` int(11) NULL DEFAULT NULL,
  `beli_kode` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`beli_kode`) USING BTREE,
  INDEX `beli_user_id`(`beli_user_id`) USING BTREE,
  INDEX `beli_suplier_id`(`beli_suplier_id`) USING BTREE,
  INDEX `beli_id`(`beli_kode`) USING BTREE,
  CONSTRAINT `tbl_beli_ibfk_1` FOREIGN KEY (`beli_user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tbl_beli_ibfk_2` FOREIGN KEY (`beli_suplier_id`) REFERENCES `tbl_suplier` (`suplier_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_beli
-- ----------------------------
INSERT INTO `tbl_beli` VALUES ('070119000004', '2019-01-07', 1, 1, 'BL070119000001');
INSERT INTO `tbl_beli` VALUES ('FFCC))', '2019-01-08', 1, 1, 'BL080119000001');

-- ----------------------------
-- Table structure for tbl_detail_beli
-- ----------------------------
DROP TABLE IF EXISTS `tbl_detail_beli`;
CREATE TABLE `tbl_detail_beli`  (
  `d_beli_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_beli_nofak` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `d_beli_barang_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `d_beli_harga` double NULL DEFAULT NULL,
  `d_beli_jumlah` int(11) NULL DEFAULT NULL,
  `d_beli_total` double NULL DEFAULT NULL,
  `d_beli_kode` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`d_beli_id`) USING BTREE,
  INDEX `d_beli_barang_id`(`d_beli_barang_id`) USING BTREE,
  INDEX `d_beli_nofak`(`d_beli_nofak`) USING BTREE,
  INDEX `d_beli_kode`(`d_beli_kode`) USING BTREE,
  CONSTRAINT `tbl_detail_beli_ibfk_1` FOREIGN KEY (`d_beli_barang_id`) REFERENCES `tbl_barang` (`barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tbl_detail_beli_ibfk_2` FOREIGN KEY (`d_beli_kode`) REFERENCES `tbl_beli` (`beli_kode`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_detail_beli
-- ----------------------------
INSERT INTO `tbl_detail_beli` VALUES (1, '070119000004', 'belden', 1700000, 50, 85000000, 'BL070119000001');
INSERT INTO `tbl_detail_beli` VALUES (2, 'FFCC))', 'belden', 1700000, 30, 51000000, 'BL080119000001');

-- ----------------------------
-- Table structure for tbl_detail_jual
-- ----------------------------
DROP TABLE IF EXISTS `tbl_detail_jual`;
CREATE TABLE `tbl_detail_jual`  (
  `d_jual_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_jual_nofak` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `d_jual_barang_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `d_jual_barang_nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `d_jual_barang_satuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `d_jual_barang_harpok` double NULL DEFAULT NULL,
  `d_jual_barang_harjul` double NULL DEFAULT NULL,
  `d_jual_qty` int(11) NULL DEFAULT NULL,
  `d_jual_diskon` double NULL DEFAULT NULL,
  `d_jual_total` double NULL DEFAULT NULL,
  PRIMARY KEY (`d_jual_id`) USING BTREE,
  INDEX `d_jual_barang_id`(`d_jual_barang_id`) USING BTREE,
  INDEX `d_jual_nofak`(`d_jual_nofak`) USING BTREE,
  CONSTRAINT `tbl_detail_jual_ibfk_1` FOREIGN KEY (`d_jual_barang_id`) REFERENCES `tbl_barang` (`barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tbl_detail_jual_ibfk_2` FOREIGN KEY (`d_jual_nofak`) REFERENCES `tbl_jual` (`jual_nofak`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_detail_jual
-- ----------------------------
INSERT INTO `tbl_detail_jual` VALUES (34, '070119000001', 'kron', 'tang kron', 'Buah', 80000, 115000, 1, 0, 115000);
INSERT INTO `tbl_detail_jual` VALUES (35, '070119000001', 'belden', 'kabel UTP cat 6 Belden', 'Roll', 1700000, 2200000, 1, 0, 2200000);
INSERT INTO `tbl_detail_jual` VALUES (36, '070119000002', 'amp', 'kabel UTP cat 6 amp', 'Roll', 1560000, 2100000, 3, 0, 6300000);
INSERT INTO `tbl_detail_jual` VALUES (37, '070119000003', 'belden', 'kabel UTP cat 6 Belden', 'Roll', 1700000, 2000000, 10, 0, 20000000);
INSERT INTO `tbl_detail_jual` VALUES (38, '070119000004', 'belden', 'kabel UTP cat 6 Belden', 'Roll', 1700000, 2000000, 9, 0, 18000000);
INSERT INTO `tbl_detail_jual` VALUES (39, '080119000001', 'belden', 'kabel UTP cat 6 Belden', 'Roll', 1700000, 2200000, 79, 0, 173800000);
INSERT INTO `tbl_detail_jual` VALUES (40, '090119000001', 'belden', 'kabel UTP cat 6 Belden', 'Roll', 1700000, 2200000, 1, 0, 2200000);

-- ----------------------------
-- Table structure for tbl_jual
-- ----------------------------
DROP TABLE IF EXISTS `tbl_jual`;
CREATE TABLE `tbl_jual`  (
  `jual_nofak` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jual_tanggal` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `jual_total` double NULL DEFAULT NULL,
  `jual_jml_uang` double NULL DEFAULT NULL,
  `jual_kembalian` double NULL DEFAULT NULL,
  `jual_user_id` int(11) NULL DEFAULT NULL,
  `jual_keterangan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`jual_nofak`) USING BTREE,
  INDEX `jual_user_id`(`jual_user_id`) USING BTREE,
  CONSTRAINT `tbl_jual_ibfk_1` FOREIGN KEY (`jual_user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_jual
-- ----------------------------
INSERT INTO `tbl_jual` VALUES ('070119000001', '2019-01-07 22:14:29', 2315000, 3000000, 685000, 1, 'eceran');
INSERT INTO `tbl_jual` VALUES ('070119000002', '2019-01-07 22:23:54', 6300000, 8000000, 1700000, 1, 'eceran');
INSERT INTO `tbl_jual` VALUES ('070119000003', '2019-01-07 22:27:46', 20000000, 80000000, 60000000, 1, 'grosir');
INSERT INTO `tbl_jual` VALUES ('070119000004', '2019-01-07 22:28:30', 18000000, 20000000, 2000000, 1, 'grosir');
INSERT INTO `tbl_jual` VALUES ('080119000001', '2019-01-08 16:01:10', 173800000, 200000000, 26200000, 1, 'eceran');
INSERT INTO `tbl_jual` VALUES ('090119000001', '2019-01-09 10:51:00', 2200000, 3000000, 800000, 3, 'eceran');

-- ----------------------------
-- Table structure for tbl_kategori
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kategori`;
CREATE TABLE `tbl_kategori`  (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_nama` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kategori_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_kategori
-- ----------------------------
INSERT INTO `tbl_kategori` VALUES (40, 'Hardware');
INSERT INTO `tbl_kategori` VALUES (41, 'Periperal');
INSERT INTO `tbl_kategori` VALUES (42, 'Tool');
INSERT INTO `tbl_kategori` VALUES (43, 'Listrik');
INSERT INTO `tbl_kategori` VALUES (44, 'Jasa');
INSERT INTO `tbl_kategori` VALUES (45, 'Software');

-- ----------------------------
-- Table structure for tbl_retur
-- ----------------------------
DROP TABLE IF EXISTS `tbl_retur`;
CREATE TABLE `tbl_retur`  (
  `retur_id` int(11) NOT NULL AUTO_INCREMENT,
  `retur_tanggal` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `retur_barang_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `retur_barang_nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `retur_barang_satuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `retur_harjul` double NULL DEFAULT NULL,
  `retur_qty` int(11) NULL DEFAULT NULL,
  `retur_subtotal` double NULL DEFAULT NULL,
  `retur_keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`retur_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_retur
-- ----------------------------
INSERT INTO `tbl_retur` VALUES (5, '2019-01-09 10:47:28', 'amp', 'kabel UTP cat 6 amp', 'Roll', 2000000, 1, NULL, 'Rusak');
INSERT INTO `tbl_retur` VALUES (6, '2019-01-09 10:47:38', 'amp', 'kabel UTP cat 6 amp', 'Roll', 2000000, 1, NULL, 'Rusak');
INSERT INTO `tbl_retur` VALUES (7, '2019-01-09 10:47:46', 'rack', 'rack server', 'Buah', 3350000, 1, NULL, 'Rusak');
INSERT INTO `tbl_retur` VALUES (8, '2019-01-09 10:47:51', 'kron', 'tang kron', 'Buah', 100000, 1, NULL, 'Rusak');

-- ----------------------------
-- Table structure for tbl_suplier
-- ----------------------------
DROP TABLE IF EXISTS `tbl_suplier`;
CREATE TABLE `tbl_suplier`  (
  `suplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `suplier_nama` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `suplier_alamat` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `suplier_notelp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`suplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_suplier
-- ----------------------------
INSERT INTO `tbl_suplier` VALUES (1, 'synergy data trust', 'tabanan bali', '08179730808');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_nama` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_password` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_level` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_status` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'Haris Rifai ST', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '1');
INSERT INTO `tbl_user` VALUES (2, 'CAHYA IBRAHIM', 'kasir', 'e10adc3949ba59abbe56e057f20f883e', '2', '1');
INSERT INTO `tbl_user` VALUES (3, 'moh haris rifai ST', 'aaa', '47bce5c74f589f4867dbd57e9ca9f808', '2', '1');

SET FOREIGN_KEY_CHECKS = 1;
