FROM python:{{cookiecutter.python_version}}-slim as build

RUN apt-get -y update && apt-get -y install python3-dev tini libpq-dev

RUN addgroup --gid 10001 {{cookiecutter.docker_app_group}} \
    && adduser \
    --gid 10001 \
    --uid 10001 \
    --system \
    --no-create-home \
    --disabled-login \
    {{cookiecutter.docker_app_user}}

COPY requirements/ /tmp/

RUN pip install \
    --disable-pip-version-check \
    --no-cache-dir \
    -r /tmp/requirements.txt \
    -c /tmp/constraints.txt

# Intentionally not removing libpq-dev or tini.
# libpq-dev has shared object libraries that are required
RUN apt-get -y remove python3-dev && apt-get -y autoremove

COPY . /code
WORKDIR /code

RUN chown {{cookiecutter.docker_app_user}}:{{cookiecutter.docker_app_group}} docker-entrypoint.sh \
    && chmod 500 docker-entrypoint.sh

USER {{cookiecutter.docker_app_user}}

FROM build

ENTRYPOINT [ "/usr/bin/tini", "--", "/code/docker-entrypoint.sh"]
