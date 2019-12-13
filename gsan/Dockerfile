FROM python:3-alpine

RUN apk add --no-cache musl-dev libffi-dev openssl-dev gcc && pip install --user gsan
ENV PATH="/root/.local/bin:$PATH"

ENTRYPOINT ["gsan"]
