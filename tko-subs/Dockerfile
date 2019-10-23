FROM golang:alpine AS builder

RUN apk add git && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go get github.com/anshumanbh/tko-subs && wget https://raw.githubusercontent.com/anshumanbh/tko-subs/master/providers-data.csv

FROM scratch
# Copy our static executable.
COPY --from=builder /go/bin/tko-subs /tko-subs
COPY --from=builder /go/providers-data.csv /providers-data.csv
# Run the hello binary.
ENTRYPOINT ["/tko-subs"]
