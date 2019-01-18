FROM golang:alpine

RUN apk add git && go get -u github.com/tomnomnom/unfurl

ENTRYPOINT ["unfurl"]
