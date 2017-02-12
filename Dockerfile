
FROM openshift/base-centos7

USER root

RUN yum update -y \
    yum -y install python \
    python-devel \
    python34-pip.noarch \
    python2-pip.noarch \
    mercurial && yum clean all

# Install dev cron
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron

ADD ./etc/crontab /cron/crontab

USER 1001

CMD ["devcron.py", "/cron/crontab"]

