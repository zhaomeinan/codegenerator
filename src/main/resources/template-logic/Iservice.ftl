package ${packageName}.interfaces;

/**
* ${className}服务接口.
* @author weahan
*/
@SuppressWarnings("unused")
public interface I${className_d}Service {

<#--增加方法列出所有字段，除去Id、CreateTime、UpdateTime、IsDelete、Status -->
/**
* 添加${className}.
* @param jsonString 参数对象json串
<#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName_x=="isDelete" >
    <#elseif  tableCarray.carrayName_x=="status" >
    <#elseif  tableCarray.carrayName_x=="createTime" >
    <#elseif  tableCarray.carrayName_x=="updateTime" >
    <#elseif  tableCarray.carrayName_x=="id" >
    <#else>
    *         -${tableCarray.carrayName_x} ${tableCarray.remark}
    </#if>
</#list>
* @return 结果json串
*         -result:       结果
*         -message:      提示消息
*         -code:         结果代码
*         -returnObject: 结果实体对象
*/
String add${className_d}(String jsonString);

/**
* 根据Id删除${className}.
* @param id 对象编号
* @return 结果json串
*         -result:       结果
*         -message:      提示消息
*         -code:         结果代码
*         -returnObject: 结果实体对象
*/
String delete${className_d}ById(Long id);

/**
* 根据Id修改${className}.
* @param jsonString 参数对象json串
<#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName_x=="isDelete" >
    <#elseif  tableCarray.carrayName_x=="createTime" >
    <#elseif  tableCarray.carrayName_x=="updateTime" >
    <#else>
    *         -${tableCarray.carrayName_x} ${tableCarray.remark}
    </#if>
</#list>
* @return 结果json串
*         -result:       结果
*         -message:      提示消息
*         -code:         结果代码
*         -returnObject: 结果实体对象
*/
String update${className_d}ById(String jsonString);

/**
* 根据Id获取${className}对象.
* @param id 对象编号
* @return 结果json串
*         -result:       结果
*         -message:      提示消息
*         -code:         结果代码
*         -returnObject: 结果实体对象
*/
String get${className_d}ById(Long id);

/**
* 分页查询${className}.
* @param jsonString 参数对象json串
<#list tableCarrays as tableCarray>
    <#if  tableCarray.carrayName_x=="id" >
    <#else>
        <#if  tableCarray.carrayName_x=="createTime" >
        *         -begin${tableCarray.carrayName_d} 开始${tableCarray.remark}
        *         -end${tableCarray.carrayName_d} 结束${tableCarray.remark}
        <#else>
        *         -${tableCarray.carrayName_x} ${tableCarray.remark}
        </#if>
    </#if>
</#list>
* @param pageNum 分页页码.
* @param pageSize 分页大小
* @return 结果json串
*         -result:       结果
*         -message:      提示消息
*         -code:         结果代码
*         -returnObject: 结果实体对象
*/
String find${className_d}ForPage(String jsonString, String pageNum, String pageSize);
}
