<?php

#$url = "/moodle/aaa/test.php";

$url = $_SERVER['REQUEST_URI'];
$schoolid = explode("/", $url)[2];

print_r($schoolid);

#print "\n";


phpinfo();

?>
