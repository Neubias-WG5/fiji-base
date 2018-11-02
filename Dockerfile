FROM neubiaswg5/neubias-base

# Java is installed in neubiaswg5/neubias-base.

# Install virtual X server
RUN apt-get update && apt-get install -y unzip xvfb libx11-dev libxtst-dev libxrender-dev

# Install Fiji.
RUN wget https://downloads.imagej.net/fiji/Life-Line/fiji-linux64-20170530.zip
RUN unzip fiji-linux64-20170530.zip
RUN mv Fiji.app/ fiji

# create a sym-link with the name jars/ij.jar that is pointing to the current version jars/ij-1.nm.jar
RUN cd /fiji/jars && ln -s $(ls ij-1.*.jar) ij.jar

# Add fiji to the PATH
ENV PATH $PATH:/fiji

RUN mkdir -p /fiji/data

# Clean up
RUN rm fiji-linux64-20170530.zip
