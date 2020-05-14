############################
# STEP 1 build executable binary
############################
FROM golang:1.13-alpine
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git
# GCC Compiler (github.com/herumi/bls-eth-go-binary need)
RUN apk add build-base
WORKDIR $GOPATH/src/bloxapp/walletd
COPY . .
COPY ./data/config/stage /data/config/stage
# Fetch dependencies.
# Using go get.
#RUN go get -d -v
# Build the binary.
RUN GOOS=linux GOARCH=amd64 go build -o /go/bin/walletd