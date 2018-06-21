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
    <select id="search${className_d}ForPage" resultType="java.lang.Long"
            parameterType="${packageName}.model.${className_d}">
        select
            id
        from ${className}
        <where>
            1 = 1
        <#list tableCarrays as tableCarray>
            <#if tableCarray.carrayType=="String">
            <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
            <#else>
            <if test="${tableCarray.carrayName_x} !=null">
            </#if>
            and ${tableCarray.carrayName}=<@mapperEl tableCarray.carrayName_x/>
        </if>
        </#list>
            <if test="dataStatus ==null">
                and data_status != 99
            </if>
        </where>
    </select>

    <update id="edit${className_d}" parameterType="${packageName}.model.${className_d}">
        update ${className} set
    <#list tableCarrays as tableCarray>
        <#if tableCarray_index != 0>
            <#if tableCarray.carrayName_x !="createtime" && tableCarray.carrayName_x !="updatetime">
                <#if tableCarray.carrayType=="String">
                <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
                <#else>
                <if test="${tableCarray.carrayName_x} !=null">
                </#if>
                    ${tableCarray.carrayName}=<@mapperEl tableCarray.carrayName_x/>,
                </if>
            </#if>
        </#if>
    </#list>
            updatetime = unix_timestamp(now())*1000
        where id=<@mapperEl "id" /> and data_status != 99
    </update>

    <select id="getBy${className_d}Id" parameterType="java.lang.Long" resultMap="${className_d}Map">
        select
            <include refid="${className_d}Columns"/>
        from
            ${className}
        WHERE
            Id = <@mapperEl "id" />
            and data_status != 99
    </select>

    <select id="getIdByCode" parameterType="java.lang.String" resultType="java.lang.Long">
        select id from ${className} where weahan_code = <@mapperEl "code" />
    </select>

    <update id="dataStatusChange">
        update ${className}
        set
            data_status = ${r'#{dataStatus}'}
            ,updatetime = unix_timestamp(now())*1000
        where id = ${r'#{id}'}
    </update>

    <insert id="add${className_d}" parameterType="${packageName}.model.${className_d}" useGeneratedKeys="true" keyProperty="id">
        insert into ${className}
        (
            <include refid="${className_d}Columns"/>
        )
        values(
    <#list tableCarrays as tableCarray>
            <@mapperEl tableCarray.carrayName_x/><#if (tableCarray_has_next)>,</#if>
    </#list>
        )
    </insert>
</mapper>