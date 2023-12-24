FROM golang:latest as builder
WORKDIR /src
COPY src/. .
RUN GOOS=linux GOARCH=amd64 go build -o hello ./main.go

FROM scratch
COPY --from=builder /src /app
CMD ["./app/hello"]