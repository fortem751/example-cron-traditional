
FROM docker.io/openshift/base-centos7

USER root

RUN yum update -y && \
    yum install -y python && \
    yum install -y python-devel && \
    yum install -y python34-pip.noarch \
    yum install mercurial && \
    yum clean all

# Install dev cron
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron

ADD ./etc/crontab /cron/crontab

USER 1001

CMD ["devcron.py", "/cron/crontab"]

