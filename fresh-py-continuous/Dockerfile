FROM python:3-alpine

RUN apk add git && git clone https://github.com/teknogeek/fresh.py && cd fresh.py \
        && pip3 install -r requirements.txt && pip3 install flask

COPY entrypoint.sh /entrypoint.sh
COPY entrypoint.py /entrypoint.py

ENTRYPOINT ["python3", "/entrypoint.py"]
