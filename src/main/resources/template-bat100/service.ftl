package ${packageName}.service;

import java.util.*;
import ${packageName}.models.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class ${className_d}Service{

    private I${className_d}Repository ${className_x}Repository;

    @Autowired
    public ${className_d}Service(final I${className_d}Repository ${className_x}RepositoryIn){
        this.${className_x}Repository = ${className_x}RepositoryIn;
    }

    @PostMapping("/${className_x}/")
    public ${className_d} insert(${className_d} ${className_x}) {
        int i = ${className_x}Repository.insert(${className_x});
        System.out.println();
        return ${className_x};
    }

    @PutMapping("/${className_x}/")
    public int update(${className_d} ${className_x}) {
        return ${className_x}Repository.update(${className_x});
    }

    @DeleteMapping("/${className_x}/{id}")
    public int delete(@PathVariable Long id) {
        return ${className_x}Repository.delete(id);
    }

    @GetMapping("/${className_x}/{id}")
    public ${className_d} select(@PathVariable Long id){
        return ${className_x}Repository.select(id);
    }

    @GetMapping("/${className_x}/count")
    public Long cntByMap(@RequestParam Map<String,Object> map){
        return ${className_x}Repository.cntByMap(map);
    }

    @GetMapping("/${className_x}/ids")
    List<Long> getByMap(@RequestParam Map<String,Object> map){
        return ${className_x}Repository.getByMap(map);
    }

    @GetMapping("/${className_x}/list")
    public List<${className_d}> getByMapList(@RequestParam Map<String,Object> map){
        return ${className_x}Repository.getByMapList(map);
    }
}
