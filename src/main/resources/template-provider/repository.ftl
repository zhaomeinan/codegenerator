package ${packageName}.repository.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.weahan.util.json.JsonUtil;
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

    private ${className_d}Cache ${className_x}Cache;

    public static final String codePrefix = "${dbName}.${className_d}";

    @Autowired
    public ${className_d}Repository(final ${className_d}Mapper ${className_x}MapperIn,
                                       final ${className_d}Cache ${className_x}CacheIn) {
        this.${className_x}Mapper = ${className_x}MapperIn;
        this.${className_x}Cache = ${className_x}CacheIn;
    }

    /**
    * 插入一个${className}.
    * @param jsonString 要插入的对象
    * @return 插入结果
    */
    //@Override
    public Long insert(final String jsonString) {
        final ${className_d} ${className_x} = JsonUtil.toObject(jsonString, ${className_d}.class);
        return insert(${className_x});
    }

    /**
     * 插入一个${className}.
     * @param ${className_x} 要插入的对象
     * @return 插入结果
     */
    //@Override
    public Long insert(final ${className_d} ${className_x}) {
        //final int num = this.${className_x}Mapper.insertSelective(${className_x});
    <#list tableCarrays as tableCarray>
        <#if tableCarray.carrayName_x=="displayOrder" >
        if (${className_x}.getDisplayOrder() == null){
            ${className_x}.setDisplayOrder((long) 100);
        }
        </#if>
    </#list>

        final Long id = this.${className_x}Mapper.add${className_d}(${className_x});
        if(id>0){
            this.${className_x}Cache.save(${className_x});
            //this.${className_x}Cache.saveCode(${className_x});
        }
        return id;
    }

    /**
    * 更新${className}.
    * @param jsonString 要更新的对象
    * @return 更新结果
    */
    //@Override
    public boolean update(final String jsonString) {
        final ${className_d} ${className_x} = JsonUtil.toObject(jsonString, ${className_d}.class);
        return update(${className_x});
    }

    /**
     * 更新${className}.
     * @param ${className_x} 要更新的对象
     * @return 更新结果
     */
    //@Override
    public boolean update(final ${className_d} ${className_x}) {
        //final int num = this.${className_x}Mapper.updateByPrimaryKeySelective(${className_x});
        final int num = this.${className_x}Mapper.edit${className_d}(${className_x});

        final ${className_d} ${className_x}Old = this.getBy${className_d}Id(${className_x}.getId());
    <#list tableCarrays as tableCarray>
        <#if tableCarray.carrayType == "String" >
        if (${className_x}.get${tableCarray.carrayName_d}() == null || ${className_x}.get${tableCarray.carrayName_d}().equals("")){
            ${className_x}.set${tableCarray.carrayName_d}(${className_x}Old.get${tableCarray.carrayName_d}());
        }
        <#else>
        if (${className_x}.get${tableCarray.carrayName_d}() == null){
            ${className_x}.set${tableCarray.carrayName_d}(${className_x}Old.get${tableCarray.carrayName_d}());
        }
        </#if>
    </#list>

        if(num>0){
            this.${className_x}Cache.save(${className_x});
        }
        return num>0;
    }

    <#--/**-->
     <#--* 删除${className}.-->
     <#--* @param ${className_x} 要删除的对象-->
     <#--* @return 删除结果-->
     <#--*/-->
    <#--//@Override-->
    <#--public boolean delete(final ${className_d} ${className_x}) {-->
        <#--final int num = this.${className_x}Mapper.deleteByPrimaryKey(${className_x}.getId());-->
        <#--if(num>0){-->
            <#--this.${className_x}Cache.delete(${className_x}.getId());-->
        <#--}-->
        <#--return num>0;-->
    <#--}-->

    /**
     * 逻辑删除${className}.
     * @param id 要删除的对象id
     * @return 删除结果
     */
    //@Override
    public boolean dataStatusChangeById(final Long id, final String dataStatus) {
        byte dataStatusTrans = Byte.parseByte(dataStatus);
        return dataStatusChangeById(id,dataStatusTrans);
    }

    /**
    * 逻辑删除${className}.
    * @param id 要删除的对象id
    * @return 删除结果
    */
    //@Override
    public boolean dataStatusChangeById(final Long id, final byte dataStatus) {
        ${className_d} ${className_x} = getBy${className_d}Id(id);
        ${className_x}.setDataStatus(dataStatus);
        final int num =  this.${className_x}Mapper.dataStatusChange(id, dataStatus);
        if(num>0){
            this.${className_x}Cache.save(${className_x});
        }
        return num>0;
    }

    /**
    * 逻辑删除${className}.
    * @param ids 要删除的对象id
    * @return 删除结果
    */
    //@Override
    public boolean dataStatusChangeByArray(final Long[] ids, final String dataStatus) {
        byte dataStatusTrans = Byte.parseByte(dataStatus);
        return dataStatusChangeByArray(ids,dataStatusTrans);
    }

    /**
    * 逻辑删除${className}.
    * @param ids 要删除的对象id
    * @return 删除结果
    */
    //@Override
    public boolean dataStatusChangeByArray(final Long[] ids, final byte dataStatus) {
        for(Long id : ids){
            dataStatusChangeById(id, dataStatus);
        }
        return true;
    }

    ///**
    // * 查找${className}列表.  过时方法
    // * @param idList 查找条件列表
    // * @return 查找到的结果列表
    // */
    //@Override
    //@Deprecated
    //public List<${className_d}> findByIdList(final List<String> idList) {
    //    String[] array = (String[])list.toArray(new String[size])
    //    return this.${className_x}Mapper.selectList(idList);
    //}

    /**
    *
    * @param weahanCode  weahan_code
    * @return 操作结果
    */
    //@Override
    public Long getId(String weahanCode){
        return this.${className_x}Mapper.getIdByCode(weahanCode);
    }

    /**
    * 查找${className}列表.  过时方法
    * @param ${className_x} 查找条件对象
    * @return 查找到的结果列表
    */
    //@Override
    @Deprecated
    public List<${className_d}> search${className_d}ForPage(final ${className_d} ${className_x}){
        List< Long> idList = this.${className_x}Mapper.search${className_d}ForPage(${className_x});
        return getBy${className_d}Id(idList);
    }

    /**
    * 分页查询.
    * @param ${className_x} 条件对象
    * @return 获取到的对象列表
    */
    public List< Long> search${className_d}IdForPage(${className_d} ${className_x}){
        return this.${className_x}Mapper.search${className_d}ForPage(${className_x});
    }

    /**
    * 根据id获取${className}对象.
    * @param id 查询对象的id
    * @return 查找到的结果对象
    */
    //@Override
    public ${className_d} getBy${className_d}Id(final Long id){
        ${className_d} ${className_x} = this.${className_x}Cache.getById(id);
        if(${className_x}==null){
            ${className_x} = this.${className_x}Mapper.getBy${className_d}Id(id);
            if(${className_x} != null && ${className_x}.getDataStatus() != 99){
                this.${className_x}Cache.save(${className_x});
            }
            else {
                return null;
            }
        }
        return ${className_x};
        <#--return this.${className_x}Mapper.getBy${className_d}Id(id);-->
    }

    /**
    * 根据id数组获取对象列表
    * @param id 要获取的对象的id
    * @return 获取到的对象
    */
    public List<${className_d}> getBy${className_d}Id(List< Long> idList){
        List<${className_d}> result = new ArrayList<${className_d}>();
        for (Long id : idList) {
            ${className_d} item = getBy${className_d}Id(id);
            if(item == null){
                item.setId(id);
            }
            result.add(item);
        }
        return result;
    }
}
