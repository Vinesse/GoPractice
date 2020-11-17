FROM golang:1.15 as builder
WORKDIR GoPractice/src/server
# RUN go get -d -v golang.org/x/net/html  
COPY server.go    .

FROM alpine3.12 
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /GoPractice/src/server .

# arguments that can be overridden
CMD ["./server"]
