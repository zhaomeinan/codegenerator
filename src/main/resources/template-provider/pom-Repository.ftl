<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <groupId>${packageName}</groupId>
        <artifactId>${projectName}</artifactId>
        <version>1.0.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>${projectName}-Repository</artifactId>

    <properties>
        <!-- 需要在Repository Service Web 三大模块中加上此属性,作用是不向maven私服中发布这三个模块中的包 -->
        <maven.deploy.skip>true</maven.deploy.skip>
    </properties>
    <dependencies>
        <dependency>
            <groupId>${packageName}</groupId>
            <artifactId>${projectName}-Models</artifactId>
        ${r"<version>${project.parent.version}</version>"}
        </dependency>
    </dependencies>

</project>
