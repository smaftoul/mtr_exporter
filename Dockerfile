FROM golang:1.9-alpine3.6 as builder
RUN apk add --update git && go get github.com/Shinzu/mtr_exporter

FROM alpine:3.6
COPY --from=builder /go/bin/mtr_exporter .
RUN apk add --no-cache --update mtr
EXPOSE 9116
ENTRYPOINT ./mtr_exporter
