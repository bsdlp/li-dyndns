#!/bin/sh

# absolute path to this script
SCRIPTPATH=$( builtin cd $(dirname $0) ; pwd -P )

CONFIGFILE=$SCRIPTPATH/../config
MYIP=''

# load up the config
. $CONFIGFILE

MYIP=$(curl -s $EXTURL)

if grep -Fxq "$MYIP" $IPCACHEFILE then
    echo "IP address ($MYIP) has not changed, aborting."
else
    echo "New IP address: $MYIP, updating DNS record."
    curl -s 'https://$API_ENDPOINT/?api_key=$APIKEY&api_action=domain.resource.update&domainid=$DOMAINID&resourceid=$RESOURCEID'
fi

