package com.weahan.utility.codegenerator.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:provider.properties")
@ConfigurationProperties(prefix = "weahan.code.generator.provider")
public class ProviderConfig extends BaseConfig {

    /*
    下面是定义了需要生成的源码类型
    */
    Boolean openPojo;

    Boolean openMapper;

    Boolean openIService;

    Boolean openService;

    Boolean openIRepository;

    Boolean openRepository;

    Boolean openSqlXml;

    Boolean openCache;

    Boolean openPom;

    Boolean openCustomer;

    Boolean openProviderApplication;

    Boolean openProperties;

    String dbName;

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

    public Boolean getOpenIService() {
        return openIService;
    }

    public void setOpenIService(Boolean openIService) {
        this.openIService = openIService;
    }

    public Boolean getOpenService() {
        return openService;
    }

    public void setOpenService(Boolean openService) {
        this.openService = openService;
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

    public Boolean getOpenSqlXml() {
        return openSqlXml;
    }

    public void setOpenSqlXml(Boolean openSqlXml) {
        this.openSqlXml = openSqlXml;
    }

    public Boolean getOpenCache() {
        return openCache;
    }

    public void setOpenCache(Boolean openCache) {
        this.openCache = openCache;
    }

    public Boolean getOpenPom() {
        return openPom;
    }

    public void setOpenPom(Boolean openPom) {
        this.openPom = openPom;
    }

    public Boolean getOpenCustomer() {
        return openCustomer;
    }

    public void setOpenCustomer(Boolean openCustomer) {
        this.openCustomer = openCustomer;
    }

    public Boolean getOpenProviderApplication() {
        return openProviderApplication;
    }

    public void setOpenProviderApplication(Boolean openProviderApplication) {
        this.openProviderApplication = openProviderApplication;
    }

    public Boolean getOpenProperties() {
        return openProperties;
    }

    public void setOpenProperties(Boolean openProperties) {
        this.openProperties = openProperties;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }
}
