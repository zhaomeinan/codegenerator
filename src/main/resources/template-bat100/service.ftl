package ${packageName}.controller;

import java.util.*;

import com.bat100.core.commond.result.Commond;
import com.bat100.core.commond.result.ResultFactory;
import ${packageName}.models.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class ${className_d}Controller{

    private I${className_d}Repository ${className_x}Repository;

    @Autowired
    public ${className_d}Controller(final I${className_d}Repository ${className_x}RepositoryIn){
        this.${className_x}Repository = ${className_x}RepositoryIn;
    }

    @PostMapping("${className_strike}")
    public String insert(${className_d} ${className_x}) {
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.insert(${className_x}), "");
    }

    @PutMapping("${className_strike}")
    public String update(${className_d} ${className_x}) {
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.update(${className_x}), "");
    }

    @DeleteMapping("${className_strike}/{id}")
    public String delete(@PathVariable Integer id) {
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.delete(id), "");
    }

    @GetMapping("${className_strike}/{id}")
    public String select(@PathVariable Integer id){
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.select(id), "");
    }

    @GetMapping("${className_strike}/count")
    public String cntByMap(@RequestParam Map<String,Object> map){
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.cntByMap(map), "");
    }

    @GetMapping("${className_strike}/ids")
    public String getByMap(@RequestParam Map<String,Object> map){
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.getByMap(map), "");
    }

    @GetMapping("${className_strike}/list")
    public String getByMapList(@RequestParam Map<String,Object> map){
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.getByMapList(map), "");
    }

    @PutMapping("${className_strike}/by-code")
    public String updateByCode(${className_d} ${className_x}) {
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.updateByCode(${className_x}), "");
    }

    @GetMapping("${className_strike}/by-code")
    public String selectByBfCode(@RequestParam(value = "bfCode") String bfCode){
        return ResultFactory.resultMsg(Commond.R_SUCCESS, ${className_x}Repository.selectByBfCode(bfCode), "");
    }
}
