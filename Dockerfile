FROM python:2.7-alpine

MAINTAINER Josh Williams <th3prime@codingprime.com>

ENV ANSIBLE_VERSION 2.2.1.0

RUN apk add --no-cache --virtual=build-dependencies \
		bash \
		build-base \
		ca-certificates \
		gmp-dev \
		libffi-dev \
		vim \
		openssl-dev \
		openssh-client \
		yaml-dev && \
	cd "/tmp" && \
	wget "http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz" && \
	tar -xvzf ansible-${ANSIBLE_VERSION}.tar.gz && \
	rm ansible-${ANSIBLE_VERSION}.tar.gz && \
	cd ansible-${ANSIBLE_VERSION} && \
	python setup.py install && \
	pip install \
		dopy \
		boto && \
	cd / && \
	rm -rf /tmp/ansible-${ANSIBLE_VERSION}

COPY run_command.sh /run_command.sh

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

ENTRYPOINT ["/run_command.sh"]
