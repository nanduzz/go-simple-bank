# Buil stage
FROM golang:1.23-alpine3.20 as builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

# Run stage

EXPOSE 8080
FROM alpine:3.20
WORKDIR /app

COPY --from=builder /app/main .
COPY app.env .

CMD ["/app/main"]