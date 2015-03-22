<?php

/*	database connection details
 ******************************/
$db['host'] = getenv('MYSQL_HOST');
$db['user'] = getenv('MYSQL_USER');
$db['pass'] = getenv('MYSQL_PASSWORD');
$db['name'] = getenv('MYSQL_DB');

/**
 * php debugging on/off
 *
 * true  = SHOW all php errors
 * false = HIDE all php errors
 ******************************/
$debugging = false;

$phpsessname = "phpipam";


/**	
 *	BASE definition if phpipam 
 * 	is not in root directory (e.g. /phpipam/)
 *
 *  Also change 
 *	RewriteBase / in .htaccess
 ******************************/
define('BASE', "/");

?>
