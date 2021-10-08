<?php

require '/app/vendor/autoload.php';

use Monolog\Handler\SyslogHandler;                                              
use Monolog\Logger;  


$log = new Logger('app');
$syslog = new SyslogHandler('local1', 'local1', Logger::INFO);
$log->pushHandler($syslog);
$log->info('This is local1 info');

