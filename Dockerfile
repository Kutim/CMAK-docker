FROM  kutim/openjdk:11.0.4-stretch

LABEL maintainer="Kutim <1252900197@qq.com>"

ARG VERSION=3.0.0.2

RUN cd /opt \
    && curl -sSL https://codeload.github.com/yahoo/CMAK/zip/${version} -o CMAK.zip \
    && unzip CMAK.zip \
    && mv CMAK-${version} CMAK \
    && rm -f CMAK.zip \
    && cd CMAK \
    && while [[ -z $(yes r | ./sbt clean dist 1>&2 && echo "ok") ]]; do echo "retry sbt"; done \
    && rm -rf ~/.ivy2 ~/.pki ~/.sbt \
    && cd /opt \
    && mv CMAK/target/universal/cmak-${version}.zip ./ \
    && rm -rf CMAK \
    && ls -l -h cmak-${version}.zip \
    && md5sum cmak-${version}.zip
 
 
