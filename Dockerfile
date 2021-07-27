FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /django_geo_map

COPY Pipfile Pipfile.lock /django_geo_map/
RUN apt-get update &&\
    apt-get install -y binutils libproj-dev gdal-bin
RUN pip install pipenv && pipenv install --system

COPY . /django_geo_map/