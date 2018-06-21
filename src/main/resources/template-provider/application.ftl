#通用配置

#server.port:别忘记修改成自己的端口号
server.port=56789

#active profile
spring.profiles.active=dev

mybatis.typeAliasesPackage=${packageName}.repository.mapper
mybatis.mapperLocations=classpath:mapping/**/*.xml