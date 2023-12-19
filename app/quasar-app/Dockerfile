# Stage 1. Build application
FROM golang:1.21 as builder

WORKDIR /go/src/app

COPY . .

RUN make build

# Stage 2. Create final image
FROM golang:1.21

WORKDIR /app

COPY --from=builder /go/src/app/quasar-app /app
COPY --from=builder /go/src/app/templates /app/templates

EXPOSE 9000

CMD ["./quasar-app"]

