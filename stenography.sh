#!/bin/bash

indice=1

while [ $indice -le 46 ]
do 
	echo $(md5sum /home/unai/Descargas/imagen/imagen$indice.jpg | grep "e5ed313192776744b9b93b1320b5e268")
	indice=$(($indice+1))
done
