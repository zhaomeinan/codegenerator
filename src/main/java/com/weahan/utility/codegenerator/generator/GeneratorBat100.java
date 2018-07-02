package com.weahan.utility.codegenerator.generator;

import com.weahan.utility.codegenerator.config.Bat100Config;
import com.weahan.utility.codegenerator.config.DataSourceConfig;
import com.weahan.utility.codegenerator.connection.ConnectionFactory;
import com.weahan.utility.codegenerator.fileWriter.EnumTemplateType;
import com.weahan.utility.codegenerator.fileWriter.FileWriterFactory;
import com.weahan.utility.codegenerator.table.Table;
import com.weahan.utility.codegenerator.util.CopyFile;
import com.weahan.utility.codegenerator.util.StringUtil;
import com.weahan.utility.codegenerator.util.TableUtil;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.sql.Connection;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class GeneratorBat100 {

    @Autowired
    private Bat100Config config;

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
    public GeneratorBat100() {
        super();
    }

    /**
     * 初始化模板的生成规则
     */
    public void initTemplates() {
        templates.clear();
        templates.put(EnumTemplateType.POJO, config.getOpenPojo());
        templates.put(EnumTemplateType.MAPPER, config.getOpenMapper());
        templates.put(EnumTemplateType.SERVICE, config.getOpenService());
        templates.put(EnumTemplateType.IREPOSITORY, config.getOpenIRepository());
        templates.put(EnumTemplateType.REPOSITORY, config.getOpenRepository());
        templates.put(EnumTemplateType.SQLXML, config.getOpenSqlXml());

        dbName = config.getTemplateUrl();
        String connectionUrl = dataSourceConfig.getConnectionUrl();
        Pattern r = Pattern.compile(dbPattern);
        Matcher matcher = r.matcher(connectionUrl);
        if (matcher.find()) {
            dbName = StringUtil.underlineToCamel(matcher.group(1));
            providerUri = StringUtil.upperFirst(dbName);
        }
    }

    public void generate(Bat100Config configIn,String[] tableNamesIn) throws Exception {
        configIn.setTemplateUrl(config.getTemplateUrl());
        config= configIn;
        this.generate(tableNamesIn);
    }

    public void generate(String[] tableNamesIn) throws Exception {
        //CopyFile.deleteSrcFiles(new File(config.getSrcPath()));

        // 根据配置定义
        initTemplates();

        //获得数据库连接
        Connection conn = ConnectionFactory.getConnection(dataSourceConfig);

        //获取所有的表名
        List<Table> tables = TableUtil.getTables(conn, tableNamesIn, config);

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
        String filePath = config.getSrcPath() + File.separator +
                config.getPackageName().replace(".", File.separator) + File.separator;

        String packagePath = config.getPackageName().replace(".", File.separator);

        for (Object file : tableNames) {
            String fileName = (String) file;

            if (config.getOpenPojo()) {
                // 1、copy model
                String modelFileName = fileName + ".java";
                CopyFile.copy(filePath + "provider" + File.separator + "model" +
                                File.separator + modelFileName,
                        config.getDestPath() +
                                File.separator + config.getPojoModuleName() +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "models" +
                                File.separator + modelFileName);
            }

            if (config.getOpenService()) {
                // 2、copy service
                String serviceFileName = fileName + "Service.java";
                CopyFile.copy(filePath + "provider" + File.separator + "service" +
                                File.separator + serviceFileName,
                        config.getDestPath() +
                                File.separator + config.getServiceModuleName() +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "service" +
                                File.separator + serviceFileName);
            }

            if (config.getOpenRepository()) {
                // 3、copy irepository
                String irepositoryFileName = "I" + fileName + "Repository.java";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "irepository" +
                                File.separator + irepositoryFileName,
                        config.getDestPath() +
                                File.separator + config.getiRepositoryModuleName() +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "repository" +
                                File.separator + "irepository" +
                                File.separator + irepositoryFileName);

                // 4、copy mapper
                String mapperFileName = fileName + "Mapper.java";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "mapper" +
                                File.separator + mapperFileName,
                        config.getDestPath() +
                                File.separator + config.getMapperModuleName() +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "repository" +
                                File.separator + "mapper" +
                                File.separator + mapperFileName);


                // 5、copy repository
                String repositoryFileName = fileName + "Repository.java";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "repository" +
                                File.separator + repositoryFileName,
                        config.getDestPath() +
                                File.separator + config.getRepositoryModuleName() +
                                File.separator + "src" +
                                File.separator + "main" +
                                File.separator + "java" +
                                File.separator + packagePath +
                                File.separator + "repository" +
                                File.separator + "repository" +
                                File.separator + repositoryFileName);
            }

            if (config.getOpenSqlXml()) {
                // 6、copy mapping
                String mappingFileName = fileName + "Mapper.xml";
                CopyFile.copy(filePath + "provider" +
                                File.separator + "repository" +
                                File.separator + "mapping" +
                                File.separator + mappingFileName,
                        config.getDestPath() +
                                File.separator + config.getSqlXmlDestPath() +
                                File.separator + mappingFileName);
            }

        }

        //delete srcFiles
        //CopyFile.deleteSrcFiles(new File(config.getSrcPath()));
    }
}
