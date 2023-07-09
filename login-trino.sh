kubectl cp hadoop-hadoop-hive-metastore-0:/opt/apache/hadoop/etc/hadoop/core-site.xml ./core-site.xml -n hadoop
kubectl cp hadoop-hadoop-hive-metastore-0:/opt/apache/hadoop/etc/hadoop/hdfs-site.xml ./hdfs-site.xml -n hadoop

# wget https://repo1.maven.org/maven2/io/trino/trino-cli/421/trino-cli-421-executable.jar

for trino_name in `kubectl get pods |grep trino|awk '{print $1}'`
do

echo ${trino_name}
kubectl cp ./core-site.xml ${trino_name}:/tmp/core-site.xml
kubectl cp ./hdfs-site.xml ${trino_name}:/tmp/hdfs-site.xml
kubectl cp ./trino-cli-421-executable.jar ${trino_name}:/tmp/trino-cli-421-executable.jar
done


/tmp/trino-cli-421-executable.jar --server http://localhost:8080 --user=hadoop --catalog=hive

