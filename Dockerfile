FROM python:3.10-slim

WORKDIR /label-studio
RUN useradd -ms /bin/bash lstudio

COPY ./requirements.txt .

RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y libpq-dev

RUN pip install --upgrade pip \
    -r requirements.txt

COPY . .

USER lstudio

CMD [ "label-studio", "-b", "--port=8888"]