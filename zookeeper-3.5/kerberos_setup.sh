#!/bin/bash

# KDC master key is "kerberos"
/usr/sbin/kdb5_util -P kerberos create -s

cd /conf

kadmin.local <<EOF
addprinc root/admin
kerberos
kerberos
addprinc -randkey zookeeper/kerberos.example.com@EXAMPLE.COM
addprinc -randkey zookeeper-client@EXAMPLE.COM
xst -k zookeeper.keytab zookeeper/kerberos.example.com@EXAMPLE.COM
xst -k zookeeper-client.keytab zookeeper-client@EXAMPLE.COM
exit
EOF

krb5kdc restart
kadmind
