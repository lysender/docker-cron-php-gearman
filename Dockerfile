FROM centos:centos7
MAINTAINER Leonel Baer <leonel@lysender.com>

# Install packages
RUN yum -y update &&  yum clean all
RUN yum -y install epel-release && yum clean all

RUN yum -y install git \
    bind-utils \
    pwgen \
    psmisc \
    net-tools \
    hostname \
    curl \
    curl-devel \
    sqlite \
    cronie \
    libevent \
    gearmand \
    libgearman \
    libgearman-devel \
    php \
    php-bcmath \
    php-common \
    php-pear \
    php-mysql \
    php-cli \
    php-devel \
    php-gd \
    php-fpm \
    php-pdo \
    php-mbstring \
    php-mcrypt \
    php-soap \
    php-xml \
    php-xmlrpc \
    php-pecl-gearman \
    python \
    python-devel \
    python-pip \
    mercurial && yum clean all

# Install dev cron
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron

# Configure servicies
ADD ./my-cron.conf /cron/crontab

VOLUME ["/cron"]

CMD ["devcron.py", "/cron/crontab"]

