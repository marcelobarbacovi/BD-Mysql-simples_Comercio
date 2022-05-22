-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: how5
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `ID_Cargo` int(4) NOT NULL,
  `Nome_cargo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--
-- ORDER BY:  `ID_Cargo`

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (0,'Coordenador'),(1,'SUpervisor'),(2,'Vendedor'),(3,'Auxiliar de Faturamento'),(4,'Comprador'),(6,'Assistente Contas a Receber'),(7,'Assistente Contábil');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `ID_Cidade` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Cidade` varchar(30) DEFAULT NULL,
  `ID_Estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Cidade`),
  KEY `FK_Cidade_estado` (`ID_Estado`),
  CONSTRAINT `FK_Cidade_estado` FOREIGN KEY (`ID_Estado`) REFERENCES `estado` (`ID_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--
-- ORDER BY:  `ID_Cidade`

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Florianópolis',5),(2,'Palhoca',5),(3,'São José',5),(4,'Biguacu',5),(5,'Itajaí',5),(6,'Itajaí',5),(7,'São Paulo',1),(8,'Barueri',1),(9,'Rio de Janeiro',2),(10,'Duque de Caxias',2),(11,'Porto ALegre',3),(12,'Caxias',3),(13,'Curitiba',6),(14,'Arapongas',6);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Cliente` varchar(50) DEFAULT NULL,
  `CPF_Cliente` varchar(14) NOT NULL,
  `ID_Endereco` int(11) DEFAULT NULL,
  `DtNascimento_cliente` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--
-- ORDER BY:  `ID_Cliente`

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'FAbricio Constante Catro','09965687561',1,'07121998'),(2,'Ciro Gomes','09965687561',2,'10031968'),(3,'Jailson Ferreira','00223579922',1,'15/12/19'),(4,'Rosangela silva','09999999999',5,'10011970'),(5,'Luiz Machado','09965687744',4,'11712255'),(7,'lucas','09965642766',5,'09071999');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `ID_compra` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Fornecedor` int(11) DEFAULT NULL,
  `NF_Compra` int(11) DEFAULT NULL,
  `Total_Comrpa` decimal(10,0) DEFAULT NULL,
  `DT_Compra` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_compra`),
  KEY `FK_Compras_Fornecedor` (`ID_Fornecedor`),
  CONSTRAINT `FK_Compras_Fornecedor` FOREIGN KEY (`ID_Fornecedor`) REFERENCES `fornecedor` (`ID_Fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--
-- ORDER BY:  `ID_compra`

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `ID_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `Rua` varchar(100) DEFAULT NULL,
  `Numero` int(8) DEFAULT NULL,
  `Cidade` int(11) DEFAULT NULL,
  `Cep` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID_Endereco`),
  KEY `FK_Endereco_Cidade` (`Cidade`),
  CONSTRAINT `FK_Endereco_Cidade` FOREIGN KEY (`Cidade`) REFERENCES `cidade` (`ID_Cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--
-- ORDER BY:  `ID_Endereco`

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Beira mar',56,1,'88119130'),(2,'Rio Branco',4456,1,'88119540'),(3,'Dibi Mussi',1487,1,'88119558'),(4,'VAldemar Vieira',1487,12,'88125958'),(5,'Deodoro freire',220,5,'88132958'),(6,'Deodoro freire',420,5,'88132958');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `ID_Estado` int(11) NOT NULL AUTO_INCREMENT,
  `UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--
-- ORDER BY:  `ID_Estado`

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'SP'),(2,'RJ'),(3,'RS'),(5,'SC'),(6,'PR'),(7,'MG');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `ID_Produto` int(11) DEFAULT NULL,
  `Qtd_Produto` decimal(4,2) DEFAULT NULL,
  `Custo_Produto` decimal(6,2) DEFAULT NULL,
  KEY `FK_Id_Produto` (`ID_Produto`),
  CONSTRAINT `FK_Id_Produto` FOREIGN KEY (`ID_Produto`) REFERENCES `produto` (`ID_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `ID_Fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `RazaoSocial` varchar(50) DEFAULT NULL,
  `CNPJ_Fornecedor` varchar(14) NOT NULL,
  `ID_Endereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--
-- ORDER BY:  `ID_Fornecedor`

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_compra`
--

DROP TABLE IF EXISTS `item_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_compra` (
  `ID_Compra` int(11) DEFAULT NULL,
  `ID_Produto` int(11) DEFAULT NULL,
  `Qtd_compra` decimal(4,2) DEFAULT NULL,
  `Preco_Compra` decimal(10,0) DEFAULT NULL,
  KEY `FK_Item_Compra` (`ID_Compra`),
  KEY `FK_Item_Produto` (`ID_Produto`),
  CONSTRAINT `FK_Item_Compra` FOREIGN KEY (`ID_Compra`) REFERENCES `compra` (`ID_compra`),
  CONSTRAINT `FK_Item_Produto` FOREIGN KEY (`ID_Produto`) REFERENCES `produto` (`ID_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_compra`
--

LOCK TABLES `item_compra` WRITE;
/*!40000 ALTER TABLE `item_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_venda` (
  `ID_venda` int(11) DEFAULT NULL,
  `Id_Produto` int(11) DEFAULT NULL,
  `Qtd_Venda` decimal(4,2) DEFAULT NULL,
  `Vlr_venda` decimal(6,4) DEFAULT NULL,
  KEY `FK_Item_Venda` (`ID_venda`),
  CONSTRAINT `FK_Item_Venda` FOREIGN KEY (`ID_venda`) REFERENCES `venda` (`ID_Venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `ID_Produto` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_produto` varchar(30) DEFAULT NULL,
  `Vlr_produto` decimal(6,2) DEFAULT NULL,
  `DtInclusao_Produto` varchar(8) DEFAULT NULL,
  `Status_Produto` tinyint(1) DEFAULT NULL,
  `ID_User` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Produto`),
  KEY `FK_produto_User` (`ID_User`),
  CONSTRAINT `FK_produto_User` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID_User`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--
-- ORDER BY:  `ID_Produto`

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Furadenrai-Parafusadeira 1.6 V',540.99,'24042022',1,5),(2,'Serra Circular 700W',435.23,'24042022',1,6),(3,'Serra Tico-Tico',249.99,'27042022',1,6),(4,'Alicate Bico chato N 6',12.99,'24042022',1,6),(5,'Martelo Pedreiro 27',15.99,'24042022',1,6),(6,'Martelo Pedreiro 26',14.99,'24042022',1,6),(7,'Martelo Pedreiro 25',14.50,'24042022',1,6),(8,'Enxada c/ Cabo 14',19.99,'24042022',1,6),(9,'Broca Irwin 8',10.99,'24042022',1,6),(10,'Broca Irwin 10',11.99,'24042022',1,6),(11,'Broca Irwin 8',9.99,'24042022',1,6);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID_User` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_User` varchar(100) DEFAULT NULL,
  `Cpf_User` varchar(14) NOT NULL,
  `Dt_nascimento_user` varchar(10) DEFAULT NULL,
  `Cargo_User` int(4) DEFAULT NULL,
  `Login_user` varchar(50) DEFAULT NULL,
  `Senha_user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_User`),
  KEY `Cargo_User` (`Cargo_User`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Cargo_User`) REFERENCES `cargo` (`ID_Cargo`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`Cargo_User`) REFERENCES `cargo` (`ID_Cargo`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`Cargo_User`) REFERENCES `cargo` (`ID_Cargo`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`Cargo_User`) REFERENCES `cargo` (`ID_Cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--
-- ORDER BY:  `ID_User`

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'Camila Paixao Marinho','09965645561','12101997',2,'camila.paixao','paixao10'),(4,'Miguel','01522236699','06072015',4,'miguel','TIKTOK'),(5,'Daiana Loureiro','99999999999','19041991',3,'daiana.loureiro','Greenday@182'),(6,'Marcos Pereira','12345678900','27091985',3,'marcos.pereira','marcos123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `ID_Venda` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int(11) DEFAULT NULL,
  `NF` int(11) DEFAULT NULL,
  `DT_Venda` varchar(10) DEFAULT NULL,
  `Total_Venda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Venda`),
  KEY `FK_Venda_Cliente` (`ID_Cliente`),
  CONSTRAINT `FK_Venda_Cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--
-- ORDER BY:  `ID_Venda`

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (3,1,1,'2022-05-19',11.99),(4,3,2,'2022-05-19',30.98),(5,4,3,'2022-05-19',540.99);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `how5`.`venda_BEFORE_INSERT` BEFORE INSERT ON `venda` FOR EACH ROW
BEGIN
SET NEW.DT_Venda = NOW(); 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'how5'
--

--
-- Dumping routines for database 'how5'
--
/*!50003 DROP PROCEDURE IF EXISTS `cadastroCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastroCliente`(Nome varchar (50) , cpf varchar (11), 
id int, nascimento varchar(9)
)
main: BEGIN
if(	Nome = "") then
Select ' Nome precisa ser preenchido' as msg, 'Erro cadastro' as msg;
leave main;
 end if;
 if( length(cpf)<11 ) then
Select ' CPF Invalido' as msg, 'Precisa ter minimo 11  numeros' as msg;
leave main;
end if;
 
 insert INTO cliente (Nome_cliente, CPF_cliente, ID_Endereco, DtNAscimento_Cliente) 
values (Nome, cpf, id, nascimento); 


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-22 19:32:51
