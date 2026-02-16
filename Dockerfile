FROM golang:latest as builder 
WORKDIR /app 
COPY . .
RUN go build -o main .
FROM alpine:latest 
WORKDIR /root/ 
COPY --from=builder /app/main . 
ENTRYPOINT ["./main"]
