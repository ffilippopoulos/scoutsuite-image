FROM python:3.7.5-alpine3.10

ENV VERSION 5.4.0
 
WORKDIR /git/

RUN apk --no-cache add git gcc musl-dev python3-dev libffi-dev openssl-dev g++ make &&\
  git clone https://github.com/nccgroup/ScoutSuite.git &&\
  cd ScoutSuite &&\
  git checkout ${VERSION} &&\
  pip install -r requirements.txt

ENTRYPOINT ["/usr/local/bin/python", "/git/ScoutSuite/scout.py"]
CMD [ "--help" ]
