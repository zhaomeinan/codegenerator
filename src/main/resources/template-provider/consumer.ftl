package ${packageName}.consumer;

import java.lang.reflect.Type;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Service;

import com.google.gson.reflect.TypeToken;
import com.weahan.core.consumer.BaseConsumer;
import ${packageName}.model.${className_d};
import com.weahan.util.json.GsonUtil;
import com.weahan.util.result.ResultProviderT;
/**
* ${className}服务实现类.
* @author weahan qd
*/
@SuppressWarnings("unused")
@Service
public class ${className_d}Consumer extends BaseConsumer {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public ${className_d}Consumer() {
    }

    /**
     * 获取URI.
     *
     * @return URI
     */
    @Override
    protected String getUri() {
        return getProviderUriConfig().get${providerUri}Uri() + "/${className_x}/";
    }

    /**
     * 分页查询返回resultProviderT<List<${className_d}>>.
     * @param jsonString
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    public ResultProviderT<List<${className_d}>> findListTForPage(final String jsonString, final String pageNum, final String pageSize) {
        final String url = getUri() + "?jsonString={jsonObj}&pageNum={pageNum}&pageSize={pageSize}";
        final String resultJson = getRestTemplate().getForObject(url, String.class, jsonString, pageNum, pageSize);
        final Type type = new TypeToken<ResultProviderT<List<${className_d}>>>() {
            }.getType();
        final ResultProviderT<List<${className_d}>> result = GsonUtil.fromJson(resultJson, type);
        logger.info(result.toString());
        return result;
    }
}
