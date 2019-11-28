FROM golang:latest as build-env

RUN CGO_ENABLED=0 go get -u github.com/tomnomnom/meg
# Here you can build a nice paths file if you want
#RUN git clone https://github.com/milo2012/pathbrute.git
#RUN cat /go/src/github.com/tomnomnom/meg/lists/configfiles pathbrute/*.txt | sort -u > /go/src/github.com/tomnomnom/meg/lists/all.txt
# Copy a small dict instead of the super huge one above
COPY ./small.txt .
RUN cat small.txt | sort -u > /go/src/github.com/tomnomnom/meg/lists/all.txt

FROM alpine:latest
COPY --from=build-env /go/bin/meg /usr/bin
COPY --from=build-env /go/src/github.com/tomnomnom/meg/lists/all.txt ./paths

ENTRYPOINT ["meg"]
