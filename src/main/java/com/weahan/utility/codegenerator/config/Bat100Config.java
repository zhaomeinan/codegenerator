package com.weahan.utility.codegenerator.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:bat100.properties")
@ConfigurationProperties(prefix = "weahan.code.generator.bat100")
public class Bat100Config extends BaseConfig {

    String sqlXmlDestPath;

    Boolean openPojo = false;

    Boolean openMapper = false;

    Boolean openSqlXml = false;

    Boolean openIRepository = false;

    Boolean openRepository = false;

    Boolean openService = false;

    String pojoModuleName;

    String mapperModuleName;

    String iRepositoryModuleName;

    String repositoryModuleName;

    String serviceModuleName;

    public String getSqlXmlDestPath() {
        return sqlXmlDestPath;
    }

    public void setSqlXmlDestPath(String sqlXmlDestPath) {
        this.sqlXmlDestPath = sqlXmlDestPath;
    }

    public Boolean getOpenPojo() {
        return openPojo;
    }

    public void setOpenPojo(Boolean openPojo) {
        this.openPojo = openPojo;
    }

    public Boolean getOpenMapper() {
        return openMapper;
    }

    public void setOpenMapper(Boolean openMapper) {
        this.openMapper = openMapper;
    }

    public Boolean getOpenSqlXml() {
        return openSqlXml;
    }

    public void setOpenSqlXml(Boolean openSqlXml) {
        this.openSqlXml = openSqlXml;
    }

    public Boolean getOpenIRepository() {
        return openIRepository;
    }

    public void setOpenIRepository(Boolean openIRepository) {
        this.openIRepository = openIRepository;
    }

    public Boolean getOpenRepository() {
        return openRepository;
    }

    public void setOpenRepository(Boolean openRepository) {
        this.openRepository = openRepository;
    }

    public Boolean getOpenService() {
        return openService;
    }

    public void setOpenService(Boolean openService) {
        this.openService = openService;
    }

    public String getPojoModuleName() {
        return pojoModuleName;
    }

    public void setPojoModuleName(String pojoModuleName) {
        this.pojoModuleName = pojoModuleName;
    }

    public String getMapperModuleName() {
        return mapperModuleName;
    }

    public void setMapperModuleName(String mapperModuleName) {
        this.mapperModuleName = mapperModuleName;
    }

    public String getiRepositoryModuleName() {
        return iRepositoryModuleName;
    }

    public void setiRepositoryModuleName(String iRepositoryModuleName) {
        this.iRepositoryModuleName = iRepositoryModuleName;
    }

    public String getRepositoryModuleName() {
        return repositoryModuleName;
    }

    public void setRepositoryModuleName(String repositoryModuleName) {
        this.repositoryModuleName = repositoryModuleName;
    }

    public String getServiceModuleName() {
        return serviceModuleName;
    }

    public void setServiceModuleName(String serviceModuleName) {
        this.serviceModuleName = serviceModuleName;
    }
}

