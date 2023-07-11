FROM golang:alpine AS builder

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 go build -o /go-app .

FROM scratch

COPY --from=builder /go-app /go-app

ENTRYPOINT ["/go-app"]
