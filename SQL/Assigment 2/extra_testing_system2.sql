DROP DATABASE IF EXISTS fresher;
CREATE DATABASE fresher;
USE fresher;
DROP TABLE IF EXISTS trainee;
CREATE TABLE trainee(
trainee_id			SMALLINT UNSIGNED PRIMARY KEY,
full_name			VARCHAR(50) NOT NULL,
birth_date			DATE NOT NULL,
gender				ENUM('male','female','unknonw'),
et_iq				TINYINT UNSIGNED CHECK(et_iq >=0 && et_iq <=20),
et_gmath			TINYINT UNSIGNED CHECK(et_gmath >=0 && et_gmath <=20),
et_english			TINYINT	UNSIGNED CHECK(et_english >=0 && et_english <=50),
traning_class		VARCHAR(50),
evaluation_notes	TEXT,
vti_account			VARCHAR(100) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS id;
CREATE TABLE id(
id					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`name`				VARCHAR(50),
code				CHAR(5),
modified_date		DATETIME, 
birth_date			DATE,
gender				ENUM('male','female','unknow'),
is_deleted_flag		ENUM('0','1')
);