FROM python:rc-slim

RUN apt update && apt install -y git g++ make bluez \
    libpango1.0-dev libgif-dev build-essential libxext-dev libxss-dev bluez

RUN git clone https://github.com/rhyst/idasen-controller.git
RUN pip3 install -r idasen-controller/requirements.txt

RUN pip3 install Flask
COPY main.py /root/main.py
ENV FLASK_APP=/root/main.py
EXPOSE 10453
CMD [ "flask", "run", "--host", "0.0.0.0", "--port", "10453" ]