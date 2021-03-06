package ${packageName}.services;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import ${packageName}.model.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import com.weahan.util.result.OperationCode;
import com.weahan.util.result.ResultBasic;
import com.weahan.util.result.ResultProvider;
import org.springframework.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * ${className}服务实现类.
 * @author weahan qd
 */
@SuppressWarnings("unused")
@RestController
public class ${className_d}Service{

    private I${className_d}Repository ${className_x}Repository;

    @Autowired
    public ${className_d}Service(final I${className_d}Repository ${className_x}Repository1){
        this.${className_x}Repository = ${className_x}Repository1;
    }


    /**
      * 增加${className_d}.
      * @param jsonString 参数json对象字符串
<#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName_x=="isDelete" >
    <#elseif  tableCarray.carrayName_x=="status" >
    <#elseif  tableCarray.carrayName_x=="createtime" >
    <#elseif  tableCarray.carrayName_x=="updatetime" >
    <#elseif  tableCarray.carrayName_x=="id" >
    <#else>
      *      -${tableCarray.carrayName_x};
    </#if>
</#list>
      * @return 结果json串
      *         -result:       结果
      *         -message:      提示消息
      *         -code:         结果代码
      *         -returnObject: 结果实体对象
      */
    @PostMapping("/${className_x}/")
    //@Override
    public final String add${className_d}(@RequestBody final String jsonString) throws Exception{
        if ("".equals(jsonString)){
            return new ResultBasic(OperationCode.ADD_SIGLE_LOGIC_ERROR_L1,
                    "输入参数为null").toJsonString();
        }
        final ${className_d} ${className_x} = JSON.parseObject(jsonString, ${className_d}.class);
        if (${className_x} == null) {
            return new ResultBasic(OperationCode.ADD_SIGLE_LOGIC_ERROR_L1,
                    "插入失败,输入参数格式错误").toJsonString();
        }

<#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName_x=="weahanCode" >
        if (StringUtils.isEmpty(${className_x}.getWeahanCode())) {
            throw new Exception("weahanCode不能为null");
        }
    </#if>
</#list>
        <#--final ${className_d} ${className_x} = new ${className_d}();-->
        <#--if (StringUtil.isNotEmpty(${className_x}Object.getWeahanCode())) {-->
            <#--${className_x}.setWeahanCode(${className_x}Object.getWeahanCode());-->
        <#--}-->
        <#--else {-->
            <#--${className_x}.setWeahanCode(UuidUtil.newid());-->
        <#--}-->

        ${className_x}.setCreatetime(System.currentTimeMillis());
        ${className_x}.setUpdatetime(System.currentTimeMillis());
        //${className_x}.setCreatetime(new Date().getTime());
        //${className_x}.setHasDelete((byte)0);

        final Long id = this.${className_x}Repository.insert(${className_x});
        if (id != null) {
            return new ResultProvider(OperationCode.CODE_OK, "插入成功", ${className_x}).toJsonString();
        }

        return new ResultBasic(OperationCode.ADD_SIGLE_LOGIC_ERROR_L1, "插入失败").toJsonString();
    }

    /**
      * 根据id更改数据状态.
      * @param id 要更改状态对象的id
      * @param status 要更改的状态
      * @return 结果json串
      *         -result:       结果
      *         -message:      提示消息
      *         -code:         结果代码
      *         -returnObject: 结果实体对象
      */
    @PutMapping("/${className_x}/status/id")
    //@Override
    public final String changeStatus${className_d}ById(@RequestParam final Long id, @RequestParam final String status) {

        final boolean flag = this.${className_x}Repository.dataStatusChangeById(id,status);

        if (flag) {
            return new ResultBasic(OperationCode.CODE_OK, "更改成功").toJsonString();
        }
        return new ResultBasic(OperationCode.DEL_SIGLE_SYSTEM_ERROR,
                "更改失败").toJsonString();
    }

    /**
     * 根据code更改数据状态.
     * @param code 要更改状态对象的code
     * @param status 要更改的状态
     * @return 结果json串
     *         -result:       结果
     *         -message:      提示消息
     *         -code:         结果代码
     *         -returnObject: 结果实体对象
     */
    @PutMapping("/${className_x}/status/code")
    //@Override
    public final String changeStatus${className_d}ByCode(@RequestParam final String code, @RequestParam final String status) {
        long id = this.${className_x}Repository.getId(code);
        return changeStatus${className_d}ById(id,status);
    }

    /**
     * 根据id列表更改数据状态.
     * @param ids 要更改状态对象的ids
     * @param status 要更改的状态
     * @return 结果json串
     *         -result:       结果
     *         -message:      提示消息
     *         -code:         结果代码
     *         -returnObject: 结果实体对象
     */
    @PutMapping("/${className_x}/status/array")
    //@Override
    public final String changeStatus${className_d}ByArray(@RequestParam final Long[] ids, @RequestParam final String status) {
        for (Long id:ids) {
            changeStatus${className_d}ById(id,status);
        }
        return new ResultBasic(OperationCode.CODE_OK, "更改成功").toJsonString();
    }

    /**
     * 根据code列表更改数据状态.
     * @param codes 要更改状态对象的codes
     * @param status 要更改的状态
     * @return 结果json串
     *         -result:       结果
     *         -message:      提示消息
     *         -code:         结果代码
     *         -returnObject: 结果实体对象
     */
    @PutMapping("/${className_x}/status/code/array")
    //@Override
    public final String changeStatus${className_d}ByCodeArray(@RequestParam final String[] codes, @RequestParam final String status) {
        for (String code:codes) {
            changeStatus${className_d}ByCode(code,status);
        }
        return new ResultBasic(OperationCode.CODE_OK, "更改成功").toJsonString();
    }

    /**
     * 根据id删除对象.
     *
     * @param id 要删除对象的id
     * @return 结果json串
     * -result:       结果
     * -message:      提示消息
     * -code:         结果代码
     * -returnObject: 结果实体对象
     */
    @DeleteMapping("/${className_x}/{id}")
    //@Override
    public final String delete${className_d}ById(@PathVariable final Long id) {
        final boolean flag = this.${className_x}Repository.dataStatusChangeById(id,"99");
        if (flag) {
            return new ResultBasic(OperationCode.CODE_OK, "删除成功").toJsonString();
        }
        return new ResultBasic(OperationCode.DEL_SIGLE_SYSTEM_ERROR,"删除失败").toJsonString();
    }

    /**
     * 根据id启用对象.
     *
     * @param id 要删除对象的id
     * @return 结果json串
     * -result:       结果
     * -message:      提示消息
     * -code:         结果代码
     * -returnObject: 结果实体对象
     */
    @PutMapping("/${className_x}/normal/{id}")
    //@Override
    public final String normal${className_d}ById(@PathVariable final Long id) {
        final boolean flag = this.${className_x}Repository.dataStatusChangeById(id,"1");
        if (flag) {
            return new ResultBasic(OperationCode.CODE_OK, "启用成功").toJsonString();
        }
        return new ResultBasic(OperationCode.DEL_SIGLE_SYSTEM_ERROR,"启用失败").toJsonString();
    }

    /**
     * 根据id停用对象.
     *
     * @param id 要删除对象的id
     * @return 结果json串
     * -result:       结果
     * -message:      提示消息
     * -code:         结果代码
     * -returnObject: 结果实体对象
     */
    @PutMapping("/${className_x}/stop/{id}")
    //@Override
    public final String stop${className_d}ById(@PathVariable final Long id) {
        final boolean flag = this.${className_x}Repository.dataStatusChangeById(id,"2");
        if (flag) {
            return new ResultBasic(OperationCode.CODE_OK, "停用成功").toJsonString();
        }
        return new ResultBasic(OperationCode.DEL_SIGLE_SYSTEM_ERROR,"停用失败").toJsonString();
    }

    /**
      * 根据id更新对象.
      * @param jsonString 要更新对象的json字符串
      * @return 结果json串
      *         -result:       结果
      *         -message:      提示消息
      *         -code:         结果代码
      *         -returnObject: 结果实体对象
      */
    @PutMapping("/${className_x}/")
    //@Override
    public final String update${className_d}ById(@RequestBody final String jsonString){
        if ("".equals(jsonString)){
            return new ResultBasic(OperationCode.EDIT_SIGLE_LOGIC_ERROR_L1,
            "输入参数为null").toJsonString();
        }
        final ${className_d} ${className_x}Object = JSON.parseObject(jsonString, ${className_d}.class);
        if (${className_x}Object == null) {
            return new ResultBasic(OperationCode.EDIT_SIGLE_LOGIC_ERROR_L1,
            "更新失败,输入参数格式错误").toJsonString();
        }

        ${className_x}Object.setUpdatetime(System.currentTimeMillis());

        final boolean flag = this.${className_x}Repository.update(${className_x}Object);
            if (flag) {
            return new ResultProvider(OperationCode.CODE_OK, "更新成功", ${className_x}Object).toJsonString();
        }

        return new ResultBasic(OperationCode.EDIT_SIGLE_LOGIC_ERROR_L1, "更新失败").toJsonString();

        <#--if ("".equals(jsonString)){-->
            <#--return new ResultBasic(OperationCode.EDIT_SIGLE_SYSTEM_ERROR,-->
                    <#--"插入失败,输入参数为null").toJsonString();-->
        <#--}-->

        <#--final ${className_d} ${className_x}Object = JSON.parseObject(jsonString, ${className_d}.class);-->
        <#--if (${className_x}Object == null) {-->
            <#--return new ResultBasic(OperationCode.EDIT_SIGLE_NOT_EXIST,-->
                    <#--"${className_d}不存在").toJsonString();-->
        <#--}-->

        <#--final ${className_d} ${className_x} = this.${className_x}Repository.getBy${className_d}Id(-->
                        <#--${className_x}Object.getId());-->
        <#--if (${className_x} == null) {-->
            <#--return new ResultBasic(OperationCode.GET_SIGLE_NOT_EXIST, "${className_d}不存在").toJsonString();-->
        <#--}-->

<#--<#list tableCarrays as tableCarray>-->
    <#--<#if tableCarray.carrayName_x=="isDelete" >-->
    <#--<#elseif  tableCarray.carrayName_x=="status" >-->
    <#--<#elseif  tableCarray.carrayName_x=="createtime" >-->
    <#--<#elseif  tableCarray.carrayName_x=="updatetime" >-->
    <#--<#elseif  tableCarray.carrayName_x=="id" >-->
    <#--<#else>-->
        <#--<#if tableCarray.carrayType == "Integer" >-->
        <#--${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());-->
        <#--<#else>-->
        <#--${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());-->
        <#--</#if>-->
    <#--</#if>-->
<#--</#list>-->

        <#--${className_x}.setUpdatetime(System.currentTimeMillis());-->

        <#--//更新操作需要注意对应model里加上@Id注解   会以此当主键更新-->
        <#--final boolean flag = this.${className_x}Repository.update(${className_x});-->

        <#--if (flag) {-->
            <#--return new ResultProvider(OperationCode.CODE_OK, "更新成功", ${className_x}).toJsonString();-->
        <#--}-->
        <#--return new ResultBasic(OperationCode.EDIT_SIGLE_SYSTEM_ERROR, "更新失败").toJsonString();-->
    }

    /**
      * 根据id获取对象.
      * @param id 要获取的对象id
      * @return 结果json串
      *         -result:       结果
      *         -message:      提示消息
      *         -code:         结果代码
      *         -returnObject: 结果实体对象
      */
    @GetMapping("/${className_x}/{id}")
    //@Override
    public final String get${className_d}ById(@PathVariable final Long id){
        final ${className_d} ${className_x} = this.${className_x}Repository.getBy${className_d}Id(id);
        if (${className_x} == null) {
            return new ResultBasic(OperationCode.GET_SIGLE_NOT_EXIST,
                    "对象不存在").toJsonString();
        }
        return new ResultProvider(OperationCode.CODE_OK, "获取成功", ${className_x}).toJsonString();
    }

    /**
     * 根据code获取对象.
     * @param code 要获取的对象code
     * @return 结果json串
     *         -result:       结果
     *         -message:      提示消息
     *         -code:         结果代码
     *         -returnObject: 结果实体对象
     */
    @GetMapping("/${className_x}/code/{code}")
    //@Override
    public final String get${className_d}ByCode(@PathVariable final String code){
        long id = this.${className_x}Repository.getId(code);
        return get${className_d}ById(id);
    }

    /**
      * 根据id查询对象.
      * @param jsonString 查询条件对象的json字符串
      * @param pageNum 查询页码
      * @param pageSize 查询每页大小
      * @param orderString 查询分页排序
      * @return 结果json串
      *         -result:       结果
      *         -message:      提示消息
      *         -code:         结果代码
      *         -returnObject: 结果实体对象
      */
    @GetMapping("/${className_x}/")
    //@Override
    public final String find${className_d}ForPage(final String jsonString,
                                                @RequestParam(value = "pageNum", defaultValue = "1") final String pageNum,
                                                @RequestParam(value = "pageSize", defaultValue = "20") final String pageSize,
                                                @RequestParam(value = "orderString", defaultValue = "createtime desc") String orderString){
        final ${className_d} ${className_x}Object;
        if(StringUtils.isEmpty(jsonString)){
            ${className_x}Object = new ${className_d}();
        }
        else{
            ${className_x}Object = JSON.parseObject(jsonString, ${className_d}.class);
            if (${className_x}Object == null) {
                return new ResultBasic(OperationCode.GET_LIST_SYSTEM_ERROR,
                        "输入参数格式错误").toJsonString();
            }
        }

        final ${className_d} ${className_x} = new ${className_d}();

<#list tableCarrays as tableCarray>
    <#if  tableCarray.carrayName_x=="status" >
    <#elseif  tableCarray.carrayName_x=="createtime" >
    <#elseif  tableCarray.carrayName_x=="updatetime" >
    <#elseif  tableCarray.carrayName_x=="id" >
    <#else>
        <#if tableCarray.carrayType == "Integer" >
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        <#else>
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        </#if>
    </#if>
</#list>

        //启动分页拦截  // 拦截当前线程下一个查询  仅拦截一次
        //PageHelper.startPage(Integer.parseInt(pageNum), Integer.parseInt(pageSize));
        //可以加上排序字段 会自动拼装sql语句里
        PageHelper.startPage(Integer.parseInt(pageNum), Integer.parseInt(pageSize),orderString);

        final List<${className_d}> resultList = this.${className_x}Repository.
                  search${className_d}ForPage(${className_x});

        //查询结果用PageInfo转换一下  page里就可以拿分页参数了
        final PageInfo<${className_d}> page = new PageInfo<>(resultList);

        return new ResultProvider(OperationCode.CODE_OK, "分页成功",resultList, (int)page.getTotal()).toJsonString();
    }
}
