FROM ubuntu:20.04
ADD . /toy-deployment
RUN apt-get update
RUN apt-get install -y git python3-dev python3-pip
WORKDIR /toy-deployment
RUN pip3 install setuptools==68.0.0
RUN pip3 install -e .
EXPOSE 5001
CMD ["azmlinfsrv", "--entry_script", "src/score.py", "--port", "5001"]