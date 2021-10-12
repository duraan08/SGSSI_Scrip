#!/bin/bash

#Funciones para llevar acabo el backup de los archivos de la carpeta /home/user/Escritorio/Seguridad#


#Previamente se crea una carpeta general donde se guardaran los backups en la direccion /var/tmp/Backups/#
#Dentro de la carpeta crearemos dos carpetas --> una para el backup de los archivos de Seguridad
                                                #--> otra para backup de la BD de MySQL
fecha=`date +%d-%m-%y`
fechaAnt=`date -d yesterday +%d-%m-%y`                              
cd /var/tmp/Backups/SGSSI/Sec
mkdir $fecha
cd /var/tmp/Backups/SGSSI/Sec
fech=`(ls | grep $fechaAnt)`
if [ -z $fech ]
then
  cd /var/tmp/Backups/SGSSI/Sec
  mkdir $fechaAnt
  cd /home/unai/Escritorio
  rsync -av /var/tmp/Backups/SGSSI/Sec/$fechaAnt /home/unai/Escritorio/Seguridad
else
  cd /home/unai/Escritorio          
  rsync -av --link-dest=/var/tmp/Backups/SGSSI/Sec/$fechaAnt . Seguridad/var/tmp/Backups/SGSSI/Sec/$fecha
fi 
cd /var/tmp/Backups/SGSSI/BD
mkdir $fecha
mysqldump -u 'unai' -p'1384001u.D' 'SGSSI' > /var/tmp/Backups/SGSSI/BD/$fecha/backup_SGSSI.sql 
