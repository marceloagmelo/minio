#!/bin/bash

if [ -d "/etc/certificates" ];then
   #keystore=/etc/pki/java/cacerts
   keystore=/etc/pki/ca-trust/extracted/java/cacerts

   echo "Importing trusted CA certificates"
   echo "Acessando Directorio /etc/certificates"

   pushd $APP_HOME
   cd /etc/certificates/

   for certfile in `ls *.pem *.cert *.cer *.crt 2>/dev/null`
   do
       keytool -import -noprompt -alias $certfile -keystore $keystore -storepass changeit -file $certfile
   done

   popd
fi
