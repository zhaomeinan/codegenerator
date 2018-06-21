package com.weahan.utility.codegenerator.generator;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.weahan.utility.codegenerator.config.DataSourceConfig;
import com.weahan.utility.codegenerator.config.ProviderConfig;
import com.weahan.utility.codegenerator.connection.ConnectionFactory;
import com.weahan.utility.codegenerator.fileWriter.EnumTemplateType;
import com.weahan.utility.codegenerator.fileWriter.FileWriterFactory;
import com.weahan.utility.codegenerator.table.Table;
import com.weahan.utility.codegenerator.util.CopyFile;
import com.weahan.utility.codegenerator.util.StringUtil;
import com.weahan.utility.codegenerator.util.TableUtil;
import freemarker.template.Configuration;


@Component
public class GeneratorProvider {

    @Autowired
    private ProviderConfig config;

    @Autowired
    private DataSourceConfig dataSourceConfig;


    private ArrayList tableNames = new ArrayList();

    private HashMap templates = new HashMap();


    public static final String dbPattern = "^jdbc:mysql:\\/\\/.*/(\\w+)";

    private static String dbName;

    private static String providerUri;

    /**
     * @throws Exception
     */
    public GeneratorProvider() {
        super();
    }

    /**
     * 初始化模板的生成规则
     */
    public void initTemplates() {
        templates.clear();
        templates.put(EnumTemplateType.POJO, config.getOpenPojo());
        templates.put(EnumTemplateType.MAPPER, config.getOpenMapper());
        templates.put(EnumTemplateType.ISERVICE, config.getOpenIService());
        templates.put(EnumTemplateType.SERVICE, config.getOpenService());
        templates.put(EnumTemplateType.IREPOSITORY, config.getOpenIRepository());
        templates.put(EnumTemplateType.REPOSITORY, config.getOpenRepository());
        templates.put(EnumTemplateType.SQLXML, config.getOpenSqlXml());
        templates.put(EnumTemplateType.CACHE, config.getOpenCache());
        templates.put(EnumTemplateType.CONSUMER, config.getOpenCustomer());
        templates.put(EnumTemplateType.POM, config.getOpenPom());
        templates.put(EnumTemplateType.POM_INTERFACES, config.getOpenPom());
        templates.put(EnumTemplateType.POM_MODELS, config.getOpenPom());
        templates.put(EnumTemplateType.POM_REPOSITORY, config.getOpenPom());
        templates.put(EnumTemplateType.POM_SERVICES, config.getOpenPom());
        templates.put(EnumTemplateType.POM_WEB, config.getOpenPom());
        templates.put(EnumTemplateType.APPLICATION_MAIN, config.getOpenProviderApplication());
        templates.put(EnumTemplateType.APPLICATION_SERVICEINSTANCE, config.getOpenProviderApplication());
        templates.put(EnumTemplateType.APPLICATION_PROPERTIES, config.getOpenProperties());
        templates.put(EnumTemplateType.APPLICATION_PROPERTIES_DEV, config.getOpenProperties());
        templates.put(EnumTemplateType.APPLICATION_PROPERTIES_TEST, config.getOpenProperties());
        templates.put(EnumTemplateType.APPLICATION_PROPERTIES_PROD, config.getOpenProperties());

        dbName = config.getTemplateUrl();
        String connectionUrl = dataSourceConfig.getConnectionUrl();
        Pattern r = Pattern.compile(dbPattern);
        Matcher matcher = r.matcher(connectionUrl);
        if (matcher.find()) {
            dbName = StringUtil.underlineToCamel(matcher.group(1));
//            dbName = connectionUrl.split("^jdbc:mysql:\\/\\/.*/(db_)?")[1];
            providerUri = StringUtil.upperFirst(dbName);
        }
    }

    /**
     * {方法功能中文描述}
     *
     * @throws Exception
     * @author: cuicong
     * @datetime:2015年9月15日下午3:25:45
     */
    public void generate() throws Exception {
        // 根据配置定义
        initTemplates();

        //获得数据库连接
        Connection conn = ConnectionFactory.getConnection(dataSourceConfig);

        //获取所有的表名
        List<Table> tables = TableUtil.getTables(conn, null, config);

        tableNames.clear();
        for (Table table : tables) {
            tableNames.add(table.getClassName_d());
            table.setDbName(dbName);
            table.setProviderUri(providerUri);
        }


        //获取模板
        Configuration configuration = FileWriterFactory.getConfiguration(config.getTemplateUrl());


        for (Table table : tables) {
            Iterator iter = templates.entrySet().iterator();
            while (iter.hasNext()) {
                Map.Entry entry = (Map.Entry) iter.next();
                int templateType = (int) entry.getKey();
                Boolean isGen = (Boolean) entry.getValue();
                if (isGen) {
                    String templateUrl = EnumTemplateType.getTemplateUrl(templateType);
                    build(table, configuration, templateUrl, templateType);
                }
            }
        }
        System.err.println("祝贺你,生成成功！");
    }

    /**
     * @param table
     * @param configuration
     */
    public void build(Table table, Configuration configuration, String templateUrl, int type) {
        FileWriterFactory.dataSourceOut(configuration, // 解析对象
                templateUrl, //模板名称
                table, //数据对象
                type,
                config.getSrcPath());
    }

    public void copyAll() {
        String filePath = config.getSrcPath() +
                config.getPackageName().replace(".", File.separator) + File.separator;

        String projectName = config.getProjectName();
        String packagePath = config.getPackageName().replace(".", File.separator);

        for (Object file : tableNames) {
            String fileName = (String) file;
            if (config.getOpenIService()) {
                // 1、copy interfaces
                String interfacesFileName = "I" + fileName + "Service.java";
                CopyFile.copy(filePath + "provider" + File.separator + "interfaces" +
                                File.separator + interfacesFileName,
                        config.getDestPath() +
                                File.separator + "provider" + File.separator + projectName +
                                File.separator + projectName + "-Interfaces" + File.separator + "src" +
                                File.separator + "main" + File.separator + "java" +
                                File.separator + packagePath + File.separator + "interfaces" +
                                File.separator + interfacesFileName);
            }


            if (config.getOpenPojo()) {
                // 2、copy model
                String modelFileName = fileName + ".java";
                CopyFile.copy(filePath + "provider" + File.separator + "model" +
                                File.separator + modelFileName,
                        config.getDestPath() +
                                File.separator + "provider" + File.separator + projectName +
                                File.separator + projectName + "-Models" + File.separator + "src" +
                                File.separator + "main" + File.separator + "java" +
                                File.separator + packagePath + File.separator + "model" +
                                File.separator + modelFileName);
            }


            if (config.getOpenService()) {
                // 3、copy service
                String serviceFileName = fileName + "Service.java";
                CopyFile.copy(filePath + "provider" + File.separator + "service" +
                                File.separator + serviceFileName,
                        config.getDestPath() +
                                File.separator + "provider" + File.separator + projectName +
                                File.separator + projectName + "-Services" + File.separator + "src" +
                                File.separator + "main" + File.separator + "java" +
                                File.separator + packagePath + File.separator + "services" +
                                File.separator + serviceFileName);
            }

            if (config.getOpenRepository()) {
                // 4、copy cache
                String cacheFileName = fileName + "Cache.java";
                CopyFile.copy(filePath + "provider" + File.separator + "repository" +
                                File.separator + "cache" + File.separator + cacheFileName,
                        config.getDestPath() +
                                File.separator + "provider" + File.separator + projectName +
                                File.separator + projectName + "-Repository" + File.separator + "src" +
                                File.separator + "main" + File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "repository" +
                                File.separator + "cache" + File.separator + cacheFileName);


                // 5、copy irepository
                String irepositoryFileName = "I" + fileName + "Repository.java";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "irepository" +
                                File.separator + irepositoryFileName,
                        config.getDestPath() +
                                File.separator + "provider" +
                                File.separator + projectName +
                                File.separator + projectName + "-Repository" +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "repository" +
                                File.separator + "irepository" +
                                File.separator + irepositoryFileName);


                // 6、copy mapper
                String mapperFileName = fileName + "Mapper.java";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "mapper" +
                                File.separator + mapperFileName,
                        config.getDestPath() +
                                File.separator + "provider" +
                                File.separator + projectName +
                                File.separator + projectName + "-Repository" +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "repository" +
                                File.separator + "mapper" +
                                File.separator + mapperFileName);


                // 7、copy repository
                String repositoryFileName = fileName + "Repository.java";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "repository" +
                                File.separator + repositoryFileName,
                        config.getDestPath() +
                                File.separator + "provider" +
                                File.separator + projectName +
                                File.separator + projectName + "-Repository" +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "repository" +
                                File.separator + "repository" +
                                File.separator + repositoryFileName);
            }

            if (config.getOpenMapper()) {
                // 8、copy mapping
                    /*String mappingFileName = fileName +"Mapper.java";
                    CopyFile.copy(srcPath+"repository" + File.separator  +"mapper" + File.separator +mappingFileName, destPath+projectName+
                             File.separator +projectName+"-Web" + File.separator  +"src" + File.separator  +"main" + File.separator  +"resources" + File.separator  +"mapping" + File.separator  + mappingFileName);*/
            }

            if (config.getOpenSqlXml()) {
                // 8、copy mapping
                String mappingFileName = fileName + "Mapper.xml";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "mapping" +
                                File.separator + mappingFileName,
                        config.getDestPath() +
                                File.separator + "provider" +
                                File.separator + projectName +
                                File.separator + projectName + "-Web" +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "resources" +
                                File.separator + "mapping" +
                                File.separator + mappingFileName);
            }

            if (config.getOpenCustomer()) {
                String consumerFileName = fileName + "Consumer.java";
                CopyFile.copy(filePath + "consumer" +
                                File.separator + consumerFileName,
                        config.getDestPath() +
                                File.separator + "consumer" +
                                File.separator + projectName +
                                File.separator + projectName + "-Consumer" +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "consumer" +
                                File.separator + consumerFileName);
            }

        }


        if (config.getOpenPom()) {
            CopyFile.copy(filePath + "provider" +
                            File.separator + "pom.xml",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + "pom.xml");

            CopyFile.copy(filePath + "provider" +
                            File.separator + "pom_web.xml",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Web" +
                            File.separator + "pom.xml");

            CopyFile.copy(filePath + "provider" +
                            File.separator + "interfaces" +
                            File.separator + "pom.xml",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Interfaces" +
                            File.separator + "pom.xml");

            CopyFile.copy(filePath + "provider" +
                            File.separator + "model" +
                            File.separator + "pom.xml",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Models" +
                            File.separator + "pom.xml");

            CopyFile.copy(filePath + "provider" +
                    File.separator + "repository" +
                    File.separator + "pom.xml", config.getDestPath() +
                    File.separator + "provider" +
                    File.separator + projectName +
                    File.separator + projectName + "-Repository" +
                    File.separator + "pom.xml");

            CopyFile.copy(filePath + "provider" +
                            File.separator + "service" +
                            File.separator + "pom.xml",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Services" +
                            File.separator + "pom.xml");
        }

        // 判断是否生成Application类
        if (config.getOpenProviderApplication()) {
            String applicationFileName =
                    //projectName.substring(projectName.lastIndexOf(".")+1) +
                    "Application.java";
            CopyFile.copy(filePath + "provider" +
                            File.separator + applicationFileName,
                    config.getDestPath() +
                            File.separator + "provider" + File.separator + projectName +
                            File.separator + projectName + "-Web" + File.separator + "src" +
                            File.separator + "main" + File.separator + "java" +
                            File.separator + packagePath +
                            File.separator + applicationFileName);


            String instanceServiceFileName = "ServiceInstanceRestController.java";
            CopyFile.copy(filePath + "provider" +
                            File.separator + instanceServiceFileName,
                    config.getDestPath() +
                            File.separator + "provider" + File.separator + projectName +
                            File.separator + projectName + "-Web" + File.separator + "src" +
                            File.separator + "main" + File.separator + "java" +
                            File.separator + packagePath +
                            File.separator + instanceServiceFileName);

        }

        // 判断是否生成properties配置文件
        if (config.getOpenProperties()) {
            CopyFile.copy(filePath + "provider" +
                            File.separator + "application.properties",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Web" +
                            File.separator + "src" + File.separator + "main" +
                            File.separator + "resources" +
                            File.separator + "application.properties");

            CopyFile.copy(filePath + "provider" +
                            File.separator + "application-dev.properties",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Web" +
                            File.separator + "src" + File.separator + "main" +
                            File.separator + "resources" +
                            File.separator + "application-dev.properties");

            CopyFile.copy(filePath + "provider" +
                            File.separator + "application-test.properties",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Web" +
                            File.separator + "src" + File.separator + "main" +
                            File.separator + "resources" +
                            File.separator + "application-test.properties");

            CopyFile.copy(filePath + "provider" +
                            File.separator + "application-prod.properties",
                    config.getDestPath() +
                            File.separator + "provider" +
                            File.separator + projectName +
                            File.separator + projectName + "-Web" +
                            File.separator + "src" + File.separator + "main" +
                            File.separator + "resources" +
                            File.separator + "application-prod.properties");

        }

        //delete srcFiles
        //CopyFile.deleteSrcFiles(new File(config.getSrcPath()));
    }
}
