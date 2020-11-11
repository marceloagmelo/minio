FROM centos:7

MAINTAINER Marcelo Melo <marceloagmelo@gmail.com

USER root

ENV MINIO_UPDATE off
ENV MINIO_ACCESS_KEY_FILE=access_key \
    MINIO_SECRET_KEY_FILE=secret_key
ENV GID 20000
ENV UID 20000
ENV IMAGE_SCRIPTS_HOME /opt/scripts
ENV TZ America/Sao_Paulo
ENV APP_HOME /opt/app

EXPOSE 9000

COPY ./docker-entrypoint.sh /usr/bin/
ADD scripts $IMAGE_SCRIPTS_HOME
COPY Dockerfile $IMAGE_SCRIPTS_HOME/Dockerfile
ADD app $APP_HOME

VOLUME ["/data"]

RUN yum clean all && yum update -y && \
    yum -y install tar wget unzip net-tools && \
    curl --silent --output "/tmp/minio.tgz" --remote-name "$MINIO_ARTIFACTORY_URL" && \
    tar -xzvf /tmp/minio.tgz -C /usr/bin/ --strip-components=1 && \
    rm -Rf /tmp/* && rm -Rf /var/tmp/* && \
    yum clean all && \
    groupadd --gid $GID minio && useradd --uid $UID -m -g minio minio

USER 20000

HEALTHCHECK --interval=1m CMD healthcheck

#CMD ["minio"]

WORKDIR $IMAGE_SCRIPTS_HOME

ENTRYPOINT [ "./control.sh" ]
CMD [ "start" ]
