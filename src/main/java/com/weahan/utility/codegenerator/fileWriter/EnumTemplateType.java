package com.weahan.utility.codegenerator.fileWriter;

import java.util.HashMap;

/**
 * @author jlon
 */
public class EnumTemplateType {
    public static final int POJO = 1;

    public static final int MAPPER = 2;

    public static final int ISERVICE = 3;

    public static final int SERVICE = 4;

    public static final int IREPOSITORY = 5;

    public static final int REPOSITORY = 6;

    public static final int SQLXML = 7;

    public static final int CACHE = 8;

    public static final int CONSUMER = 9;

    public static final int POM = 10;

    public static final int POM_WEB = 11;

    public static final int POM_INTERFACES = 12;

    public static final int POM_MODELS = 13;

    public static final int POM_REPOSITORY = 14;

    public static final int POM_SERVICES = 15;

    public static final int APPLICATION_MAIN = 16;

    public static final int APPLICATION_PROPERTIES = 17;

    public static final int APPLICATION_PROPERTIES_DEV = 18;

    public static final int APPLICATION_PROPERTIES_TEST = 19;

    public static final int APPLICATION_PROPERTIES_PROD = 20;

    public static final int APPLICATION_SERVICEINSTANCE = 21;

    public static final int DATA_SYNC_PO = 22;


    public static HashMap TEMPLATE_DEF = new HashMap();

    static {
        TEMPLATE_DEF.put(POJO, "pojo.ftl");
        TEMPLATE_DEF.put(MAPPER, "mapper.ftl");
        TEMPLATE_DEF.put(ISERVICE, "Iservice.ftl");
        TEMPLATE_DEF.put(SERVICE, "service.ftl");
        TEMPLATE_DEF.put(IREPOSITORY, "Irepository.ftl");
        TEMPLATE_DEF.put(REPOSITORY, "repository.ftl");
        TEMPLATE_DEF.put(SQLXML, "sqlXml.ftl");
        TEMPLATE_DEF.put(CACHE, "cache.ftl");
        TEMPLATE_DEF.put(CONSUMER, "consumer.ftl");
        TEMPLATE_DEF.put(POM, "pom.ftl");
        TEMPLATE_DEF.put(POM_INTERFACES, "pom-Interfaces.ftl");
        TEMPLATE_DEF.put(POM_MODELS, "pom-Models.ftl");
        TEMPLATE_DEF.put(POM_REPOSITORY, "pom-Repository.ftl");
        TEMPLATE_DEF.put(POM_SERVICES, "pom-Services.ftl");
        TEMPLATE_DEF.put(POM_WEB, "pom-Web.ftl");
        TEMPLATE_DEF.put(APPLICATION_MAIN, "providerapplication.ftl");
        TEMPLATE_DEF.put(APPLICATION_SERVICEINSTANCE, "serviceinstancerestcontroller.ftl");
        TEMPLATE_DEF.put(APPLICATION_PROPERTIES, "application.ftl");
        TEMPLATE_DEF.put(APPLICATION_PROPERTIES_DEV, "application-dev.ftl");
        TEMPLATE_DEF.put(APPLICATION_PROPERTIES_TEST, "application-test.ftl");
        TEMPLATE_DEF.put(APPLICATION_PROPERTIES_PROD, "application-prod.ftl");
        TEMPLATE_DEF.put(DATA_SYNC_PO, "dataSyncPO.ftl");
    }

    public static String getTemplateUrl(int type) {
        Object value = TEMPLATE_DEF.get(type);
        if (value == null) return "";
        return (String) value;
    }
}
