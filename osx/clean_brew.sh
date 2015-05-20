#!/bin/bash
 
if [ "$#" -ne "1" ]; then
    echo "Usage: $0 package_list"
    exit 1
fi
 
cat $1 | xargs -I {} bash -c "echo {}; brew deps {}" | sort | uniq > /tmp/brew_keep
comm -23 <(brew list -1 | sort) <(cat /tmp/brew_keep) > /tmp/brew_rm
lines=$(cat /tmp/brew_rm | wc -l | sed -e 's/ //g')
if [ "$lines" -ne "0" ]; then
    echo "Remove the following packages?"
    cat /tmp/brew_rm
    read -p "Remove? [yn]" ans
    if [ "$ans" == "y" ]; then
        brew rm $(cat /tmp/brew_rm)
    fi
else
    echo "All clean"
fi
rm -f /tmp/brew_keep /tmp/brew_rm
