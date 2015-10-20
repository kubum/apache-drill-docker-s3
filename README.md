## Apache Drill

Apache Drill Docker image with S3 jet plugin

## core-site.xml

Example:

```xml
<configuration>

  <property>
    <name>fs.s3.awsAccessKeyId</name>
    <value>ACCESS_KEY</value>
  </property>

  <property>
    <name>fs.s3.awsSecretAccessKey</name>
    <value>SECRET_ACCESS_KEY</value>
  </property>

  <property>
    <name>fs.s3n.awsAccessKeyId</name>
    <value>ACCESS_KEY</value>
  </property>

  <property>
    <name>fs.s3n.awsSecretAccessKey</name>
    <value>SECRET_ACCESS_KEY</value>
  </property>

</configuration>
```
