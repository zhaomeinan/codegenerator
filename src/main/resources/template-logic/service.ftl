package ${packageName}.services;

import com.alibaba.fastjson.JSON;
import java.util.*;
import ${packageName}.interfaces.I${className_d}Service;
import ${packageName}.model.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import com.weahan.util.UuidUtil;
import com.weahan.util.result.OperationCode;
import com.weahan.util.result.ResultBasic;
import com.weahan.util.result.ResultProvider;
import com.weahan.utility.data.mybatis.pagehelper.PageHelper;
import com.weahan.utility.data.mybatis.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
* ${className}服务实现类.
* @author weahan
*/
@SuppressWarnings("unused")
@RestController
public class ${className_d}Service implements I${className_d}Service{

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
    <#elseif  tableCarray.carrayName_x=="createTime" >
    <#elseif  tableCarray.carrayName_x=="updateTime" >
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
@Override
public final String add${className_d}(final String jsonString){
if ("".equals(jsonString)){
return new ResultBasic(OperationCode.ADD_SIGLE_LOGIC_ERROR_L1,
"输入参数为null").toJsonString();
}
final ${className_d} ${className_x}Object = JSON.parseObject(jsonString, ${className_d}.class);
if (${className_x}Object == null) {
return new ResultBasic(OperationCode.ADD_SIGLE_LOGIC_ERROR_L1,
"插入失败,输入参数格式错误").toJsonString();
}

final ${className_d} ${className_x} = new ${className_d}();
${className_x}.setId(UuidUtil.newid());
<#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName_x=="isDelete" >
    <#elseif  tableCarray.carrayName_x=="status" >
    <#elseif  tableCarray.carrayName_x=="createTime" >
    <#elseif  tableCarray.carrayName_x=="updateTime" >
    <#elseif  tableCarray.carrayName_x=="id" >
    <#else>
        <#if tableCarray.carrayType == "Integer" >
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        <#else>
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        </#if>
    </#if>
</#list>
//${className_x}.setCreatetime(new Date().getTime());
//${className_x}.setHasDelete((byte)0);

final boolean flag = this.${className_x}Repository.insert(${className_x});
if (flag) {
return new ResultProvider(OperationCode.CODE_OK, "插入成功", ${className_x}).toJsonString();
}

return new ResultBasic(OperationCode.ADD_SIGLE_LOGIC_ERROR_L1, "插入失败").toJsonString();
}

/**
* 根据id删除对象.
* @param id 要删除对象的id
* @return 结果json串
*         -result:       结果
*         -message:      提示消息
*         -code:         结果代码
*         -returnObject: 结果实体对象
*/
@DeleteMapping("/${className_x}/{id}")
@Override
public final String delete${className_d}ById(@PathVariable final Long id) {

final boolean flag = this.${className_x}Repository.logicDelete(id);

if (flag) {
return new ResultBasic(OperationCode.CODE_OK, "删除成功").toJsonString();
}
return new ResultBasic(OperationCode.DEL_SIGLE_SYSTEM_ERROR,
"删除失败").toJsonString();
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
@Override
public final String update${className_d}ById(final String jsonString){
if ("".equals(jsonString)){
return new ResultBasic(OperationCode.EDIT_SIGLE_SYSTEM_ERROR,
"插入失败,输入参数为null").toJsonString();
}

final ${className_d} ${className_x}Object = JSON.parseObject(jsonString, ${className_d}.class);
if (${className_x}Object == null) {
return new ResultBasic(OperationCode.EDIT_SIGLE_NOT_EXIST,
"${className_d}不存在").toJsonString();
}

final ${className_d} ${className_x} = this.${className_x}Repository.getBy${className_d}Id(
${className_x}Object.getId());
if (${className_x} == null) {
return new ResultBasic(OperationCode.GET_SIGLE_NOT_EXIST, "${className_d}不存在").toJsonString();
}

<#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName_x=="isDelete" >
    <#elseif  tableCarray.carrayName_x=="status" >
    <#elseif  tableCarray.carrayName_x=="createTime" >
    <#elseif  tableCarray.carrayName_x=="updateTime" >
    <#elseif  tableCarray.carrayName_x=="id" >
    <#else>
        <#if tableCarray.carrayType == "Integer" >
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        <#else>
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        </#if>
    </#if>
</#list>

//更新操作需要注意对应model里加上@Id注解   会以此当主键更新
final boolean flag = this.${className_x}Repository.update(${className_x});

if (flag) {
return new ResultProvider(OperationCode.CODE_OK, "更新成功", ${className_x}).toJsonString();
}
return new ResultBasic(OperationCode.EDIT_SIGLE_SYSTEM_ERROR, "更新失败").toJsonString();
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
@Override
public final String get${className_d}ById(@PathVariable final Long id){
final ${className_d} ${className_x} = this.${className_x}Repository.getBy${className_d}Id(id);
if (${className_x} == null) {
return new ResultBasic(OperationCode.GET_SIGLE_NOT_EXIST,
"对象不存在").toJsonString();
}
return new ResultProvider(OperationCode.CODE_OK, "获取成功", ${className_x}).toJsonString();
}

/**
* 根据id查询对象.
* @param jsonString 查询条件对象的json字符串
* @param pageNum 查询页码
* @param pageSize 查询每页大小
* @return 结果json串
*         -result:       结果
*         -message:      提示消息
*         -code:         结果代码
*         -returnObject: 结果实体对象
*/
@GetMapping("/${className_x}/")
@Override
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
    <#if tableCarray.carrayName_x=="isDelete" >
    <#elseif  tableCarray.carrayName_x=="status" >
    <#elseif  tableCarray.carrayName_x=="createTime" >
    <#elseif  tableCarray.carrayName_x=="updateTime" >
    <#elseif  tableCarray.carrayName_x=="id" >
    <#else>
        <#if tableCarray.carrayType == "Integer" >
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        <#else>
        ${className_x}.set${tableCarray.carrayName_d}(${className_x}Object.get${tableCarray.carrayName_d}());
        </#if>
    </#if>
</#list>

//${className_x}.setHasDelete((byte)0);

//启动分页拦截  // 拦截当前线程下一个查询  仅拦截一次
PageHelper.startPage(Integer.parseInt(pageNum), Integer.parseInt(pageSize));
//可以加上排序字段 会自动拼装sql语句里
//PageHelper.startPage(Integer.parseInt(pageNum), Integer.parseInt(pageSize),"CreateDate desc");

final List<${className_d}> ${className_x}List = this.${className_x}Repository.
search${className_d}ForPage(${className_x});

//查询结果用PageInfo转换一下  page里就可以拿分页参数了
final PageInfo<${className_d}> page = new PageInfo<>(${className_x}List);

return new ResultProvider(OperationCode.CODE_OK, "分页成功",
${className_x}List, (int)page.getTotal()).toJsonString();
}
}
