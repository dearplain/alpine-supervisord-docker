FROM frolvlad/alpine-glibc
MAINTAINER Emil Nilsson <eonilsson@gmail.com>

ENV PYTHON_VERSION=2.7.12-r0
ENV PY_PIP_VERSION=8.1.2-r0
ENV SUPERVISOR_VERSION=3.3.0

RUN apk update && apk add -u python=$PYTHON_VERSION py-pip=$PY_PIP_VERSION
RUN pip install supervisor==$SUPERVISOR_VERSION
COPY supervisor /etc/supervisor
RUN mkdir /etc/supervisor/conf.d

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/supervisord.conf"]

