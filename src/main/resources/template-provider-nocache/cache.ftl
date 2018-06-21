package ${packageName}.repository.cache;

import org.springframework.stereotype.Component;
import com.weahan.utility.data.commons.persistence.CacheDao;
import ${packageName}.model.${className_d};

/**
* ${className}.
* @author weahan qd
*/
@Component
@SuppressWarnings("unused")
public class ${className_d}Cache extends CacheDao<${className_d}>{

private static int expire;

public ${className_d}Cache() {
}

/**
* 添加对象.
* @param entity 要添加的对象
*/
public final void save(final ${className_d} entity){
super.save(entity, entity.getId(), expire);
}

/**
* 根据id查询.
*
* @param id 对象id
* @return 获取到的对象
*/
public final ${className_d} getById(final Long id){
return super.getById(id, expire);
}

}
