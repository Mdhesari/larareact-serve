
#!/bin/sh

if [ "$#" -ne 1 ]
then
  echo "Usage: Must supply a domain"
  exit 1
fi

DOMAIN=$1
SSLPATH=${2:-"../../docker/proxy/ssl"}

mkcert --key-file $SSLPATH/$DOMAIN.key --cert-file $SSLPATH/$DOMAIN.crt $DOMAIN