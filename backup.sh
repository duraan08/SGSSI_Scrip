#!/bin/bash

#Funciones para llevar acabo el backup de los archivos de la carpeta /home/user/Escritorio/Seguridad#


#Previamente se crea una carpeta general donde se guardaran los backups en la direccion /var/tmp/Backups/#
#Dentro de la carpeta crearemos dos carpetas --> una para el backup de los archivos de Seguridad
                                                #--> otra para backup de la BD de MySQL
fecha=`date +%d-%m-%y`
fechaAnt=`date -d yesterday +%d-%m-%y`                              
cd /var/tmp/Backups/SGSSI/Sec
fech1=`(ls | grep $fecha)`
if [ -z $fech1 ]
then 
	
	mkdir /var/tmp/Backups/SGSSI/Sec/$fecha
fi

fech=`(ls | grep $fechaAnt)`
if [ -z $fech ]
then
 
  mkdir /var/tmp/Backups/SGSSI/Sec/$fechaAnt
  cd /home/unai/Escritorio
  rsync -av  /home/unai/Escritorio/Seguridad /var/tmp/Backups/SGSSI/Sec/$fechaAnt
  
fi 
  
cd /home/unai/Escritorio/Seguridad        
rsync -av --link-dest=/var/tmp/Backups/SGSSI/Sec/$fechaAnt . /var/tmp/Backups/SGSSI/Sec/$fecha

cd /var/tmp/Backups/SGSSI/BD
mkdir $fecha
mysqldump -u 'unai' -p'1384001u.D' 'SGSSI' > /var/tmp/Backups/SGSSI/BD/$fecha/backup_SGSSI.sql 

## Después se ejecuta en la terminal --> crontab -e ##
## Escribimos en el editor de texto lo siguiente --> 0 12 * * * ##
# 1º posicion --> minutos # 2º posicion --> horas # 3º posicion --> dia del mes # 4º posicion --> mes  # 5º posicion --> dia de la semana 
