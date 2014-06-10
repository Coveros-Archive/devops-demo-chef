#!/bin/bash
knife ec2 server list | grep $1 | grep -v terminated | tr -s ' ' | cut -d' ' -f1
