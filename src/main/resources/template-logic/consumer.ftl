package ${packageName}.consumer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Service;

import com.weahan.core.consumer.BaseConsumer;

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
        return getProviderUriConfig().get${dbName}Uri() + "/${className_x}/";
    }

}
