FROM golang:1.22-alpine

WORKDIR /app 

COPY . .

RUN go mod download
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main_app
CMD ["/main_app"]
