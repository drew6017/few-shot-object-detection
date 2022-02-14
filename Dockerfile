# docker run -it --gpus all drew6017/fsdet
# docker build -t drew6017/fsdet .
#FROM pure/python:3.6-cuda10.2-cudnn7-runtime
FROM pure/python:3.6-cuda10.0-cudnn7-runtime

RUN pip install torch==1.6.0 torchvision==0.7.0
RUN git clone https://github.com/drew6017/few-shot-object-detection /fsdet
WORKDIR /fsdet

ENTRYPOINT [ "/bin/bash" ]
