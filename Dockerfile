############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git
# GCC Compiler (github.com/herumi/bls-eth-go-binary need)
RUN apk add build-base
WORKDIR $GOPATH/src/bloxapp/walletd
COPY . .
# Fetch dependencies.
# Using go get.
#RUN go get -d -v
# Build the binary.
RUN GOOS=linux GOARCH=amd64 go build -o /go/bin/walletd
############################
# STEP 2 build a small image
############################
#FROM scratch
# Copy our static executable.
#COPY --from=builder /go/bin/walletd /go/bin/walletd
# Run the walletd binary.
#ENTRYPOINT ["/go/bin/walletd"]