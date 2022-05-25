FROM zookeeper:3.8.0

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y krb5-user libpam-krb5 libpam-ccreds libkrb5-dev krb5-kdc krb5-admin-server && rm -rf /var/lib/apt/lists/* 

EXPOSE 88 749 2181 2888 3888 8080

ADD ./krb5.conf /etc/krb5.conf
ADD ./kadm5.acl /etc/krb5kdc/kadm5.acl
ADD	./kerberos_setup.sh /root/kerberos_setup.sh

RUN chmod 0644 /etc/krb5.conf && \
    chown root:root /etc/krb5.conf && \
    chown root:root /etc/krb5kdc/kadm5.acl && \
    chmod +x /root/kerberos_setup.sh && \
    exec /root/kerberos_setup.sh

ADD	./jaas.conf /conf/jaas.conf
ADD	./java.env /conf/java.env
ADD	./zoo.cfg /conf/zoo.cfg
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]
