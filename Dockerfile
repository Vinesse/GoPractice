FROM golang:1.7.3 as builder
WORKDIR GoPractice/src/server
# RUN go get -d -v golang.org/x/net/html  
COPY server.go    .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /GoPractice/src/server .

# executable
ENTRYPOINT [ "./server" ]
# arguments that can be overridden
CMD ["./server"]