
FROM openshift/base-centos7

USER root

RUN yum -y install python \
    python-devel \
    epel-release \
    rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    python-pip \
    mercurial && yum clean all

# Install dev cron
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron

ADD ./etc/crontab /cron/crontab

USER 1001

CMD ["devcron.py", "/cron/crontab"]

