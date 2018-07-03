package com.weahan.utility.codegenerator.fileWriter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import com.weahan.utility.codegenerator.table.Table;
import com.weahan.utility.codegenerator.util.DirMaker;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @author jlon
 */
public class FileWriterFactory {

    private static Configuration cfg;

    /**
     * @param url
     * @return
     */
    public static Configuration getConfiguration(String url) {
        if (cfg == null) {
            cfg = new Configuration(Configuration.VERSION_2_3_23);
            url = FileWriterFactory.class.getResource("/").getPath() + url;
            url.replaceAll("bin", "src");
            System.out.println(url);
            File file = new File(url);
            try {
                cfg.setDirectoryForTemplateLoading(file);
                cfg.setObjectWrapper(new DefaultObjectWrapper(Configuration.VERSION_2_3_23));
            }
            catch (IOException e) {
                e.printStackTrace();
            }
        }
        return cfg;
    }

    /**
     * @param cfg          解析对象
     * @param templateName 模板名称
     */
    public static void dataSourceOut(Configuration cfg, String templateName,
                                     Table table, int type, String srcPath) {
        String fileName = null;
        Template temp = null;

        try {
            temp = cfg.getTemplate(templateName);
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        Writer out = null;

        try {
            String packageName = "";
            switch (type) {
                case EnumTemplateType.POJO:
                    fileName = table.getClassName_d() + ".java";
                    packageName = table.getPackageName() + ".provider.model";// 获得这个文件的存储路径(外部传进来的)
                    break;
                case EnumTemplateType.MAPPER:
                    fileName = "repository" + File.separator + "mapper" + File.separator + table.getClassName_d() + "Mapper" + ".java";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.ISERVICE:
                    fileName = "I" + table.getClassName_d() + "Service" + ".java";
                    packageName = table.getPackageName() + ".provider.interfaces";
                    break;
                case EnumTemplateType.SERVICE:
//                    fileName = table.getClassName_d() + "Service" + ".java";
//                    packageName = table.getPackageName() + ".provider.service";
//                    break;
                    fileName = table.getClassName_d() + "Controller" + ".java";
                    packageName = table.getPackageName() + ".provider.controller";
                    break;
                case EnumTemplateType.IREPOSITORY:
                    fileName = "repository" + File.separator + "irepository" + File.separator + "I" +
                            table.getClassName_d() + "Repository" + ".java";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.REPOSITORY:
                    fileName = "repository" + File.separator + "repository" + File.separator +
                            table.getClassName_d() + "Repository" + ".java";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.SQLXML:
                    fileName = "repository" + File.separator + "mapping" + File.separator +
                            table.getClassName_d() + "Mapper" + ".xml";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.CACHE:
                    fileName = "repository" + File.separator + "cache" + File.separator +
                            table.getClassName_d() + "Cache" + ".java";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.CONSUMER:
                    fileName = table.getClassName_d() + "Consumer.java";
                    packageName = table.getPackageName() + ".consumer";
                    break;
                case EnumTemplateType.POM:
                    fileName = "pom.xml";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.POM_INTERFACES:
                    fileName = "pom.xml";
                    packageName = table.getPackageName() + ".provider.interfaces";
                    break;
                case EnumTemplateType.POM_MODELS:
                    fileName = "pom.xml";
                    packageName = table.getPackageName() + ".provider.model";
                    break;
                case EnumTemplateType.POM_REPOSITORY:
                    fileName = "pom.xml";
                    packageName = table.getPackageName() + ".provider.repository";
                    break;
                case EnumTemplateType.POM_SERVICES:
                    fileName = "pom.xml";
                    packageName = table.getPackageName() + ".provider.service";
                    break;
                case EnumTemplateType.POM_WEB:
                    fileName = "pom_web.xml";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.APPLICATION_MAIN:
                    fileName = "Application.java";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.APPLICATION_SERVICEINSTANCE:
                    fileName = "ServiceInstanceRestController.java";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.APPLICATION_PROPERTIES:
                    fileName = "application.properties";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.APPLICATION_PROPERTIES_DEV:
                    fileName = "application-dev.properties";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.APPLICATION_PROPERTIES_TEST:
                    fileName = "application-test.properties";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.APPLICATION_PROPERTIES_PROD:
                    fileName = "application-prod.properties";
                    packageName = table.getPackageName() + ".provider";
                    break;
                case EnumTemplateType.DATA_SYNC_PO:
                    fileName = table.getClassName_d() + "PO.java";
                    packageName = "po";
            }
            packageName = packageName.replace(".", File.separator);

            String url = srcPath + File.separator + packageName + File.separator + fileName;

            File file = new File(url);

            DirMaker.createFile(file);

            out = new FileWriter(file);

            temp.process(table, out);

            temp.process(table, new OutputStreamWriter(System.out));

            out.flush();

        }
        catch (TemplateException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            if (out != null) {
                try {
                    out.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * @param cfg
     * @param templateName
     * @param root
     * @param fileName
     */
    public static void dataSourceOut(Configuration cfg, String templateName,
                                     Object root, String fileName) {

        Template temp = null;
        try {
            temp = cfg.getTemplate(templateName);
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        Writer out = null;
        try {
            if (fileName != null && !"".equals(fileName)) {
                String packageName = "";
                packageName = packageName.replace(".", File.separator);
                String url = "src" + File.separator + packageName + File.separator + fileName;
                File file = new File(url);
                out = new FileWriter(file);
                temp.process(root, out);
            }
            temp.process(root, new OutputStreamWriter(System.out));
            out.flush();
        }
        catch (TemplateException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            if (out != null) {
                try {
                    out.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
