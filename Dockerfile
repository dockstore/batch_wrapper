FROM docker
RUN apk add --update alpine-sdk python python-dev py-pip wget openjdk8-jre-base bash
RUN pip install setuptools==34.2.0
RUN pip install cwl-runner cwltool==1.0.20170217172322 schema-salad==2.2.20170222151604 avro==1.8.1
RUN wget https://github.com/ga4gh/dockstore/releases/download/1.2.1/dockstore
RUN mkdir /root/.dockstore
RUN echo -e "token: dummy_token\nserver-url:https://dockstore.org:8443" > /root/.dockstore/config
RUN chmod a+x dockstore
RUN mv dockstore /bin
ENV DOCKSTORE_ROOT 1
RUN dockstore
RUN dockstore plugin download
ADD test.sh test.sh
