#!/bin/bash
#####################################################
#title           :docker-entrypoint.sh
#description     :This script is a starter script for docker.
#author		 :rlaborius
#date            :20141211
#version         :0.1    


set -e

if [ ! -f /etc/apache2/certs/server_key.pem ]; then
	mkdir -p /etc/apache2/certs
        KEY=/etc/apache2/certs/server_key.pem
        DOMAIN=$SSL_CN

#######
# Edit for your needs.
# Please don't edit commonName ! The commonName will be added as commandline option
	
SUBJ="
C=DE
ST=Germany
O=Tec
localityName=Karlsruhe
commonName=$DOMAIN
organizationalUnitName=
emailAddress=rl@ocedo.com"

#
#######

openssl req -x509 -nodes -days 3650 -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -newkey rsa:1024 -keyout /etc/apache2/certs/server_key.pem -out /etc/apache2/certs/server_cert.pem

fi

exec "$@"
