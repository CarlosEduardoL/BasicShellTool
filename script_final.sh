#!/bin/bash

while :
do

    echo ¿Que desea hacer?
    echo 1. Desplegar los cinco procesos que más CPU esté consumiendo en ese momento.
    echo 2. Desplegar los filesystems o discos conectados a la máquina
    echo 3. Desplegar el nombre y el tamaño del archivo más grande almacenado en un disco o filesystem
    echo 4. Desplegar la cantidad de memoria libre y cantidad del espacio de swap en uso
    echo 5. Desplegar el número de conexiones de red activas actualmente

    read opcion
    if echo $opcion | grep -Eq '[0-9]'
    then
        if echo $opcion | grep -Eq '1'
        then
            ps -ao pcpu,pid,user,comm --sort=-pcpu | head -n 6
        elif echo $opcion | grep -Eq '2'
        then
            df -Th -Bk | grep '/dev/sd'
        elif echo $opcion | grep -Eq '3'
        then
            echo porfavor ingrese la ruta del archivo o filesystem
            read route
             ls -1Rhs $route | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n 1
        elif echo $opcion | grep -Eq '4'
        then
            free | grep Mem | awk '{ printf("RAM\nEn uso: %iB %.4f%s\nLibre:%iB %.4f%s\nDisponible:%iB %.4f%s\n", $3, $3/$2 * 100.0, "%", $4, $4/$2 * 100.0, "%", $7, $7/$2 * 100.0, "%") }'
            free | grep Swap | awk '{ printf("Swap\nEn uso: %iB %.4f%s\nLibre:%iB %.4f%s\n", $3, $3/$2 * 100.0, "%", $4, $4/$2 * 100.0, "%") }'

        elif echo $opcion | grep -Eq '5'
        then
            echo opcion 5
        else
            echo $opcion no es una opcion valida
        fi
    else
        echo $opcion no es una opcion valida
    fi
    read garbage
done

