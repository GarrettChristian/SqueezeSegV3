# https://github.com/GarrettChristian/SalsaNext/blob/master/salsanext_cuda10.yml

# Base Image
FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

# Don't answer questions
ARG DEBIAN_FRONTEND=noninteractive

# Install Python
RUN apt update
RUN apt install -y python3-pip
RUN apt install -y python3-tk

RUN pip3 install --upgrade pip

# Model Dependencies
RUN pip3 install torch==1.3.1+cu100 --extra-index-url https://download.pytorch.org/whl/cu100
RUN pip3 install scipy==1.3.1
RUN pip3 install numpy==1.19.5
RUN pip3 install absl-py==0.8.0
RUN pip3 install astor==0.8.0
RUN pip3 install cycler==0.10.0
RUN pip3 install grpcio==1.24.1
RUN pip3 install h5py==2.10.0
RUN pip3 install kiwisolver==1.1.0
RUN pip3 install matplotlib==2.2.3
RUN pip3 install mock==3.0.5
RUN pip3 install opencv-contrib-python==4.1.0.25
RUN pip3 install opencv-python==4.1.0.25
RUN pip3 install pillow==6.1.0
RUN pip3 install protobuf==3.10.0
RUN pip3 install pyparsing==2.4.2
RUN pip3 install python-dateutil==2.8.0
RUN pip3 install pytz==2019.2
RUN pip3 install pyyaml==5.1.1
RUN pip3 install tensorboard==1.13.1
RUN pip3 install tensorflow==1.13.1
RUN pip3 install tensorflow-estimator==1.13.0
RUN pip3 install termcolor==1.1.0
RUN pip3 install torchvision==0.2.2.post3

# Fix for open cv
RUN apt update && apt install -y libsm6 libxext6
RUN apt-get install -y libxrender-dev