package ${packageName}.repository.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import ${packageName}.model.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import ${packageName}.repository.cache.${className_d}Cache;
import ${packageName}.repository.mapper.${className_d}Mapper;


/**
* ${className}.
* @author weahan qd
*/
@SuppressWarnings("unused")
@Repository
public class ${className_d}Repository implements I${className_d}Repository{
private ${className_d}Mapper ${className_x}Mapper;

//private ${className_d}Cache ${className_x}Cache;

@Autowired
public ${className_d}Repository(final ${className_d}Mapper ${className_x}Mapper1) {
//${className_d}Cache ${className_x}Cache1) {
this.${className_x}Mapper = ${className_x}Mapper1;
//this.${className_x}Cache = ${className_x}Cache1;
}

/**
* 插入一个${className}.
* @param ${className_x} 要插入的对象
* @return 插入结果
*/
@Override
public boolean insert(final ${className_d} ${className_x}) {
final int num = this.${className_x}Mapper.insertSelective(${className_x});
//if(num>0){
//this.${className_x}Cache.save(${className_x});
//}
return num>0;
}

/**
* 更新${className}.
* @param ${className_x} 要更新的对象
* @return 更新结果
*/
@Override
public boolean update(final ${className_d} ${className_x}) {
final int num = this.${className_x}Mapper.updateByPrimaryKeySelective(${className_x});
//if(num>0){
//this.${className_x}Cache.save(${className_x});
//}
return num>0;
}

/**
* 删除${className}.
* @param ${className_x} 要删除的对象
* @return 删除结果
*/
@Override
public boolean delete(final ${className_d} ${className_x}) {
final int num = this.${className_x}Mapper.deleteByPrimaryKey(${className_x}.getId());
//if(num>0){
//this.${className_x}Cache.delete(${className_x}.getId());
//}
return num>0;
}

/**
* 逻辑删除${className}.
* @param id 要删除的对象id
* @return 删除结果
*/
@Override
public boolean logicDelete(final Long id) {
final int num =  this.${className_x}Mapper.logicDelete(id);
//if(num>0){
//this.${className_x}Cache.delete(id);
//}
return num>0;
}

/**
* 查找${className}列表.
* @param idList 查找条件列表
* @return 查找到的结果列表
*/
@Override
public List<${className_d}> findByIdList(final List
<String> idList) {
    return this.${className_x}Mapper.selectList(idList);
    }

    /**
    * 查找${className}列表.
    * @param ${className_x} 查找条件对象
    * @return 查找到的结果列表
    */
    @Override
    public List<${className_d}> search${className_d}ForPage(
    final ${className_d} ${className_x}){
    return this.${className_x}Mapper.search${className_d}ForPage(${className_x});
    }

    /**
    * 根据id获取${className}对象.
    * @param id 查询对象的id
    * @return 查找到的结果对象
    */
    @Override
    public ${className_d} getBy${className_d}Id(final Long id){
    //${className_d} ${className_x} = this.${className_x}Cache.getById(id);
    //if(${className_x}==null){
    return this.${className_x}Mapper.getBy${className_d}Id(id);
    //final ${className_d} ${className_x} = this.${className_x}Mapper.getBy${className_d}Id(id);
    //if(${className_x}!=null){
    //this.${className_x}Cache.save(${className_x});
    //}
    //}
    //return ${className_x};
    }
    }
