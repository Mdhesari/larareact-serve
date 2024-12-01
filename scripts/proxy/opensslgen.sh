
#!/bin/sh

if [ "$#" -ne 1 ]
then
  echo "Usage: Must supply a domain"
  exit 1
fi

DOMAIN=$1
SSLPATH=${2:-"../../docker/proxy/ssl"}
CAKEY=${2:-"./myCA.key"}
CAPEM=${3:-"./myCA.pem"}

openssl genrsa -out $SSLPATH/$DOMAIN.key 2048
openssl req -new -key $SSLPATH/$DOMAIN.key -out $SSLPATH/$DOMAIN.csr

cat > $SSLPATH/$DOMAIN.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN
EOF

openssl x509 -req -in $SSLPATH/$DOMAIN.csr -CA $CAPEM -CAkey $CAKEY -CAcreateserial \
-out $SSLPATH/$DOMAIN.crt -days 825 -sha256 -extfile $SSLPATH/$DOMAIN.ext

