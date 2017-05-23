FROM frolvlad/alpine-glibc

ENV MAJOR=8 \
    MINOR=131

WORKDIR /tmp

RUN apk --update add wget ca-certificates && \
 wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/server-jre-8u131-linux-x64.tar.gz -O server-jre.tar.gz && \
 mkdir oracle-server-jre && \
 tar -xzf server-jre.tar.gz -C ./oracle-server-jre && \
 mkdir -p /opt/oracle-server-jre && \
 cp -r /tmp/oracle-server-jre/jdk1.${MAJOR}.0_${MINOR}/* /opt/oracle-server-jre/ && \
 ln -s /opt/oracle-server-jre/bin/* /usr/bin/ && \
 chmod ugo+x /usr/bin/java && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
 apk del wget ca-certificates 