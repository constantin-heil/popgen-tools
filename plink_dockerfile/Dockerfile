FROM ubuntu:20.04

ENV PLINK_ZIP plink_linux_x86_64.zip
ENV PLINK2_ZIP plink2_linux_x86_64.zip
ENV PLINK_DIR /opt/plink
ENV PLINK2_DIR /opt/plink2

RUN set -ex \
    && apt-get update && apt-get install -y unzip curl \
    && curl -fSL "https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20230116.zip" -o $PLINK_ZIP \
    && mkdir $PLINK_DIR \
    && unzip $PLINK_ZIP -d $PLINK_DIR \
    && rm $PLINK_ZIP

RUN set -ex \
    && curl -fSL "https://s3.amazonaws.com/plink2-assets/alpha4/plink2_linux_x86_64_20230426.zip" -o $PLINK2_ZIP \
    && mkdir $PLINK2_DIR \
    && unzip $PLINK2_ZIP -d $PLINK2_DIR \
    && rm $PLINK2_ZIP

RUN cd /usr/local/bin \
    && ln -s $PLINK_DIR/plink plink \
    && ln -s $PLINK2_DIR/plink2 plink2
