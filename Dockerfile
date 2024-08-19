# Buil stage
FROM golang:1.23-alpine3.20 as builder
WORKDIR /app
COPY . .
RUN go build -o main main.go
RUN apk add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.17.1/migrate.linux-amd64.tar.gz | tar xvz

# Run stage

EXPOSE 8080
FROM alpine:3.20
RUN apk add --no-cache bash
WORKDIR /app
COPY --from=builder /app/main .
COPY --from=builder /app/migrate ./migrate
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./migration

CMD ["/app/main"]

ENTRYPOINT ["/app/start.sh"]