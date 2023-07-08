FROM registry.cn-hangzhou.aliyuncs.com/bigdata_cloudnative/hadoop_hive:v1

RUN yum -y install expect

COPY bootstrap.sh /opt/apache/

RUN chown -R hadoop:hadoop /opt/apache/bootstrap.sh
