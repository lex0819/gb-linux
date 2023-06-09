#!/bin/bash

read -p "Введите путь к директории: " CLEARDIR

if [ -e $CLEARDIR ]
    then
        echo 'Директория найдена'
        cd $CLEARDIR
        echo 'Идет очистка...'
        rm -v *.tmp *.bak *.backup
        echo 'Очищено успешно'
else
        echo 'Директория не найдена!'
        exit 2
fi
