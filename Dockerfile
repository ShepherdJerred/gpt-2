FROM tensorflow/tensorflow:1.12.0-py3

ENV LANG=C.UTF-8

RUN mkdir /gpt-2
WORKDIR /gpt-2

COPY requirements.txt /gpt-2
RUN pip3 install -r requirements.txt

COPY download_model.py /gpt-2
RUN python3 download_model.py 774M

COPY . /gpt-2

ENV PYTHONPATH=/gpt/src
ENV PATH="/gpt-2:${PATH}"

