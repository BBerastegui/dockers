FROM golang:alpine

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="bberastegui/mjolnir"
LABEL org.label-schema.description="The JWT hammer"

RUN apk add git && go get -v -u dev.hackercat.ninja/hcninja/mjolnir

ENTRYPOINT ["mjolnir"]
