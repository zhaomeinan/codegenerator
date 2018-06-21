<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>${packageName}.provider</groupId>
        <artifactId>${projectName}</artifactId>
        <version>1.0.0</version>
    </parent>

    <artifactId>${projectName}-Web</artifactId>
    <packaging>jar</packaging>

    <properties>
        <!-- 需要在Repository Service Web 三大模块中加上此属性,作用是不向maven私服中发布这三个模块中的包 -->
        <maven.deploy.skip>true</maven.deploy.skip>
        <mysql.version>5.1.35</mysql.version>
    </properties>
    <!--#### springboot-end ####-->
    <dependencies>

        <dependency>
            <groupId>${packageName}.provider</groupId>
            <artifactId>${projectName}-Services</artifactId>
        ${r"<version>${project.parent.version}</version>"}
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
        </dependency>


        <!--  mybatis官方适配的springboot-->
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>1.1.1</version>
        </dependency>


        <dependency>
            <groupId>org.mybatis.generator</groupId>
            <artifactId>mybatis-generator-core</artifactId>
            <version>1.3.5</version>
        </dependency>

        <!-- <dependency> <groupId>org.mybatis.caches</groupId> <artifactId>mybatis-redis</artifactId>
            <version>1.0.0-beta2</version> </dependency> -->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
            <version>3.4.0</version>
        </dependency>


        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
            <version>1.3.0</version>
        </dependency>

        <dependency>
            <groupId>redis.clients</groupId>
            <artifactId>jedis</artifactId>
            <version>2.9.0</version>
        </dependency>

        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>1.1.1</version>
        </dependency>


    </dependencies>

    <!--#### springboot-begin ####-->
    <build>
    ${r"<finalName>${project.parent.artifactId}_${project.version}_${server.port}_${timestamp}_${spring.profiles.include}</finalName>"}
        <plugins>
            <!--可以把依赖的包都打包到生成的Jar包中-->
            <!--
            clean package -Dmaven.test.skip=true
              -->
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>1.4.1.RELEASE</version>
                <configuration>
                ${r"<mainClass>${weahan.startClass}</mainClass>"}
                    <attach>false</attach>
                </configuration>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>

            <!-- 打包时,输出文件加上日期后缀 -->
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>buildnumber-maven-plugin</artifactId>
                <version>1.4</version>
                <configuration>
                    <timestampFormat>yyyyMMdd_HHmm</timestampFormat>
                </configuration>
                <executions>
                    <execution>
                        <goals>
                            <goal>create-timestamp</goal>
                        </goals>
                    </execution>
                </executions>
                <inherited>false</inherited>
            </plugin>
        ${r"<!-- 保证application.properties中的变量能够在maven中读取,用${xx}占位替换 -->"}
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>properties-maven-plugin</artifactId>
                <version>1.0.0</version>
                <executions>
                    <execution>
                        <phase>initialize</phase>
                        <goals>
                            <goal>read-project-properties</goal>
                        </goals>
                        <configuration>
                            <files>
                                <file>src/main/resources/application.properties</file>
                            </files>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
</project>
