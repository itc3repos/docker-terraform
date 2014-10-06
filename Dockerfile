FROM google/golang:stable

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y vim less zip python-pip && \
    pip install awscli s3cmd

RUN go get -u github.com/mitchellh/gox && \
	git clone https://github.com/mitchellh/goamz.git $GOPATH/src/github.com/mitchellh/goamz && \
	cd $GOPATH/src/github.com/mitchellh/goamz && \
	git remote add xuwang https://github.com/xuwang/goamz && git pull xuwang master && \
	git clone https://github.com/hashicorp/terraform.git $GOPATH/src/github.com/hashicorp/terraform && \
    cd $GOPATH/src/github.com/hashicorp/terraform && \
	git remote add xuwang https://github.com/xuwang/terraform && git pull xuwang master
RUN export XC_ARCH=amd64; export XC_OS=linux; cd $GOPATH/src/github.com/hashicorp/terraform; \
	make updatedeps && make bin
	
ADD test.tf /test/test.tf
    
VOLUME /tf
VOLUME /root/.aws
WORKDIR /tf
 
CMD ["/bin/bash"]
