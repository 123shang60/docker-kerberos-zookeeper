FROM zookeeper:3.4.13

RUN apk add --no-cache \
    krb5-server \
    krb5-libs

EXPOSE 88 749 2181 2888 3888

ADD ./krb5.conf /etc/krb5.conf
ADD	./kerberos_setup.sh /root/kerberos_setup.sh

RUN chmod 0644 /etc/krb5.conf && \
    chown root:root /etc/krb5.conf && \
    chmod +x /root/kerberos_setup.sh && \
    exec /root/kerberos_setup.sh

ADD	./jaas.conf /conf/jaas.conf
ADD	./java.env /conf/java.env
ADD	./zoo.cfg /conf/zoo.cfg
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]
