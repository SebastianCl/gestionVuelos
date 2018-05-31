CREATE DATABASE CONTROLVUELO
GO
USE CONTROLVUELO
GO

/******* ------------------------------ CREACION DE TABLAS ------------------------------ *******/
CREATE TABLE tblAEROPUERTO
(CODIGO VARCHAR(10) PRIMARY KEY,
NOMBRE VARCHAR(100),
CIUDAD VARCHAR(100),
PAIS VARCHAR(100),
ID_RESPONSABLE VARCHAR(10),
ESTADO VARCHAR(50))

CREATE TABLE tblLINEA_AEREA
(CODIGO VARCHAR(10) PRIMARY KEY,
NOMBRE VARCHAR(100),
PAIS VARCHAR(100))

CREATE TABLE tblPILOTO
(ID VARCHAR(10) PRIMARY KEY,
NOMBRE VARCHAR(100),
DIRECCION VARCHAR(100),
CIUDAD_RESIDENCIA VARCHAR(100),
CODIGO_LINEA VARCHAR(10),
COD_USUARIO INT,
TELEFONO VARCHAR(20))

CREATE TABLE tblAVION
(CODIGO VARCHAR(10) PRIMARY KEY,
MODELO VARCHAR(50),
CAPACIDAD INT,
CODIGO_LINEA VARCHAR(10))

CREATE TABLE tblVUELO
(CODIGO VARCHAR(10) PRIMARY KEY,
FECHA_PARTIDA smalldatetime,
FECHA_LLEGADA smalldatetime,
PLAZAS_VACIAS INT,
IDPILOTO VARCHAR(10),
COD_AVION VARCHAR(10))

CREATE TABLE tblPROGRAMA_VUELO
(CODIGO VARCHAR(10) PRIMARY KEY,
CODIGO_VUELO VARCHAR(10),
CODIGO_LINEA VARCHAR(10),
CODIGO_ESCALATECNICA VARCHAR(10),
AEROPUERTO_PARTIDA VARCHAR(10),
AEROPUERTO_DESTINO VARCHAR(10))

CREATE TABLE tblESCALA_TECNICA
(CODIGO VARCHAR(10) PRIMARY KEY,
COD_AEROPUERTO VARCHAR(10))

CREATE TABLE tblLINEA_AEROPUERTO
(CODIGO_AEROPUERTO VARCHAR(10),
CODIGO_LINEA VARCHAR(10),
PRIMARY KEY (CODIGO_AEROPUERTO, CODIGO_LINEA))

CREATE TABLE tblUSUARIO (
CODIGO_USUARIO INT IDENTITY PRIMARY KEY,
NOMBRE_USUARIO VARCHAR(100),
CLAVE_USUARIO VARCHAR  (100),
ROL_USUARIO VARCHAR(5)
)

CREATE TABLE tblPERSONA
(ID VARCHAR(10) PRIMARY KEY,
NOMBRE VARCHAR(50),
CIUDAD VARCHAR(50),
COD_USUARIO INT)


GO

/******* ------------------------------ RELACION DE LAS TABLAS  ------------------------------ *******/
ALTER TABLE tblAEROPUERTO ADD FOREIGN KEY (ID_RESPONSABLE) REFERENCES tblPERSONA(ID)
ALTER TABLE tblPERSONA ADD FOREIGN KEY (COD_USUARIO) REFERENCES tblUSUARIO(CODIGO_USUARIO)
ALTER TABLE tblPILOTO ADD FOREIGN KEY (COD_USUARIO) REFERENCES tblUSUARIO(CODIGO_USUARIO)
ALTER TABLE tblPILOTO ADD FOREIGN KEY (CODIGO_LINEA) REFERENCES tblLINEA_AEREA(CODIGO)
ALTER TABLE tblVUELO ADD FOREIGN KEY (IDPILOTO) REFERENCES tblPILOTO(ID)
ALTER TABLE tblVUELO ADD FOREIGN KEY (COD_AVION) REFERENCES tblAVION(CODIGO)
ALTER TABLE tblAVION ADD FOREIGN KEY (CODIGO_LINEA) REFERENCES tblLINEA_AEREA(CODIGO)
ALTER TABLE tblLINEA_AEROPUERTO ADD FOREIGN KEY (CODIGO_AEROPUERTO) REFERENCES tblAEROPUERTO(CODIGO)
ALTER TABLE tblLINEA_AEROPUERTO ADD FOREIGN KEY (CODIGO_LINEA) REFERENCES tblLINEA_AEREA(CODIGO)
ALTER TABLE tblESCALA_TECNICA ADD FOREIGN KEY (COD_AEROPUERTO) REFERENCES tblAEROPUERTO(CODIGO)
ALTER TABLE tblPROGRAMA_VUELO ADD FOREIGN KEY (CODIGO_VUELO) REFERENCES tblVUELO(CODIGO)
ALTER TABLE tblPROGRAMA_VUELO ADD FOREIGN KEY (CODIGO_LINEA) REFERENCES tblLINEA_AEREA(CODIGO)
ALTER TABLE tblPROGRAMA_VUELO ADD FOREIGN KEY (CODIGO_ESCALATECNICA) REFERENCES tblESCALA_TECNICA(CODIGO)
ALTER TABLE tblPROGRAMA_VUELO ADD FOREIGN KEY (AEROPUERTO_PARTIDA) REFERENCES tblAEROPUERTO(CODIGO)
ALTER TABLE tblPROGRAMA_VUELO ADD FOREIGN KEY (AEROPUERTO_DESTINO) REFERENCES tblAEROPUERTO(CODIGO)
GO


----- INSERCION DATOS -----

----- USUARIO -----
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Dieter','ZPN84SFG6QD','A'),('Quinlan','BGK80MVJ6GY','P'),('Clio','WLS03TIP7OI','P'),('Channing','GAS78UNR7PV','P'),('Justin','CRS88FVK6VY','A'),('Ramona','MJP98EHF6XN','R'),('Blossom','PBT69CFZ4PA','P'),('Moana','IXH17IZA0GY','U'),('Kieran','SCB02SEN8CK','A'),('Yoshio','IXF82VAK1XL','A');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Bert','AOO18QLJ3QB','A'),('Basil','CFG95SSW3KP','P'),('Brenden','IDC08TPB2ZN','U'),('Amery','ZMF16WWO3NC','P'),('Kasper','ONF77GNK5GD','U'),('Chloe','LGB65EUS9YP','P'),('Wyatt','BCE52RQV0HY','U'),('Irene','KKR73UAG5DI','R'),('Victor','UXK58TMS5DG','A'),('Amelia','FTV99HOZ9RP','A');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Todd','THG65KCO4PC','P'),('Vernon','JQX23ZJU6EU','U'),('April','HHR09NRL4LN','P'),('Jameson','DNU57CRK2VK','P'),('Avram','CEA55OPD7RU','U'),('Aimee','CHS90YPE0BO','A'),('Logan','XLT76HRC3GH','R'),('Sopoline','DII93JEN7PE','A'),('Dolan','KVW77LEU7HA','P'),('Bianca','JML70POR2TT','U');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Quinlan','WDO07CQC5VS','A'),('Holmes','PNY89SHV4XM','A'),('Kieran','RBQ50VVB5QR','U'),('Colleen','BUI46KNA1UM','P'),('Uriel','IUX61HGK6IP','R'),('Althea','BUC41FIF1DA','P'),('Blaze','VNV94TJR6LW','R'),('Russell','FFT16GFJ2LY','A'),('Hamilton','HPK07NVP8HV','R'),('Francis','WLF52CIQ9DP','R');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Trevor','NSY80ZYJ5CV','A'),('Denise','ZQQ77HWA2ZB','R'),('Iola','LWJ07RTH6MZ','R'),('Quon','IPR66MNC7XZ','R'),('Carla','QMQ86RPX2VN','A'),('Yael','CUQ19HTT3XO','A'),('Dane','YPX44VRJ4UX','A'),('Richard','BHG43YNQ6JO','A'),('Jakeem','IJL67DUC5CH','U'),('Zeph','ASX85RCU1XM','U');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Quail','UAB02GCO0WV','A'),('Ria','PKF62HUW2EE','A'),('Dane','ZJU73RBQ2PZ','U'),('Zena','JWJ91INK7RM','A'),('Robert','KTF68HHR7IB','U'),('Gregory','LPJ89UIE7EM','P'),('Uta','WEE75JAK5ZK','A'),('Maia','BVD93OTL2CM','P'),('Anastasia','OBM54QKX0IF','A'),('Fuller','EGJ00ERX6UU','A');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Benjamin','MCO51XLQ0CV','A'),('Cyrus','PHH75GNE7IT','U'),('Laith','ZVA35GJA3TT','R'),('Dora','BRE77NZO7ZE','A'),('Merrill','VNL03WBE6CA','P'),('Christian','CVU44RNC0HQ','R'),('Selma','GAK54XYX0GS','A'),('Otto','FDC19XRP5WE','A'),('Jessica','PPH95QGD4RJ','P'),('Sigourney','VAU91YUD5PU','U');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Keiko','UPC67ITK2PQ','R'),('Zelda','WOH77DIU7KZ','P'),('Tad','NIY07GDB5YK','U'),('Rose','LPG47JLK1TM','A'),('Shaine','FBW19FPC1WX','U'),('Palmer','AUV15KWZ4WE','P'),('Xaviera','HER20QHH4JU','U'),('Kermit','TIV21AZH8TV','R'),('Tamara','QWG02ZJE6TL','R'),('Gabriel','VPO54BKM8LI','A');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Margaret','CYJ34ULD2ZC','P'),('Nathan','VZR82LJJ6BC','A'),('Nina','VYE27OVA7VZ','R'),('Amy','FAV29PEI4JX','U'),('Sandra','ATI36FFA7IR','P'),('Ross','VER91ISZ6WC','U'),('Hedley','AAN29FGI5OB','U'),('Kimberley','NXD45QFS0JE','P'),('Davis','JDC05HXY3CZ','A'),('Georgia','NXR32CNZ7JW','U');
INSERT INTO tblUSUARIO([NOMBRE_USUARIO],[CLAVE_USUARIO],[ROL_USUARIO]) VALUES('Eagan','DKA52ICP3TV','R'),('Grady','KLL47SIV3WE','U'),('Armando','OCI27MXW4RJ','R'),('Erich','ICE43APW7AP','P'),('Idola','VWX37ODC3EH','P'),('Rafael','WMM49SUV3TH','P'),('George','OYS96RQO0EX','P'),('Jorden','OPT06AAP5FB','U'),('Diana','PNZ62IKP9GS','U'),('Isabelle','ATK98PFP0YB','A');
GO

----- PERSONA -----
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(1,'Ina Meyers','Sedgewick',1),(2,'Murphy Bruce','Penco',2),(3,'Gray Shaw','Graz',3),(4,'Jameson Clarke','Ville-en-Hesbaye',4),(5,'Fulton Lewis','Avernas-le-Bauduin',5),(6,'Xander Bush','Joué-lès-Tours',6),(7,'Yardley Anthony','Ödemiş',7),(8,'Iola Velasquez','Gondiya',8),(9,'Finn Stevens','Lissewege',9),(10,'Shafira Dillon','Bhilai',10);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(11,'Clark Mckee','Lanark County',11),(12,'Serena Eaton','Harlow',12),(13,'Clayton David','Oudekapelle',13),(14,'Grace Russell','San Diego',14),(15,'Axel Gray','Redruth',15),(16,'Tashya Cote','Palma de Mallorca',16),(17,'Wade Pennington','Farciennes',17),(18,'Adrian Byrd','Zuccarello',18),(19,'Linus Wolf','Sangli',19),(20,'Chase Rivers','Joliet',20);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(21,'Blythe Eaton','Mellery',21),(22,'Zoe Taylor','Genk',22),(23,'Hayden Donaldson','Vaughan',23),(24,'Abdul Grimes','North Shore',24),(25,'Dustin Ingram','Carson City',25),(26,'Jonas Johnston','Lint',26),(27,'Callie Molina','Brye',27),(28,'Salvador Coffey','Champdani',28),(29,'Sybil Snyder','Duluth',29),(30,'Dante Adams','Istanbul',30);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(31,'Lydia Waller','Cortil-Noirmont',31),(32,'Dante Benton','Pramaggiore',32),(33,'Hedley Gilbert','Mobile',33),(34,'Eleanor Henry','Lillianes',34),(35,'Jonah Barber','Cerignola',35),(36,'Risa Marsh','Beauvechain',36),(37,'Elmo Leonard','Valbrevenna',37),(38,'Rahim Lawson','Arrone',38),(39,'Jada Brooks','Hathras',39),(40,'Shay Wilder','Wiekevorst',40);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(41,'Emerson Chen','Bihar Sharif',41),(42,'Emerald Jimenez','Genzano di Lucania',42),(43,'Lev Ferguson','Villa Santo Stefano',43),(44,'Noah Ford','Pogliano Milanese',44),(45,'Owen Lane','Vigo',45),(46,'Linda Collins','Leamington',46),(47,'Kimberley Molina','Burnpur',47),(48,'Quyn Davidson','Houston',48),(49,'Joelle Fulton','Buckingham',49),(50,'Zorita Ferguson','Baltasound',50);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(51,'John Vaughn','Bourges',51),(52,'Porter Carey','Aquila d''Arroscia',52),(53,'Christen Hatfield','Grand-Manil',53),(54,'Alvin Valdez','Fresno',54),(55,'Slade Edwards','Shillong',55),(56,'Noelle Barber','Ketchikan',56),(57,'Hyatt Walter','Tula',57),(58,'Kylee Wallace','Lions Bay',58),(59,'Yasir Flynn','Waver',59),(60,'Minerva Herman','Villers-Poterie',60);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(61,'Mechelle Compton','Ashbourne',61),(62,'Cathleen Scott','Cartagena',62),(63,'Clark Woodward','Pollein',63),(64,'India Eaton','Rocca d''Arce',64),(65,'Benjamin Johnson','Quinte West',65),(66,'Rosalyn Ballard','Rapone',66),(67,'Jonas Gilliam','Los Angeles',67),(68,'Orson Maddox','Borgerhout',68),(69,'Vincent Reeves','Niort',69),(70,'Genevieve Weaver','Deurne',70);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(71,'Inga Santos','Bamberg',71),(72,'Britanni Alford','Rampur',72),(73,'Doris Ortiz','Lagundo/Algund',73),(74,'Raja Donovan','Sint-Pieters-Woluwe',74),(75,'Yoshi Acosta','Priolo Gargallo',75),(76,'Donovan Hancock','Juazeiro do Norte',76),(77,'Erich Cummings','Aiseau-Presles',77),(78,'Hector James','Saint-Denis',78),(79,'Reece Randall','Bulnes',79),(80,'Cade Dudley','Curitiba',80);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(81,'Linda Stewart','Fairbanks',81),(82,'Aidan Neal','Ibadan',82),(83,'Emmanuel Mack','Vigo',83),(84,'Constance Randolph','Castiglione di Sicilia',84),(85,'Mira Rivera','Bradford',85),(86,'Alika Durham','Rodì Milici',86),(87,'Aaron Cook','Franeker',87),(88,'Mark Soto','Rhemes-Notre-Dame',88),(89,'Amanda Gonzalez','Bad Ischl',89),(90,'Thane Rasmussen','Whakatane',90);
INSERT INTO tblPERSONA([ID],[NOMBRE],[CIUDAD],[COD_USUARIO]) VALUES(91,'Emi Watkins','Gmunden',91),(92,'Armando Castaneda','Bertogne',92),(93,'Coby Waller','Fort Providence',93),(94,'Orla Fields','Forlì',94),(95,'Bruce Ortega','Pelarco',95),(96,'Yen Newton','Acquafredda',96),(97,'Kyra Whitfield','Luik',97),(98,'Alice Stephenson','Eastbourne',98),(99,'Devin Bauer','Melrose',99),(100,'Ella Fuller','Cobourg',100);
GO

----- AEROPUERTO -----

INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(1,'Aeropuerto Gonzalo Mejía','Autre-Eglise','Finland',1,'ACTIVO'),(2,'Aeropuerto Vanguardia','Helmond','Sudan',2,'ACTIVO'),(3,'Aeropuerto El Triunfo','Moio Alcantara','Gabon',3,'ACTIVO'),(4,'Aeropuerto El Embrujo','Kailua','Namibia',4,'ACTIVO'),(5,'Aeropuerto Benito Salas','Nalinnes','Liechtenstein',5,'ACTIVO'),(6,'Aeropuerto Vanguardia','Seattle','Burundi',6,'ACTIVO'),(7,'Terminal Puente Aéreo','Kędzierzyn-Koźle','Honduras',7,'ACTIVO'),(8,'Aeropuerto El Embrujo','Opdorp','Laos',8,'ACTIVO'),(9,'Aeropuerto Vanguardia','Coquimbo','China',9,'ACTIVO'),(10,'Aeropuerto Antonio Roldán Betancourt','Steyr','United States',10,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(11,'Aeropuerto Vanguardia','Felixstowe','France',11,'ACTIVO'),(12,'Aeropuerto Cravo Norte','Armo','Finland',12,'ACTIVO'),(13,'Aeropuerto El Embrujo','Khandwa','Guatemala',13,'ACTIVO'),(14,'Aeropuerto Cravo Norte','Rudiano','Andorra',14,'ACTIVO'),(15,'Aeropuerto César Gaviria Trujillo','Paradise','Sint Maarten',15,'ACTIVO'),(16,'Aeropuerto César Gaviria Trujillo','Pemuco','Philippines',16,'ACTIVO'),(17,'Aeropuerto Gonzalo Mejía','Salem','Montenegro',17,'ACTIVO'),(18,'Aeropuerto El Embrujo','Orosei','Djibouti',18,'ACTIVO'),(19,'Aeropuerto El Triunfo','Okara','Norway',19,'ACTIVO'),(20,'Aeropuerto Gonzalo Mejía','New Maryland','Tanzania',20,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(21,'Aeropuerto El Embrujo','Mauá','Mongolia',21,'ACTIVO'),(22,'Aeropuerto El Embrujo','Loverval','Lebanon',22,'ACTIVO'),(23,'Aeropuerto El Embrujo','Tilly','Saint Helena, Ascension and Tristan da Cunha',23,'ACTIVO'),(24,'Aeropuerto El Triunfo','Pereto','American Samoa',24,'ACTIVO'),(25,'Aeropuerto El Triunfo','Stamford','Turkey',25,'ACTIVO'),(26,'Aeropuerto Gonzalo Mejía','Civo','Trinidad and Tobago',26,'ACTIVO'),(27,'Aeropuerto Eduardo Falla Solano','St. Paul','New Zealand',27,'ACTIVO'),(28,'Aeropuerto Benito Salas','Masterton','Equatorial Guinea',28,'ACTIVO'),(29,'Aeropuerto Eduardo Falla Solano','Pica','Croatia',29,'ACTIVO'),(30,'Aeropuerto Cravo Norte','Valéncia','Reunion',30,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(31,'Aeropuerto Benito Salas','Bijapur','Micronesia',31,'ACTIVO'),(32,'Aeropuerto Benito Salas','Dubuisson','Cocos (Keeling) Islands',32,'ACTIVO'),(33,'Aeropuerto Vanguardia','Großpetersdorf','Cape Verde',33,'ACTIVO'),(34,'Aeropuerto El Triunfo','Moircy','Taiwan',34,'ACTIVO'),(35,'Aeropuerto Gonzalo Mejía','Satna','Senegal',35,'ACTIVO'),(36,'Terminal Puente Aéreo','Naihati','Kuwait',36,'ACTIVO'),(37,'Aeropuerto Benito Salas','Gentinnes','Egypt',37,'ACTIVO'),(38,'Aeropuerto Eduardo Falla Solano','Duque de Caxias','Burkina Faso',38,'ACTIVO'),(39,'Aeropuerto El Triunfo','Beauvais','Anguilla',39,'ACTIVO'),(40,'Aeropuerto El Triunfo','Worthing','Tajikistan',40,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(41,'Aeropuerto Cravo Norte','Vitrival','Armenia',41,'ACTIVO'),(42,'Aeropuerto Benito Salas','Coalville','Honduras',42,'ACTIVO'),(43,'Aeropuerto César Gaviria Trujillo','Haarlem','Micronesia',43,'ACTIVO'),(44,'Aeropuerto El Embrujo','Nocciano','Mauritius',44,'ACTIVO'),(45,'Aeropuerto Antonio Roldán Betancourt','Prince Albert','Anguilla',45,'ACTIVO'),(46,'Aeropuerto Benito Salas','Orta San Giulio','Virgin Islands, United States',46,'ACTIVO'),(47,'Aeropuerto Cravo Norte','Mount Pearl','Virgin Islands, British',47,'ACTIVO'),(48,'Aeropuerto Cravo Norte','Namen','Nicaragua',48,'ACTIVO'),(49,'Aeropuerto Benito Salas','Bangalore','British Indian Ocean Territory',49,'ACTIVO'),(50,'Aeropuerto Benito Salas','Burns Lake','Syria',50,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(51,'Aeropuerto Cravo Norte','Raymond','Honduras',51,'ACTIVO'),(52,'Aeropuerto Eduardo Falla Solano','Inverbervie','Bosnia and Herzegovina',52,'ACTIVO'),(53,'Aeropuerto Antonio Roldán Betancourt','Belsele','Mauritania',53,'ACTIVO'),(54,'Terminal Puente Aéreo','Sellia Marina','Niger',54,'ACTIVO'),(55,'Aeropuerto El Triunfo','Chilliwack','Ecuador',55,'ACTIVO'),(56,'Aeropuerto Benito Salas','Fontaine-Valmont','Montenegro',56,'ACTIVO'),(57,'Aeropuerto César Gaviria Trujillo','Pointe-Claire','Madagascar',57,'ACTIVO'),(58,'Aeropuerto Benito Salas','Cambridge','Jordan',58,'ACTIVO'),(59,'Terminal Puente Aéreo','Pietrarubbia','Guam',59,'ACTIVO'),(60,'Terminal Puente Aéreo','Alexandra','Ghana',60,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(61,'Aeropuerto El Triunfo','Graneros','Bermuda',61,'ACTIVO'),(62,'Aeropuerto Cravo Norte','Sant''Eusanio Forconese','Trinidad and Tobago',62,'ACTIVO'),(63,'Aeropuerto El Triunfo','Ruddervoorde','Kazakhstan',63,'ACTIVO'),(64,'Aeropuerto Benito Salas','Waidhofen an der Ybbs','Sint Maarten',64,'ACTIVO'),(65,'Aeropuerto El Embrujo','Mérignac','Isle of Man',65,'ACTIVO'),(66,'Aeropuerto Vanguardia','Chatteris','Guatemala',66,'ACTIVO'),(67,'Aeropuerto Antonio Roldán Betancourt','Carleton','Eritrea',67,'ACTIVO'),(68,'Aeropuerto Antonio Roldán Betancourt','Palagano','Indonesia',68,'ACTIVO'),(69,'Aeropuerto El Embrujo','Vedrin','Rwanda',69,'ACTIVO'),(70,'Aeropuerto El Triunfo','Puerto Octay','Ghana',70,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(71,'Aeropuerto Gonzalo Mejía','Annone di Brianza','Brunei',71,'ACTIVO'),(72,'Aeropuerto Eduardo Falla Solano','Rathenow','Indonesia',72,'ACTIVO'),(73,'Aeropuerto César Gaviria Trujillo','Matera','Tunisia',73,'ACTIVO'),(74,'Aeropuerto Cravo Norte','Falciano del Massico','Mauritius',74,'ACTIVO'),(75,'Aeropuerto Gonzalo Mejía','Asigliano Veneto','Turks and Caicos Islands',75,'ACTIVO'),(76,'Aeropuerto Eduardo Falla Solano','Kiel','Ethiopia',76,'ACTIVO'),(77,'Aeropuerto Vanguardia','Eugene','Nauru',77,'ACTIVO'),(78,'Aeropuerto Gonzalo Mejía','Kawartha Lakes','Bermuda',78,'ACTIVO'),(79,'Terminal Puente Aéreo','Monte Santa Maria Tiberina','Christmas Island',79,'ACTIVO'),(80,'Aeropuerto Vanguardia','Leamington','Saint Martin',80,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(81,'Aeropuerto Eduardo Falla Solano','Sudbury','Central African Republic',81,'ACTIVO'),(82,'Aeropuerto Antonio Roldán Betancourt','Greenock','Liechtenstein',82,'ACTIVO'),(83,'Aeropuerto El Embrujo','Thorembais-les-BŽguines','Bolivia',83,'ACTIVO'),(84,'Aeropuerto Gonzalo Mejía','Wisbech','United States Minor Outlying Islands',84,'ACTIVO'),(85,'Aeropuerto El Embrujo','Tuscaloosa','Lithuania',85,'ACTIVO'),(86,'Aeropuerto Eduardo Falla Solano','Casanova Elvo','Luxembourg',86,'ACTIVO'),(87,'Aeropuerto Antonio Roldán Betancourt','Oristano','Tajikistan',87,'ACTIVO'),(88,'Aeropuerto César Gaviria Trujillo','Luik','Guernsey',88,'ACTIVO'),(89,'Aeropuerto El Triunfo','Staßfurt','Malawi',89,'ACTIVO'),(90,'Aeropuerto Vanguardia','Kendal','Thailand',90,'ACTIVO');
INSERT INTO tblAEROPUERTO([CODIGO],[NOMBRE],[CIUDAD],[PAIS],[ID_RESPONSABLE],[ESTADO]) VALUES(91,'Aeropuerto Vanguardia','Kirkwall','Senegal',91,'ACTIVO'),(92,'Aeropuerto El Embrujo','Whyalla','South Sudan',92,'ACTIVO'),(93,'Aeropuerto El Triunfo','Finkenstein am Faaker See','Bhutan',93,'ACTIVO'),(94,'Aeropuerto César Gaviria Trujillo','Barrhead','Moldova',94,'ACTIVO'),(95,'Aeropuerto El Triunfo','Patos','Saint Martin',95,'ACTIVO'),(96,'Aeropuerto César Gaviria Trujillo','Waarmaarde','Greenland',96,'ACTIVO'),(97,'Aeropuerto El Triunfo','Grantham','Montserrat',97,'ACTIVO'),(98,'Aeropuerto Vanguardia','Loughborough','Kazakhstan',98,'ACTIVO'),(99,'Terminal Puente Aéreo','Sonipat','Liechtenstein',99,'ACTIVO'),(100,'Aeropuerto Antonio Roldán Betancourt','South Portland','Saint Kitts and Nevis',100,'ACTIVO');
GO

----- LINEA AEREA -----
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(1,'Avianca','Tokelau'),(2,'Viva Colombia','Finland'),(3,'JetBlue','Fiji'),(4,'JetBlue','Guadeloupe'),(5,'Avianca','Antarctica'),(6,'Viva Colombia','Northern Mariana Islands'),(7,'Delta Airlines','Saudi Arabia'),(8,'Air Express','Ethiopia'),(9,'Viva Colombia','Lesotho'),(10,'Avianca','Honduras');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(11,'American Airlines','Sri Lanka'),(12,'JetBlue','Oman'),(13,'Avianca','Christmas Island'),(14,'JetBlue','Austria'),(15,'American Airlines','Romania'),(16,'Express','Lithuania'),(17,'Avianca','Puerto Rico'),(18,'Delta Airlines','Tokelau'),(19,'Viva Colombia','Saint Lucia'),(20,'American Airlines','Slovakia');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(21,'Express','Equatorial Guinea'),(22,'Air Express','Holy See (Vatican City State)'),(23,'JetBlue','Wallis and Futuna'),(24,'Express','Tonga'),(25,'Air Express','Bermuda'),(26,'American Airlines','Yemen'),(27,'Delta Airlines','Ethiopia'),(28,'Viva Colombia','Saint Vincent and The Grenadines'),(29,'Air Express','Saint Martin'),(30,'American Airlines','Argentina');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(31,'Avianca','Equatorial Guinea'),(32,'Avianca','Bolivia'),(33,'Avianca','Brazil'),(34,'Express','Argentina'),(35,'Air Express','Poland'),(36,'American Airlines','Brunei'),(37,'American Airlines','Falkland Islands'),(38,'Avianca','Bangladesh'),(39,'Viva Colombia','Guinea'),(40,'Express','Guatemala');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(41,'Avianca','United States Minor Outlying Islands'),(42,'Avianca','Brunei'),(43,'Express','Chile'),(44,'Delta Airlines','France'),(45,'Viva Colombia','Saint Martin'),(46,'American Airlines','Niger'),(47,'JetBlue','Belize'),(48,'Express','Bonaire, Sint Eustatius and Saba'),(49,'JetBlue','Virgin Islands, British'),(50,'JetBlue','Seychelles');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(51,'Viva Colombia','Haiti'),(52,'Express','French Polynesia'),(53,'Express','Tonga'),(54,'Air Express','Suriname'),(55,'JetBlue','Chad'),(56,'Avianca','Reunion'),(57,'American Airlines','Isle of Man'),(58,'Delta Airlines','Afghanistan'),(59,'Avianca','Curaçao'),(60,'Air Express','Sweden');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(61,'Delta Airlines','Switzerland'),(62,'American Airlines','Thailand'),(63,'American Airlines','Guinea'),(64,'Delta Airlines','Macao'),(65,'JetBlue','Monaco'),(66,'Express','Montserrat'),(67,'Avianca','Moldova'),(68,'JetBlue','Sudan'),(69,'American Airlines','Bosnia and Herzegovina'),(70,'Air Express','Montserrat');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(71,'Express','United States Minor Outlying Islands'),(72,'American Airlines','Virgin Islands, United States'),(73,'JetBlue','Mali'),(74,'Viva Colombia','Malawi'),(75,'American Airlines','Faroe Islands'),(76,'Viva Colombia','Latvia'),(77,'Express','Romania'),(78,'Express','Côte D''Ivoire (Ivory Coast)'),(79,'JetBlue','Ethiopia'),(80,'Delta Airlines','Jersey');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(81,'Delta Airlines','Zambia'),(82,'JetBlue','French Southern Territories'),(83,'Express','Colombia'),(84,'JetBlue','Laos'),(85,'Viva Colombia','Congo (Brazzaville)'),(86,'Avianca','Qatar'),(87,'Express','Belize'),(88,'Avianca','American Samoa'),(89,'Delta Airlines','Cyprus'),(90,'Air Express','San Marino');
INSERT INTO tblLINEA_AEREA([CODIGO],[NOMBRE],[PAIS]) VALUES(91,'Viva Colombia','Maldives'),(92,'Avianca','Monaco'),(93,'American Airlines','Mongolia'),(94,'JetBlue','Nigeria'),(95,'Viva Colombia','Panama'),(96,'Avianca','Ukraine'),(97,'Express','France'),(98,'Delta Airlines','Malawi'),(99,'Viva Colombia','Moldova'),(100,'JetBlue','Colombia');
GO

----- PILOTO -----
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(1,'Yardley Gillespie','869-1786 Ut, Ctra.','Cabildo',12,67,'335-27-15'),(2,'Blossom England','9534 Dui. Avda.','Lagonegro',46,70,'974-51-93'),(3,'Oscar Hendricks','Apdo.:123-3131 Nisl Ctra.','Enterprise',57,48,'391-76-53'),(4,'Ava Farley','669-6015 Ridiculus Av.','Hunstanton',22,68,'189-27-77'),(5,'Chase Tate','973-7617 Mauris C/','Tullibody',19,50,'753-29-29'),(6,'Wesley Lawrence','431-7698 Semper, C.','Annan',54,73,'579-26-72'),(7,'Aquila Foster','496-1785 Est Avenida','Jette',6,4,'635-46-58'),(8,'Florence Sandoval','Apdo.:874-5200 Lorem. Ctra.','Putignano',50,14,'636-83-91'),(9,'Chester Mathis','1693 Mauris C.','Leominster',11,94,'319-45-63'),(10,'Ira George','204-267 Dignissim. Carretera','Rimouski',57,13,'474-88-45');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(11,'Bevis Kerr','Apdo.:298-786 Dis Calle','Rabbi',1,90,'586-39-49'),(12,'Dalton Stanton','Apdo.:400-3336 Per Avda.','Zutphen',55,74,'976-61-26'),(13,'Lydia Nichols','Apartado núm.: 391, 9024 Nunc C.','Milton Keynes',56,52,'621-11-83'),(14,'Andrew Burns','1096 Enim. Calle','San Pablo',15,28,'793-74-49'),(15,'Rosalyn Solis','Apdo.:482-270 Donec Avda.','Gagliano del Capo',8,61,'697-73-95'),(16,'Simone Gilmore','140-648 Integer Ctra.','Acquasparta',61,88,'274-15-26'),(17,'Xanthus Little','466-3856 Vitae Av.','Rothesay',36,63,'532-77-54'),(18,'Kelsey Ramirez','497-9527 Sed C/','Jammu',41,28,'911-92-47'),(19,'Illana Flowers','Apartado núm.: 333, 3268 Velit. Avenida','Arviat',37,66,'125-39-89'),(20,'Zenaida Gates','Apdo.:824-2356 Purus. Calle','Albano di Lucania',67,85,'761-11-12');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(21,'Yoshio Marsh','Apdo.:719-1211 Magna. Ctra.','Court-Saint-Etienne',33,70,'718-72-95'),(22,'Chava Lawrence','508-6383 Lorem Avda.','Farrukhabad-cum-Fatehgarh',75,80,'838-64-34'),(23,'Colleen Frederick','Apdo.:678-4276 Phasellus C/','Keumiee',40,78,'621-65-15'),(24,'Aspen Donovan','719-3341 Cras Av.','Toledo',53,54,'492-54-86'),(25,'Linus Allen','Apartado núm.: 660, 2869 Tincidunt Ctra.','Winnipeg',57,42,'539-41-57'),(26,'Hannah Church','Apartado núm.: 442, 3848 Neque ','Priolo Gargallo',42,28,'438-35-74'),(27,'Lionel Nguyen','1438 Accumsan ','Columbia',73,68,'815-23-96'),(28,'Vincent Perkins','Apartado núm.: 112, 1835 Interdum Av.','Motherwell',38,14,'286-11-88'),(29,'Wing Fox','Apdo.:184-1530 Tristique Calle','Lille',61,6,'931-81-12'),(30,'Florence Ryan','488-5283 Sit Calle','Bonn',7,23,'533-51-54');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(31,'Kylie Simon','Apartado núm.: 545, 9332 Vestibulum. Calle','Merksplas',52,19,'932-27-93'),(32,'Melodie Benton','269-7496 Sem C/','Bellingen',97,80,'829-63-59'),(33,'Kennedy Lancaster','808-715 Nullam Avda.','Erpe',62,49,'529-63-52'),(34,'Quon Savage','402-1793 Fermentum Avenida','Cuenca',45,16,'698-64-93'),(35,'Keaton Rosario','357 Tortor. Calle','Erpe',100,61,'368-84-63'),(36,'Eden Graves','Apdo.:908-5205 Scelerisque C/','Lac Ste. Anne',27,97,'883-55-59'),(37,'Yolanda Ballard','8892 Et, Avenida','Laramie',76,25,'791-87-58'),(38,'Nehru Conley','968-1510 Arcu. Ctra.','Lexington',51,88,'355-75-37'),(39,'Mannix Ochoa','550-7864 Tincidunt Avda.','Maidenhead',99,67,'587-42-55'),(40,'Preston Shepard','Apartado núm.: 271, 8065 Erat. ','San Damiano al Colle',19,73,'889-15-89');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(41,'Hedda Gomez','Apdo.:534-9227 Justo Calle','Champorcher',57,16,'518-35-85'),(42,'Lydia Hester','Apdo.:233-9114 Orci, Avenida','Nancy',2,50,'877-42-12'),(43,'Patrick Zimmerman','584 Suspendisse Avenida','Stokkem',73,7,'885-75-78'),(44,'Kylie Hoffman','600-4277 Cum C.','Hudson Bay',39,91,'226-45-81'),(45,'India Pearson','193-7354 Erat. Av.','Groenlo',91,54,'791-69-25'),(46,'Natalie Dennis','5728 Odio, Avda.','San Vicente',43,90,'319-67-72'),(47,'Britanni Norton','441-5081 Elit, Av.','Wolfville',78,15,'734-29-47'),(48,'Noelani Stokes','3758 Et Ctra.','Fleurus',33,32,'545-86-12'),(49,'Gay Tyler','Apartado núm.: 277, 7903 Nunc Ctra.','Little Rock',99,73,'912-28-34'),(50,'Stephanie Bradshaw','918 Aliquam Avenida','Mira Bhayandar',33,73,'313-66-26');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(51,'Bruce Nguyen','320-1736 Eu, Calle','Port Glasgow',26,53,'167-47-59'),(52,'Merritt Boone','626-9056 Purus, Av.','Hoyerswerda',31,81,'794-19-37'),(53,'Grace Juarez','665-5371 Ligula ','Dehradun',23,63,'125-52-31'),(54,'Calvin Acevedo','Apdo.:380-1345 Aliquam C/','Crieff',98,82,'619-39-43'),(55,'Marsden Reynolds','Apdo.:566-4970 Blandit C.','Sahiwal',48,14,'123-45-88'),(56,'Leilani Winters','2766 Tempus Ctra.','Valverde',70,61,'414-91-92'),(57,'Jeanette Pacheco','757-1547 Faucibus Avenida','GŽrouville',2,49,'564-89-52'),(58,'Madonna Barnes','9894 Cras Avda.','Martigues',88,13,'135-74-85'),(59,'Salvador Hoffman','236-1508 Lorem Calle','Daly',86,81,'328-45-51'),(60,'Whoopi Cooke','1597 Nec, Ctra.','Dole',15,68,'933-64-73');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(61,'Guinevere Baker','824-2891 Donec Calle','Overrepen',8,14,'631-76-81'),(62,'Felix Walls','3418 Ac Avda.','Swansea',73,13,'361-35-42'),(63,'Yuri Mayo','Apartado núm.: 283, 6779 Leo Av.','Trier',10,59,'228-71-69'),(64,'Halla Morales','3617 Morbi Calle','Tirrases',33,61,'195-31-11'),(65,'Quail Myers','Apdo.:493-2367 Sodales Av.','Billings',80,56,'235-94-89'),(66,'Hedwig Mcbride','Apdo.:395-3532 Duis Avda.','Plymouth',49,60,'465-99-93'),(67,'Hakeem Clay','4251 Phasellus C/','Maidenhead',32,94,'616-48-78'),(68,'Tatyana Sweeney','5735 Non Ctra.','Glasgow',5,59,'497-48-83'),(69,'George Humphrey','862-6176 Augue C.','Calgary',39,74,'743-52-11'),(70,'Peter Howard','4301 Class Avda.','Middelkerke',55,55,'322-86-96');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(71,'Victor Duffy','Apdo.:292-3222 Libero. Avda.','Sint-Gillis-bij-Dendermonde',11,18,'261-18-17'),(72,'Xenos Castillo','4487 Enim. Av.','Bowling Green',89,26,'977-93-74'),(73,'Amal Dixon','965-3223 Magnis Carretera','Enkhuizen',47,17,'357-18-51'),(74,'Adara Fry','3743 Donec Avenida','LaSalle',100,50,'755-12-57'),(75,'Damon Hayden','Apdo.:816-568 Ipsum C/','Vieux-Genappe',53,54,'635-84-99'),(76,'Martena Becker','Apdo.:849-9066 Nullam ','Raj Nandgaon',100,87,'758-69-78'),(77,'Brittany Carlson','153-2794 Dapibus Avenida','Indianapolis',80,30,'671-61-63'),(78,'Destiny Mayer','Apdo.:848-3159 Diam Avenida','Ellesmere Port',75,7,'975-46-93'),(79,'Lillian Wall','Apdo.:202-5417 Libero. Avda.','Cisterna di Latina',96,69,'636-62-33'),(80,'Melinda Gibson','384-945 Mi ','Fort Collins',12,47,'831-81-15');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(81,'Inga Sampson','908-1474 Nunc Avenida','Gloucester',50,94,'964-15-74'),(82,'Whitney Salas','437-7600 Dolor Avenida','Tresigallo',75,84,'253-51-96'),(83,'Kylie Sweet','Apdo.:588-1003 Tellus Av.','Alacant',10,100,'115-17-77'),(84,'Ciara Fields','Apartado núm.: 263, 7345 Ante. Avda.','Sant''Onofrio',90,2,'353-76-44'),(85,'Todd Jarvis','306 Etiam Ctra.','Naihati',91,42,'926-93-71'),(86,'Rebekah Huff','695-3410 Mauris. C.','Castelluccio Superiore',70,50,'632-25-11'),(87,'Barclay Hines','1673 Vitae, ','Ghlin',46,75,'247-15-64'),(88,'Bruce Wiggins','Apartado núm.: 643, 6831 Tincidunt Avenida','San Pedro',79,17,'111-75-95'),(89,'Kaitlin Murphy','Apartado núm.: 988, 8569 Lobortis. Avda.','Saint-Étienne-du-Rouvray',34,60,'854-23-66'),(90,'Eden Levy','Apartado núm.: 767, 6869 Dictum C/','HomprŽ',40,62,'882-57-79');
INSERT INTO tblPILOTO([ID],[NOMBRE],[DIRECCION],[CIUDAD_RESIDENCIA],[CODIGO_LINEA],[COD_USUARIO],[TELEFONO]) VALUES(91,'Veda Chang','5261 Quisque ','St. Pölten',24,98,'694-92-19'),(92,'Wayne Frost','Apdo.:121-3727 Nisl. Avda.','Allein',49,21,'511-43-97'),(93,'Amy Dunn','Apdo.:630-6939 Ultricies C.','Mount Pearl',32,21,'287-55-83'),(94,'Akeem Young','969-1002 Class Avda.','Bolano',11,69,'899-65-88'),(95,'Howard Barry','Apartado núm.: 973, 1596 Facilisis Calle','Andalo',18,19,'534-42-92'),(96,'Cora Best','Apartado núm.: 565, 9880 In C/','Chile Chico',19,20,'623-54-63'),(97,'Olympia Byrd','803-3539 Eu Av.','Koekelberg',37,91,'882-22-22'),(98,'Emmanuel Neal','Apartado núm.: 728, 8725 A, Calle','Hearst',11,55,'293-78-85'),(99,'Shaine Weber','167-3586 Id Calle','Kettering',45,100,'895-77-58'),(100,'Quinn Wynn','3031 Sed Carretera','Etobicoke',70,75,'878-39-88');
GO


----- AVION -----
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(1,'Boeing 757',88,7),(2,'A320',61,14),(3,'Boeing 757',79,38),(4,'Boeing 727',98,35),(5,'A380',92,68),(6,'A380',92,47),(7,'Boeing 727',97,39),(8,'A380',70,63),(9,'Boeing 707',92,8),(10,'A380',91,43);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(11,'MAX 737',89,84),(12,'A320',63,2),(13,'Boeing 707',99,31),(14,'Boeing 707',71,96),(15,'A320',88,79),(16,'A320',88,15),(17,'Boeing 707',64,20),(18,'Boeing 707',64,1),(19,'A380',95,92),(20,'Boeing 777-200',60,16);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(21,'A380',88,30),(22,'A320',52,50),(23,'A320',90,37),(24,'Boeing 777-200',56,36),(25,'MAX 737',63,22),(26,'Boeing 757',98,27),(27,'A320',61,6),(28,'Boeing 757',56,3),(29,'Boeing 777-200',89,72),(30,'Boeing 727',86,50);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(31,'Boeing 707',81,1),(32,'Boeing 767',73,8),(33,'Boeing 757',69,57),(34,'A380',58,4),(35,'Boeing 757',73,91),(36,'Boeing 777-200',62,74),(37,'Boeing 757',69,36),(38,'A380',88,81),(39,'A380',53,98),(40,'MAX 737',82,18);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(41,'Boeing 777-200',81,37),(42,'Boeing 767',95,42),(43,'Boeing 777-200',70,57),(44,'Boeing 707',71,19),(45,'Boeing 767',99,92),(46,'Boeing 757',78,44),(47,'Boeing 757',58,33),(48,'A380',98,8),(49,'Boeing 777-200',70,56),(50,'Boeing 777-200',57,51);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(51,'Boeing 777-200',86,27),(52,'Boeing 777-200',100,79),(53,'A380',92,54),(54,'Boeing 707',67,99),(55,'MAX 737',51,69),(56,'Boeing 777-200',66,89),(57,'Boeing 777-200',99,82),(58,'Boeing 727',60,69),(59,'Boeing 777-200',94,80),(60,'A380',93,36);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(61,'Boeing 757',51,14),(62,'Boeing 777-200',90,26),(63,'A320',61,77),(64,'Boeing 767',92,80),(65,'Boeing 777-200',90,76),(66,'Boeing 707',59,71),(67,'Boeing 757',78,39),(68,'Boeing 777-200',89,19),(69,'MAX 737',97,80),(70,'Boeing 757',81,76);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(71,'Boeing 777-200',65,46),(72,'Boeing 707',82,2),(73,'Boeing 777-200',89,21),(74,'A320',58,74),(75,'A320',90,35),(76,'Boeing 757',50,58),(77,'Boeing 767',89,84),(78,'Boeing 707',62,71),(79,'A380',94,75),(80,'Boeing 727',77,17);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(81,'A320',86,67),(82,'Boeing 757',65,62),(83,'A320',66,2),(84,'A380',80,22),(85,'Boeing 767',59,43),(86,'MAX 737',94,16),(87,'Boeing 727',63,61),(88,'Boeing 727',81,43),(89,'Boeing 707',96,82),(90,'A320',67,25);
INSERT INTO tblAVION([CODIGO],[MODELO],[CAPACIDAD],[CODIGO_LINEA]) VALUES(91,'A320',96,30),(92,'A320',68,28),(93,'Boeing 727',62,34),(94,'Boeing 777-200',86,4),(95,'A320',62,54),(96,'Boeing 727',53,95),(97,'MAX 737',77,18),(98,'Boeing 767',73,11),(99,'Boeing 767',94,67),(100,'Boeing 777-200',70,80);
GO

----- VUELO -----
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (1, '2016-06-23 11:03:09', '2017-10-26 00:03:40', 74, 24, 59);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (2, '2017-03-31 17:45:28', '2017-07-09 17:41:13', 52, 59, 39);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (3, '2015-01-10 09:43:09', '2017-08-31 02:48:06', 75, 59, 30);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (4, '2017-05-21 21:11:40', '2017-10-08 04:08:24', 99, 41, 70);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (5, '2014-12-31 17:46:30', '2017-08-12 11:35:18', 83, 76, 28);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (6, '2015-09-08 23:21:52', '2018-05-10 02:18:21', 79, 23, 21);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (7, '2014-10-29 19:15:13', '2017-09-23 10:23:29', 89, 3, 28);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (8, '2016-01-31 18:45:11', '2017-06-20 10:07:37', 55, 17, 14);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (9, '2014-10-13 02:27:42', '2017-11-27 21:36:25', 98, 60, 24);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (10, '2017-02-04 04:24:32', '2017-08-23 01:49:42', 85, 54, 61);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (11, '2014-10-13 20:49:35', '2017-08-19 19:58:26', 67, 9, 57);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (12, '2014-08-15 02:00:40', '2018-04-30 04:06:57', 78, 99, 30);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (13, '2015-05-15 23:49:45', '2018-05-13 18:12:17', 80, 77, 77);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (14, '2016-09-26 07:49:31', '2017-10-14 11:42:08', 68, 81, 12);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (15, '2015-08-05 06:17:45', '2018-04-22 03:47:53', 95, 14, 67);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (16, '2015-09-05 15:04:06', '2017-09-17 13:29:53', 76, 52, 73);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (17, '2017-02-26 03:20:43', '2018-03-01 16:28:39', 76, 93, 39);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (18, '2017-05-28 10:29:44', '2017-12-14 07:39:31', 55, 88, 54);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (19, '2015-08-19 13:39:41', '2018-01-19 05:27:37', 100, 67, 76);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (20, '2016-03-23 06:53:04', '2017-10-26 05:29:39', 57, 100, 54);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (21, '2015-09-05 01:31:08', '2018-04-27 14:01:46', 56, 100, 61);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (22, '2017-05-14 23:17:20', '2018-04-14 00:10:40', 98, 29, 27);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (23, '2017-04-03 15:11:25', '2018-02-22 17:50:16', 70, 6, 17);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (24, '2017-04-14 17:54:49', '2017-07-29 09:55:40', 85, 97, 86);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (25, '2016-03-22 03:45:41', '2017-06-11 17:46:16', 89, 52, 3);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (26, '2016-06-10 03:26:52', '2017-11-06 00:33:29', 84, 52, 10);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (27, '2015-03-29 13:03:04', '2017-06-22 07:36:31', 94, 29, 51);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (28, '2016-01-24 20:36:03', '2017-10-10 20:43:10', 64, 56, 8);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (29, '2016-09-05 09:56:31', '2017-09-02 01:26:30', 80, 35, 14);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (30, '2014-08-04 18:51:15', '2018-03-24 20:05:38', 61, 29, 73);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (31, '2016-04-17 03:38:43', '2017-11-01 23:57:45', 91, 43, 65);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (32, '2016-06-23 03:13:05', '2017-09-21 22:00:25', 89, 1, 63);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (33, '2014-06-28 16:41:20', '2017-10-23 17:47:54', 77, 94, 14);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (34, '2017-02-14 12:34:28', '2017-12-05 12:00:36', 95, 63, 64);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (35, '2015-05-25 15:57:39', '2017-07-31 12:34:46', 59, 95, 14);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (36, '2014-09-06 09:29:16', '2017-07-26 03:04:51', 52, 37, 42);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (37, '2015-12-06 07:04:45', '2017-10-30 19:41:04', 57, 64, 36);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (38, '2014-06-15 03:46:06', '2017-10-05 00:12:16', 89, 76, 97);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (39, '2017-05-23 05:43:52', '2018-02-25 09:19:09', 57, 74, 78);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (40, '2017-03-11 15:52:47', '2018-04-16 08:07:08', 99, 29, 75);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (41, '2015-08-12 11:11:23', '2017-10-20 14:48:05', 71, 19, 54);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (42, '2015-07-25 11:58:08', '2017-08-18 00:13:33', 93, 81, 81);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (43, '2014-05-20 08:54:16', '2018-01-06 17:51:28', 97, 76, 72);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (44, '2016-11-20 15:16:00', '2017-12-25 11:57:56', 60, 88, 71);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (45, '2017-02-25 14:55:22', '2017-07-08 06:18:26', 55, 81, 76);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (46, '2015-11-14 02:06:56', '2017-09-27 06:06:18', 98, 95, 16);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (47, '2015-07-17 04:38:33', '2018-05-03 20:09:21', 75, 87, 52);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (48, '2015-05-20 09:11:56', '2018-02-04 15:29:12', 59, 50, 61);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (49, '2017-02-25 01:53:34', '2018-04-20 01:54:47', 87, 48, 97);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (50, '2016-10-29 10:18:15', '2018-04-18 01:34:49', 92, 35, 70);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (51, '2017-01-19 05:08:18', '2017-12-13 18:17:01', 91, 13, 43);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (52, '2015-06-05 04:52:35', '2018-04-13 20:20:57', 95, 49, 71);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (53, '2017-03-10 02:53:53', '2017-07-07 16:22:13', 83, 81, 63);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (54, '2015-05-24 03:13:14', '2017-07-27 04:15:15', 97, 71, 74);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (55, '2014-09-25 17:11:47', '2017-06-14 01:30:58', 99, 80, 29);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (56, '2016-05-22 11:25:17', '2017-06-18 05:13:07', 78, 29, 55);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (57, '2016-04-21 11:08:38', '2018-03-05 09:22:50', 50, 76, 44);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (58, '2014-08-23 13:24:25', '2017-06-17 15:06:55', 99, 76, 1);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (59, '2017-04-24 19:44:28', '2017-08-10 20:11:33', 84, 1, 92);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (60, '2014-10-29 15:40:33', '2017-06-17 11:48:05', 96, 29, 72);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (61, '2014-05-25 05:57:45', '2017-10-27 00:48:23', 80, 42, 10);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (62, '2015-05-24 01:18:55', '2017-12-26 20:37:05', 78, 43, 99);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (63, '2016-01-24 16:47:30', '2017-06-03 10:27:24', 64, 46, 6);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (64, '2015-10-07 18:38:19', '2017-11-15 23:50:44', 100, 91, 46);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (65, '2017-01-30 22:55:33', '2017-07-06 11:45:56', 98, 4, 10);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (66, '2014-10-18 08:23:44', '2017-07-24 08:20:04', 78, 74, 14);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (67, '2017-03-15 00:13:33', '2017-09-02 01:40:13', 85, 33, 27);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (68, '2016-07-26 23:05:00', '2018-01-21 17:18:14', 84, 27, 13);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (69, '2015-06-09 13:42:45', '2017-10-02 09:50:24', 59, 25, 22);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (70, '2015-10-29 21:26:53', '2017-08-22 14:32:31', 79, 100, 20);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (71, '2014-06-02 09:56:01', '2017-09-04 15:42:09', 64, 54, 27);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (72, '2016-01-21 05:12:04', '2018-03-30 17:01:27', 56, 67, 12);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (73, '2017-04-28 15:18:26', '2017-07-04 15:37:35', 75, 61, 2);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (74, '2015-09-09 05:36:52', '2018-03-12 06:41:59', 58, 23, 35);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (75, '2014-05-29 21:21:08', '2017-10-31 02:35:02', 75, 15, 17);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (76, '2017-04-27 06:22:48', '2018-03-21 23:05:06', 80, 81, 10);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (77, '2015-05-12 12:52:39', '2018-02-17 13:47:47', 60, 78, 68);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (78, '2015-08-18 23:52:49', '2018-01-29 13:34:40', 91, 55, 19);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (79, '2014-05-17 23:25:48', '2018-01-18 08:24:39', 58, 19, 24);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (80, '2016-08-01 13:21:08', '2017-06-16 01:29:32', 76, 85, 38);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (81, '2014-06-06 05:53:56', '2017-10-10 07:51:05', 99, 55, 99);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (82, '2015-08-13 15:13:33', '2018-02-07 11:14:24', 54, 44, 86);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (83, '2017-04-07 12:39:51', '2018-03-28 08:33:08', 75, 27, 27);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (84, '2015-04-08 19:23:59', '2018-04-28 01:39:06', 99, 12, 18);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (85, '2014-12-29 18:04:08', '2017-12-25 22:04:46', 76, 73, 17);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (86, '2014-08-23 17:30:17', '2017-09-20 13:10:42', 90, 28, 70);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (87, '2016-04-26 23:03:09', '2017-05-30 14:19:23', 97, 5, 37);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (88, '2014-06-21 15:38:21', '2017-08-21 21:15:19', 72, 98, 60);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (89, '2014-08-20 01:23:16', '2017-06-28 06:28:54', 99, 12, 32);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (90, '2016-04-23 15:50:58', '2017-08-27 12:30:29', 59, 97, 44);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (91, '2015-05-31 00:31:47', '2018-05-03 00:27:24', 79, 10, 26);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (92, '2015-12-07 06:22:26', '2018-03-19 10:57:01', 89, 72, 67);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (93, '2016-08-06 03:20:26', '2018-04-28 03:19:04', 73, 59, 40);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (94, '2016-07-17 23:51:13', '2018-03-28 20:48:41', 87, 31, 48);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (95, '2015-10-10 23:42:15', '2017-12-13 16:27:10', 74, 18, 84);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (96, '2014-11-22 03:37:14', '2017-09-12 20:41:08', 98, 56, 94);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (97, '2016-09-28 05:04:53', '2017-07-10 21:22:42', 86, 20, 20);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (98, '2016-09-02 04:24:05', '2017-12-18 16:11:59', 57, 94, 89);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (99, '2016-06-04 15:16:14', '2017-10-14 20:40:19', 73, 63, 81);
insert into tblVUELO (CODIGO, FECHA_partida, FECHA_llegada, PLAZAS_VACIAS, IDPILOTO, COD_AVION) values (100, '2015-08-29 00:38:21', '2017-11-06 05:56:09', 80, 54, 29);
GO

----- ESCALA TECNICA -----
INSERT INTO tblESCALA_TECNICA VALUES ('N/A', NULL);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90);
INSERT INTO tblESCALA_TECNICA([CODIGO],[COD_AEROPUERTO]) VALUES(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100);
GO

----- PROGRAMA VUELO -----
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(1,1,1,1,1,1),(2,2,2,2,2,2),(3,3,3,3,3,3),(4,4,4,4,4,4),(5,5,5,5,5,5),(6,6,6,6,6,6),(7,7,7,7,7,7),(8,8,8,8,8,8),(9,9,9,9,9,9),(10,10,10,10,10,10);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(11,11,11,11,11,11),(12,12,12,12,12,12),(13,13,13,13,13,13),(14,14,14,14,14,14),(15,15,15,15,15,15),(16,16,16,16,16,16),(17,17,17,17,17,17),(18,18,18,18,18,18),(19,19,19,19,19,19),(20,20,20,20,20,20);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(21,21,21,21,21,21),(22,22,22,22,22,22),(23,23,23,23,23,23),(24,24,24,24,24,24),(25,25,25,25,25,25),(26,26,26,26,26,26),(27,27,27,27,27,27),(28,28,28,28,28,28),(29,29,29,29,29,29),(30,30,30,30,30,30);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(31,31,31,31,31,31),(32,32,32,32,32,32),(33,33,33,33,33,33),(34,34,34,34,34,34),(35,35,35,35,35,35),(36,36,36,36,36,36),(37,37,37,37,37,37),(38,38,38,38,38,38),(39,39,39,39,39,39),(40,40,40,40,40,40);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(41,41,41,41,41,41),(42,42,42,42,42,42),(43,43,43,43,43,43),(44,44,44,44,44,44),(45,45,45,45,45,45),(46,46,46,46,46,46),(47,47,47,47,47,47),(48,48,48,48,48,48),(49,49,49,49,49,49),(50,50,50,50,50,50);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(51,51,51,51,51,51),(52,52,52,52,52,52),(53,53,53,53,53,53),(54,54,54,54,54,54),(55,55,55,55,55,55),(56,56,56,56,56,56),(57,57,57,57,57,57),(58,58,58,58,58,58),(59,59,59,59,59,59),(60,60,60,60,60,60);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(61,61,61,61,61,61),(62,62,62,62,62,62),(63,63,63,63,63,63),(64,64,64,64,64,64),(65,65,65,65,65,65),(66,66,66,66,66,66),(67,67,67,67,67,67),(68,68,68,68,68,68),(69,69,69,69,69,69),(70,70,70,70,70,70);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(71,71,71,71,71,71),(72,72,72,72,72,72),(73,73,73,73,73,73),(74,74,74,74,74,74),(75,75,75,75,75,75),(76,76,76,76,76,76),(77,77,77,77,77,77),(78,78,78,78,78,78),(79,79,79,79,79,79),(80,80,80,80,80,80);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(81,81,81,81,81,81),(82,82,82,82,82,82),(83,83,83,83,83,83),(84,84,84,84,84,84),(85,85,85,85,85,85),(86,86,86,86,86,86),(87,87,87,87,87,87),(88,88,88,88,88,88),(89,89,89,89,89,89),(90,90,90,90,90,90);
INSERT INTO tblPROGRAMA_VUELO([CODIGO],[CODIGO_VUELO],[CODIGO_LINEA],[CODIGO_ESCALATECNICA],[AEROPUERTO_PARTIDA],[AEROPUERTO_DESTINO]) VALUES(91,91,91,91,91,91),(92,92,92,92,92,92),(93,93,93,93,93,93),(94,94,94,94,94,94),(95,95,95,95,95,95),(96,96,96,96,96,96),(97,97,97,97,97,97),(98,98,98,98,98,98),(99,99,99,99,99,99),(100,100,100,100,100,100);
GO

----- LINEA AEROPUERTO -----
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90);
INSERT INTO tblLINEA_AEROPUERTO([CODIGO_AEROPUERTO],[CODIGO_LINEA]) VALUES(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100);
GO

/*******------------------------------ PROCEDIMIENTOS ALMACENADOS ------------------------------*******/
CREATE PROCEDURE SP_ValidarCredencialesDeAcceso (
@usuario VARCHAR(100),
@clave VARCHAR(100))
AS
BEGIN
	IF EXISTS (SELECT nombre_usuario, clave_usuario FROM tblUSUARIO WHERE nombre_usuario = @usuario AND clave_usuario = @clave)
	BEGIN
		SELECT '0' as SW
	END
	ELSE
		BEGIN
			SELECT '1' as SW
		END
END


CREATE PROCEDURE SP_CrearUsuario
@NOMBRE_USUARIO VARCHAR(10),
@CLAVE_USUARIO VARCHAR  (10),
@ROL_USUARIO VARCHAR(5)
AS
BEGIN
	IF EXISTS(SELECT CODIGO_USUARIO FROM tblUSUARIO WHERE NOMBRE_USUARIO = @NOMBRE_USUARIO)
	BEGIN				
		SELECT '0' AS SW,
			   'El nombre de usuario ya existe'
	END
	ELSE
	BEGIN
		INSERT INTO tblUSUARIO(NOMBRE_USUARIO, CLAVE_USUARIO, ROL_USUARIO) VALUES(@NOMBRE_USUARIO, @CLAVE_USUARIO, @ROL_USUARIO)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
	END
END


CREATE PROCEDURE SP_CrearPersona
@ID VARCHAR(10),
@NOMBRE VARCHAR(30),
@CIUDAD VARCHAR(30),
@COD_USUARIO INT
AS
BEGIN
	INSERT INTO tblPERSONA(ID, NOMBRE, CIUDAD,COD_USUARIO) VALUES(@ID, @NOMBRE, @CIUDAD,@COD_USUARIO)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
END


CREATE PROCEDURE SP_CrearPiloto
@ID VARCHAR(10),
@NOMBRE VARCHAR(30),
@DIRECCION VARCHAR(30),
@CIUDAD_RESIDENCIA VARCHAR(30),
@CODIGO_LINEA VARCHAR(10),
@COD_USUARIO INT,
@TELEFONO VARCHAR(20)
AS
BEGIN
	INSERT INTO tblPILOTO(ID, NOMBRE, DIRECCION,CIUDAD_RESIDENCIA, CODIGO_LINEA, COD_USUARIO, TELEFONO) VALUES(@ID, @NOMBRE, @DIRECCION,@CIUDAD_RESIDENCIA, @CODIGO_LINEA, @COD_USUARIO, @TELEFONO)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
END


CREATE PROCEDURE SP_CrearAvion
@CODIGO VARCHAR(10),
@MODELO VARCHAR(20),
@CAPACIDAD INT,
@CODIGO_LINEA VARCHAR(10)
AS
BEGIN
	INSERT INTO tblAVION(CODIGO,MODELO,CAPACIDAD,CODIGO_LINEA) VALUES(@CODIGO,@MODELO,@CAPACIDAD,@CODIGO_LINEA)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
END


CREATE PROCEDURE SP_CrearAeropuerto
@CODIGO VARCHAR(10),
@NOMBRE VARCHAR(30),
@CIUDAD VARCHAR(30),
@PAIS VARCHAR(30),
@ID_RESPONSABLE VARCHAR(10),
@ESTADO VARCHAR(50)
AS
BEGIN
	INSERT INTO tblAEROPUERTO(CODIGO,NOMBRE,CIUDAD,PAIS,ID_RESPONSABLE,ESTADO) VALUES(@CODIGO,@NOMBRE,@CIUDAD,@PAIS,@ID_RESPONSABLE,@ESTADO)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
END


CREATE PROCEDURE SP_CrearEscalaTecnica
@CODIGO VARCHAR(10),
@COD_AEROPUERTO VARCHAR(10)
AS
BEGIN
	INSERT INTO tblESCALA_TECNICA(CODIGO, COD_AEROPUERTO) VALUES(@CODIGO, @COD_AEROPUERTO)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
END


CREATE PROCEDURE SP_CrearVuelo
@CODIGO VARCHAR(10),
@FECHA_partida SMALLDATETIME,
@FECHA_llegada SMALLDATETIME,
@PLAZAS_VACIAS INT,
@IDPILOTO VARCHAR(10),
@COD_AVION VARCHAR(10)
AS
BEGIN
	INSERT INTO tblVUELO(CODIGO, FECHA_partida,FECHA_llegada,PLAZAS_VACIAS,IDPILOTO,COD_AVION) VALUES(@CODIGO, @FECHA_partida,@FECHA_llegada,@PLAZAS_VACIAS,@IDPILOTO,@COD_AVION)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
END


CREATE PROCEDURE SP_CrearPlanVuelo
@CODIGO VARCHAR(10),
@CODIGO_VUELO VARCHAR(10),
@CODIGO_LINEA VARCHAR(10),
@CODIGO_ESCALATECNICA VARCHAR(10),
@AEROPUERTO_PARTIDA VARCHAR(10),
@AEROPUERTO_DESTINO VARCHAR(10)
AS
BEGIN
	INSERT INTO tblPROGRAMA_VUELO(CODIGO,CODIGO_VUELO,CODIGO_LINEA,CODIGO_ESCALATECNICA,AEROPUERTO_PARTIDA,AEROPUERTO_DESTINO) VALUES(@CODIGO,@CODIGO_VUELO,@CODIGO_LINEA,@CODIGO_ESCALATECNICA,@AEROPUERTO_PARTIDA,@AEROPUERTO_DESTINO)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
END


CREATE PROCEDURE SP_CrearLineaAerea
@CODIGO VARCHAR(10),
@NOMBRE VARCHAR(30),
@PAIS VARCHAR(30)
AS
BEGIN
	IF EXISTS(SELECT NOMBRE FROM tblLINEA_AEREA WHERE CODIGO = @CODIGO)
	BEGIN				
		SELECT '0' AS SW,
			   'La linea aerea ya existe'
	END
	ELSE
	BEGIN
		INSERT INTO tblLINEA_AEREA(CODIGO, NOMBRE, PAIS) VALUES(@CODIGO, @NOMBRE, @PAIS)

		SELECT '1' AS SW,
			   'Registro creado correctamente'
	END
END


CREATE PROCEDURE SP_ConsultarPersona
@NOMBRE VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblPERSONA
	WHERE NOMBRE = @NOMBRE

END


CREATE PROCEDURE SP_ValidarPersona (
@ID VARCHAR(10))
AS
BEGIN
	SELECT *	   
	FROM tblPERSONA
	WHERE ID = @ID
END


CREATE PROCEDURE SP_ObtenerCodigoUsuario
@NOMBRE_USUARIO VARCHAR(10)
AS
BEGIN
	SELECT CODIGO_USUARIO
	FROM tblUSUARIO
	WHERE NOMBRE_USUARIO = @NOMBRE_USUARIO

END


CREATE PROCEDURE SP_ConsultarAvion
@CODIGO VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblAVION
	WHERE CODIGO = @CODIGO

END


CREATE PROCEDURE SP_ConsultarLineaAerea
@CODIGO VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblLINEA_AEREA
	WHERE CODIGO = @CODIGO

END


CREATE PROCEDURE SP_ConsultarRol
@NOMBRE_USUARIO VARCHAR(10)
AS
BEGIN
	SELECT ROL_USUARIO	   
	FROM tblUSUARIO
	WHERE NOMBRE_USUARIO = @NOMBRE_USUARIO

END


CREATE PROCEDURE SP_ConsultarAeropuerto
@CODIGO VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblAEROPUERTO
	WHERE CODIGO = @CODIGO

END


CREATE PROCEDURE SP_ConsultarEscalaTecnica
@CODIGO VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblESCALA_TECNICA
	WHERE CODIGO = @CODIGO

END


CREATE PROCEDURE SP_ConsultarPiloto
@ID VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblPILOTO
	WHERE ID = @ID

END


CREATE PROCEDURE SP_ConsultarVuelo
@CODIGO VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblVUELO
	WHERE CODIGO = @CODIGO

END



CREATE PROCEDURE SP_ConsultarPlanVuelo
@CODIGO VARCHAR(10)
AS
BEGIN
	SELECT *	   
	FROM tblPROGRAMA_VUELO
	WHERE CODIGO = @CODIGO

END



CREATE PROCEDURE SP_AsignarAero_LineaAerea
@CODIGO_AEROPUERTO VARCHAR(10),
@CODIGO_LINEA VARCHAR(10)
AS
BEGIN
	INSERT INTO tblLINEA_AEROPUERTO(CODIGO_AEROPUERTO, CODIGO_LINEA) VALUES(@CODIGO_AEROPUERTO, @CODIGO_LINEA)

		SELECT '1' AS SW,
			   'Asignación exitosa'
END
GO




/*******------------------------------ PRUEBAS------------------------------*******/

exec SP_CrearUsuario @NOMBRE_USUARIO = 'usu', @CLAVE_USUARIO='1', @ROL_USUARIO='A'

exec SP_CrearPersona @ID='1017', @NOMBRE='Sebastian', @CIUDAD = 'Medellín',@COD_USUARIO = '101'

GO



