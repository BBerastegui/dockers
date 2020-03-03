FROM python:3-alpine

RUN apk add git && pip3 install requests && git clone https://github.com/si9int/cc.py.git

ENTRYPOINT ["python","cc.py/cc.py"]


