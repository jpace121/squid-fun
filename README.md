# Local Squid Setup

Build the squid container.
```
podman build . -t squid
```

Now run it:
```
podmarun --rm --network=host -v squid-volume:/var/spool/squid localhost/squid
```

To test, build the test container once:
```
podman build --network host --no-cache --build-arg http_proxy=http://127.0.0.1:3128 -f ./Dockerfile.test
```

Now disconnect from the internet and try again.

