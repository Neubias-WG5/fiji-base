FROM neubiaswg5/neubias-base

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update -y && \
    apt-get install -y software-properties-common && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y --force-yes oracle-java8-installer && \
    apt-get install -y curl xvfb libx11-dev libxtst-dev libxrender-dev && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/*

# Install Fiji.
RUN mkdir -p /fiji && cd /fiji && \
    curl -O http://update.imagej.net/bootstrap.js && \
    jrunscript bootstrap.js update-force-pristine

# Add fiji to the PATH
ENV PATH $PATH:/fiji

RUN mkdir -p /fiji/data
