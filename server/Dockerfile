# Build Stage 
FROM arm64v8/golang:1.19-alpine3.17 AS builder

WORKDIR /app

COPY . .

RUN apk add curl 
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-amd64.tar.gz | tar xvz
RUN go build -o main main.go


# Run Stage 

FROM arm64v8/alpine:3.17

WORKDIR /app

COPY wait-for .
COPY --from=builder /app/main .
COPY --from=builder /app/migrate .
COPY db/migration ./migration
COPY .env .
COPY start.sh .

EXPOSE 4000
CMD ["/app/main"]
