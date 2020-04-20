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
            df -Th -Bk
        elif echo $opcion | grep -Eq '3'
        then
            echo opcion 3
        elif echo $opcion | grep -Eq '4'
        then
            echo opcion 4
        elif echo $opcion | grep -Eq '5'
        then
            echo opcion 5
        else
            echo $opcion no es una opcion valida
        fi
    else
        echo $opcion no es una opcion valida
    fi
done

