FROM golang:1.15 as builder
WORKDIR /GoPractice/src/server
COPY server.go    .
RUN GOOS=linux go build -a -o app .

FROM alpine3.12 
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /GoPractice/src/server .

CMD ["./server"]
