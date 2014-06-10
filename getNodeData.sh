#!/bin/bash

knife search name:${1} > node_data

FQDN=$(grep <node_data FQDN| tr -s ' ' | cut -d' ' -f2)
IP=$(grep <node_data IP | tr -s ' ' | cut -d' ' -f2)
EXTIP=$IP  # The IP returned by knife search is the external address.
           # Fix it to parse the FQDN for the internal address if
           # that is required, and use the parsing command for IP
           # for EXTIP.
rm node_data # Remove the tmp file.

echo WEB=${FQDN} >> params_test.txt
echo WEBIP=${IP} >> params_test.txt
echo EXTWEBIP=${EXTIP} >> params_test.txt
