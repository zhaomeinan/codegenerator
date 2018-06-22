<html>
<title>代码生成器</title>

<style type="text/css">
    .input-text{
        width:500px;
    }
    span{
        color: red;
    }
</style>

<body>

<h1>代码生成器</h1>
<form action="/index/" method="post">
    <table>
        <tr>
            <td>packageName：</td>
            <td><input type="text" name="packageName" class="input-text" value="${(config.packageName)!}"/></td>
            <td><span>example: com.bat100.customer.producer</span></td>
        </tr>
        <tr>
            <td>srcPath：</td>
            <td><input type="text" name="srcPath" class="input-text" value="${(config.srcPath)!}"/></td>
            <td><span>example: D:\generate\</span></td>
        </tr>
        <tr>
            <td>destPath：</td>
            <td><input type="text" name="destPath" class="input-text" value="${(config.destPath)!}"/></td>
            <td><span>example: D:\workspace2\customer-producer\bf_service_customer_producer\</span></td>
        </tr>
        <tr>
            <td>数据库表：</td>
            <td><input type="text" name="tableNames" class="input-text" value="${tableNames!}"/></td>
            <td><span>example: users,role（如不指定表，默认生成数据库所有表）</span></td>
        </tr>
    </table>
    <table>
        <tr style="height: 60px;">
            <td>选择生成的文件：</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="openPojo" id="openPojo" <#if (config.openPojo)??><#if (config.openPojo)?string( "true", "false") == 'true'> checked="checked"</#if></#if>><label for="openPojo">pojo</label>
                &nbsp;&nbsp;&nbsp;
                pojoModuleName：<input type="text" name="pojoModuleName" class="input-text" value="${(config.pojoModuleName)!}"/></td>
            <td><span>example: customer_producer_models</span></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="openMapper" id="openMapper" <#if (config.openMapper)??><#if (config.openMapper)?string( "true", "false") == 'true'> checked="checked"</#if></#if>><label for="openMapper">mapper</label>
                &nbsp;&nbsp;&nbsp; mapperModuleName：
                <input type="text" name="mapperModuleName" class="input-text" value="${(config.mapperModuleName)!}"/></td>
            <td><span>example: customer_producer_repository</span></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="openIRepository" id="openIRepository" <#if (config.openIRepository)??><#if (config.openIRepository)?string( "true", "false") == 'true'> checked="checked"</#if></#if>><label for="openIRepository">iRepository</label>
                &nbsp;&nbsp;&nbsp;
                iRepositoryModuleName：  <input type="text" name="iRepositoryModuleName" class="input-text" value="${(config.iRepositoryModuleName)!}"/></td>
            <td><span>example: customer_producer_repository</span></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="openRepository" id="openRepository" <#if (config.openRepository)??><#if (config.openRepository)?string( "true", "false") == 'true'> checked="checked"</#if></#if>><label for="openRepository">repository</label>
                &nbsp;&nbsp;&nbsp;
                repositoryModuleName：  <input type="text" name="repositoryModuleName" class="input-text" value="${(config.repositoryModuleName)!}"/></td>
            <td><span>example: customer_producer_repository</span></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="openService" id="openService" <#if (config.openService)??><#if (config.openService)?string( "true", "false") == 'true'> checked="checked"</#if></#if>><label for="openService">service</label>
                &nbsp;&nbsp;&nbsp;
                serviceModuleName：  <input type="text" name="serviceModuleName" class="input-text" value="${(config.serviceModuleName)!}"/></td>
            <td><span>example: customer_producer_services</span></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="openSqlXml" id="openSqlXml" <#if (config.openSqlXml)??><#if (config.openSqlXml)?string( "true", "false") == 'true'> checked="checked"</#if></#if>><label for="openSqlXml">sqlXml</label>
                &nbsp;&nbsp;&nbsp;
                sqlXmlDestPath：  <input type="text" name="sqlXmlDestPath" class="input-text" value="${(config.sqlXmlDestPath)!}"/></td>
            <td><span>example: customer_producer_web\src\main\resources\mybatis\mapper\</span></td>
        </tr>
        <tr style="height: 100px;"><td><input type="submit" value="提交"></td></tr>
    </table>
    <table>
        <tr>
            <td><h1 style="color: red">${result!}</h1></td>
        </tr>
    </table>
</form>

</body>
</html>