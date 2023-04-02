FROM golang:1.17-alpine3.14 as builder

WORKDIR /app

RUN apk update && apk add --no-cache git
COPY go.mod go.sum ./
RUN go mod download

COPY . .
WORKDIR /app/cmd
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

CMD ["/app/cmd/app"]

FROM alpine:3.14

ENV APP_ROOT=/app/app
WORKDIR /app

COPY --from=builder /app ./app
RUN chmod +x /app/app

CMD ["./app/cmd/app", "development"]
