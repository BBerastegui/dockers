FROM python:3

RUN git clone https://github.com/teknogeek/fresh.py && cd fresh.py \
        && pip3 install -r requirements.txt

ENTRYPOINT ["python3", "fresh.py/fresh.py"]
