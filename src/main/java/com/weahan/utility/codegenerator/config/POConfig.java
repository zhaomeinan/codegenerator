package com.weahan.utility.codegenerator.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:po.properties")
@ConfigurationProperties(prefix = "weahan.code.generator.po")
public class POConfig extends BaseConfig {

    Boolean dataSyncPO;//是否生成数据同步的po

    String dbName;

    public Boolean getDataSyncPO() {
        return dataSyncPO;
    }

    public void setDataSyncPO(Boolean dataSyncPO) {
        this.dataSyncPO = dataSyncPO;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }
}

