FROM centos:centos7

RUN yum install -y git
RUN yum install -y golang
RUN yum install -y patch

ENV GOPATH /

RUN go get github.com/elazarl/goproxy
RUN go get github.com/inconshreveable/go-vhost/

RUN yum remove -y git

ADD patches/EDITME /patch

WORKDIR /src/github.com/elazarl/goproxy/examples/goproxy-transparent
RUN patch < /patch

#ENTRYPOINT ["bash"]
ENTRYPOINT ["go", "run", "/src/github.com/elazarl/goproxy/examples/goproxy-transparent/transparent.go"]

