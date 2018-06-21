package ${packageName}.repository.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import ${packageName}.model.${className_d};
import com.weahan.utility.data.commons.persistence.CacheDaoPlus;




/**
 * ${className}.
 * @author weahan qd
  */
@Component
@SuppressWarnings("unused")
public class ${className_d}Cache extends CacheDaoPlus<${className_d}>{

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    ${"@Value(\"$\{cache.timeout}\")"}
    private int expire;

    public ${className_d}Cache() {
    }

    /**
     * 获取StringRedisTemplate.
     * @return StringRedisTemplate.
     */
    @Override
    protected StringRedisTemplate getStringRedisTemplate(){
        return this.stringRedisTemplate;
    }

    /**
     * 添加对象.
     * @param entity 要添加的对象
     */
    public final void save(final ${className_d} entity){
        super.save(entity, entity.getId().toString(), expire);
    }

    /**
     * 保存code与id的缓存
     */
//    public final void saveCode(final ${className_d} entity) {
//        super.saveByKey(entity.getId(), entity.getCode(), expire);
//    }

    /**
     * 根据id查询.
     * @param id 对象id
     * @return 获取到的对象
     */
    public final ${className_d} getById(final Long id){
        return super.getById(id.toString(), expire);
    }


    /**
     * 根据code获取id
     * @param code
     * @return code对应的id
     */
    public final Long getIdByCode(final String code) {
        return super.getByKey(code, expire);
    }

}
