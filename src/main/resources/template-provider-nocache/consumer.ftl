package ${packageName}.services;

import com.alibaba.fastjson.JSON;
import java.util.*;
import ${packageName}.model.${className_d};
import com.weahan.util.result.ResultProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/**
* ${className}服务实现类.
* @author weahan qd
*/
@SuppressWarnings("unused")
public class ${className_d}Service {

private final String providerUri = "http://family-doctor-provider-person/${className_x}/";

private final Logger logger = LoggerFactory.getLogger(this.getClass());

public final Logger getLogger() {
return this.logger;
}

@Autowired
private RestTemplate restTemplate;

/**
* 增加${className_d}.
* @param jsonObj 参数json对象字符串
* @return 结果ResultProvider
*/
@PostMapping("/${className_x}/")
public final ResultProvider add${className_d}(final String jsonObj){
HttpEntity
<String> formEntity = new HttpEntity<>(jsonObj.toString());
    ResultProvider result = restTemplate.postForObject(providerUri,formEntity, ResultProvider.class);
    getLogger().info(result.toString());
    return result;
    }


    /**
    * 根据id删除对象.
    * @param id 要删除对象的id
    * @return 结果ResultProvider
    */
    @DeleteMapping("/${className_x}/{id}")
    public final ResultProvider delete${className_d}ById(@PathVariable final Long id) {
    ResponseEntity
    <ResultProvider> resultEntity = restTemplate.exchange(
        providerUri+ id, HttpMethod.DELETE, null, ResultProvider.class);
        ResultProvider result = resultEntity.getBody();
        getLogger().info(result.toString());
        return result;
        }

        /**
        * 根据id更新对象.
        * @param jsonObj 要更新对象的json字符串
        * @return 结果ResultProvider
        */
        @PutMapping("/${className_x}/")
        public final ResultProvider update${className_d}ById(final String jsonObj){
        HttpEntity
        <String> formEntity = new HttpEntity
            <String>(jsonObj.toString());
                ResponseEntity
                <ResultProvider> resultEntity = restTemplate.exchange(
                    providerUri,HttpMethod.PUT, formEntity, ResultProvider.class);
                    ResultProvider result = resultEntity.getBody();
                    getLogger().info(result.toString());
                    return result;
                    }

                    /**
                    * 根据id获取对象.
                    * @param id 要获取的对象id
                    * @return 结果ResultProvider
                    */
                    @GetMapping("/${className_x}/{id}")
                    public final ResultProvider get${className_d}ById(@PathVariable final Long id){
                    ResultProvider result = restTemplate.getForObject(providerUri+ id, ResultProvider.class);
                    getLogger().info(result.toString());
                    return result;
                    }

                    /**
                    * 根据id删除对象.
                    * @param jsonObj 查询条件对象的json字符串
                    * @param pageNum 查询页码
                    * @param pageSize 查询每页大小
                    * @return 结果ResultProvider
                    */
                    @GetMapping("/${className_x}/")
                    public final ResultProvider find${className_d}ForPage(final String jsonObj,
                    final String pageNum, final String pageSize){
                    MultiValueMap
                    <String
                    , String> params = new LinkedMultiValueMap<>();
                    params.add("jsonString",jsonObj);
                    params.add("pageNum","1");
                    params.add("pageSize","10");

                    ResultProvider result = restTemplate.getForObject("/person/", ResultProvider.class, params);
                    getLogger().info(result.toString());
                    return result;
                    }
                    }
