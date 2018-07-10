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
        <#if tableCarray.carrayName_x =="gmtCreateTime" || tableCarray.carrayName_x =="gmtModifyTime">
        NOW()<#if (tableCarray_has_next)>,</#if>
        <#elseif tableCarray.carrayName_x =="recStatus">
        0<#if (tableCarray_has_next)>,</#if>
        <#else>
        <@mapperEl tableCarray.carrayName_x/><#if (tableCarray_has_next)>,</#if>
        </#if>
    </#list>
        )
    </insert>

    <update id="update" parameterType="${packageName}.models.${className_d}">
        update ${className}
        <set>
    <#list tableCarrays as tableCarray>
        <#if tableCarray_index != 0 && tableCarray.carrayName_x != 'bfCode' && tableCarray.carrayName_x !="gmtCreateTime" && tableCarray.carrayName_x !="createUserId">
            <#if tableCarray.carrayName_x=="gmtModifyTime">
            ${tableCarray.carrayName}=NOW(),
            <#else>
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
          and rec_status = 0
    </update>

    <delete id="delete" parameterType="java.lang.Integer">
        DELETE
        FROM
        ${className}
        WHERE
        id = <@mapperEl "id" />
    </delete>

    <select id="select" parameterType="java.lang.Integer" resultMap="${className_d}ResultMap">
        select
        <include refid="${className_d}Columns"/>
        from
        ${className}
        WHERE
        id = <@mapperEl "id" />
        and rec_status = 0
    </select>

    <sql id="dynamicWhere">
    <#list tableCarrays as tableCarray>
        <#if tableCarray.carrayName_x != "recStatus">
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
        <#else>
            and rec_status=0
        </#if>
    </#list>
    </sql>

    <select id="cntByMap" parameterType="java.util.Map" resultType="java.lang.Integer">
        select count(*) from ${className} where 1=1
        <include refid="dynamicWhere" />
    </select>

    <select id="getByMap" parameterType="java.util.Map" resultType="java.lang.Integer">
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
        <#if tableCarray_index != 0 && tableCarray.carrayName_x != 'bfCode' && tableCarray.carrayName_x !="gmtCreateTime" && tableCarray.carrayName_x !="createUserId">
            <#if tableCarray.carrayName_x=="gmtModifyTime">
            ${tableCarray.carrayName}=NOW(),
            <#else>
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
          and rec_status = 0
    </update>

    <select id="selectByBfCode" parameterType="java.lang.String" resultMap="${className_d}ResultMap">
        select
        <include refid="${className_d}Columns"/>
        from
    ${className}
        WHERE
        bf_code = <@mapperEl "bfCode" />
        and rec_status = 0
    </select>
</mapper>