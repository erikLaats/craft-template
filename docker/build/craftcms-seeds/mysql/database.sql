CREATE DATABASE `craftcms` DEFAULT CHARACTER SET = `utf8`;
USE `craftcms`;

# ************************************************************
# Sequel Ace SQL dump
# Version 3041
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.35)
# Database: craftcms
# Generation Time: 2021-10-01 00:09:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table announcements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `announcements`;

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_amulxkkawdrispgfymrypgrytomyfbcpjfly` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_wgqmpmflmakpncvehdgrxudmhdkppxhagnch` (`dateRead`),
  KEY `fk_tsvrcxiiokiofntytwbrbnmzmytnomedcrbl` (`pluginId`),
  CONSTRAINT `fk_qojjbkhgetiovuibuiemahxrzuspomtwpwba` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tsvrcxiiokiofntytwbrbnmzmytnomedcrbl` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zzymavtagfsqsyvzejgioptviwgngzlmjpvx` (`sessionId`,`volumeId`),
  KEY `idx_lvtvlzyubgfiikgrjrefenokklfefwinferx` (`volumeId`),
  CONSTRAINT `fk_rrzfcxftqpdbxhvlgovxubedmpgrkxaorxui` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ntzekpobeiacpyaanouhynzoncnfydwcaqqa` (`filename`,`folderId`),
  KEY `idx_sleqbibjqrdkssnfbpjgfefecszmzvhvhmai` (`folderId`),
  KEY `idx_sbdwhnffmwchczsjwdtwstiukklbmtcymylw` (`volumeId`),
  KEY `fk_bgtjpolcwptzkmzcvsysopaczyigomzgdhgc` (`uploaderId`),
  CONSTRAINT `fk_afkcmkjezljocjxrikuohtmiawrmuhryvcor` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bgtjpolcwptzkmzcvsysopaczyigomzgdhgc` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gitxcqlfwomzwnznlvgbdgizbmxkacyiediq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zvipnxulaknqgujhstqqllmtncjtsbnprktf` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransformindex`;

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jjnqoxtusumgqpgjdkytiiqijatxryqtacyl` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransforms`;

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gazvcfdkscpavmrohyafqrjjkqubgyxwuwcm` (`name`),
  KEY `idx_pvcrcqkszqxzvenhhwqzolsopkmazzvronli` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mgjywjuwufbclpmnlulefzdymnclivkgfonj` (`groupId`),
  KEY `fk_qzuxzvzrmybzvbaeycmyttphnfipnolhjqnm` (`parentId`),
  CONSTRAINT `fk_qdubplygmjnurkhqljvtrduohdwxozabdxqa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qzuxzvzrmybzvbaeycmyttphnfipnolhjqnm` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_utzlqdfibgjeexzfabmhwthqcjjgypvjvvmm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ojycuxvhfnrjztbwbrgwpvzrcqhooyvqfype` (`name`),
  KEY `idx_jebfgknxrtylpheobwnjsvpsivyqsvwtvmmf` (`handle`),
  KEY `idx_katguqrwzuksqpnxwdhirjqvbhkfugghukru` (`structureId`),
  KEY `idx_aqazmdvprdxmnevqsoohkiceagylmhvquica` (`fieldLayoutId`),
  KEY `idx_uectdbtskancozvsawzxvqybfqplsngqpzhg` (`dateDeleted`),
  CONSTRAINT `fk_kgfmiakotrinrmslrbyyfcqhhrkiuzjmgosp` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nibddeslutuuthhpptrkdxtkfoazwgfblzjj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dcmqglptlxoymfvpdqoytezjicmujfsyybhg` (`groupId`,`siteId`),
  KEY `idx_lyujlzgfygqjvzpblyxawwtnbysbdfpkshui` (`siteId`),
  CONSTRAINT `fk_nwwzlnamyhalsslwoikpbenystqndobnorej` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zkzfoplztizjqxlztpbfekpikvixjqbrrkwl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table changedattributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedattributes`;

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_yjzgqxrwjqlinwtglhwrnwwrrtqmfwoxhtsj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_vzxvozquwlqiwgwabitqmfaimsoxuyjzwykc` (`siteId`),
  KEY `fk_oowyxbmmhopvkqglskuefqedoqujzklkuevs` (`userId`),
  CONSTRAINT `fk_famqxsawybbpzlpscaisxlqkqfzaupztcyuw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oowyxbmmhopvkqglskuefqedoqujzklkuevs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_vzxvozquwlqiwgwabitqmfaimsoxuyjzwykc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table changedfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedfields`;

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_jozyroymfmpeftehbgknnyenerzsizjalpqj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_rqxidrbturhhnxxksoklwgggvffnhslquqfz` (`siteId`),
  KEY `fk_ovukiahnkmjbrpejgcandhkjjgoigpitxxgy` (`fieldId`),
  KEY `fk_hvsbmcmytvjhqgkwqyssdrakpqftsuqfsumu` (`userId`),
  CONSTRAINT `fk_alkskgfxozxpzljdhbsquvzuaoleoxqjdtsb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hvsbmcmytvjhqgkwqyssdrakpqftsuqfsumu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ovukiahnkmjbrpejgcandhkjjgoigpitxxgy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rqxidrbturhhnxxksoklwgggvffnhslquqfz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ifreswnbutdbkptbycgepankiuhmrechxlqg` (`elementId`,`siteId`),
  KEY `idx_rjtqcuanjgrzoqrhibtxxblmncswqozntrzc` (`siteId`),
  KEY `idx_gblxkfsapfoyyuudkybupachalsckljuftsa` (`title`),
  CONSTRAINT `fk_bmwiozfckbydekgqinadyemksnmcinpsrmrs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_prtoqehqtsruzbchagppizeoqwwllmyuykjs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
  (1,1,1,NULL,'2021-10-01 00:09:15','2021-10-01 00:09:15','48b5d07f-43de-4852-b743-a6d2d812fc3f');

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ajjztonixapddzidptouofzwjtqvekkxjeef` (`userId`),
  CONSTRAINT `fk_ajjztonixapddzidptouofzwjtqvekkxjeef` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_btkzfnjttqddodwjvzklwnqbjhyabbguttbs` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drafts`;

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_xdgnqkdqooycojzjgzmivodmeuktuvvhzkcv` (`creatorId`,`provisional`),
  KEY `idx_wncxgyiqndsipmvxndqhfkwjaooidkgprahx` (`saved`),
  KEY `fk_xmxwsnbeyzzkksrgzlbwvignwfuuyoufyygr` (`sourceId`),
  CONSTRAINT `fk_hddtxficzgvreaarlefvdcmgllmoscruhzyd` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xmxwsnbeyzzkksrgzlbwvignwfuuyoufyygr` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementindexsettings`;

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pmozppbbnqdsajdrnmrjjrrwxwetwrcqitgi` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qfivvuxrilgykhzfdahjnlcvpwvukzzknhyf` (`dateDeleted`),
  KEY `idx_buqualhqmhxmvzvxeusxibywiblrsjdejton` (`fieldLayoutId`),
  KEY `idx_lnyijlxqfvefbgicnewxzaicdnmtrohibrok` (`type`),
  KEY `idx_vlcdquycovwsoyloozaazinalatecmsnnsbm` (`enabled`),
  KEY `idx_npnunswcyysruoflhjzmhzqkvtiiqxdnfirc` (`archived`,`dateCreated`),
  KEY `idx_ykemgxlbavyefnohoxmgvjfuwtimsrzmtngf` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `fk_pqvieamroqqrpkctinkljlfuxkzxlrrdoaon` (`canonicalId`),
  KEY `fk_kkkihqwfktpwqzfvfgoekbrnncebehmnucxg` (`draftId`),
  KEY `fk_tfvajaqguoqngxkysuyykooolkuopwzfbtyx` (`revisionId`),
  CONSTRAINT `fk_kkkihqwfktpwqzfvfgoekbrnncebehmnucxg` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pqvieamroqqrpkctinkljlfuxkzxlrrdoaon` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qwnxzzqivupzpyqinlgakuknvnbjxufacder` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tfvajaqguoqngxkysuyykooolkuopwzfbtyx` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`)
VALUES
  (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-10-01 00:09:15','2021-10-01 00:09:15',NULL,NULL,'610161ee-e91b-42c2-b167-4c84713e6609');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_acwuvfyewiyskhjylycymmbuzxjncpssucqx` (`elementId`,`siteId`),
  KEY `idx_wzdjfxmauxpxignipqkqyxnwkbleuvddswvf` (`siteId`),
  KEY `idx_ijgbqtnamongquoiiqwrkmtwqkpdfazediky` (`slug`,`siteId`),
  KEY `idx_iluwzvsnqasphcwptasxofcqfkacxypsrdcr` (`enabled`),
  KEY `idx_stzplavqaxhrnrsfutdwvydowclxumhnpfpt` (`uri`,`siteId`),
  CONSTRAINT `fk_amjnvqowhqfibpftpjlpakoiyxarpqiimhch` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oribxfvfmoirwtvewvyzlhpxyjhsakdrqach` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
  (1,1,1,NULL,NULL,1,'2021-10-01 00:09:15','2021-10-01 00:09:15','347239a1-9dd8-4e98-83b0-b564acc5cf92');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xkasisgwmfmqexepfdjjnsxzoztvxqlnwdwp` (`postDate`),
  KEY `idx_rbkyodjimarelcovapbtefklpzpucppfwuli` (`expiryDate`),
  KEY `idx_xvdrvwgphzlhmkfsofvbjrqzxfxvsiphqkxl` (`authorId`),
  KEY `idx_glaiqaokcaxwdgadzdicrqihlnquakzxecza` (`sectionId`),
  KEY `idx_jigmzforfusuisnhziirysmezajqzltuszck` (`typeId`),
  KEY `fk_jfzesijkcrtekvcrxawyjpbgufgzzmpztpuw` (`parentId`),
  CONSTRAINT `fk_jfzesijkcrtekvcrxawyjpbgufgzzmpztpuw` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_maxusuigclqjwdwzqtpbjnouyzmrvvjjlktm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_osgyngbxugqiamjhxigdvomygijlmuvewgtv` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vvwjafktutpjtzbzopyvtdbwdnpptljcazqt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ywcbxvfwhpaoalzeowwodksgidpypuhtseqo` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_suakrdawcxwvwgwcuiqatvaopkndrtohdhig` (`name`,`sectionId`),
  KEY `idx_skewtpfnmssorrdakvyiipnjzasnabulwtcg` (`handle`,`sectionId`),
  KEY `idx_kipbidwcnlleszzujjjbhcvlmuckpaolhkjx` (`sectionId`),
  KEY `idx_zrousreoyysuveccaophxzwyyesbbwrbewxc` (`fieldLayoutId`),
  KEY `idx_uvwwncdqrnurfxfmjjdnwlhxbaugtdwpfkmj` (`dateDeleted`),
  CONSTRAINT `fk_dfdamrlwxcqheeggjpziikzptfuloekzkmxf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xwdwiwvotiwsegvaxbdifobwzatpvfknymcb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldgroups`;

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_clfandhvuyjpjuzzlvxdefygtpnbhlfcchnd` (`name`),
  KEY `idx_nlhxcmypdujaqgfcmonwcctbpxhbaaanrewk` (`dateDeleted`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
  (1,'Common','2021-10-01 00:09:15','2021-10-01 00:09:15',NULL,'a45b8f9a-81a7-4785-b187-3aac933c015f');

/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayoutfields`;

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wvcfybkuikbjnezttiyoiqoiuhqpnfsrjwcu` (`layoutId`,`fieldId`),
  KEY `idx_mstvmsfisxdqeonucuvqrzrrbtuuxvhrcdzr` (`sortOrder`),
  KEY `idx_flgtpktfkeoiqutzirzhtuzvidedmxhzzano` (`tabId`),
  KEY `idx_awbsfdihupqyhojhebcqzdtbcvwtapncxhhq` (`fieldId`),
  CONSTRAINT `fk_ihudpdiuztbrwhanwnbarlluvfeubyjnrbti` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ogjxrsropfdgcnzcnlrrftckeckcsvyxveqr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vrzgwyunoqdvnfmlpphzcbpersryxzktkzba` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vyfbeiilohpomrwzxxqmorxoywuhihzenybc` (`dateDeleted`),
  KEY `idx_tegyyvcnhtguwpsjujbcplgtosnvkvngzzyg` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouttabs`;

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kbkearnmtbiytpugxynzzalozwadeohcjrqb` (`sortOrder`),
  KEY `idx_dkukwfrlpsgtelaskgudfulamjkgwptotvoc` (`layoutId`),
  CONSTRAINT `fk_gosivpscsrzpnzgbswqrhtmsimerlrcpyuot` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uoxdyihfzbscgojnxhstsdukslljrucqyaww` (`handle`,`context`),
  KEY `idx_zuzzuwjxhmdrfmauxsqxoxuogvgqzlqlubdc` (`groupId`),
  KEY `idx_xfmqyvwtcjkjusdbncwxlhjeapqmubceiswo` (`context`),
  CONSTRAINT `fk_nqirnwajbrxqsdlxesxeommzrkquqcgbwttu` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gayjwhifngwczljmmupvmhxvdbsukefsqscv` (`name`),
  KEY `idx_xuwyiilcupdjybueealmfrmclkdeubtyymxa` (`handle`),
  KEY `idx_bdxzrproblidlwjkzawrbxbhcveibknivfzw` (`fieldLayoutId`),
  KEY `idx_wwdrgzdbqqytttszmqktjojwxaglmtxpbffh` (`sortOrder`),
  CONSTRAINT `fk_disvlhszsbbpdpcavelflgkirrteiatkgnkx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ntbchbtwhtkryxloudompgvzaopadlbeovbr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqlschemas`;

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gqltokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqltokens`;

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hnzndtilcmhmyweferibvhwknesbiabogepz` (`accessToken`),
  UNIQUE KEY `idx_inesreibdpeqatkuyfhnelcmzrmczxwwgptv` (`name`),
  KEY `fk_wfqliaaeqqinxnticgbjtxdwjcdzzfgxmrab` (`schemaId`),
  CONSTRAINT `fk_wfqliaaeqqinxnticgbjtxdwjcdzzfgxmrab` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
  (1,'3.7.14','3.7.8',0,'hhlylhepctkj','bcyljlgadtga','2021-10-01 00:09:15','2021-10-01 00:09:15','0b8365cf-2409-4ea8-b9bc-7cd6eaa8114e');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocks`;

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rmqqvyzrumdcdllbdjwvayegsbsrtiiqpyxm` (`ownerId`),
  KEY `idx_aiairjymwkplcfmvrzjqlfaoqkdpattznvev` (`fieldId`),
  KEY `idx_jlgwygllbgmiyndwknzuawfwtzkqgjcmzoox` (`typeId`),
  KEY `idx_tpqwlcjvzwgnrlibkaaewlrkofrwnztuzdyh` (`sortOrder`),
  CONSTRAINT `fk_brvyyrtqmcjpmcsrsdrxpddgtffhqfvjmhss` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nagllozjfdeueodrhjsglcihtvaxlfmoolpi` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_triidrybufdtbkaqwczarvywfrmdxactxmrt` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xngydkvddypjfxsidjnqfnrutwobmegvajbb` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocktypes`;

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_knkgxwaakqimqrysqcjnoxqfnbboymmadtiy` (`name`,`fieldId`),
  KEY `idx_ywpvbjrvdgmrvypblwlbevawiyyixkhsdgdq` (`handle`,`fieldId`),
  KEY `idx_tkhbczsjwydlcrpwuhuzxsdfteerdkisakqn` (`fieldId`),
  KEY `idx_ajreiumvjxohrvbwncvdwuunplaevsaghfos` (`fieldLayoutId`),
  CONSTRAINT `fk_qqlqkwbtjkgrhihezsfexdkkfqrepklqthsp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rreuwykyybsiakcnhywrumnxvcupteltcstd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fbalprcwubarvgmvgaeolghpbqogohhhfltg` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
  (1,'craft','Install','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f8e14356-5823-4072-b7bd-70dd3cd48a35'),
  (2,'craft','m150403_183908_migrations_table_changes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6b663c9a-7e3c-46c7-bb49-9ae672d1ffaf'),
  (3,'craft','m150403_184247_plugins_table_changes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','3cd163d4-05e9-47bb-9bd5-2850d4562c8a'),
  (4,'craft','m150403_184533_field_version','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','bf19e65d-4fcc-405b-bc5b-91bc090b9120'),
  (5,'craft','m150403_184729_type_columns','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','11a64cc2-58c0-45c9-b3ed-6202c1455b85'),
  (6,'craft','m150403_185142_volumes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0b79a3b3-88ee-441a-89e1-33ad2c826cf2'),
  (7,'craft','m150428_231346_userpreferences','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','edb653a7-f280-4d9c-a4b5-960728b09b5a'),
  (8,'craft','m150519_150900_fieldversion_conversion','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','948ed35f-3238-46be-a1f1-f620e3242cb5'),
  (9,'craft','m150617_213829_update_email_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d56f0fd1-1375-41b7-b6d0-0b54715edb98'),
  (10,'craft','m150721_124739_templatecachequeries','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','12755729-9991-40b3-8942-13a987433e1a'),
  (11,'craft','m150724_140822_adjust_quality_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2a8a89e1-9b75-40da-b2e1-e5a79e3deab4'),
  (12,'craft','m150815_133521_last_login_attempt_ip','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','52097255-fda8-4192-a23e-d3adca7e1496'),
  (13,'craft','m151002_095935_volume_cache_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1514bdcd-aa96-4f56-80da-27976766e6f0'),
  (14,'craft','m151005_142750_volume_s3_storage_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1c85016c-4b18-4766-b546-1cae380cf6ef'),
  (15,'craft','m151016_133600_delete_asset_thumbnails','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','c4dfe4ed-41e3-46d2-90ca-002dd8b5a420'),
  (16,'craft','m151209_000000_move_logo','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','58654f9d-a530-4e0f-a3f7-7d8eb72f3349'),
  (17,'craft','m151211_000000_rename_fileId_to_assetId','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','7233fb18-79b4-4ffa-b1ac-4dcd05d31e5e'),
  (18,'craft','m151215_000000_rename_asset_permissions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','c2d684f6-97aa-4f93-8900-cf432429062f'),
  (19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','9574ded4-5115-4946-9170-395d4666f4a2'),
  (20,'craft','m160708_185142_volume_hasUrls_setting','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','967dd7d1-e8c0-427f-80e2-a65a202cb98f'),
  (21,'craft','m160714_000000_increase_max_asset_filesize','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','a016f546-414d-4589-ad50-a8e826790b3c'),
  (22,'craft','m160727_194637_column_cleanup','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','69859f5d-0bf6-4341-a128-2d3c073e8c9a'),
  (23,'craft','m160804_110002_userphotos_to_assets','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d6d161c9-1a1d-4ce2-95bc-aaef6cfcd69d'),
  (24,'craft','m160807_144858_sites','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','bc811189-a2cd-40ef-a412-2961d6ea5e80'),
  (25,'craft','m160829_000000_pending_user_content_cleanup','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1e134172-2e04-4efb-9253-ade5b1cf0e6f'),
  (26,'craft','m160830_000000_asset_index_uri_increase','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0987e347-14a1-4992-9395-9979df72ca8d'),
  (27,'craft','m160912_230520_require_entry_type_id','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','ff91eafb-0594-475e-aad2-6f7f0abf514d'),
  (28,'craft','m160913_134730_require_matrix_block_type_id','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','4a6fcb91-1ef1-4305-a671-febc118a67e2'),
  (29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','c7249151-9dd4-4b87-8850-4caca6155a03'),
  (30,'craft','m160920_231045_usergroup_handle_title_unique','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0d33aca0-120c-4d3c-a87f-f29c882b3c98'),
  (31,'craft','m160925_113941_route_uri_parts','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','a2c1cf6a-3089-489b-9b17-07d2999b803e'),
  (32,'craft','m161006_205918_schemaVersion_not_null','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0117ea92-ec66-490f-a123-5a33d60800bf'),
  (33,'craft','m161007_130653_update_email_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','adb2f857-10fb-4c22-a6f4-b92e6b4fcf91'),
  (34,'craft','m161013_175052_newParentId','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b8b9900a-7bc1-4e59-b1ea-4a21457511c9'),
  (35,'craft','m161021_102916_fix_recent_entries_widgets','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2c1d5d96-fc8b-4bd9-aa30-86d506dd0ed1'),
  (36,'craft','m161021_182140_rename_get_help_widget','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b53b6083-bc52-4a5e-b894-95103f2f5477'),
  (37,'craft','m161025_000000_fix_char_columns','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','e96deffc-1c8e-41f7-a61a-c23e252d0120'),
  (38,'craft','m161029_124145_email_message_languages','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f2584d21-399d-4607-9582-064ea072e6e4'),
  (39,'craft','m161108_000000_new_version_format','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f453a282-758c-4d13-a187-90a60ee40b80'),
  (40,'craft','m161109_000000_index_shuffle','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0755bc0e-de56-4a04-9146-f6561941e28f'),
  (41,'craft','m161122_185500_no_craft_app','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','5c40394d-c17d-4ee4-aea8-4b9e8e37a017'),
  (42,'craft','m161125_150752_clear_urlmanager_cache','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d9a2944a-a117-4863-beec-106776521fb1'),
  (43,'craft','m161220_000000_volumes_hasurl_notnull','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','fb1a59bc-1309-4c77-8908-77671b93acc4'),
  (44,'craft','m170114_161144_udates_permission','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','9032cb9b-1b48-431c-b945-bc3a69cac089'),
  (45,'craft','m170120_000000_schema_cleanup','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','00823be5-20b8-40cf-8a9c-5f21a0501c22'),
  (46,'craft','m170126_000000_assets_focal_point','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1acdf1d8-9986-4129-824c-ede0d1b2318b'),
  (47,'craft','m170206_142126_system_name','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f5beb3a9-a930-41de-850b-45af397d458e'),
  (48,'craft','m170217_044740_category_branch_limits','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','3f6648a3-c88e-4329-b9a1-b966e3dde385'),
  (49,'craft','m170217_120224_asset_indexing_columns','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','8a522b93-a667-4068-b18b-709a1a9bc29b'),
  (50,'craft','m170223_224012_plain_text_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b8836bfc-3979-4fa5-85a2-3b0c4813b73f'),
  (51,'craft','m170227_120814_focal_point_percentage','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','171491ed-a8ce-45f3-92ac-6e2adfb74d09'),
  (52,'craft','m170228_171113_system_messages','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','438ebfd7-d238-4ee3-92ab-c88d245770ed'),
  (53,'craft','m170303_140500_asset_field_source_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2ca32b63-9bb0-4174-9f60-5d34bd2fcfdf'),
  (54,'craft','m170306_150500_asset_temporary_uploads','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f14db6e2-b4b3-4239-9bbf-40b954ea8cef'),
  (55,'craft','m170523_190652_element_field_layout_ids','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','17cabe1d-a167-4d85-9442-dcc90d21d8d0'),
  (56,'craft','m170621_195237_format_plugin_handles','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2a70b0f4-8a74-45ae-bd29-3ee0b1f22309'),
  (57,'craft','m170630_161027_deprecation_line_nullable','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0708d4af-1976-409b-b8ff-bc843cd149d1'),
  (58,'craft','m170630_161028_deprecation_changes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0eea21d8-d11f-461d-af46-441b59e3f144'),
  (59,'craft','m170703_181539_plugins_table_tweaks','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','06823906-efcb-466b-925e-63a5c6f170bd'),
  (60,'craft','m170704_134916_sites_tables','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0db7948e-cb27-48a1-8af8-7ce6035aadd8'),
  (61,'craft','m170706_183216_rename_sequences','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','375333db-42e1-47e0-ae13-508ba41b0de1'),
  (62,'craft','m170707_094758_delete_compiled_traits','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','97e57232-4550-44f1-8ca7-ef7b360cf5fc'),
  (63,'craft','m170731_190138_drop_asset_packagist','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','e459a6fd-084c-4662-acd3-744219c40384'),
  (64,'craft','m170810_201318_create_queue_table','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d8b86d2d-3148-4d09-8c99-6f403b616e27'),
  (65,'craft','m170903_192801_longblob_for_queue_jobs','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','43fb1027-7fcf-426e-bb00-d31a970fc145'),
  (66,'craft','m170914_204621_asset_cache_shuffle','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','11eb37ab-fe49-4d41-84d8-f27ca10bec93'),
  (67,'craft','m171011_214115_site_groups','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d29245c9-ed7b-42ca-9975-a4fd3b0b9e58'),
  (68,'craft','m171012_151440_primary_site','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','450b5f37-800e-4637-bf5e-077975277272'),
  (69,'craft','m171013_142500_transform_interlace','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b4b00c11-67ed-4166-92d8-79941fb28cec'),
  (70,'craft','m171016_092553_drop_position_select','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','3e76954e-dafb-4bdf-b562-f8d7aaeb3126'),
  (71,'craft','m171016_221244_less_strict_translation_method','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','3e96f8a8-5e11-41b3-8080-e03ef87edd65'),
  (72,'craft','m171107_000000_assign_group_permissions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d1be97c3-d141-4cb0-a010-1ee508c88c49'),
  (73,'craft','m171117_000001_templatecache_index_tune','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','c7234b40-8c5b-4978-96ca-4a2931a21bb9'),
  (74,'craft','m171126_105927_disabled_plugins','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6fbca335-8e73-490f-b14c-fd90b499ee1c'),
  (75,'craft','m171130_214407_craftidtokens_table','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','40baef20-3d43-4fe8-a5d8-3b8c7fbf6dde'),
  (76,'craft','m171202_004225_update_email_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','02a8e481-4f1c-4ddb-aee7-fbdfc336b549'),
  (77,'craft','m171204_000001_templatecache_index_tune_deux','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d52457cc-55e7-4e45-a96d-f128400cd2ec'),
  (78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','e12dd1d3-9d53-41b4-8d7e-5da4daa0095d'),
  (79,'craft','m171218_143135_longtext_query_column','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0b881d55-e86b-43d5-953f-9b802450203a'),
  (80,'craft','m171231_055546_environment_variables_to_aliases','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','de67e031-47d9-4381-9f03-2cd269011869'),
  (81,'craft','m180113_153740_drop_users_archived_column','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','69321115-b719-4706-bf51-6e0c7183a7ea'),
  (82,'craft','m180122_213433_propagate_entries_setting','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f745efab-a12f-4ce9-ab19-1afe503eb40c'),
  (83,'craft','m180124_230459_fix_propagate_entries_values','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f853d9ea-98d4-4820-a18c-11ad8be07a33'),
  (84,'craft','m180128_235202_set_tag_slugs','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d423704b-5c3d-40eb-a810-4d32fb2479ef'),
  (85,'craft','m180202_185551_fix_focal_points','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d98f5d9f-7ccb-4f85-a8d2-634f8eb539ec'),
  (86,'craft','m180217_172123_tiny_ints','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','44a91f75-49ba-480e-a23a-2b63df60848f'),
  (87,'craft','m180321_233505_small_ints','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d9c5a861-5e74-4a4f-a2ec-e6f4725e3b61'),
  (88,'craft','m180404_182320_edition_changes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','3062da60-7620-4a90-b7db-4c4861378720'),
  (89,'craft','m180411_102218_fix_db_routes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','eaa1986b-30ab-4097-b990-a8b3a579da63'),
  (90,'craft','m180416_205628_resourcepaths_table','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','de796fac-0b23-4079-8016-5b529ff9b352'),
  (91,'craft','m180418_205713_widget_cleanup','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','9b3894f4-a26e-4827-ad93-5cbf88b9e505'),
  (92,'craft','m180425_203349_searchable_fields','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','bacead53-34ab-4951-a9fd-59e2ac9911cf'),
  (93,'craft','m180516_153000_uids_in_field_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','60247486-b215-499a-b552-f2cc57474340'),
  (94,'craft','m180517_173000_user_photo_volume_to_uid','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1e4acb3b-777e-40f3-9960-e265cbcbe4b7'),
  (95,'craft','m180518_173000_permissions_to_uid','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b7a31bbb-8f17-4b03-9b8f-a6b7d38c3a12'),
  (96,'craft','m180520_173000_matrix_context_to_uids','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2b4b5915-7ff9-4587-9bf4-6d7c9c605d9c'),
  (97,'craft','m180521_172900_project_config_table','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6ae623e9-34f9-4b4b-81fe-60f1b6a27ec7'),
  (98,'craft','m180521_173000_initial_yml_and_snapshot','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','14459d2b-239b-4bda-8fb6-36874ee1633c'),
  (99,'craft','m180731_162030_soft_delete_sites','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','a1d56a57-316f-4ccf-afee-eb613c288c91'),
  (100,'craft','m180810_214427_soft_delete_field_layouts','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','10537133-3555-422d-a508-e32e6061d19f'),
  (101,'craft','m180810_214439_soft_delete_elements','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','9c76a7ce-5ac0-45a2-ad28-b7ede82bade8'),
  (102,'craft','m180824_193422_case_sensitivity_fixes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f386b4cf-a8c6-44f0-82b5-90c2facce2d5'),
  (103,'craft','m180901_151639_fix_matrixcontent_tables','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','c0089f85-9df1-4bbe-8834-2df1403c039e'),
  (104,'craft','m180904_112109_permission_changes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','9e97fdce-38ea-4158-95a6-b37b77338281'),
  (105,'craft','m180910_142030_soft_delete_sitegroups','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','54daa887-476d-4cc5-8f77-b026860e009d'),
  (106,'craft','m181011_160000_soft_delete_asset_support','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b9db1516-a650-417f-9e39-d82f97a5df58'),
  (107,'craft','m181016_183648_set_default_user_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d3104124-d931-4573-8700-40577e28de41'),
  (108,'craft','m181017_225222_system_config_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','4519dabb-7cfd-42b9-8cef-7bec3f824037'),
  (109,'craft','m181018_222343_drop_userpermissions_from_config','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','79cdaa1d-b645-4a11-a8b8-0cfeacdbf947'),
  (110,'craft','m181029_130000_add_transforms_routes_to_config','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','221d8d8c-5416-4656-a2ef-07638275f961'),
  (111,'craft','m181112_203955_sequences_table','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','cbdfece7-243f-42b3-8400-c94e3a9fddec'),
  (112,'craft','m181121_001712_cleanup_field_configs','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','cdcf8d9c-627c-4275-a043-35a2a01169c0'),
  (113,'craft','m181128_193942_fix_project_config','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','03db55fe-5d64-4db8-b6c7-f37365d2915e'),
  (114,'craft','m181130_143040_fix_schema_version','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','561effc0-40ff-438c-82f5-2a3b4c617dfc'),
  (115,'craft','m181211_143040_fix_entry_type_uids','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','02eac786-e059-435d-a089-ff74417d87e9'),
  (116,'craft','m181217_153000_fix_structure_uids','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','4408c2ab-50eb-4453-bf68-57cea19f0a61'),
  (117,'craft','m190104_152725_store_licensed_plugin_editions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','7db11a30-95ef-49d1-a544-84eaa1ed72c1'),
  (118,'craft','m190108_110000_cleanup_project_config','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b6f4bd6b-b752-40cc-8e52-e6a0e7545a03'),
  (119,'craft','m190108_113000_asset_field_setting_change','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f0651699-219b-4390-a130-895e06878b4f'),
  (120,'craft','m190109_172845_fix_colspan','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','dcc2402b-e7c3-4639-ae64-9d5fc18dfbb2'),
  (121,'craft','m190110_150000_prune_nonexisting_sites','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','38558660-b9ac-4c4f-8acb-f8d40fe2789c'),
  (122,'craft','m190110_214819_soft_delete_volumes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','92e1ca39-889a-462e-b9b8-a38c4d780b39'),
  (123,'craft','m190112_124737_fix_user_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','bda4c2f0-b67f-4103-90d3-533673d87249'),
  (124,'craft','m190112_131225_fix_field_layouts','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','0f964866-fa2d-4fe8-8504-0e10328be60b'),
  (125,'craft','m190112_201010_more_soft_deletes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b2a45845-4f41-4700-b998-aa359035f3ad'),
  (126,'craft','m190114_143000_more_asset_field_setting_changes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','65b2e3e4-2b3a-4459-af93-df1e8c32f460'),
  (127,'craft','m190121_120000_rich_text_config_setting','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','7b5aa1e8-7b16-4912-9962-33641be24029'),
  (128,'craft','m190125_191628_fix_email_transport_password','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','9a4f043e-4c69-4b4e-816f-8d042ff72e6b'),
  (129,'craft','m190128_181422_cleanup_volume_folders','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','832577bf-64f5-4fe3-a8dc-bfd5bc844105'),
  (130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','5500fcb6-3ef6-44a2-b856-f55f4cc82e28'),
  (131,'craft','m190218_143000_element_index_settings_uid','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','c8b30f0e-7580-4678-b8bc-0a43c6914a0e'),
  (132,'craft','m190312_152740_element_revisions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6dcb2b62-f787-445c-92a6-4471d1cf3d55'),
  (133,'craft','m190327_235137_propagation_method','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','78948304-e911-4507-a061-3c0962260dae'),
  (134,'craft','m190401_223843_drop_old_indexes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6704ec0c-6618-4af4-a7b5-34d911f42af7'),
  (135,'craft','m190416_014525_drop_unique_global_indexes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2cd8dc7f-97b3-4825-8a36-7faadc613e94'),
  (136,'craft','m190417_085010_add_image_editor_permissions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','7d3fbeed-b229-4c40-998c-0c2b5b496db8'),
  (137,'craft','m190502_122019_store_default_user_group_uid','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d7e52e7f-a6db-4e2f-80e2-7e7c2fb6ccb4'),
  (138,'craft','m190504_150349_preview_targets','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','c4ae7696-3303-4266-9eb5-a7af610f528d'),
  (139,'craft','m190516_184711_job_progress_label','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','8d6ff26f-24ee-41a5-a492-497b97479bc6'),
  (140,'craft','m190523_190303_optional_revision_creators','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','be2b4e41-1eb6-44b4-9c54-50d07ceed34b'),
  (141,'craft','m190529_204501_fix_duplicate_uids','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','e50a7fbc-662a-48c3-ab8e-fe7413915d26'),
  (142,'craft','m190605_223807_unsaved_drafts','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','ace8deb4-7e9a-429d-b0a3-0edd5c0c4986'),
  (143,'craft','m190607_230042_entry_revision_error_tables','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b979cddd-d68b-4c2b-b3ae-57cf8f804592'),
  (144,'craft','m190608_033429_drop_elements_uid_idx','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','bdf07dc6-38fe-42c3-8979-6ba0f4a232a6'),
  (145,'craft','m190617_164400_add_gqlschemas_table','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','b46b6eea-ea40-46bd-be2c-5e3029123621'),
  (146,'craft','m190624_234204_matrix_propagation_method','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','59f1ef15-d4ff-4e50-b4aa-a5a285ef45ef'),
  (147,'craft','m190711_153020_drop_snapshots','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','4db71bac-e159-4ff6-9adf-a13ae248da6c'),
  (148,'craft','m190712_195914_no_draft_revisions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','40e156eb-4cff-425b-8bc6-f01041ec17a2'),
  (149,'craft','m190723_140314_fix_preview_targets_column','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','db3f724b-9618-4813-88e6-b6de29976721'),
  (150,'craft','m190820_003519_flush_compiled_templates','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6e26c4d8-452e-4fd1-97c9-b986e6d4f62d'),
  (151,'craft','m190823_020339_optional_draft_creators','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','bcc8a829-da98-4c91-9078-30b542266ada'),
  (152,'craft','m190913_152146_update_preview_targets','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1bb293cc-6682-433a-a013-cba183a10166'),
  (153,'craft','m191107_122000_add_gql_project_config_support','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','5d82dcce-ff2d-4fb4-b628-a587fe2a301e'),
  (154,'craft','m191204_085100_pack_savable_component_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','720aa584-7b7f-482e-91dd-620cf2920426'),
  (155,'craft','m191206_001148_change_tracking','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','bf78cb9c-8682-4948-80ad-732ad4ab7ac8'),
  (156,'craft','m191216_191635_asset_upload_tracking','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','04212347-b1e2-47be-a206-583b510b6f5f'),
  (157,'craft','m191222_002848_peer_asset_permissions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1ae87a6c-cab0-45d6-90a0-bf54154e7fc4'),
  (158,'craft','m200127_172522_queue_channels','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','38eb64d4-8e5c-46b6-bd73-179d4bf81f9f'),
  (159,'craft','m200211_175048_truncate_element_query_cache','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','38128bf1-b681-47b1-b01f-01185ef32957'),
  (160,'craft','m200213_172522_new_elements_index','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','9adc5540-9c37-42c5-8003-bd74291f8f57'),
  (161,'craft','m200228_195211_long_deprecation_messages','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','224d9ee7-a6bb-4b7a-8aa3-262783e641d1'),
  (162,'craft','m200306_054652_disabled_sites','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','21cd9138-3deb-4f9d-b6e4-0cfc95ff5c69'),
  (163,'craft','m200522_191453_clear_template_caches','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','86856c65-4031-4ad6-8fbb-e411c3ed63ce'),
  (164,'craft','m200606_231117_migration_tracks','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','81a4e9f9-52df-4752-a5cb-2dac7c627996'),
  (165,'craft','m200619_215137_title_translation_method','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2a3e48eb-86f2-4793-a7f9-f45805064ee6'),
  (166,'craft','m200620_005028_user_group_descriptions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','f4936b33-76b9-487e-85f6-bf45d145756d'),
  (167,'craft','m200620_230205_field_layout_changes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','4ff3180c-4938-4b79-804d-4fe05d8ccd67'),
  (168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','afde0fb1-1ac2-4699-a7b2-4730d8a98d89'),
  (169,'craft','m200629_112700_remove_project_config_legacy_files','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','8db2ad51-69e0-4a0c-9961-3e4462760d46'),
  (170,'craft','m200630_183000_drop_configmap','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','2bf1fa6f-2d3a-444f-880b-5e622319d9cf'),
  (171,'craft','m200715_113400_transform_index_error_flag','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','e0db2bd7-0a81-4f75-b136-6dca62158471'),
  (172,'craft','m200716_110900_replace_file_asset_permissions','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6a13002b-c57d-4917-ba05-34aca01af369'),
  (173,'craft','m200716_153800_public_token_settings_in_project_config','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','52105666-0265-486f-b767-3ec4b9ea60e1'),
  (174,'craft','m200720_175543_drop_unique_constraints','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','67a904c3-8197-44c8-af6d-94de784f1051'),
  (175,'craft','m200825_051217_project_config_version','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6c3d025e-a5e0-4e0f-a4ee-5fe71629320b'),
  (176,'craft','m201116_190500_asset_title_translation_method','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','40153049-0249-4d4e-88f5-045de227d5c1'),
  (177,'craft','m201124_003555_plugin_trials','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1817cd79-a8e4-4668-9b96-06345b3e6ea8'),
  (178,'craft','m210209_135503_soft_delete_field_groups','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','54ed7d2b-6458-4d09-b3a0-b0456c6ff956'),
  (179,'craft','m210212_223539_delete_invalid_drafts','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','d4adb883-c934-4164-b12c-cb657c4c2170'),
  (180,'craft','m210214_202731_track_saved_drafts','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','fa49a47a-706d-4928-92ee-205f011cacf4'),
  (181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','4a52587f-4d64-4b13-af2e-fcb1b5141da1'),
  (182,'craft','m210302_212318_canonical_elements','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','8267467c-a73e-471c-8e13-4cc7083c4552'),
  (183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','63835bf3-138b-4a78-9745-4f656e8462e9'),
  (184,'craft','m210329_214847_field_column_suffixes','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','6867b737-10ce-44d9-a241-672735cae627'),
  (185,'craft','m210331_220322_null_author','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','067f5be7-e365-47ae-9e03-333ad4559f63'),
  (186,'craft','m210405_231315_provisional_drafts','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','e42c1664-767e-4c8a-93cc-c0cacd41e912'),
  (187,'craft','m210602_111300_project_config_names_in_config','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','7aa2e7de-80e8-4489-8a96-d609a8efa91c'),
  (188,'craft','m210611_233510_default_placement_settings','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','1582c56d-7180-41fd-89c3-ff44cb4d846e'),
  (189,'craft','m210613_145522_sortable_global_sets','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','ca003dbf-430d-4a68-8a5b-28f138a431ca'),
  (190,'craft','m210613_184103_announcements','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','aa87c246-41f1-4e54-9cb0-4bead81d1d8d'),
  (191,'craft','m210829_000000_element_index_tweak','2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:15','a8ac039e-6bb7-491e-8a26-117b0f9c413b');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_juendtvgyfsycqalzbwukdtjorsotqyraduj` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table projectconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projectconfig`;

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;

INSERT INTO `projectconfig` (`path`, `value`)
VALUES
  ('dateModified','1633046955'),
  ('email.fromEmail','\"admin@fablevision.com\"'),
  ('email.fromName','\"Craft Template\"'),
  ('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
  ('fieldGroups.a45b8f9a-81a7-4785-b187-3aac933c015f.name','\"Common\"'),
  ('meta.__names__.2f2713ac-d18f-4708-b7a9-ca3ec62a795d','\"Craft Template\"'),
  ('meta.__names__.a45b8f9a-81a7-4785-b187-3aac933c015f','\"Common\"'),
  ('meta.__names__.d0ae583f-36a5-4226-9352-a5a94a34ee14','\"Craft Template\"'),
  ('siteGroups.2f2713ac-d18f-4708-b7a9-ca3ec62a795d.name','\"Craft Template\"'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.baseUrl','\"$PRIMARY_SITE_URL\"'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.handle','\"default\"'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.hasUrls','true'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.language','\"en-US\"'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.name','\"Craft Template\"'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.primary','true'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.siteGroup','\"2f2713ac-d18f-4708-b7a9-ca3ec62a795d\"'),
  ('sites.d0ae583f-36a5-4226-9352-a5a94a34ee14.sortOrder','1'),
  ('system.edition','\"pro\"'),
  ('system.live','true'),
  ('system.name','\"Craft Template\"'),
  ('system.schemaVersion','\"3.7.8\"'),
  ('system.timeZone','\"America/Los_Angeles\"'),
  ('users.allowPublicRegistration','false'),
  ('users.defaultGroup','null'),
  ('users.photoSubpath','null'),
  ('users.photoVolumeUid','null'),
  ('users.requireEmailVerification','true');

/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_taconcnhguydjgdrcrvfhxuknigessaxawud` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zftxszodvqgczmexefnvyemomjnhjpqcilut` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ydwreginqglmdbzcgvjtfndeaqspddxaiabp` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_hxbiefgvwsuimrrkbxhcbivwsnzxmsppfugl` (`sourceId`),
  KEY `idx_uymajryvykkyeokarrenzlviqttxyyuhtlry` (`targetId`),
  KEY `idx_dbgppjqwsvicjvnkrsxnjcgwqimjazqqpvjk` (`sourceSiteId`),
  CONSTRAINT `fk_dizphkvhwfmlvxegkscfzyoaguivgvweypzu` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hwfpiaoagtbhibritruuzezpcdtbfgesqrzg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rvceizfbxjzltsoiczijndyehzpiehfacttz` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xwlgvrwmqwrqyavoxkzhksmvzkizaafvvhij` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
  ('1d57dd2c','@lib/garnishjs'),
  ('204feafb','@lib/picturefill'),
  ('27ebd639','@lib/jquery-touch-events'),
  ('2eeacaaa','@lib/d3'),
  ('3404d412','@lib/iframe-resizer'),
  ('38a7eb05','@lib/fileupload'),
  ('4854d161','@craft/web/assets/craftsupport/dist'),
  ('7431c77f','@lib/selectize'),
  ('7741ec25','@craft/web/assets/feed/dist'),
  ('7e5d83f5','@lib/xregexp'),
  ('8110912','@lib/fabric'),
  ('83757d89','@lib/element-resize-detector'),
  ('a14d8ee9','@lib/jquery.payment'),
  ('ace5d67c','@bower/jquery/dist'),
  ('bd6a2101','@lib/velocity'),
  ('d1426506','@craft/web/assets/recententries/dist'),
  ('e02caee','@craft/web/assets/dashboard/dist'),
  ('eff82768','@craft/web/assets/updateswidget/dist'),
  ('f3c3baa4','@lib/jquery-ui'),
  ('f586fef9','@craft/web/assets/cp/dist'),
  ('f914faed','@lib/axios');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fyohjbxytesimpqsqxesbcakzgsrttidgwaa` (`sourceId`,`num`),
  KEY `fk_afxoculmktyfrptuvrcuipymdiiftwhhvhwv` (`creatorId`),
  CONSTRAINT `fk_afxoculmktyfrptuvrcuipymdiiftwhhvhwv` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_capptdnhinzvxpfnbllbbsoekbwajglnlpeg` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_rvatrjdhtyvmltxwbizgfzoiehkleazxnpai` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
  (1,'username',0,1,' admin '),
  (1,'firstname',0,1,''),
  (1,'lastname',0,1,''),
  (1,'fullname',0,1,''),
  (1,'email',0,1,' admin fablevision com '),
  (1,'slug',0,1,'');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_glqbhgtvxoqrzzbdergiodozeuivwlgtqqmx` (`handle`),
  KEY `idx_rvrngbmawgouaolqzdusxgkklhmukihxwbve` (`name`),
  KEY `idx_texsadqgvjufsinibycnzwoekoitsukzcvac` (`structureId`),
  KEY `idx_ngucetdmzbyaaakkelwweynuvaoogaqapmab` (`dateDeleted`),
  CONSTRAINT `fk_zhjjywjfrjyrqaiwqyhffungrjurcvpopipc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ftirgfbhpkteytcjrvxbbcdasbonhzehnbns` (`sectionId`,`siteId`),
  KEY `idx_zrgklvksgonjfaanmenfzgrepufrifljnfyr` (`siteId`),
  CONSTRAINT `fk_jzthylqsnmwqfektxvzecxvvpkmaugqqyyov` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mqtbzqjiggdogloraclbasefdulrfqbytwtj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cywtgahvmddxbpbkvgesqjolhtglfywhfpda` (`uid`),
  KEY `idx_hpmxzenlxzqhtmgnbudpdvsamuboppxyvrmt` (`token`),
  KEY `idx_miqdebixtortvuccowiqiiczdsijrcunnoaq` (`dateUpdated`),
  KEY `idx_bocvpcfwuufeemkuyoouerbcjmwgjyikgyoo` (`userId`),
  CONSTRAINT `fk_bsfwcitibzejztsmuljpsrqodwsyannxgbgl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
  (1,1,'sgROZYxe5odShoWwncAr9SCBZmavqmG5kxaB6PTozTc7TKptavTtv7WNyNBq-DOYMVJvKOzF5fiT36eXjysf7bz7zaTs7CI3tZ-U','2021-10-01 00:09:15','2021-10-01 00:09:18','65e050d5-beb0-4db3-aba2-100e8c630077');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eqbeijplajiiiwmanuwlyfaywmgzwdgithge` (`userId`,`message`),
  CONSTRAINT `fk_udobowuypadkucjfhsmndjfkrbtmrinunzqg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xrzwpaveefghifpdqqocfhcqcmnvcdyrbjur` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
  (1,'Craft Template','2021-10-01 00:09:15','2021-10-01 00:09:15',NULL,'2f2713ac-d18f-4708-b7a9-ca3ec62a795d');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_paqjnltcpptmfxytleosmbbohpzbvfqiavec` (`dateDeleted`),
  KEY `idx_yqsyznrrxlarpfaowdbrlasqfkluqipliovs` (`handle`),
  KEY `idx_loaowdtoatzhjmvltjmodxronfqrsctkpyac` (`sortOrder`),
  KEY `fk_nkbycngybehoqufdtjobbxtunowzljimyhjh` (`groupId`),
  CONSTRAINT `fk_nkbycngybehoqufdtjobbxtunowzljimyhjh` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
  (1,1,1,1,'Craft Template','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-10-01 00:09:15','2021-10-01 00:09:15',NULL,'d0ae583f-36a5-4226-9352-a5a94a34ee14');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zzlywaridkbbofcxnoxngtywxqrtntzjpjbn` (`structureId`,`elementId`),
  KEY `idx_lbudqoupqbvsnalgkgqsoqdhojsewchikrnl` (`root`),
  KEY `idx_nsdorfodsakmftfpsrjtxrvskkuiktngysei` (`lft`),
  KEY `idx_surxtzzobtmncgzbwqeswxwhrxazsdkxfjwo` (`rgt`),
  KEY `idx_nadtuefnauqyhfalaacsmsfqolagvmqfocjy` (`level`),
  KEY `idx_bjwfqiwxnvczdurdnrtxbltezhdhoxvspatz` (`elementId`),
  CONSTRAINT `fk_daweyrszvjriqpuxsfrilybechdtoocilkmy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zphreyeslbeeuylfvgkytknwiiojtvfbswcq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ualaaxgqpewxjlytadnfkrrauevqwzdaznjf` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bjvxsyvybzsjfxomxlnmfvtxzglsbhndcoyp` (`key`,`language`),
  KEY `idx_uxsjsmgbxtkgmrpcukhlilsluzaweaxoifwv` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fqwghdlwuqbjwnnaficcejvnfpmnaubcfzyr` (`name`),
  KEY `idx_lffzjbrvyzxwokfpicqodzccexroesrtrkgj` (`handle`),
  KEY `idx_tjoffgsgzyqffsiurlpubbowenengsaiibnc` (`dateDeleted`),
  KEY `fk_ybrleazyiriylqjvahrysmzvhwnfdhbsoxnx` (`fieldLayoutId`),
  CONSTRAINT `fk_ybrleazyiriylqjvahrysmzvhwnfdhbsoxnx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rffunebmbedalxhtomupufbokxoaoiifcmcz` (`groupId`),
  CONSTRAINT `fk_gciewafnoosxnrowuytcvkrrutmhoojrqzaf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ofvqieuhawvdbgchcsjftgaaekuwiemluqdp` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecacheelements`;

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agvfjnxdanbsashpizzboozhowibbjhvmlri` (`cacheId`),
  KEY `idx_gladwpchqognjbtiapscyexsjzyniafrvgxu` (`elementId`),
  CONSTRAINT `fk_eidmytbdpbzisocljnemrsjgdzqjiqjnzhmr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vogeqimgcmykvzizdvjmknrwtmngvbppybdm` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecachequeries`;

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ynithwoflfxaszbrgemzibajyizvjbkuiuwp` (`cacheId`),
  KEY `idx_ruuawyoautuxvvqrwducqdisipckoesmswgv` (`type`),
  CONSTRAINT `fk_frfzofhvptlyxwereqdtgzcudekjxueljlop` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecaches`;

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pallimbwnsggugzumpxtqmerncowcstucviv` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_adloggdzjtzndyjcctiielqtwsdurpdoyyxx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_bxoaztujzsuscywujffnjdtgcsbrupeffrtc` (`siteId`),
  CONSTRAINT `fk_momxreutdsiyfethjgvaivksnbpgtzvgpbck` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wjoqibxgrokqoysbzkipcymzgmiyeccqfsaz` (`token`),
  KEY `idx_gqdtpnqnzxobheaubinsfuchyjzapkinljpm` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifrouuvekpurdeekhxxaturxvhpgjiwthaen` (`handle`),
  KEY `idx_ketgpvecdeahzjzenoazisaofzoyuejycjcg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bskzrbjgqvflkrfajgmqygmwmsqjtnkkmkqf` (`groupId`,`userId`),
  KEY `idx_kuvofftnzqknyicdlptftfoanbiokbdrkxwj` (`userId`),
  CONSTRAINT `fk_bglfitwblzkzrvwfncbbnzkwkispcxcqfbtt` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfdmqpgpdsdzhahsnxaeigqxvojhmsttxhiv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gbeaomorhshuuccohfcmggkoddpfmqlbdyau` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tqayylvtjypjghexyoqqtdtcfojqocgqmfdt` (`permissionId`,`groupId`),
  KEY `idx_rjfngmcvmqdomyelrlnnswzmoqfiubongiwp` (`groupId`),
  CONSTRAINT `fk_mibcnnobojjabxqgprfmeksalowgcvmjmlso` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_squyiwirojqawilkiruwlkuhgduksbpswznb` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lieuaiyuckemfgoxujwxqkychhizajrdndif` (`permissionId`,`userId`),
  KEY `idx_wuyowcqwhoegbvflibwsuzmgeazqvfhwigyf` (`userId`),
  CONSTRAINT `fk_batyenknhsglmraqauakgbiejigwqqfzkqwx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jykycmaqaepdjopvspgrzicencdetjdtxosm` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_cuilpvwknitmrnxzdycmaoucywjbcaoceara` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
  (1,'{\"language\":\"en-US\"}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fxzvupnohvrfwetylauyapjirirfxkneucng` (`uid`),
  KEY `idx_icvpoarmpphumzarznkcvouxyqojttiovktn` (`verificationCode`),
  KEY `idx_qzwrxuawvwevwphaklqbiiqrvlcoboujosfv` (`email`),
  KEY `idx_vswecgukafinnttpfoefvwzfdbjaggoadqbf` (`username`),
  KEY `fk_uhsylqfazfzqppissbwlnqacrrovazriwbke` (`photoId`),
  CONSTRAINT `fk_iwmivhwysbluxswufsminfarjlqoubdfklzx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uhsylqfazfzqppissbwlnqacrrovazriwbke` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
  (1,'admin',NULL,NULL,NULL,'admin@fablevision.com','$2y$13$s/9X8H61kuN8UVOICFoeDOfin09HDuIFZ.iXdL8IwtXFYpjOkG1Ay',1,0,0,0,'2021-10-01 00:09:15',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-10-01 00:09:15','2021-10-01 00:09:15','2021-10-01 00:09:17','bf6665d6-d597-4bbb-9f34-05d3b1f07a7a');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ktjchqjvydzlngewemaqbianzahdmvknkabj` (`name`,`parentId`,`volumeId`),
  KEY `idx_znqpmbehouhxxckgehnrpnriulvpzpejjcvg` (`parentId`),
  KEY `idx_jobshhhpahjhsydyupctnghvwarnilpuunrz` (`volumeId`),
  CONSTRAINT `fk_dksnzsphqnufwqfplzydkyopjyehytpawtch` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kkjuxwpsiudenjqisemtqpfyjnzicrsgksrd` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sovwcrvcbuqwdqslnuhrfhtfzsauzmdfrclg` (`name`),
  KEY `idx_dkyarhjoxuzucitwpprfkskrkfwtegagiluj` (`handle`),
  KEY `idx_nvcbbukleoaprhylkkclrgiztzibgyistbjk` (`fieldLayoutId`),
  KEY `idx_tpibqruvahvhpuhosspyhqxmkatdwyaxouwh` (`dateDeleted`),
  CONSTRAINT `fk_chtsvnuakqqiepsmdjxutedmavvlpmrtdvff` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_exdufncjearjvbgxjzoatbijlzcqvcmfrrey` (`userId`),
  CONSTRAINT `fk_zkwxzvhtwgzmuoraipfbriisykggfzkgnfsp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
  (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-10-01 00:09:17','2021-10-01 00:09:17','8c93742d-5f51-4cea-ab53-9132aab5e36a'),
  (2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-10-01 00:09:17','2021-10-01 00:09:17','fc57485d-77c3-46ff-aefa-51ddb86f828f'),
  (3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-10-01 00:09:17','2021-10-01 00:09:17','4863067e-6f07-42bb-9c98-8c3b4b7a47dc'),
  (4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-10-01 00:09:17','2021-10-01 00:09:17','27f0686d-e268-45eb-ae16-6449dffb76dc');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
