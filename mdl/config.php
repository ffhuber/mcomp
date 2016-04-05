<?php
unset($CFG);  // Ignore this line
global $CFG;  // This is necessary here for PHPUnit execution
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';      // 'pgsql', 'mariadb', 'mysqli', 'mssql', 'sqlsrv' or 'oci'
$CFG->dblibrary = 'native';     // 'native' only at the moment
$CFG->dbhost    = 'DBHOST';  // eg 'localhost' or 'db.isp.com' or IP
$CFG->dbname    = 'DBNAME';     // database name, eg moodle
$CFG->dbuser    = 'DBUSER';   // your database username
$CFG->dbpass    = 'DBPASS';   // your database password
$CFG->prefix    = 'mdl_';       // prefix to use for all table names
$CFG->dboptions = array(
    'dbpersist' => false,       // should persistent database connections be
    'dbsocket'  => false,       // should connection via UNIX socket be used?
    'dbport'    => '',          // the TCP port number to use when connecting
);
# $CFG->wwwroot   = 'http://example.com/moodle';
# $CFG->dataroot  = '/var/moodledata';
$CFG->directorypermissions = 02777;
$CFG->admin = 'admin';

### TENANCY MANAGEMENT  ########################
$myhost = "";
$proxy = 'false';
### REDIS ARRAY ##################################
### 0     DB user
### 1     DB

$url = $_SERVER['REQUEST_URI'];
$schoolid = explode("/", $url)[2];

#print "schoolid: $schoolid<br>";

$CFG->dbname=$schoolid;
$CFG->dataroot="/var/moodledata/$schoolid";
$CFG->wwwroot="http://www.pulse.pearson.com:8080/moodle/$schoolid";
require_once(dirname(__FILE__) . '/lib/setup.php');
