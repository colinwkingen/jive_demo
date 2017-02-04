#!/bin/bash

EXPECTED_ARGS=2
E_BADARGS=65
MYSQL=`which mysql`
  
Q1="CREATE DATABASE IF NOT EXISTS jive_demo"
Q2="GRANT USAGE ON jive_demo TO $2@localhost IDENTIFIED BY '$3';"
Q3="GRANT ALL PRIVILEGES ON jive_demo TO $2@localhost;"
Q4="CREATE TABLE `jive_demo`.`environment` (
	`name` VARCHAR( 10 ) NOT NULL , 
	`version` VARCHAR( 10 ) NOT NULL ,
	`notes` VARCHAR( 300 ) ,
	PRIMARY KEY ( `name` )
); 
Q5= Engine = InnoDB;
Q6= INSERT INTO `jive_demo`.`environment` (`name`, `version`, `notes`)
 VALUES ('Ubuntu', '14.04', 'Fresh Install');
Q7= INSERT INTO `jive_demo`.`environment` (`name`, `version`, `notes`)
 VALUES ('Windows', '7', 'Totally the best Windows.');
 
 SQL="{Q1}${Q2}${Q3}${Q4}${Q5}${Q6}${Q7}"
 
 if [ $# -ne $EXPECTED_ARGS ]
 then 
 	echo "Usage: $0 dbuser dbpass"
 	exit $E_BADARGS
 fi
 
 $MYSQL -uroot -p -e "$SQL"