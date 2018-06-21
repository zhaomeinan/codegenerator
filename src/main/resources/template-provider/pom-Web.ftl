<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>${packageName}</groupId>
        <artifactId>${projectName}</artifactId>
        <version>1.0.0-SNAPSHOT</version>
    </parent>

    <artifactId>${projectName}-Web</artifactId>
    <packaging>jar</packaging>

    <properties>
        <!-- 需要在Repository Service Web 三大模块中加上此属性,作用是不向maven私服中发布这三个模块中的包 -->
        <maven.deploy.skip>true</maven.deploy.skip>
        <mysql.version>5.1.35</mysql.version>

        <!-- 启动类-->
        <weahan.start.class>com.weahan.platform.Application</weahan.start.class>
    </properties>

    <dependencies>

        <dependency>
            <groupId>${packageName}</groupId>
            <artifactId>${projectName}-Services</artifactId>
        ${r"<version>${project.parent.version}</version>"}
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-rest</artifactId>
        </dependency>
    </dependencies>

</project>
