FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install python3.6 python3-pip ffmpeg -y

WORKDIR /opt/gifbot
COPY . /opt/gifbot

RUN python3 -m pip install -r requirements.txt

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

CMD ["python3", "main_run_bot.py"]