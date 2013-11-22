#!/bin/sh

# absolute path to this script
SCRIPTPATH=$( builtin cd $(dirname $0) ; pwd -P )

CONFIGFILE=$SCRIPTPATH/../config
MYIP=''

# load up the config
. $CONFIGFILE

MYIP=$(curl -s $EXTURL)

curl -s 'https://$API_ENDPOINT/?api_key=$APIKEY&api_action=domain.resource.update&domainid=$DOMAINID&resourceid=$RESOURCEID'

