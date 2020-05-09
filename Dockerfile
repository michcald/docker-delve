FROM golang:1.14.2-alpine3.11

# installing git
RUN apk update && apk upgrade && \
    apk add --no-cache git \
        dpkg \
        gcc \
        git \
        musl-dev

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN go get github.com/go-delve/delve/cmd/dlv

WORKDIR /go/src/work
COPY . /go/src/work

RUN cd /go/src/work

#your users do want to debug their tests so you should also provide some way to build the test executable (equivalent to go test -c --gcflags='all=-N -l') and pass it to Delve.

RUN go build -o app -gcflags 'all=-N -l'

### Run the Delve debugger ###

CMD dlv debug --headless --log -l 0.0.0.0:2345 --api-version=2 app