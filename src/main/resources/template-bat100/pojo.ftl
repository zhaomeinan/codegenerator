package ${packageName}.models;

import java.io.Serializable;

public class ${className_d} implements Serializable{

    private static final long serialVersionUID =  1L;

    public ${className_d} (){
    }

    <#--列出所有的字段 -->
    <#list tableCarrays as tableCarray>
    private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	</#list>

	 <#--字段的get和set -->
	<#list tableCarrays as tableCarray>
	public final ${tableCarray.carrayType} get${tableCarray.carrayName_d}() {
        return this.${tableCarray.carrayName_x};
	}

	public final void set${tableCarray.carrayName_d}(final ${tableCarray.carrayType} ${tableCarray.carrayName_x}) {
        this.${tableCarray.carrayName_x} = ${tableCarray.carrayName_x};
	}

	</#list>
}
