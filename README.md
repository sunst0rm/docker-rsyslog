# Docker-rsyslog

This is a simple project made to invent a mechanism for sending php logs to docker stdout using docker-compose and Monolog.

## Description and how to use?

There are three (or more - add them in docker-compose) containers:
- first one `monolog-rsyslog` is a base which forwards php logs from file1.php and file2.php
- second one - `monolog-local0` views  `local0` logs in stdout from file0.php
- third one - `monolog-local1` views `local0` logs in stdout from file1.php

`cmd.sh` runs rsyslog and cron daemons in containers.

`crontab` is responsible for running php files every minute

`file0.php` / `file2.php` - these are test files, which include Monolog module - you need to copy specific instructions from them to your php app, according to your needs.

`rsyslog.conf` this is a base container config file:

Definition of TCP protocol and 514 port:

```
$ModLoad imtcp
$InputTCPServerRun 514
```

Definition of logs and where to send them regarding to facility/prority:

```
local0.*                      @@monolog-local0:514
local1.*                      @@monolog-local1:514
```

`rsysloginfo.conf`  rsyslog config file for receivers

## Getting Started

### What do you need?

* docker
* docker-compose

### Installing

* Open project's directory and type `docker-compose up`
* Modify number of containers, port, remove crontab, modify rsyslog etc. according to your needs.

## Author

Jarosław Kozioł
[@linkedin](https://www.linkedin.com/in/jaroslaw-koziol/)

## Version History

* 0.1
    * Initial release

## Acknowledgments

Inspired by projects from:
* [ helderco ](https://github.com/helderco)
* [ fabriziogaliano ](https://github.com/fabriziogaliano)
* [ jpetazzo ](https://github.com/jpetazzo)