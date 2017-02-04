CREATE DATABASE IF NOT EXISTS colin_jive_demo; 
CREATE USER IF NOT EXISTS 'colin_demo'@'localhost' IDENTIFIED BY 'Colin_32';
USE colin_jive_demo
GRANT ALL PRIVILEGES ON colin_jive_demo.* TO 'colin_demo'@'localhost' IDENTIFIED BY 'Colin_32';
CREATE TABLE IF NOT EXISTS colin_jive_demo.environment (name VARCHAR( 10 ) NOT NULL, version VARCHAR( 10 ) NOT NULL, notes VARCHAR( 300 ));
ALTER TABLE colin_jive_demo.environment ADD COLUMN id INT(10) UNSIGNED PRIMARY KEY AUTO_INCREMENT;
FLUSH PRIVILEGES; 
