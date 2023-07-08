# syntax=docker/dockerfile:1
FROM python:3.10

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
RUN apt update && apt install ffmpeg libsm6 libxext6 -y
RUN python3 setup.py
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]