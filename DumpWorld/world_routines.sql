CREATE DATABASE  IF NOT EXISTS `world` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `world`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: world
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Dumping events for database 'world'
--

--
-- Dumping routines for database 'world'
--
/*!50003 DROP PROCEDURE IF EXISTS `cityChanger1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cityChanger1`(staroIme char(35),novoIme char(35),distrikt char(20),populacija char(25))
begin
	declare trenutnaPopulacija int;
	declare novaPopulacija int;
    
	declare trenutniGrad char(35);
	declare noviGrad char(35);
    
	declare trenutniDistrikt char(35);
	declare noviDistrikt char(35);
	
   
set trenutnaPopulacija = (select Population from city where name = staroIme);
	if(populacija = 0) then set novaPopulacija = trenutnaPopulacija;
else
    set novaPopulacija = (select cast(populacija as unsigned integer) as k);
end if;
    
set trenutniDistrikt = (select District from city where name = staroIme);
set noviDistrikt = distrikt;
	if(distrikt = null or distrikt = '') then set noviDistrikt = trenutniDistrikt;
    end if;
    
set trenutniGrad = (select name from city where name = staroIme);
set noviGrad = novoIme;
	if (novoIme = null OR novoIme = '') then set noviGrad = trenutniGrad;
    end if;
    
			UPDATE city 
			SET 
				name = noviGrad,
				District = noviDistrikt,
				Population = novaPopulacija
			WHERE 
				 name = staroIme;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cityChanger2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cityChanger2`(staroIme char(35),novoIme char(35),distrikt char(20),populacija char(25))
begin
	declare trenutnaPopulacija int;
	declare novaPopulacija int;
    
	declare trenutniGrad char(35);
	declare noviGrad char(35);
    
	declare trenutniDistrikt char(35);
	declare noviDistrikt char(35);
	
   
set trenutnaPopulacija = (select Population from city where name = staroIme);
	if(populacija = 0) then set novaPopulacija = trenutnaPopulacija;
else
    set novaPopulacija = (select cast(trim(populacija) as unsigned integer));
end if;
    
set trenutniDistrikt = (select District from city where name = staroIme);
set noviDistrikt = distrikt;
	if(distrikt = null or distrikt = '') then set noviDistrikt = trenutniDistrikt;
    end if;
    
set trenutniGrad = (select name from city where name = staroIme);
set noviGrad = novoIme;
	if (novoIme = null OR novoIme = '') then set noviGrad = trenutniGrad;
    end if;
    
			UPDATE city 
			SET 
				name = noviGrad,
				District = noviDistrikt,
				Population = novaPopulacija
			WHERE 
				 name = staroIme;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `izmeniJezik` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `izmeniJezik`(kantriKod char(3),stariJezik char(30),noviJezik char(30),oficijalnost char(5),procenat char(6))
begin
	declare pomProcenat float(4,1);
	declare pomOfic char(5);
    set pomOfic = (select IsOfficial from countrylanguage WHERE CountryCode = kantriKod AND Language = stariJezik);
    set pomProcenat = (select Percentage from countrylanguage WHERE CountryCode = kantriKod AND Language = stariJezik);
    
	if(noviJezik = '') then set noviJezik = stariJezik;
    end if;
    
    if(oficijalnost = '') then set oficijalnost = pomOfic;
    end if;
    
    if(procenat = '') then set procenat = pomProcenat;
    else
    set procenat = (select cast(procenat as decimal(4,1)));
    end if;
			UPDATE countrylanguage
            SET
				Language = noviJezik,
				IsOfficial = oficijalnost,
				Percentage = procenat
            WHERE 
				Language = stariJezik
                AND
                CountryCode = kantriKod;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jezikUnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jezikUnos`(kantriKod char(3),jezik char(30),oficijalni char(20),procenat char(25))
begin
	if(procenat = '') 
		then set procenat = '0';
	else
		set procenat = (select cast(procenat as decimal(5,2)));
    end if;
    
	if (oficijalni = '') 
		then set oficijalni = 'F';
    end if;
			INSERT into countrylanguage 
			(CountryCode,Language,IsOfficial,Percentage)
            values
            (kantriKod,jezik,oficijalni,procenat);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `promeniDrzavu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `promeniDrzavu`(
							Kod char(3),ime char(52),kontinent char(12),region char(26),povrsina char(10),
							godinaDrzavnosti char(6),populacija char(11),provek char(4),
                            BDP char(10),BDPprethodni  char(10),lokalniNaziv char(45),drzavnoUredjenje char(45),
							predsednik char(60),prestonica char(11),kod2 char(2)
                            )
begin
declare pomIme char(52);
declare pomKontinent char(12);
declare pomRegion char(26);
declare pomPovrsina float(10,2);
declare pomGodinaDrzavnosti smallint(6);
declare pomPopulacija int;
declare pomProvek float(3,1);
declare pomBDP float(10,2);
declare pomBDPprethodni float(10,2);
declare pomLokalniNaziv char(45);
declare pomDrzavnoUredjenje char(45);
declare pomPredsednik char(60);
declare pomPrestonica int;
declare pomKod2 char(2);

set pomIme = (select name from country where Code = kod);
if(ime = '') then set ime = pomIme;
end if;

set pomKontinent = (select Continent from country where Code = kod);
if(kontinent = '') then set kontinent = pomKontinent;
end if;

set pomRegion = (select Region from country where Code = kod);
if(region = '') then set region = pomRegion;
end if;

set pomPovrsina = (select SurfaceArea from country where Code = kod);
if(povrsina = '') then set povrsina = pomPovrsina;
else 
set povrsina = (select cast(povrsina as decimal(10,2)));
end if;

set pomGodinaDrzavnosti = (select IndepYear from country where Code = kod);
if(godinaDrzavnosti = '') then set godinaDrzavnosti = pomGodinaDrzavnosti;
else 
set godinaDrzavnosti = (select cast(godinaDrzavnosti as unsigned integer));
end if;

set pomPopulacija = (select Population from country where Code = kod);
if(populacija = '') then set populacija = pomPopulacija;
else 
set populacija = (select cast(populacija as unsigned integer));
end if;

set pomProvek = (select LifeExpectancy from country where Code = kod);
if(provek = '') then set provek = pomProvek;
else 
set provek = (select cast(provek as decimal(3,1)));
end if;

set pomBDP = (select GNP from country where Code = kod);
if(BDP = '') then set BDP = pomBDP;
else 
set BDP = (select cast(BDP as decimal(10,2)));
end if;

set pomBDPprethodni = (select GNPOld from country where Code = kod);
if(BDPprethodni = '') then set BDPprethodni = pomBDPprethodni;
else 
set BDPprethodni = (select cast(BDPprethodni as decimal(10,2)));
end if;

set pomLokalniNaziv = (select LocalName from country where Code = kod);
if(lokalniNaziv = '') then set lokalniNaziv = pomLokalniNaziv;
end if;

set pomDrzavnoUredjenje = (select GovernmentForm from country where Code = kod);
if(drzavnoUredjenje = '') then set drzavnoUredjenje = pomDrzavnoUredjenje;
end if;

set pomPredsednik = (select HeadOfState from country where Code = kod);
if(predsednik = '') then set predsednik = pomPredsednik;
end if;

set pomPrestonica = (select Capital from country where Code = kod);
if(prestonica = '') then set prestonica = pomPrestonica;
else 
set prestonica = (select cast(prestonica as unsigned integer));
end if;

set pomKod2 = (select Code2 from country where Code = kod);
if(kod2 = '') then set kod2 = pomKod2;
end if;

    UPDATE country
    SET
		`Name`= ime,
		`Continent`= kontinent,
		`Region`= region,
		`SurfaceArea`= povrsina,
		`IndepYear`= godinaDrzavnosti,
		`Population`= populacija,
		`LifeExpectancy`= provek,
		`GNP`= BDP,
		`GNPOld`= BDPprethodni,
		`LocalName`= lokalniNaziv,
		`GovernmentForm`= drzavnoUredjenje,
		`HeadOfState`= predsednik,
		`Capital`= prestonica,
		`Code2`= kod2
		WHERE code = kod;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert`(naziv char(35),kantriKod char(3),distrikt char(20),populacija int)
begin
	declare broj int;
    select count(name) from city where name=naziv into broj;
	if broj <1 then
	insert INTO city(name,countryCode,District,population)values(naziv,kantriKod,distrikt,populacija);
		select '1';
    else 
		select '0';
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUpdate`(naziv char(35),kantriKod char(3),distrikt char(20),populacija int)
begin
	declare broj int;
    select count(name) from city where name=naziv into broj;
	if broj <1 then
	insert INTO city(name,countryCode,District,population)values(naziv,kantriKod,distrikt,populacija);
		else 
	UPDATE city
		SET CountryCode=kantriKod,
			District=distrikt,
			Population=populacija
			WHERE Name=naziv;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_city`(naziv char(35),kantriKod char(3),distrikt char(20),populacija int)
begin
	insert INTO city(name,countryCode,District,population)values(naziv,kantriKod,distrikt,populacija);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_select_Continent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_Continent`(nazivKontinenta char(35))
begin
	select name from country where Continent = nazivKontinenta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unesiDrzavu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unesiDrzavu`(
							Kod char(3),ime char(52),kontinent char(12),region char(26),povrsina char(10),
							godinaDrzavnosti char(6),populacija char(11),provek char(3),
                            BDP char(10),BDPprethodni  char(10),lokalniNaziv char(45),drzavnoUredjenje char(45),
							predsednik char(60),prestonica char(11),kod2 char(2)
                            )
begin
if(prestonica = '') then set prestonica = null;
else
set prestonica = (select cast(prestonica as unsigned integer));
end if;


if(provek = '') then set provek = null;
else
set provek = (select cast(provek as decimal(3,1)));
end if;

if(BDP = '') then set BDP = null;
else
set BDP = (select cast(BDP as decimal(10,2)));
end if;

if(BDPprethodni = '') then set BDPprethodni = null;
else
set BDPprethodni = (select cast(BDPprethodni as decimal(10,2)));
end if;


if(godinaDrzavnosti = '') then set godinaDrzavnosti = null;
else
set godinaDrzavnosti = (select cast(godinaDrzavnosti as unsigned integer));
end if;
	if(kontinent = '') then set kontinent = 'Asia';
    end if;
	if(povrsina = '') then set povrsina = '0';
    else
    set povrsina = (select cast(povrsina as decimal(10,2)));
	end if;
    if(populacija = '') then set populacija = '0';
    else
    set populacija = (select cast(populacija as unsigned integer));
	end if;
    
	INSERT into country
    (
    Code, Name, Continent, Region, SurfaceArea,
	IndepYear, Population, `LifeExpectancy`,
	GNP, GNPOld, LocalName, GovernmentForm,
	HeadOfState, Capital, Code2
    )
	values
	(
    Kod,ime,kontinent,region,povrsina,
	godinaDrzavnosti,populacija,provek,
	BDP,BDPprethodni,lokalniNaziv,drzavnoUredjenje,
	predsednik,prestonica,kod2
    );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unesiDrzavu1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unesiDrzavu1`(
							Kod char(3),ime char(52),kontinent char(12),region char(26),povrsina char(10),
							godinaDrzavnosti char(6),populacija char(11),provek char(4),
                            BDP char(10),BDPprethodni  char(10),lokalniNaziv char(45),drzavnoUredjenje char(45),
							predsednik char(60),prestonica char(11),kod2 char(2)
                            )
begin
if(prestonica = '') then set prestonica = null;
else
set prestonica = (select cast(prestonica as unsigned integer));
end if;

if(provek = '') then set provek = null;
else
set provek = (select cast(provek as decimal(3,1)));
end if;

if(BDP = '') then set BDP = null;
else
set BDP = (select cast(BDP as decimal(10,2)));
end if;

if(BDPprethodni = '') then set BDPprethodni = null;
else
set BDPprethodni = (select cast(BDPprethodni as decimal(10,2)));
end if;


if(godinaDrzavnosti = '') then set godinaDrzavnosti = null;
else
set godinaDrzavnosti = (select cast(godinaDrzavnosti as unsigned integer));
end if;

	if(kontinent = '') then set kontinent = 'Asia';
    end if;
    
	if(povrsina = '') then set povrsina = '0';
    else
    set povrsina = (select cast(povrsina as decimal(10,2)));
	end if;
    
    if(populacija = '') then set populacija = '0';
    else
    set populacija = (select cast(populacija as unsigned integer));
	end if;
    
	INSERT into country
    (
    `Code`, `Name`, `Continent`, `Region`, `SurfaceArea`,
	`IndepYear`, `Population`, `LifeExpectancy`,
	`GNP`, `GNPOld`, `LocalName`, `GovernmentForm`,
	`HeadOfState`, `Capital`, `Code2`
    )
	values
	(
    Kod,ime,kontinent,region,povrsina,
	godinaDrzavnosti,populacija,provek,
	BDP,BDPprethodni,lokalniNaziv,drzavnoUredjenje,
	predsednik,prestonica,kod2
    );
end ;;
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

-- Dump completed on 2016-02-24 20:27:29
