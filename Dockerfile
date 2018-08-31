FROM python:3.6-slim-stretch
RUN apt-get update -y
RUN apt-get -y install build-essential libssl-dev libffi-dev libxml2-dev libxslt-dev
ARG CHROME_DRIVER_VERSION=2.35
RUN makedir -p /app
COPY requirements.txt /app/requirements.txt
COPY run.sh /app/run.sh
COPY google-chrome-stable-68.0.3440.106-1.x86_64.rpm /app/chrome.rpm
RUN pip3 install -r /tmp/requirements.txt \
    && chmod a+x /usr/bin/run.sh
WORKDIR /app
ENTRYPOINT /usr/bin/run.sh
CMD [ "/bin/bash" ]
