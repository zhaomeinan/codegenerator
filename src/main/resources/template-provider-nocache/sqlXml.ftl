<#macro mapperEl value="">${r"#{"}${value}}</#macro>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${packageName}.repository.mapper.${className_d}Mapper">
    <!-- 结果对应-->
    <resultMap id="${className_d}Map" type="${packageName}.model.${className_d}">
    <#list tableCarrays as tableCarray>
        <result property="${tableCarray.carrayName_x}" column="${tableCarray.carrayName}"/>
        <!-- ${tableCarray.remark} -->
    </#list>
    </resultMap>


    <sql id="${className_d}Columns">
    ${stringCarrayNames3}
    </sql>

    <!-- 分页条件查询-->
    <select id="search${className_d}ForPage" resultMap="${className_d}Map"
            parameterType="${packageName}.model.${className_d}">
        select
        <include refid="${className_d}Columns"/>
        from ${className}
        <where>
        <#list tableCarrays as tableCarray>
            <#if tableCarray.carrayType=="String">
            <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
            <#else>
            <if test="${tableCarray.carrayName_x} !=null">
            </#if>
            and ${tableCarray.carrayName}=<@mapperEl tableCarray.carrayName_x/>
        </if>
        </#list>
        </where>
    </select>

    <select id="getBy${className_d}Id" parameterType="String" resultMap="${className_d}Map">
        SELECT
        <include refid="${className_d}Columns"/>
        from ${className} WHERE Id = <@mapperEl "id" />
    </select>

    <update id="logicDelete" parameterType="String">
        update ${className} set data_status=99,UpdateTime=now() where id=<@mapperEl "id" />
    </update>

</mapper>