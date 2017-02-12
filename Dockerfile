
FROM openshift/base-centos7

USER root

RUN yum -y install python \
    python-devel \
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" \
    python get-pip.py \
    python-pip \
    mercurial && yum clean all

# Install dev cron
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron

ADD ./etc/crontab /cron/crontab

USER 1001

CMD ["devcron.py", "/cron/crontab"]

