FROM java:8-jre
MAINTAINER kubum

ENV DRILL_HOME /opt/apache-drill

# Install packages
RUN apt-get update && apt-get install -y wget tar paxctl

# Java memory allocation
RUN paxctl -C /usr/bin/java && paxctl -m /usr/bin/java

# Get Apache Drill
RUN wget http://getdrill.org/drill/download/apache-drill-1.1.0.tar.gz

# Create Apache Drill folder
RUN mkdir -p $DRILL_HOME

# Extract Apache Drill
RUN tar -xvzf apache-drill-1.1.0.tar.gz && \
    mv apache-drill-1.1.0/* $DRILL_HOME && \
    rm apache-drill-1.1.0.tar.gz

# Install S3 Plugin
RUN wget http://bitbucket.org/jmurty/jets3t/downloads/jets3t-0.9.3.zip && \
    unzip jets3t-0.9.3.zip && \
    rm jets3t-0.9.3.zip

RUN cp jets3t-0.9.3/jars/jets3t-0.9.3.jar $DRILL_HOME/jars/3rdparty

RUN sed -i '/jets3t/d' $DRILL_HOME/bin/hadoop-excludes.txt

# Copy Java memory settings
COPY conf/ $DRILL_HOME/conf/

# Running script
COPY start.sh start.sh
RUN chmod +x start.sh
RUN chmod +x $DRILL_HOME/bin/drillbit.sh

# Log
RUN mkdir -p ${DRILL_HOME}/log/
RUN touch ${DRILL_HOME}/log/drillbit.out

# Run Apache Drill
CMD "./start.sh"

EXPOSE 8047:8047
