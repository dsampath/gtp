
Launch a containerized transparent http proxy that can use one of three
different Cookie: values, depending upon which of a set of patch files
is provided when the container is built.

    $ make (or 'make Cookie')

	inserts 'Cookie: value'

    $ make Cookie-1

	inserts 'Cookie: 1'

    $ make Cookie-2

	inserts 'Cookie: 2'

Example output:

    $ make Cookie
    ./Cookie
    Sending build context to Docker daemon  7.68 kB
    Sending build context to Docker daemon 
    Step 0 : FROM centos:centos7
     ---> 88f9454e60dd
    Step 1 : RUN yum install -y git
     ---> Using cache
     ---> 2da6353e85c9
    Step 2 : RUN yum install -y golang
     ---> Using cache
     ---> 3d5023fa4b81
    Step 3 : RUN yum install -y patch
     ---> Using cache
     ---> a4c00d0a1253
    Step 4 : ENV GOPATH /
     ---> Using cache
     ---> 80879a6e2a1a
    Step 5 : RUN go get github.com/elazarl/goproxy
     ---> Using cache
     ---> e9db44871ce7
    Step 6 : RUN go get github.com/inconshreveable/go-vhost/
     ---> Using cache
     ---> 01b6581ec3fe
    Step 7 : RUN yum remove -y git
     ---> Using cache
     ---> ed28baf4072c
    Step 8 : ADD patches/Cookie /patch
     ---> Using cache
     ---> 17b2b154fca7
    Step 9 : WORKDIR /src/github.com/elazarl/goproxy/examples/goproxy-transparent
     ---> Using cache
     ---> 745b4bbc6499
    Step 10 : RUN patch < /patch
     ---> Using cache
     ---> ae812c8a5d5f
    Step 11 : ENTRYPOINT ["go", "run", "/src/github.com/elazarl/goproxy/examples/goproxy-transparent/transparent.go"]
     ---> Using cache
     ---> 36bd3db4005e
    Successfully built 36bd3db4005e
    2015/03/06 01:25:51 Server starting up! - configured to listen on http interface :3129 and https interface :3128
    2015/03/06 01:25:57 [001] INFO: Got request / www.google.com GET http://www.google.com/
    2015/03/06 01:25:57 Cookie header added
    2015/03/06 01:25:57 [001] INFO: Sending request GET http://www.google.com/
    2015/03/06 01:25:57 [001] INFO: Received response 200 OK
    2015/03/06 01:25:57 [001] INFO: Copying response to client 200 OK [200]
    2015/03/06 01:25:57 [001] INFO: Copied 19957 bytes to client error=<nil>

