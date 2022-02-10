<?php 

/**
configuration for database connection
*/
$host = "localhost:3308";
$username="root";
$password="";
$dbname="example";
$dsn="mysql:host=$host;dbname=$dbname";
$options=array(
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            );