FROM debian:10
RUN apt-get update
RUN apt-get install -y virtualenv python3-dev python3-pip git
RUN git clone https://github.com/Arksine/moonraker.git
RUN apt-get install -y liblmdb-dev libopenjp2-7 libsodium-dev zlib1g-dev libjpeg-dev packagekit curl
RUN python3 -m pip install -r moonraker/scripts/moonraker-requirements.txt
RUN python3 -m pip install -r moonraker/scripts/moonraker-speedups.txt
ARG DATA_PATH="/root/printer_data"
ARG CONFIG_PATH="/root/printer_data/config"
ARG LOG_PATH="/tmp"
ARG MOONRAKER_LOG="${LOG_PATH}/moonraker.log"
ARG GCODE_PATH="/root/printer_data/gcodes"
ARG CONFIG_PATH="/root/printer_data/config"
WORKDIR /moonraker/moonraker
CMD python3 -m moonraker
