FROM  kutim/openjdk:11.0.4-stretch

LABEL maintainer="Kutim <1252900197@qq.com>"

ARG VERSION=3.0.0.2

RUN cd /opt \
    && git clone https://github.com/yahoo/CMAK.git \
    && cd CMAK \
    && git checkout -b ${VERSION} ${VERSION} \
    && while [[ -z $(yes r | ./sbt clean dist 1>&2 && echo "ok") ]]; do echo "retry sbt"; done \
    && rm -rf ~/.ivy2 ~/.pki ~/.sbt \
    && cd /opt \
    && mv CMAK/target/universal/cmak-${VERSION}.zip ./ \
    && rm -rf CMAK
 
 
