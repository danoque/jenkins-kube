FROM golang:1.18
RUN mkdir /go/src/app && apk update && apk add git
ADD main.go /go/src/app/
ADD go.mod /go/
ADD go.mod /go/src/
ADD go.mod /go/src/app/
WORKDIR /go/src/app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o app .
ENTRYPOINT [ "./app" ]
