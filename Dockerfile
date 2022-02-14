# docker run -it --gpus all drew6017/fsdet
# docker build -t drew6017/fsdet .
#FROM pure/python:3.6-cuda10.2-cudnn7-runtime
FROM pure/python:3.6-cuda10.0-cudnn7-runtime
#FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime

# timezone junk fix
ENV TZ=America/Detroit
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG DEBIAN_FRONTEND=noninteractive

# setup
RUN apt update; apt install -y git libgl1-mesa-glx
#RUN pip install torchvision==0.7.0
RUN pip install torch==1.6.0 torchvision==0.7.0
RUN git clone https://github.com/drew6017/few-shot-object-detection /fsdet
WORKDIR /fsdet

RUN python -m pip install detectron2==0.4 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu102/torch1.6/index.html; python3 -m pip install -r requirements.txt

ENTRYPOINT [ "/bin/bash" ]
