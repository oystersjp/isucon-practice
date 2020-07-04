FROM golang:1.14-alpine

RUN apk add --no-cache make git vim

WORKDIR /go/src/isucon
