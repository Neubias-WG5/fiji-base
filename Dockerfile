FROM neubiaswg5/neubias-base

# Java is installed in neubiaswg5/neubias-base.

# Install Fiji.
RUN mkdir -p /fiji && cd /fiji && \
    curl -O http://update.imagej.net/bootstrap.js && \
    jrunscript bootstrap.js update-force-pristine

# create a sym-link with the name jars/ij.jar that is pointing to the current version jars/ij-1.nm.jar
RUN cd /fiji/jars && ln -s $(ls ij-1.*.jar) ij.jar

# Add fiji to the PATH
ENV PATH $PATH:/fiji

RUN mkdir -p /fiji/data


