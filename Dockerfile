FROM andrewosh/binder-base
MAINTAINER Alexander Panin <justheuristic@gmail.com>
USER root

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get -qq update

RUN apt-get install -y gcc g++ wget unzip
RUN apt-get install -y libopenblas-dev liblapack-dev libsdl2-dev libboost-all-dev 
RUN apt-get install -y cmake zlib1g-dev libjpeg-dev 
RUN apt-get install -y xvfb libav-tools xorg-dev python-opengl
RUN apt-get -y install swig3.0
RUN ln -s /usr/bin/swig3.0 /usr/bin/swig


USER main

RUN pip install --upgrade pip
RUN pip install --upgrade sklearn tqdm pandas
RUN pip install --upgrade gym[all]

RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade pip
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade sklearn tqdm pandas
#TODO py3 doom once it's no longer broken
