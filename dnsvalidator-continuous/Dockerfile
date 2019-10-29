FROM python:3-alpine

RUN apk add --no-cache shadow bash git && \
    mkdir /dnsvalidator && \
    useradd --create-home --shell /sbin/nologin dnsvalidator

RUN git clone https://github.com/vortexau/dnsvalidator.git

WORKDIR /dnsvalidator/

RUN chown -R dnsvalidator:dnsvalidator /dnsvalidator && \
    python3 setup.py install

USER dnsvalidator

COPY entrypoint.sh /entrypoint.sh
COPY app.py /app.py

ENTRYPOINT ["python3", "/app.py"]
