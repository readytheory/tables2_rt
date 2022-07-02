FROM python:3.10.5-slim-bullseye

WORKDIR /code



RUN apt-get update

RUN apt-get -y install  build-essential python3-dev

RUN python -m pip install -U pip

ADD requirements.txt .

RUN pip install -r requirements.txt

COPY django .

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]