FROM python:3.14.0a4-alpine3.21

WORKDIR /sample-google-custom-search-api

RUN apk add --no-cache \
    gcc \
    g++ \
    musl-dev \
    libffi-dev \
    openblas-dev \
    lapack-dev \
    && pip install --upgrade pip \
    && pip install pandas \
    && apk del gcc g++ musl-dev

COPY . .

RUN pip install -r requirements.txt
