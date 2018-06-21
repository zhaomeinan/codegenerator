<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>com.weahan.core</groupId>
        <artifactId>weahan-core-provider</artifactId>
        <version>1.1.0</version>
    </parent>


    <groupId>${packageName}.provider</groupId>
    <artifactId>${projectName}</artifactId>
    <version>1.0.0</version>
    <packaging>pom</packaging>

    <properties>
        <main.basedir>/</main.basedir>
    </properties>

    <modules>
        <module>${projectName}-Interfaces</module>
        <module>${projectName}-Models</module>
        <module>${projectName}-Repository</module>
        <module>${projectName}-Services</module>
        <module>${projectName}-Web</module>
    </modules>

    <dependencies>
        <dependency>
            <groupId>com.weahan.util</groupId>
            <artifactId>util-data</artifactId>
            <version>1.0.0</version>
        </dependency>


        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
            <version>1.3.0</version>
        </dependency>
        <!-- Mybatis Generator -->
        <dependency>
            <groupId>org.mybatis.generator</groupId>
            <artifactId>mybatis-generator-core</artifactId>
            <version>1.3.2</version>
        </dependency>

        <dependency>
            <groupId>com.github.abel533</groupId>
            <artifactId>mapper</artifactId>
            <version>2.3.4</version>
        </dependency>
    </dependencies>

    <build>
        <pluginManagement>
            <plugins>
                <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-archetype-plugin</artifactId>
                    <version>2.2</version>
                </plugin>
            </plugins>
        </pluginManagement>
    </build>
</project>