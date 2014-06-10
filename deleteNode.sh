#!/bin/bash

knife ec2 server delete -N $1 -P $(knife ec2 server list | grep $1 | grep -v terminated | tr -s ' ' | cut -d' ' -f1) --yes
