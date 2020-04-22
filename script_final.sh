#!/bin/bash

figlet -f mono12.tlf BashTool

## COLORES 
RED='\033[0;31m'	# color rojo
NC='\033[0m' 		# sin color

while :
do
## MENU DE OPCIONES 
    echo ¿Que desea hacer?
    echo 1. Desplegar los cinco procesos que más CPU esté consumiendo en ese momento.
    echo 2. Desplegar los filesystems o discos conectados a la máquina
    echo 3. Desplegar el nombre y el tamaño del archivo más grande almacenado en un disco o filesystem
    echo 4. Desplegar la cantidad de memoria libre y cantidad del espacio de swap en uso
    echo 5. Desplegar el número de conexiones de red activas actualmente
    echo 6. salir del programa

    read opcion
    case $opcion in
	    1) ps -ao pcpu,pid,user,comm --sort=-pcpu | head -n 6;;
	
	    2) df -Th -Bk | grep '/dev/sd';;

	    3) echo porfavor ingrese la ruta del archivo o filesystem
	       read route
	       ls -1Rhs $route | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n 1;;

	    4) free | grep Mem | awk '{ printf("RAM\nEn uso: %iB %.4f%s\nLibre:%iB %.4f%s\nDisponible:%iB %.4f%s\n", $3, $3/$2 * 100.0, "%", $4, $4/$2 * 100.0, "%", $7, $7/$2 * 100.0, "%") }'

            free | grep Swap | awk '{ printf("Swap\nEn uso: %iB %.4f%s\nLibre:%iB %.4f%s\n", $3, $3/$2 * 100.0, "%", $4, $4/$2 * 100.0, "%") }';;

            5) nmcli d wifi;;

	    6) figlet -f mono12.tlf Bye! 
		exit 1;;

	    *) echo -e "${RED} ERROr >>> $opcion no es una entrada valida" 
	       echo -e "${NC}"
    esac 
done

