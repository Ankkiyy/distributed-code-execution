FROM golang:1.22-alpine AS builder
WORKDIR /app

COPY go.mod ./
COPY cmd ./cmd

RUN go build -o /bin/api ./cmd/api

FROM alpine:3.20
COPY --from=builder /bin/api /usr/local/bin/api
EXPOSE 8080
CMD ["/usr/local/bin/api"]
