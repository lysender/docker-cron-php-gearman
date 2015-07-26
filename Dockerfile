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
    php-pecl-gearman && yum clean all

# Configure servicies
ADD ./start.sh /start.sh
ADD ./my-cron.conf /etc/cron.d/my-cron

RUN chmod 755 /start.sh

CMD ["/bin/bash", "/start.sh"]

