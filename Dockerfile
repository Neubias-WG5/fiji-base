FROM neubiaswg5/neubias-base

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get update -y && apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update -y && \
    apt-get install -y oracle-java8-installer curl xvfb libx11-dev libxtst-dev libXrender-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Fiji.
RUN mkdir -p /fiji && cd /fiji \
    curl -O http://update.imagej.net/bootstrap.js && \
    jrunscript bootstrap.js update-force-pristine

# Add fiji to the PATH
ENV PATH $PATH:/fiji

RUN mkdir -p /fiji/data
