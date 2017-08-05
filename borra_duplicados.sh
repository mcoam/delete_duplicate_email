#!/bin/sh
# Delete all duplicate messages in all folders of said account.
# Note that we connect through SSL (-x) to the default port.

SERVER="mail.server.cl"
USER="xxx@damin.com"
PASS="p@ssword"

### LISTA TODO LAS CARPETAS DEL USUARIO
/root/imapdedup.py -s $SERVER -x -u $USER -w $PASS -l > /tmp/USER  

### SE RECORRE EL ARCHIVO DE LAS CARPETAS Y SE VA BORRANDO LOS DUPLICADOS
while read folder
do
  /usr/bin/python /root/imapdedup.py -s $SERVER -x -u $USER -w $PASS "$folder" 
done < /tmp/USER
