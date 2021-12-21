FROM golang:alpine
WORKDIR /go/src/app
ADD main.go-v1 main.go
RUN go get -u github.com/lib/pq
RUN go mod init
RUN go mod tidy
RUN go build -o /webapp
EXPOSE 8080
CMD ["./webapp"]
