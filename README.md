docker-terraform
================
Dockerfile for updated terraform.

A patched up version of terraform is build in this docker to support _iam_instance_profile__ for aws instance and auto-scale launch-configration.

AWS Tools, i.e. awscli and s3cmd are also installed.

##Usage
```
docker run -it -v $HOME/.aws:/root/.aws -v $HOME/projects/tf:/tf xuwang/terraform
$ terraform <cmd>
...
$ exit
```


