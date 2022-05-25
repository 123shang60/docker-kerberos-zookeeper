# docker-kerberos-zookeeper
Docker images for Zookeeper with Kerberos environment.

[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/123shang60/docker-kerberos-zookeeper/master/pwd-stack.yml)

## How to use it
The configured realm is "EXAMPLE.COM" where the kdc must be accessible througt "kerberos.example.com". To launch the container use:
```
docker run -h kerberos.example.com -v /dev/urandom:/dev/random ssorriaux/kerberos-zookeeper:${VERSION}
```
Where VERSION can be `3.4.13`, `3.5.4-beta` or `latest`.

## How can I connect
The 2 following principals are available inside the container:

* zookeeper/kerberos.example.com@EXAMPLE.COM (keytab is /conf/zookeeper.keytab)
* zookeeper-client@EXAMPLE.COM (keytab is /conf/zookeeper-client.keytab)

Have a look to `kerberos_setup.sh` for the KDC master key password or `root/admin@EXAMPLE.COM` principal.

If you want to connect using the `zkCli.sh` script, use:
```
/zookeeper-${VERSION/bin/zkCli.sh -server kerberos.example.com:2181
```

## Contributing
Have fun.