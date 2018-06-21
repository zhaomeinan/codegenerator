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
import com.weahan.utility.codegenerator.config.POConfig;
import com.weahan.utility.codegenerator.connection.ConnectionFactory;
import com.weahan.utility.codegenerator.fileWriter.EnumTemplateType;
import com.weahan.utility.codegenerator.fileWriter.FileWriterFactory;
import com.weahan.utility.codegenerator.table.Table;
import com.weahan.utility.codegenerator.util.CopyFile;
import com.weahan.utility.codegenerator.util.StringUtil;
import com.weahan.utility.codegenerator.util.TableUtil;
import freemarker.template.Configuration;


@Component
public class GeneratorPO {

    public static final String dbPattern = "^jdbc:mysql:\\/\\/.*\\/db_(\\w+)";

    private static String dbName;

    @Autowired
    private POConfig config;

    @Autowired
    private DataSourceConfig dataSourceConfig;

    private ArrayList tableNames = new ArrayList();

    private HashMap templates = new HashMap();

    /**
     * @throws Exception
     */
    public GeneratorPO() {
        super();
    }

    /**
     * 初始化模板的生成规则
     */
    public void initTemplates() {
        templates.clear();
        templates.put(EnumTemplateType.DATA_SYNC_PO, config.getDataSyncPO());
        dbName = config.getTemplateUrl();
        String connectionUrl = dataSourceConfig.getConnectionUrl();
        Pattern r = Pattern.compile(dbPattern);
        Matcher matcher = r.matcher(connectionUrl);
        if (matcher.find()) {
            dbName = StringUtil.underlineToCamel(matcher.group(1));
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

    public String copyAll() {
        String srcPath = config.getSrcPath() + File.separator + "po";
        String destPath = config.getDestPath() + File.separator + "po";
        for (Object table : tableNames) {
            String tableName = (String) table;
            if (config.getDataSyncPO()) {
                CopyFile.copy(srcPath + File.separator + tableName + "PO.java", destPath + File.separator + dbName + File.separator + tableName + "PO.java");
            }
            //delete srcFiles
        }
        CopyFile.deleteSrcFiles(new File(srcPath));
        return destPath;
    }
}
