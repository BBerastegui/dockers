FROM python:3-alpine

RUN apk add git && git clone https://github.com/nsonaniya2010/SubDomainizer.git \
        && cd SubDomainizer && pip3 install -r requirements.txt

WORKDIR SubDomainizer

ENTRYPOINT ["python3","SubDomainizer.py"]


