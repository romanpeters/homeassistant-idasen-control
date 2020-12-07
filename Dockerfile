FROM python:3.8
MAINTAINER Roman Peters "info@romanpeters.nl"
COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir -U  -r idasen-controller/requirements.txt -r requirements.txt \
    && apt-get update && apt-get -y install bluez bluetooth
EXPOSE 10453

ENTRYPOINT sh docker_entrypoint.sh
CMD ["python", "main.py"]
