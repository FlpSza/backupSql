CREATE DATABASE  IF NOT EXISTS `star_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `star_dev`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: star_dev
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cfrt`
--

DROP TABLE IF EXISTS `cfrt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfrt` (
  `CPF_CNPJ_CFRT` varchar(18) DEFAULT NULL,
  `CPF_CNPJ_EmpresaGrupo_CFRT` varchar(18) DEFAULT NULL,
  `Categoria1_CFRT` varchar(30) DEFAULT NULL,
  `Categoria2_CFRT` varchar(30) DEFAULT NULL,
  `Categoria3_CFRT` varchar(30) DEFAULT NULL,
  `CategoriaFiscal_CFRT` varchar(30) DEFAULT NULL,
  `Classificacao_CFRT` varchar(30) DEFAULT NULL,
  `Cliente_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  `Codigo_CFRT` int NOT NULL,
  `CodigoCNAE_CFRT` varchar(30) DEFAULT NULL,
  `CodigoCondicaoPagamento_CFRT` varchar(30) DEFAULT NULL,
  `CodigoEmpresaGrupo_CFRT` varchar(30) DEFAULT NULL,
  `CodigoFormaPagamento_CFRT` varchar(30) DEFAULT NULL,
  `CodigoRegistroSUFRAMA_CFRT` varchar(30) DEFAULT NULL,
  `CodigoTabelaPrecoProduto_CFRT` varchar(30) DEFAULT NULL,
  `CodigoTabelaPrecoServico_CFRT` varchar(30) DEFAULT NULL,
  `Contato_CFRT` varchar(30) DEFAULT NULL,
  `ContribuicaoICMS_CFRT` varchar(30) DEFAULT NULL,
  `DDDTelefone1_CFRT` varchar(5) DEFAULT NULL,
  `DDDTelefone2_CFRT` varchar(5) DEFAULT NULL,
  `DadosInfoPlus_CFRT` varchar(300) DEFAULT NULL,
  `DataSituacaoCFRT_CFRT` date DEFAULT NULL,
  `EmailEnvioNFe_CFRT` varchar(100) DEFAULT NULL,
  `EmailPrincipal_CFRT` varchar(100) DEFAULT NULL,
  `HomePage_CFRT` varchar(100) DEFAULT NULL,
  `InfoExtra1_CFRT` varchar(200) DEFAULT NULL,
  `InfoExtra2_CFRT` varchar(200) DEFAULT NULL,
  `InfoExtra3_CFRT` varchar(200) DEFAULT NULL,
  `InfoExtra4_CFRT` varchar(200) DEFAULT NULL,
  `InscricaoEstadual_CFRT` varchar(15) DEFAULT NULL,
  `LimiteDeCredito_CFRT` varchar(10) DEFAULT NULL,
  `Nome_CFRT` varchar(200) DEFAULT NULL,
  `NomeFantasia_CFRT` varchar(200) DEFAULT NULL,
  `OptanteSIMPLES_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  `PercentualDescontoComercial_CFRT` varchar(10) DEFAULT NULL,
  `PercentualDescontoFinanceiro_CFRT` varchar(10) DEFAULT NULL,
  `RG_CFRT` varchar(15) DEFAULT NULL,
  `RazaoSocial_CFRT` varchar(200) DEFAULT NULL,
  `Representante_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  `SituacaoCFRT_CFRT` int DEFAULT NULL,
  `Telefone1_CFRT` varchar(15) DEFAULT NULL,
  `Telefone2_CFRT` varchar(15) DEFAULT NULL,
  `TipoPessoa_CFRT` int DEFAULT NULL,
  `Transportadora_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  `UtilizaSuframa_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  `ValorDescontoComercial_CFRT` varchar(10) DEFAULT NULL,
  `ValorDescontoFinanceiro_CFRT` varchar(10) DEFAULT NULL,
  `VendaBloqueada_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  `Fornecedor_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Codigo_CFRT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfrt`
--

LOCK TABLES `cfrt` WRITE;
/*!40000 ALTER TABLE `cfrt` DISABLE KEYS */;
INSERT INTO `cfrt` VALUES ('108.391.260-77','','1.01','2.04','3.02','0','1.1.02.01.01',1,171,'','002','','15','','','','','78','047','0xx47',NULL,NULL,'','abigailg@abigailgusmao.com.br','www.abigailgusmao.com.br','','','','','','0,00','Abigail Gusmão','',0,'','','','',0,0,'3235001','3235002',70,0,0,'0,00','0,00',0,0),('00.654.321/6546-57','00.654.321/6546-57','1.01','2.05','3.05','4','1.1.02.01.02',1,187,'0162899','004','187','15','326598','2','1','Joelson','83','021','0xx21',NULL,'2022-05-25','nfe@oi.com.br','asbrema@amigosdamadrugada.com.br','www.amigosdamadruga.com.br','inf extra 01','inf extra 02','inf extra 03','inf extra 04','23.121.52-1','11.112,00','Associação Amigos da Madrugada','Asbrema',1,'','','','Associação Amigos da Madrugada',0,0,'5506261','',74,0,1,'0,00','11,00',1,0),('65.489.654/1232-51','','1.02','2.02','3.02','0','1.1.02.01.03',1,193,'4711302','','','','','','','Basílio','78','047','0xx47',NULL,NULL,'','gs@basilio.com.br','www.basilio.com.br','','','','','','0,00','Basílio de Souza','Basílio',0,'','','','Basílio de Souza',0,0,'65401200','65401201',74,0,0,'0,00','0,00',0,0),('98.765.431/6547-71','','1.03','2.01','3.02','0','1.1.02.01.04',1,201,'4789099','','','','','','','Carol','78','047','0xx47',NULL,NULL,'','ferrarif1@carolferrari.com.br','www.carolferrari.com.br','','','','','','0,00','Carolina Ferrari','Carol Ferrari',0,'','','','Carolina Ferrari',0,0,'3415689','3415690',74,0,0,'0,00','0,00',0,0),('65.432.187/4444-53','','1.02','2.02','3.02','0','1.1.02.01.05',1,218,'4789099','','','','','','','Júnior','78','047','0xx47',NULL,NULL,'','emergardo@emergrando.com.br','www.emergrando.com.br','','','','','','0,00','Emengardo de Oliveira Júnior','Emengardo',0,'','','','Emengardo de Oliveira Júnior',0,0,'65412356','65412357',74,0,0,'0,00','0,00',0,0),('45.612.345/6879-38','','1.01','2.02','3.02','0','1.1.02.01.06',1,224,'4711302','','','','','','','Fausto','78','047','0xx47',NULL,NULL,'','faustaozinho@faustocompras.com.br','www.faustocompras.com.br','','','','','','0,00','Fausto Francisco da Silva Santos','Faustaozinho',0,'','','','Fausto Francisco da Silva Santos',0,0,'56568000','56568001',74,0,0,'0,00','0,00',0,0),('65.432.189/7654-00','','1.03','2.05','3.02','0','1.1.02.01.07',1,231,'4711302','','','','','','','Georges','78','047','0xx47',NULL,NULL,'','geoges@georgessolucoes.com.br','www.gerogessolucoes.com.br','','','','','','0,00','Georges Soluções Ltda.','Geroges',0,'','','','Georges Soluções Ltda.',0,0,'56557009','56557010',74,0,0,'0,00','0,00',0,0),('00.000.000/0000-00','','1.04','2.01','3.08','0','1.1.02.01.08',1,247,'','','','','','','','Frederico','78','0','011',NULL,NULL,'','granhermano@granhermano.com','www.granhermano.com','','','','','','0,00','Gran Hermano da Fronteira','Gran Hermano',0,'','','','Gran Hermano da Fronteira',0,0,'89523655','96325454',74,0,0,'0,00','0,00',0,0),('85.265.475/3258-94','','1.02','2.01','3.02','0','1.1.02.01.09',1,253,'4789099','','','','','','','Ivo','78','041','0xx41',NULL,NULL,'','ivao@ivomerces.com.br','www.ivomerces.com.br','','','','','','0,00','Ivo das Mercês','Ivão',0,'','','','Ivo das Mercês',0,0,'5220100','5220101',74,0,0,'0,00','0,00',0,0),('45.678.913/2456-31','','1.02','2.01','3.02','0','1.1.02.01.10',1,260,'4789099','','','','','','','Almeida','78','051','0xx51',NULL,NULL,'','jucabala@jucaalmeida.com.br','www.jucaalmeida.com.br','','','','','','0,00','J J de Almeida e Filhos Ltda.','Juca Bala',0,'','','','J J de Almeida e Filhos Ltda.',0,0,'7895001','7895002',74,0,0,'0,00','0,00',0,0),('523.460.939-12','','1.01','2.03','3.05','0','1.1.02.01.11',1,276,'','','','','','','','','78','021','0xx21',NULL,NULL,'','janapar@provedor.com.br','','','','','','','0,00','Janaína Paredes','',0,'','','','',0,0,'56548004','56548005',70,0,0,'0,00','0,00',0,0),('472.017.454-09','','1.01','2.03','3.03','0','1.1.02.01.12',1,282,'','','','','','','','','78','031','0xx31',NULL,NULL,'','lalau@provedor.com.br','','','','','','','0,00','Laurindo Gomes Carneiro','',0,'','','','',0,0,'22624568','22624569',70,0,0,'0,00','0,00',0,0),('482.307.149-24','','1.01','2.03','3.02','0','1.1.02.01.13',1,299,'','','','','','','','','78','047','0xx47',NULL,NULL,'','levibill@leviseverino.com.br','www.leviseverino.com.br','','','','','','0,00','Levi Severino Goldenberg','',0,'','','','',0,0,'25605151','25605152',70,0,0,'0,00','0,00',0,0),('927.702.088-10','','1.02','2.04','3.02','0','1.1.02.01.14',1,307,'','','','','','','','','78','047','0xx47',NULL,NULL,'','luciaricarda@provedor.com.br','','','','','','','0,00','Lúcia Ricarda Srombolli','',0,'','','','',0,0,'55489002','55489003',70,0,0,'0,00','0,00',0,0),('65.432.165/4798-74','','1.02','2.01','3.02','0','1.1.02.01.15',1,313,'4755501','','','','','','','Maurícia','78','047','0xx47',NULL,NULL,'','cortecerto@cortecerto.com.br','www.cortecerto.com.br','','','','','','0,00','Malharia Corte Certo S/A','Corte Certo',0,'','','','Malharia Corte Certo S/A',0,0,'55006450','55006451',74,0,0,'0,00','0,00',0,0),('754.645.654-18','','1.01','2.03','3.02','0','1.1.02.01.16',1,320,'','','','','','','','','78','051','0xx51',NULL,NULL,'','profeta@provedor.com.br','','','','','','','0,00','Moisés Undergrudfen do Mar Aberto','',0,'','','','',0,0,'5648899','5648900',70,0,0,'0,00','0,00',0,0),('45.688.798/5132-81','','1.01','2.02','3.05','0','1.1.02.01.17',1,336,'4637199','','','','','','','Jorges Amassa','78','011','0xx11',NULL,NULL,'','bompao@padariabompao.com.br','www.padariabompao.com.br','','','','','','0,00','Padaria Bom Pão Ltda.','Bom Pão',0,'','','','Padaria Bom Pão Ltda.',0,0,'55462001','55462002',74,0,0,'0,00','0,00',0,0),('12.378.986/2248-13','','1.02','2.01','3.02','0','1.1.02.01.18',1,342,'4755501','','','','','','','Lindomario','78','047','0xx47',NULL,NULL,'','vestebem@vestebem.com.br','www.vestebem.com.br','','','','','','0,00','Veste Bem Malhas Ltda.','Veste Bem',0,'','','','Veste Bem Malhas Ltda.',0,0,'9985023','9985024',74,0,0,'0,00','0,00',0,0),('14.736.925/8159-28','','1.03','2.02','3.02','0','1.1.02.01.19',1,359,'4755501','','','','','','','Faigon','78','048','0xx48',NULL,NULL,'','ringo@ringoconfeccoes.com.br','www.ringoconfeccoes.com.br','','','','','','0,00','Ringo Confecções S/A','Ringo',0,'','','','Ringo Confecções S/A',0,0,'3714589','3714590',74,0,0,'0,00','0,00',0,0),('45.612.325/8789-83','','1.04','2.02','3.02','0','1.1.02.01.20',1,365,'5590602','','','','','','','Michail','78','048','0xx48',NULL,NULL,'','buhc@buchladem.com.br','www.buchladem.com.br','','','','','','0,00','Buch Ladem Aventura Ltda.','Buch Aventura',0,'','','','Buch Ladem Aventura Ltda.',0,0,'3725648','3725649',74,0,0,'0,00','0,00',0,0),('123.456.789-09','','1.01','2.03','3.02','0','1.1.02.01.21',1,371,'','','','','','','','','78','047','0xx47',NULL,NULL,'','valfrido@provedor.com.br','','','','','','','0,00','Valfrido Forte Pereira','',0,'','','','',0,0,'3269900','3269901',70,0,0,'0,00','0,00',0,0),('789.456.123-19','','1.01','2.04','3.02','0','1.1.02.01.22',1,388,'','','','','','','','','78','047','0xx47',NULL,NULL,'','romena@provedor.com.br','','','','','','','0,00','Romena Maria Shimino','',0,'','','','',0,0,'9984565','9984566',70,0,0,'0,00','0,00',0,0),('45.689.846/5165-14','','','','','0','2.1.01.01',0,945,'4641902','','','','','','','Hidalmo','78','0xx47','0xx47',NULL,NULL,'','hidalmo@acme.com.br','www.acme.com.br','','','','','','0,00','Acme S/A','Acme',0,'','','','Acme S/A',0,0,'65421654','65421655',74,0,0,'0,00','0,00',0,0),('65.484.655/4896-15','','','','','0','2.1.01.02',0,951,'1359600','','','','','','','Roderson','78','0xx21','0xx21',NULL,NULL,'','roderson@bee.com.br','www.bee.com.br','','','','','','0,00','Bee Indústria e Comércio Confecções S/A','Bee S/A',0,'','','','Bee Indústria e Comércio Confecções S/A',0,0,'654987654','654987655',74,0,0,'0,00','0,00',0,0),('98.654.569/8745-74','','','','','0','2.1.01.03',0,968,'1340502','','','','','','','Josefa','78','0xx47','0xx47',NULL,NULL,'','josefa@heining.com.br','www.heining.com.br','','','','','','0,00','Heining Textil S/A','Heining',0,'','','','Heining Textil S/A',0,0,'654987654','654987655',74,0,0,'0,00','0,00',0,0),('65.486.543/5498-68','','','','','0','2.1.01.04',0,974,'1340502','','','','','','','Nailson','78','0xx31','0xx31',NULL,NULL,'','nailson@kimbalao.com.br','www.kimbalao.com.br','','','','','','0,00','Ind Com. Roupas Kimbalao Ltda.','Kimbalao',0,'','','','Ind Com. Roupas Kimbalao Ltda.',0,0,'654875852','654875853',74,0,0,'0,00','0,00',0,0),('65.423.578/9000-08','','','','','0','2.1.01.05',0,981,'1531901','','','','','','','Roversão','78','0xx47','0xx47',NULL,NULL,'','roversao@cossanelli.com.br','www.cossanelli.com.br','','','','','','0,00','Ind.de Calçados Cossanelli Ltda.','Cossanelli',0,'','','','Ind.de Calçados Cossanelli Ltda.',0,0,'65487126','65487127',74,0,0,'0,00','0,00',0,0),('25.964.876/5130-54','','','','','0','2.1.01.06',0,997,'1330800','','','','','','','Deline','78','0xx41','0xx41',NULL,NULL,'','deline@kabumar.com.br','www.kabumar.com.br','','','','','','0,00','Indústria Kabumar Ltda.','Kabumar',0,'','','','Indústria Kabumar Ltda.',0,0,'654853215','654853216',74,0,0,'0,00','0,00',0,0),('98.765.432/1001-41','','','','','0','2.1.01.07',0,1005,'4641903','','','','','','','Quaterno','78','0xx47','0xx47',NULL,NULL,'','quaterno@vendetudo.com.br','www.vendetudo.com.br','','','','','','0,00','Representação Vende Tudo Ltda.','RepreVend',0,'','','','Representação Vende Tudo Ltda.',0,0,'321654987','321654988',74,0,0,'0,00','0,00',0,0),('65.498.765/4210-80','','','','','0','2.1.01.08',0,1011,'2399101','','','','','','','Timóteo','78','0xx47','0xx47',NULL,NULL,'','timoteo@vivacorloucas.com.br','www.vivacorloucas.com.br','','','','','','0,00','Vivacor Louças Ltda.','Vivacor',0,'','','','Vivacor Louças Ltda.',0,0,'465484235','465484236',74,0,0,'0,00','0,00',0,0),('65.485.865/4865-21','','','','','0','2.1.01.09',0,1028,'1340502','','','','','','','Welintom','78','0xx47','0xx47',NULL,NULL,'','welintom@walmee.com.br','www.walmee.com.br','','','','','','0,00','Walmee Malhas Ltda.','Walmee',0,'','','','Walmee Malhas Ltda.',0,0,'654485432','654485433',74,0,0,'0,00','0,00',0,0),('32.584.932/0001-05','','','','','0','2.1.01.10',0,1034,'','','','','','','','Mctomphs','78','0xx12','0xx12',NULL,NULL,'','mctomphs@waterblue.com.br','www.waterblue.com.br','','','','','','0,00','Water Blue Eletronics CO','Water Blue',0,'','','','Water Blue Eletronics CO',0,0,'11029898','11029899',74,0,0,'0,00','0,00',0,0),('65.487.451/3254-49','','','','','0','2.1.01.11',0,1041,'1340502','','','','','','','Garintino','78','0xx11','0xx11',NULL,NULL,'','garintino@xanadu.com.br','www.xanadu.com.br','','','','','','0,00','Xanadú Ind. Têxtil S/A','Xanadú',0,'','','','Xanadú Ind. Têxtil S/A',0,0,'6565478','6565479',74,0,0,'0,00','0,00',0,0),('21.452.147/8548-09','','','','','0','2.1.01.12',0,1057,'2399101','','','','','','','Benini','78','0xx51','0xx51',NULL,NULL,'','benini@brilhointenso.com.br','www.brilhointenso.com.br','','','','','','0,00','Brilho Intenso Cristais S/A','Brilho Intenso',0,'','','','Brilho Intenso Cristais S/A',0,0,'55896582','55896583',74,0,0,'0,00','0,00',0,0),('21.452.147/8550-23','','','','','0','2.1.01.13',0,1063,'4763601','','','','','','','Loeram','78','0xx47','0xx47',NULL,NULL,'','loeram@criancafeliz.com.br','www.criancafeliz.com.br','','','','','','0,00','Criança Feliz Brinquedos Atacadão Ltda.','Criança Feliz',0,'','','','Criança Feliz Brinquedos Atacadão Ltda.',0,0,'3265541','3265542',74,0,0,'0,00','0,00',0,0),('336.628.721-70','','','','','0','2.1.01.14',0,1070,'','','','','','','','','78','0xx47','0xx47',NULL,NULL,'','jovenal@provedor.com.br','','','','','','','0,00','Jovenal Eduardo Ricochete','',0,'','','','',0,0,'2278856','2278857',70,0,0,'0,00','0,00',0,0),('443.721.481-19','','','','','0','2.1.01.15',0,1086,'','','','','','','','','78','0xx41','0xx41',NULL,NULL,'','amelia@provedor.com.br','','','','','','','0,00','Amélia Jurema Souza e Silva Pereira','',0,'','','','',0,0,'3395685','3395686',70,0,0,'0,00','0,00',0,0),('21.452.147/7854-91','','','','','0','2.1.01.16',0,1092,'4763604','','','','','','','Jones','78','0xx47','0xx47',NULL,NULL,'','jones@indianaadventure.com.br','www.indianaadventure.com.br','','','','','','0,00','Indiana Pereira Jones Adventure Ltda.','Indiana Adventure',0,'','','','Indiana Pereira Jones Adventure Ltda.',0,0,'6652214','6652215',74,0,0,'0,00','0,00',0,0),('74.563.521/4523-37','','','','','0','2.1.01.17',0,1101,'4010004','','','','','','','Fábio','78','0xx48','0xx48',NULL,NULL,'','eca@eletricascatarinense.com.br','www.eletricascatarinense.gov.br','','','','','','0,00','Elétricas Catarinense S/A','ECA',0,'','','','Elétricas Catarinense S/A',0,0,'7526300','7526301',74,0,0,'0,00','0,00',0,0),('25.360.123/0001-64','','','','','0','2.1.01.18',0,1117,'4100901','','','','','','','Maria Joaquina','78','0xx47','0xx47',NULL,NULL,'','agualimpa@agualimpablumenau.gov.br','www.agualimpa.gov.br','','','','','','0,00','Agua Limpa Blumenau S/A','Água Limpa',0,'','','','Agua Limpa Blumenau S/A',0,0,'5602150','5602151',74,0,0,'0,00','0,00',0,0),('96.532.569/0001-77','','','','','0','2.1.01.19',0,1123,'6420304','','','','','','','Paulo José','83','0xx47','0xx47',NULL,NULL,'','comunica@comunicabem.gov.br','www.comunicabem.gov.br','','','','','851.658.300','0,00','Comunica Bem Telecomunicações S/A','CBT',0,'','','','Comunica Bem Telecomunicações S/A',0,0,'5910001','5910002',74,0,0,'0,00','0,00',0,0),('96.589.657/4001-20','','','','','0','2.1.01.20',0,1130,'8121400','','','','','','','Dona Benta','78','0xx47','0xx47',NULL,NULL,'','casalimpa@casalimpatudo.com.br','www.casalimpa.com.br','','','','','','0,00','Casa Limpa Tudo LTDA','Casa Limpa',0,'','','','Casa Limpa Tudo LTDA',0,0,'5808005','5808006',74,0,0,'0,00','0,00',0,0),('32.514.521/4201-01','','','','','0','2.1.01.21',0,1146,'8011101','','','','','','','Jamil','78','0xx47','0xx47',NULL,NULL,'','segurancaforte@segurancaforte.com.br','www.segurancaforte.com.br','','','','','','0,00','Segurança Forte Bem Segura LTDA','Segurança Forte',0,'','','','Segurança Forte Bem Segura LTDA',0,0,'4962001','4962002',74,0,0,'0,00','0,00',0,0),('93.670.719/6226-26','','','','','0','2.1.05.01.01',0,1465,'0114800','','','','','','','Andrada','78','0xx51','',NULL,NULL,'','andrada@felintoandrada.com.br','www.felintoandrada.com.br','','','','','','0','Felinto Andrada Representações Comerciais Ltda.','Felinto',0,'','','','Felinto Andrada Representações Comerciais Ltda.',1,0,'85402121','051-654258',74,0,0,'0,00','0,00',0,0),('09.594.519/7958-05','','','','','0','2.1.05.01.01',0,1471,'0116401','','','','','','','Júlio','78','0xx48','',NULL,NULL,'','julio@meteoro.com.br','www.meteoro.com.br','','','','','','0','Julio Cesar Meteoro','Meteoro',0,'','','','Julio Cesar Meteoro',1,0,'3485252','011-546876',74,0,0,'0,00','0,00',0,0),('88.308.062/8198-30','','','','','0','2.1.05.01.01',0,1488,'0119905','','','','','','','Roverson Badalim','78','0xx47','0xx47',NULL,NULL,'','roverson@badalim.com.br','www.badalim.com.br','','','','','','0','Representações Comerciais Badalim','Badalim',0,'','','','Representações Comerciais Badalim',1,0,'3231155','121354651',74,0,0,'0,00','0,00',0,0),('02.160.688/4423-83','','','','','0','2.1.05.01.01',0,1494,'0119903','','','','','','','Josias São Lucas','78','0xx21','',NULL,NULL,'','josias@repsao.com.br','www.repsao.com.br','','','','','','0','Representações Comerciais São Lucas Ltda.','Rep São',0,'','','','Representações Comerciais São Lucas Ltda.',1,0,'45006699','021-213246',74,0,0,'0,00','0,00',0,0),('654.215.650-09','','','','','0','2.1.05.01.01',0,1502,'','','','','','','','','78','0xx11','0xx11',NULL,NULL,'','teobaldo@provedor.com.br','','','','','','','0','Teobaldo Ronconi Pindarotti','',0,'','','','',1,0,'52558877','011-125648',70,0,0,'0,00','0,00',0,0),('65.421.500/0000-61','','','','','0','2.1.05.02.01',0,1525,'4930202','','','','','','','Gervásio','78','0xx47','0xx47',NULL,NULL,'','gervasio@levalogo.com.br','www.levalogo.com.br','','','','','','0,00','Leva Logo Transporte Rodoviário de Cargas Ltda.','Leva Logo',0,'','','','Leva Logo Transporte Rodoviário de Cargas Ltda.',0,0,'3345688','3345690',74,1,0,'0,00','0,00',0,0),('32.100.000/0000-79','','','','','0','2.1.05.02.01',0,1531,'4930302','','','','','','','Carlão','78','0xx41','0xx41',NULL,NULL,'','carlao@boacaraga.com.br','www.boacarga.com.br','','','','','','0,00','Transportadora Boa Carga Ltda.','Boa Carga',0,'','','','Transportadora Boa Carga Ltda.',0,0,'55669898','55669900',74,1,0,'0,00','0,00',0,0),('65.402.350/0000-49','','','','','0','2.1.05.02.01',0,1548,'4930302','','','','','','','Felizberto','78','0xx47','0xx47',NULL,NULL,'','flizberto@ligeirinho.com.br','www.ligeirinho.com.br','','','','','','0,00','Transporte Ligeirinho Ltda.','Ligeirinho',0,'','','','Transporte Ligeirinho Ltda.',0,0,'3295001','3295003',74,1,0,'0,00','0,00',0,0),('15.935.725/8456-02','','','','3.02','0','1.1.02.01.23',1,2849,'4763601','','','','','','','Erinaldo','78','48','0xx48',NULL,NULL,'','brinque@brinquebrincando.com.br','www.brinquebrincando.com.br','','','','','','0,00','Brinque Brincando Rogers Ltda.','Brinque Rogers',0,'','','','Brinque Brincando Rogers Ltda.',0,0,'3736-5444','3736-5455',74,0,0,'0,00','0,00',0,0),('25.845.632/1001-30','','','','','0','2.1.01.22',0,2855,'4329199','','','','','','','Zé Ferramenta','78','0xx47','0xx47',NULL,NULL,'','arrumatudo@arrumatudo.com.br','www.arrumatudo.com.br','','','','','','0,00','Arruma Tudo Manutenções LTDA','Arruma Tudo',0,'','','','Arruma Tudo Manutenções LTDA',0,0,'3962001','3962002',74,0,0,'0,00','0,00',0,0),('82.624.776/0001-47','','','','','0','2.1.01.22',0,2884,'','','','','','','','','78','47','',NULL,NULL,'','','','','','','','','0,00','Unimedic','Unimedic',0,'','','','Unimedic',0,0,'33318500','',74,0,0,'0,00','0,00',0,0),('02.101.894/0001-31','','','','','0','2.1.01.23',0,2909,'','','','','','','','','83','','',NULL,NULL,'','','','','','','','206.094.764.116','0,00','PC Distribuição de Produtos de Informática Ltda.','PC Produtos Informát',0,'','','','PC Distribuição de Produtos de Informática Ltda.',0,0,'','',74,0,0,'0,00','0,00',0,0),('91.088.328/0001-67','','','','','0','2.1.01.23',0,2921,'','','','','','','','','83','','',NULL,NULL,'','','','','','','','100/0000000','0,00','Terra Networks','Terra Networks',0,'','','','Terra Networks',0,0,'','',74,0,0,'0,00','0,00',0,0),('11.122.233/0001-25','','','','','0','2.1.01.23',0,2944,'','','','','','','','','83','','',NULL,NULL,'','','','','','','','123/1112456','0,00','Cia Nacional de Seguros','Cia Nacional Seguros',0,'','','','Cia Nacional de Seguros',0,0,'','',74,0,0,'0,00','0,00',0,0),('00.000.000/0000-00','','1.04','2.01','3.06','0','2.1.01.23',0,2951,'','','','','','','','Geroges','78','','',NULL,NULL,'','globaldelta@global.com','www.deltaglobal.com','','','','','','0,00','Delta Global','Delta Global',0,'','','','Delta Global',0,0,'','',74,0,0,'0,00','0,00',0,0);
/*!40000 ALTER TABLE `cfrt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfrt_contatos`
--

DROP TABLE IF EXISTS `cfrt_contatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfrt_contatos` (
  `CD_CFRT` int DEFAULT NULL,
  `Bairro_Contatos_CFRT` varchar(50) DEFAULT NULL,
  `CEP_Contatos_CFRT` varchar(9) DEFAULT NULL,
  `Cidade_Contatos_CFRT` varchar(100) DEFAULT NULL,
  `Codigo_Contatos_CFRT` int DEFAULT NULL,
  `CodigoCidade_Contatos_CFRT` int DEFAULT NULL,
  `CodigoIBGECidade_Contat` int DEFAULT NULL,
  `Complemento_Contatos_CFRT` varchar(300) DEFAULT NULL,
  `DDDFax_Contatos_CFRT` varchar(5) DEFAULT NULL,
  `DDDTelefone_Contatos_CFRT` varchar(5) DEFAULT NULL,
  `DataNascimento_Contatos_CFRT` date DEFAULT NULL,
  `Departamento_Contatos_CFRT` varchar(50) DEFAULT NULL,
  `Email_Contatos_CFRT` varchar(200) DEFAULT NULL,
  `Endereco_Contatos_CFRT` varchar(200) DEFAULT NULL,
  `Fax_Contatos_CFRT` varchar(15) DEFAULT NULL,
  `Funcao_Contatos_CFRT` varchar(100) DEFAULT NULL,
  `Nome_Contatos_CFRT` varchar(200) DEFAULT NULL,
  `NumeroEndereco_Contatos_CFRT` varchar(200) DEFAULT NULL,
  `Telefone_Contatos_CFRT` varchar(15) DEFAULT NULL,
  `UF_Contatos_CFRT` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfrt_contatos`
--

LOCK TABLES `cfrt_contatos` WRITE;
/*!40000 ALTER TABLE `cfrt_contatos` DISABLE KEYS */;
INSERT INTO `cfrt_contatos` VALUES (187,'De lama','23568142','Manoel Urbano',1,1201,1200344,'casa','21','21','2020-08-19','compras','lucas@oi.com.br','Rua de terra ','33364477','comprador','Lucas','55','55889966','AC'),(187,'Esse','21548752','Capixaba',2,501,1200179,'Casa2','21','21','1988-09-19','Financeiro','heloiza@oi.com.br','Rua de Terra','55447722','Contas a Pagar','Heloiza','44','33656485','AC'),(951,'','','',1,NULL,NULL,'','','',NULL,'DP','joão@oi.com.br','Estrada do Mato Alto','','Contador','João','0','',''),(951,'','','',2,NULL,NULL,'','','',NULL,'','','','','','Vitor','0','',''),(951,'Guaratiba','23062-541','Rio de Janeiro',3,6822,3304557,'Loja','21','21','2074-08-14','Diretoria','josé@oi.com.br','Estrada da Ilha','33554488','Diretor','José','22','55223366','RJ');
/*!40000 ALTER TABLE `cfrt_contatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfrt_dadosinfoplus`
--

DROP TABLE IF EXISTS `cfrt_dadosinfoplus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfrt_dadosinfoplus` (
  `CD_CFRT` int DEFAULT NULL,
  `Descricao_InfoPlus_CFRT` varchar(30) DEFAULT NULL,
  `Grupo_InfoPlus_CFRT` varchar(15) DEFAULT NULL,
  `IdHeader_InfoPlus_CFRT` varchar(15) DEFAULT NULL,
  `Obrigatorio_InfoPlus_CFRT` tinyint(1) DEFAULT NULL,
  `TipoInfoPlus_InfoPlus_CFRT` decimal(10,0) DEFAULT NULL,
  `Valor_InfoPlus_CFRT` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfrt_dadosinfoplus`
--

LOCK TABLES `cfrt_dadosinfoplus` WRITE;
/*!40000 ALTER TABLE `cfrt_dadosinfoplus` DISABLE KEYS */;
INSERT INTO `cfrt_dadosinfoplus` VALUES (171,'Caloteiro:','','100',0,2,''),(187,'Caloteiro:','','100',0,2,'Sim'),(193,'Caloteiro:','','100',0,2,''),(201,'Caloteiro:','','100',0,2,''),(218,'Caloteiro:','','100',0,2,''),(224,'Caloteiro:','','100',0,2,''),(231,'Caloteiro:','','100',0,2,''),(247,'Caloteiro:','','100',0,2,''),(253,'Caloteiro:','','100',0,2,''),(260,'Caloteiro:','','100',0,2,''),(276,'Caloteiro:','','100',0,2,''),(282,'Caloteiro:','','100',0,2,''),(299,'Caloteiro:','','100',0,2,''),(307,'Caloteiro:','','100',0,2,''),(313,'Caloteiro:','','100',0,2,''),(320,'Caloteiro:','','100',0,2,''),(336,'Caloteiro:','','100',0,2,''),(342,'Caloteiro:','','100',0,2,''),(359,'Caloteiro:','','100',0,2,''),(365,'Caloteiro:','','100',0,2,''),(371,'Caloteiro:','','100',0,2,''),(388,'Caloteiro:','','100',0,2,''),(2849,'Caloteiro:','','100',0,2,'');
/*!40000 ALTER TABLE `cfrt_dadosinfoplus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfrt_enderecos`
--

DROP TABLE IF EXISTS `cfrt_enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfrt_enderecos` (
  `CD_CFRT` int DEFAULT NULL,
  `TipoEnderecos_CFRT` varchar(25) DEFAULT NULL,
  `Bairro_Enderecos_CFRT` varchar(30) DEFAULT NULL,
  `CEP_Enderecos_CFRT` varchar(9) DEFAULT NULL,
  `Cidade_Enderecos_CFRT` varchar(30) DEFAULT NULL,
  `CodigoCidade_Enderecos_CFRT` int DEFAULT NULL,
  `CodigoIBGECidade_Enderecos_CFRT` int DEFAULT NULL,
  `ComplementoEndereco_Enderecos_CFRT` varchar(300) DEFAULT NULL,
  `Contato_Enderecos_CFRT` varchar(30) DEFAULT NULL,
  `DDDTelefone_Enderecos_CFRT` varchar(3) DEFAULT NULL,
  `DDDTelefone2_Enderecos_CFRT` varchar(3) DEFAULT NULL,
  `Email_Enderecos_CFRT` varchar(200) DEFAULT NULL,
  `Endereco_Enderecos_CFRT` varchar(300) DEFAULT NULL,
  `NumeroEndereco_Enderecos_CFRT` varchar(15) DEFAULT NULL,
  `Observacoes_Enderecos_CFRT` varchar(500) DEFAULT NULL,
  `Telefone_Enderecos_CFRT` varchar(14) DEFAULT NULL,
  `Telefone2_Enderecos_CFRT` varchar(14) DEFAULT NULL,
  `Transportadora_Enderecos_CFRT` varchar(50) DEFAULT NULL,
  `TransportadoraRedespacho_Enderecos_CFRT` varchar(50) DEFAULT NULL,
  `UF_Enderecos_CFRT` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfrt_enderecos`
--

LOCK TABLES `cfrt_enderecos` WRITE;
/*!40000 ALTER TABLE `cfrt_enderecos` DISABLE KEYS */;
INSERT INTO `cfrt_enderecos` VALUES (171,'padrao','República','89000-000','Blumenau',3725,4202404,'','','047','','abigailg@abigailgusmao.com.br','Av. XV de Novembro','100','','3235001','','','','SC'),(187,'faturamento','Lua','23061-520','Rio de Janeiro',6822,3304557,'lote 10','Shylon','21','','teste@oi.com.br','Rua Engenheiro Armando Carneiro Monteiro','2','','31554477','','','','RJ'),(187,'padrao','Caverna','23900-000','Arraial do Cabo',622,3300258,'Sub-solo','','021','','asbrema@amigosdamadrugada.com.br','Rua 19 de Abril','','','5506261','','','','RJ'),(193,'entrega','Entreguinha','0','Manoel Urbano',1201,1200344,'','','','','','Rua Entrega','','','','','','','AC'),(193,'faturamento','Bairro Fat','0','Capixaba',501,1200179,'','','','','','Rua Faturamento','','','','','','','AC'),(193,'padrao','Manjedoura','78900-520','Joinville',13725,4209102,'','','047','','gs@basilio.com.br','Rua 25 de Dezembro','25','','65401200','','','','SC'),(201,'padrao','Autódromo','80000-000','Blumenau',3725,4202404,'','','047','','ferrarif1@carolferrari.com.br','Rua 1º de Abril','1000','','3415689','','','','SC'),(218,'padrao','Penitenciária','36000-000','Joinville',13725,4209102,'','','047','','emergardo@emergrando.com.br','Rua 171','22','','65412356','','','','SC'),(224,'padrao','Jardim Botânico','20000-000','Joinville',13725,4209102,'','','047','','faustaozinho@faustocompras.com.br','Rua Sbt','','','56568000','','','','SC'),(231,'padrao','Quinta da Boavista','20000-000','Lages',14125,4209300,'Palácio','','047','','geoges@georgessolucoes.com.br','Rua Quinta da Boavista','','','56557009','','','','SC'),(247,'padrao','Rosário Central','999852','Buenos Aires',33001,0,'','','0','','granhermano@granhermano.com','Rua dos Muchachos','320','','89523655','','','','AR'),(253,'padrao','Boi Zebu','62350-020','Morretes',22617,4116208,'Chácara Feliz','','041','','ivao@ivomerces.com.br','Rua da Agricultura','','','5220100','','','','PR'),(260,'padrao','Duelo a dois','75000-600','Bento Gonçalves',4321,4302105,'','','051','','jucabala@jucaalmeida.com.br','Rua Tiroteio','','','7895001','','','','RS'),(276,'padrao','Acabamentos','20000-000','Petrópolis',5522,3303906,'','','021','','janapar@provedor.com.br','Rua Texturas','10','','56548004','','','','RJ'),(282,'padrao','Vala Comum','35400-000','Ouro Preto',54014,3146107,'Fundos','','031','','lalau@provedor.com.br','Rua do Sumidouro','325','','22624568','','','','MG'),(299,'padrao','Shalon','69000-000','Blumenau',3725,4202404,'Fronteira','','047','','levibill@leviseverino.com.br','Rua Faixa de Gaza','','','25605151','','','','SC'),(307,'padrao','Europa','12460-000','Blumenau',3725,4202404,'','','047','','luciaricarda@provedor.com.br','Rua Italo-germânico','','','55489002','','','','SC'),(313,'padrao','Moda','45012-600','Blumenau',3725,4202404,'','','047','','cortecerto@cortecerto.com.br','Rua Roupa Nova','2002','','55006450','','','','SC'),(320,'padrao','Mar Morto','87050-100','Caxias do Sul',9621,4305108,'fundos','','051','','profeta@provedor.com.br','Rua Adeus Egípcios','','','5648899','','','','RS'),(336,'padrao','Confeitos','87690-500','Ribeirão Preto',49026,3543402,'','','011','','bompao@padariabompao.com.br','Rua da Farinha de Trigo','250','','55462001','','','','SP'),(342,'padrao','Garcia','90064-300','Blumenau',3725,4202404,'','','047','','brinque@brinquebrincando.com.br','Rua Amazonino','159','','9985023','','','','SC'),(359,'padrao','Lagoa','86054-700','Florianópolis',8825,4205407,'','','048','','ringo@ringoconfeccoes.com.br','Av. Barra Funda','256','','3714589','','','','SC'),(365,'padrao','Coqueiros','87654-800','Florianópolis',8825,4205407,'','','048','','buhc@buchladem.com.br','Rua Mata Verde','3579','','3725648','','','','SC'),(371,'padrao','Fortaleza','98425-060','Blumenau',3725,4202404,'','','047','','valfrido@provedor.com.br','Rua Santa Matilde','241','','3269900','','','','SC'),(388,'padrao','Vila Itoupava','65480-300','Blumenau',3725,4202404,'','','047','','romena@provedor.com.br','Rua Fritz e Frida','700','','9984565','','','','SC'),(945,'padrao','Centro','98520-100','Blumenau',3725,4202404,'','','0xx','','hidalmo@acme.com.br','Rua Hermann Hering','','','65421654','','','','SC'),(951,'padrao','Enxame','74521-501','Rio de Janeiro',6822,3304557,'','','0xx','','roderson@bee.com.br','Rua Colméia','654','','654987654','','','','RJ'),(968,'padrao','Suburbanus','98547-200','Florianópolis',8825,4205407,'','','0xx','','josefa@heining.com.br','Rua Heinrich Hosang','654','','654987654','','','','SC'),(974,'padrao','Setor Industrial','22513-004','Belo Horizonte',6614,3106200,'','','0xx','','nailson@kimbalao.com.br','Rua do Pão de Queijo','6','','654875852','','','','MG'),(981,'padrao','Calçados','25122-000','Florianópolis',8825,4205407,'','','0xx','','roversao@cossanelli.com.br','Rua da Sola','125','','65487126','','','','SC'),(997,'padrao','Pau-Ferro','22143-330','Curitiba',9417,4106902,'','','0xx','','deline@kabumar.com.br','Rua da Prata','250','','654853215','','','','PR'),(1005,'padrao','Velha Central','55745-003','Blumenau',3725,4202404,'','','0xx','','quaterno@vendetudo.com.br','Rua Otto','35','','321654987','','','','SC'),(1011,'padrao','Aquarela','22235-200','Florianópolis',8825,4205407,'','','0xx','','timoteo@vivacorloucas.com.br','Rua Arco-Iris','357','','465484235','','','','SC'),(1028,'padrao','Centro','78451-000','Blumenau',3725,4202404,'','','0xx','','welintom@walmee.com.br','Rua Florida Sempre','252','','654485432','','','','SC'),(1034,'padrao','Central Park','3361','São Paulo',56526,3550308,'','','0xx','','mctomphs@waterblue.com.br','AV. Street Wear','451','','11029898','','','','SP'),(1041,'padrao','Peixes Nobres','32600-400','São Paulo',56526,3550308,'','','0xx','','garintino@xanadu.com.br','Rua Pirarucu','580','','6565478','','','','SP'),(1057,'padrao','Cuia Grande','96658-000','Porto Alegre',32621,4314902,'','','0xx','','benini@brilhointenso.com.br','Rua dos Corredores','51','','55896582','','','','RS'),(1063,'padrao','Itoupava Norte','74588-880','Blumenau',3725,4202404,'','','0xx','','loeram@criancafeliz.com.br','Rua Tuvaiapé','3548','','3265541','','','','SC'),(1070,'padrao','Rio Esquerdo','88965-450','Florianópolis',8825,4205407,'','','0xx','','jovenal@provedor.com.br','Rua Ponte Alta','1211','','2278856','','','','SC'),(1086,'padrao','Araucárias','96667-000','Curitiba',9417,4106902,'','','0xx','','arrumatudo@arrumatudo.com.br','Rua Rolabaixo','1254','','3395685','','','','PR'),(1092,'padrao','Bom Retiro','99745-633','Blumenau',3725,4202404,'','','0xx','','jones@indianaadventure.com.br','Rua Vaideleve','500','','6652214','','','','SC'),(1101,'padrao','Industrial','85416-226','Florianópolis',8825,4205407,'','','0xx','','eca@eletricascatarinense.com.br','Rua Tira Dentes','1200','','7526300','','','','SC'),(1117,'padrao','Paraíso','89050-210','Blumenau',3725,4202404,'','','0xx','','agualimpa@agualimpablumenau.gov.br','Rua Fonte Pura','2653','','5602150','','','','SC'),(1123,'padrao','Centro','89040-120','Blumenau',3725,4202404,'','','0xx','','comunica@comunicabem.gov.br','Rua Gov. Celso Ramos','810','','5910001','','','','SC'),(1130,'padrao','Centro','90045-160','Blumenau',3725,4202404,'','','0xx','','casalimpa@casalimpatudo.com.br','Rua Brilhantina','325','','5808005','','','','SC'),(1146,'padrao','Centro','96300-520','Blumenau',3725,4202404,'','','0xx','','segurancaforte@segurancaforte.com.br','Rua da Paz','852','','4962001','','','','SC'),(1465,'padrao','Centro','89036-524','Porto Alegre',32621,4314902,'','','0xx','','andrada@felintoandrada.com.br','Rua Elvis','100','','85402121','','','','RS'),(1471,'padrao','Venda Certa','87562-315','Florianópolis',8825,4205407,'','','0xx','','julio@meteoro.com.br','Av. dos Vendedores','1000','','3485252','','','','SC'),(1488,'padrao','Tocantins','45698-521','Blumenau',3725,4202404,'','','0xx','','roverson@badalim.com.br','Rua Amazonas','','','3231155','','','','SC'),(1494,'padrao','Leste','25908-986','Rio de Janeiro',6822,3304557,'','','0xx','','josias@repsao.com.br','Rua Rosa dos Ventos','64','','45006699','','','','RJ'),(1502,'padrao','Fubá','22265-897','São Paulo',56526,3550308,'','','0xx','','teobaldo@provedor.com.br','Rua da Polenta','258','','52558877','','','','SP'),(1525,'padrao','Chegada','98550-600','Blumenau',3725,4202404,'','','0xx','','gervasio@levalogo.com.br','Rodovia BR-101 - Km 109283001','1','','3345688','','','','SC'),(1531,'padrao','Peixada','25412-800','Curitiba',9417,4106902,'','','0xx','','carlao@boacaraga.com.br','Rua Boto Cor-de-rosa','369','','55669898','','','','PR'),(1548,'padrao','Entregas','32069-690','Blumenau',3725,4202404,'','','0xx','','flizberto@ligeirinho.com.br','Rua das Transportadoras','1258','','3295001','','','','SC'),(2849,'padrao','Centro','69850-010','Águas Mornas',825,4200606,'','','48','','brinque@brinquebrincando.com.br','Av. 7 de Setembro','254','','3736-5444','','','','SC'),(2855,'padrao','Centro','90062-430','Blumenau',3725,4202404,'','','0xx','','arrumatudo@arrumatudo.com.br','Av. Senador da Paz','900','','3962001','','','','SC'),(2884,'padrao','','89051-000','Blumenau',3725,4202404,'','','47','','','Rua da Floresta Branca','445','','33318500','','','','SC'),(2909,'padrao','','06460-030','Barueri',6526,3505708,'','','','','','Av Piracema','1411','','','','','','SP'),(2921,'padrao','','0','Porto Alegre',32621,4314902,'','','','','','Rua General João Manoel','90','','','','','','RS'),(2944,'padrao','Céu Azul','76893-000','Porto Alegre',32621,4314902,'','','','','','Rua dos marinheiros','240','','','','','','RS'),(2951,'padrao','Bel Air','99999999','Los Angeles',33003,9999999,'','Geroges','','','globaldelta@global.com',' Rua Bel Air New','321','','','','','','CA');
/*!40000 ALTER TABLE `cfrt_enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfrt_representantes`
--

DROP TABLE IF EXISTS `cfrt_representantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfrt_representantes` (
  `CD_CFRT` int DEFAULT NULL,
  `CPF_CNPJ_Representantes_CFRT` varchar(18) DEFAULT NULL,
  `Codigo_Representantes_CFRT` varchar(10) DEFAULT NULL,
  `CodigoTabelaPrecoProduto_Representantes_CFRT` varchar(10) DEFAULT NULL,
  `CodigoTabelaPrecoServico_Representantes_CFRT` varchar(10) DEFAULT NULL,
  `Nome_Representantes_CFRT` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfrt_representantes`
--

LOCK TABLES `cfrt_representantes` WRITE;
/*!40000 ALTER TABLE `cfrt_representantes` DISABLE KEYS */;
INSERT INTO `cfrt_representantes` VALUES (171,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(187,'02.160.688/4423-83','1494','','','Representações Comerciais São Lucas Ltda.'),(193,'88.308.062/8198-30','1488','','','Representações Comerciais Badalim'),(201,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(218,'88.308.062/8198-30','1488','','','Representações Comerciais Badalim'),(224,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(231,'88.308.062/8198-30','1488','','','Representações Comerciais Badalim'),(247,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(253,'88.308.062/8198-30','1488','','','Representações Comerciais Badalim'),(260,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(276,'02.160.688/4423-83','1494','','','Representações Comerciais São Lucas Ltda.'),(282,'654.215.650-09','1502','','','Teobaldo Ronconi Pindarotti'),(313,'88.308.062/8198-30','1488','','','Representações Comerciais Badalim'),(320,'93.670.719/6226-26','1465','','','Felinto Andrada Representações Comerciais Ltda.'),(336,'654.215.650-09','1502','','','Teobaldo Ronconi Pindarotti'),(342,'88.308.062/8198-30','1488','','','Representações Comerciais Badalim'),(359,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(365,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(2849,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(2855,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(2884,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(2909,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(2921,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(2944,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro'),(2951,'09.594.519/7958-05','1471','','','Julio Cesar Meteoro');
/*!40000 ALTER TABLE `cfrt_representantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfrt_tipocobranca`
--

DROP TABLE IF EXISTS `cfrt_tipocobranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfrt_tipocobranca` (
  `CD_CFRT` int DEFAULT NULL,
  `Codigo_TipoCobranca_CFRT` int DEFAULT NULL,
  `Descricao_TipoCobranca_CFRT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfrt_tipocobranca`
--

LOCK TABLES `cfrt_tipocobranca` WRITE;
/*!40000 ALTER TABLE `cfrt_tipocobranca` DISABLE KEYS */;
INSERT INTO `cfrt_tipocobranca` VALUES (171,4,'Cartório'),(187,2,'Carteira');
/*!40000 ALTER TABLE `cfrt_tipocobranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfrt_vendedores`
--

DROP TABLE IF EXISTS `cfrt_vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfrt_vendedores` (
  `CD_CFRT` int DEFAULT NULL,
  `Codigo_Vendedores_CFRT` int DEFAULT NULL,
  `EMail_Vendedores_CFRT` varchar(200) DEFAULT NULL,
  `Inativo_Vendedores_CFRT` tinyint(1) NOT NULL DEFAULT '0',
  `Nome_Vendedores_CFRT` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfrt_vendedores`
--

LOCK TABLES `cfrt_vendedores` WRITE;
/*!40000 ALTER TABLE `cfrt_vendedores` DISABLE KEYS */;
INSERT INTO `cfrt_vendedores` VALUES (187,3,'',0,'Nozileide Ferrari Kabum');
/*!40000 ALTER TABLE `cfrt_vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `nivel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'star_dev'
--

--
-- Dumping routines for database 'star_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-19 11:20:12
