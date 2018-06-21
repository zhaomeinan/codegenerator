package com.weahan.utility.codegenerator.build;

import com.weahan.utility.codegenerator.generator.GeneratorBat100;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import com.weahan.utility.codegenerator.generator.GeneratorLogic;
import com.weahan.utility.codegenerator.generator.GeneratorPO;
import com.weahan.utility.codegenerator.generator.GeneratorProvider;

/**
 * @author jlon
 */
@RestController
@RequestMapping("/build")
public class Build {

    @Autowired
    GeneratorProvider generatorProvider;

    @Autowired
    GeneratorLogic generatorLogic;

    @Autowired
    private GeneratorPO generatorPO;

    @Autowired
    private GeneratorBat100 generatorBat100;

    @RequestMapping(value = "/provider/", method = RequestMethod.GET)
    public String buildProvider() {
        try {
            // 生成源文件
            generatorProvider.generate();

            System.out.println("generate OK!!!");

            // 拷贝文件
            generatorProvider.copyAll();

            System.out.println("copy OK!!!");
        }
        catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }

        return "OK";
    }

    @RequestMapping(value = "/logic/", method = RequestMethod.GET)
    public String buildLogic() {
        try {
            // 生成源文件
            generatorLogic.generate();

            // 拷贝文件
            generatorLogic.copyAll();
        }
        catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }

        return "OK";
    }

    @GetMapping(value = "/data-sync-po")
    public String buildDataSyncPO() {
        String result = "";
        try {
            generatorPO.generate();
            result = generatorPO.copyAll();
        }
        catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "<html><body><a href='file://" + result + "/PersonPO.java'>生成的路径为 " + result + "</a></body></html>";
    }

    @RequestMapping(value = "/bat100/", method = RequestMethod.GET)
    public String buildBat100(String tableNames) {
        try {
            String tableNamesIn[] = null;

            if(!StringUtils.isEmpty(tableNames)){
                tableNamesIn = tableNames.split(",");
            }

            // 生成源文件
            generatorBat100.generate(tableNamesIn);

            System.out.println("generate OK!!!");

            // 拷贝文件
            generatorBat100.copyAll();

            System.out.println("copy OK!!!");
        }
        catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }

        return "OK";
    }
}
