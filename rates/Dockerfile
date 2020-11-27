FROM python:latest
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python-pip
RUN pip install -U gunicorn
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app
RUN pip3 install -Ur requirements.txt
ADD . /app
EXPOSE 3000
ENTRYPOINT ["gunicorn", "-b", ":3000", "wsgi"]

