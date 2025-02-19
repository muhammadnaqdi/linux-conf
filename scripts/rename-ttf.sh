#!/bin/bash

list=(*.ttf)

for i in ${list[@]};
do
    mv $i $(fc-scan $i | grep -oP 'fullname:\s*"\K.*(?=")' | sed 's/ /-/g' | xargs -i echo {}.ttf)
done
