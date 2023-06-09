#!/bin/bash

dir=$(ls -l | tr -s ' ' '\t' | cut -f '3' | sort -u)
for i in $dir; do
    mkdir -p $i
done
folder=$(ls -l | tr -s ' ' '\t' | cut -f '3 9')
count=0
for i in $folder; do
    count=$((count+1))
    if (($count%2))
        then
            dir=$i
            echo $dir was checked
        else
            if [ -f ./$i ]
                then
                cp ./$i ./$dir/$i
            fi
    fi
done