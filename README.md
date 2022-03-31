# Local Squid Setup

Setup:

Make space on your hard drive for the cache:
```
mkdir ./cache
```

Make that directory world read-writeable.

This is not great for security, but the proxy user in the container has
its own user id and needs to be able to save the files it's grabbing.
```
sudo chmod 777 ./cache
```

Build the squid container.
```
podman build . -t squid
```

Now run it:
```
podman run --network host -i -t --rm -v $PWD/cache:/var/spool/squid3 -v ~/Develop/squid/squid.conf:/opt/squid.conf localhost/squid
```

To test, build the test container once:
```
podman build --network host --no-cache --build-arg http_proxy=http://127.0.0.1:3128 -f ./Dockerfile.test
```

Now disconnect from the internet and try again.

