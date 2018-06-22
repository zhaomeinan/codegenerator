package com.weahan.utility.codegenerator.build;

import com.weahan.utility.codegenerator.config.Bat100Config;
import com.weahan.utility.codegenerator.generator.GeneratorBat100;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Index {

    @Autowired
    private GeneratorBat100 generatorBat100;

    @RequestMapping(value = "/index/", method = RequestMethod.GET)
    public String buildProvider() {
        return "index";
    }

    @RequestMapping(value = "/index/", method = RequestMethod.POST)
    public String submit(Bat100Config config, Model model,String tableNames) {
        try {

            if(StringUtils.isEmpty(config.getPackageName())||StringUtils.isEmpty(config.getSrcPath())){
                model.addAttribute("config",config);
                model.addAttribute("tableNames",tableNames);
                model.addAttribute("result","packageName和srcPath不能为空！");
                return "index";
            }

            String tableNamesIn[] = null;

            if(!StringUtils.isEmpty(tableNames)){
                tableNamesIn = tableNames.split(",");
            }

            generatorBat100.generate(config,tableNamesIn);

            System.out.println("generate OK!!!");

            if(!StringUtils.isEmpty(config.getDestPath())){
                // 拷贝文件
                generatorBat100.copyAll();

                System.out.println("copy OK!!!");
            }
        }catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }

        model.addAttribute("config",config);
        model.addAttribute("tableNames",tableNames);
        model.addAttribute("result","祝贺你,生成成功！");

        return "index";
    }
}
