![Kopius Logo](dashboard/img/logo-s.png)

# Backend for Kopius players registration
Table of contents:

* [Introduction](#introduction)
* [System requirements](#system-requirements)
* [Installation](#installation)

<a name="introduction" />

## Introduction

This is the backend for Kopius players registration for the Hackathon 2023 event.
It allows registering, editing and deleting users. In addition to exporting the complete list of them.


<a name="system-requirements" />

## System requirements

- Database
    - MariaDB
        - Version 10.0 or higher.
    - MySQL
        - Version 5.0 or higher.
    - PostgreSQL
        - Version 9.6 or higher.
    - MSSQL
        - Version 13 or higher.
- PHP
    - Version 5.1 or higher.
- Web server
    - Apache 2.0 or higher
    - Nginx 1.0 or higher
    - IIS 7.0 or higher

<a name="installation" />

## Installation

The following is a quick installation overview. 

1. Create a database for the backend.<br>
   Create a database (e.g.: kopius). Then import the tables from the kopius.sql file and set the connection data in the file bd/conexion.php
   
2. Create a directory in your server for the backend files.<br>
   In the site directory of the server, create a folder and copy into it the files of the current project (e.g.: kopius).
