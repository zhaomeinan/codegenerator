<#macro mapperEl value="">${r"#{"}${value}}</#macro>
<#macro mapperEl2 value="">${r"${"}${value}}</#macro>
<#macro mapperEl3 value="">${r"${"}${value}Co}</#macro>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${packageName}.repository.mapper.${className_d}Mapper">

    <!-- 结果对应 -->
    <resultMap id="${className_d}ResultMap" type="${packageName}.models.${className_d}">
    <#list tableCarrays as tableCarray>
        <result column="${tableCarray.carrayName}" property="${tableCarray.carrayName_x}" />
    </#list>
    </resultMap>

    <!-- 用于select查询公用抽取的列 -->
    <sql id="${className_d}Columns">
    ${stringCarrayNames3}
    </sql>

    <insert id="insert" parameterType="${packageName}.models.${className_d}" useGeneratedKeys="true" keyProperty="id">
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

    <update id="update" parameterType="${packageName}.models.${className_d}">
        update ${className}
        <set>
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
        </set>
        where id=<@mapperEl "id" />
    </update>

    <delete id="delete" parameterType="java.lang.Long">
        DELETE
        FROM
        ${className}
        WHERE
        id = <@mapperEl "id" />
    </delete>

    <select id="select" parameterType="java.lang.Long" resultMap="${className_d}ResultMap">
        select
        <include refid="${className_d}Columns"/>
        from
        ${className}
        WHERE
        id = <@mapperEl "id" />
    </select>

    <sql id="dynamicWhere">
    <#list tableCarrays as tableCarray>
        <#if tableCarray.carrayType=="String">
        <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
        <#else>
        <if test="${tableCarray.carrayName_x} !=null">
        </#if>
            <if test="${tableCarray.carrayName_x}Co ==null">
                and ${tableCarray.carrayName}=<@mapperEl tableCarray.carrayName_x/>
            </if>
            <if test="${tableCarray.carrayName_x}Co !=null">
                and ${tableCarray.carrayName} <@mapperEl3 tableCarray.carrayName_x/> <@mapperEl tableCarray.carrayName_x/>
            </if>
        </if>
    </#list>
    </sql>

    <select id="cntByMap" parameterType="java.util.Map" resultType="java.lang.Long">
        select count(*) from ${className} where 1=1
        <include refid="dynamicWhere" />
    </select>

    <select id="getByMap" parameterType="java.util.Map" resultType="java.lang.Long">
        select id from ${className} where 1=1

        <include refid="dynamicWhere" />

        <if test="maxId != null">
            and id  &gt; <@mapperEl "maxId"/>
        </if>
        <if test="sortColumns != null">
            ORDER BY <@mapperEl "sortColumns"/>
        </if>
        <if test="start != null and size == null">
            limit <@mapperEl "size"/>
        </if>
        <if test="start != null and size != null">
            limit <@mapperEl "start"/>, <@mapperEl "size"/>
        </if>
    </select>

    <select id="getByMapList" parameterType="java.util.Map" resultMap="${className_d}ResultMap">
        select <include refid="${className_d}Columns"/> from ${className} where 1=1

        <include refid="dynamicWhere" />

        <if test="maxId != null">
            and id  &gt; <@mapperEl "maxId"/>
        </if>
        <if test="sortColumns != null">
            ORDER BY <@mapperEl2 "sortColumns"/>
        </if>
        <if test="start != null and size == null">
            limit <@mapperEl "size"/>
        </if>
        <if test="start != null and size != null">
            limit <@mapperEl "start"/>, <@mapperEl "size"/>
        </if>
    </select>

    <update id="updateByCode" parameterType="${packageName}.models.${className_d}">
        update ${className}
        <set>
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
        </set>
        where bf_code=<@mapperEl "bfCode" />
    </update>
</mapper>