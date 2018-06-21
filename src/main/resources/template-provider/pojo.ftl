package ${packageName}.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.weahan.utility.data.mybatis.mapper.mapper.annotation.NameStyle;



/**
 * ${className}.
 * 如果表名跟实体类不同 需要注明一下表名
 * @author weahan qd
 */
@SuppressWarnings("unused")
@Table(name="${className}")
@NameStyle
public class ${className_d} implements Serializable{

    private static final long serialVersionUID =  1L;

    public ${className_d} (){
    }

    <#--列出所有的字段 -->
    <#list tableCarrays as tableCarray>

    /** ${tableCarray.remark}. */
	<#if tableCarray.carrayName_x=="id" >
	@Id
    private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	<#else >
    private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	</#if>

	</#list>


	 <#--字段的get和set -->
	<#list tableCarrays as tableCarray>

	public final ${tableCarray.carrayType} get${tableCarray.carrayName_d}() {
        <#if tableCarray.carrayType=="java.util.Date" >
        if (this.${tableCarray.carrayName_x} != null){
            return new Date(this.${tableCarray.carrayName_x}.getTime());
        }
        else {
            return null;
        }
        <#else>
        return this.${tableCarray.carrayName_x};
        </#if>
	}

	public final void set${tableCarray.carrayName_d}(final ${tableCarray.carrayType} ${tableCarray.carrayName_x}) {
        <#if tableCarray.carrayType=="java.util.Date" >
        if (${tableCarray.carrayName_x} != null){
            this.${tableCarray.carrayName_x} = (Date)${tableCarray.carrayName_x}.clone();
        }
        else {
            this.${tableCarray.carrayName_x} = null;
        }
        <#else>
        this.${tableCarray.carrayName_x} = ${tableCarray.carrayName_x};
        </#if>
	}
	</#list>

}
