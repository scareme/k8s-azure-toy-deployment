FROM ubuntu:20.04
ADD . /toy-deployment
RUN apt-get update && \
    apt-get install -y git python3-dev python3-pip && \
    apt-get clean
WORKDIR /toy-deployment
RUN pip3 install setuptools==68.0.0 && \
    pip3 install -e .
RUN which pip3
RUN which python3
RUN uname -a
EXPOSE 5001
CMD ["azmlinfsrv", "--entry_script", "src/score.py", "--port", "5001"]