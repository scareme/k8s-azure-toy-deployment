FROM python:3.8-alpine
ADD . /toy-deployment
RUN apk update
RUN apk add git build-base libffi-dev
WORKDIR /toy-deployment
RUN python3 -m venv inference-env
RUN source inference-env/bin/activate
RUN pip install --upgrade pip
RUN pip install setuptools==68.0.0
RUN pip install -e .
EXPOSE 5001
CMD ["azmlinfsrv", "--entry_script", "src/score.py", "--port", "5001"]
