package ${packageName}.repository.repository;

import java.util.*;
import ${packageName}.models.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import ${packageName}.repository.mapper.${className_d}Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ${className_d}Repository implements I${className_d}Repository{

    private ${className_d}Mapper ${className_x}Mapper;

    @Autowired
    public ${className_d}Repository(final ${className_d}Mapper ${className_x}MapperIn) {
        this.${className_x}Mapper = ${className_x}MapperIn;
    }

    @Override
    public int insert(${className_d} ${className_x}){
        return ${className_x}Mapper.insert(${className_x});
    }

    @Override
    public int update(${className_d} ${className_x}){
        return ${className_x}Mapper.update(${className_x});
    }

    @Override
    public int delete(Long id){
        return ${className_x}Mapper.delete(id);
    }

    @Override
    public ${className_d} select(Long id){
        return ${className_x}Mapper.select(id);
    }

    @Override
    public Long cntByMap(Map<String,Object> map){
        return ${className_x}Mapper.cntByMap(map);
    }

    @Override
    public List<Long> getByMap(Map<String,Object> map){
        return ${className_x}Mapper.getByMap(map);
    }

    @Override
    public List<${className_d}> getByMapList(Map<String,Object> map){
        return ${className_x}Mapper.getByMapList(map);
    }

}
