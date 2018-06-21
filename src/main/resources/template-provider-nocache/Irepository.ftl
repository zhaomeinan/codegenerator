package ${packageName}.repository.irepository;

import java.util.List;

import ${packageName}.model.${className_d};

/**
* ${className}.
* @author weahan qd
*/
@SuppressWarnings("unused")
public interface I${className_d}Repository {

/**
* 插入一个${className}.
* @param ${className_x} 要插入的对象
* @return 插入结果
*/
boolean insert(${className_d} ${className_x});

/**
* 根据主键Id 更新${className}.
* @param ${className_x} 要更新的对象
* @return 更新结果
*/
boolean update(${className_d} ${className_x});

/**
* 根据主键Id 刪除${className}.
* @param ${className_x} 要删除的对象
* @return 删除结果
*/
boolean delete(${className_d} ${className_x});

/**
* 逻辑删除.
* @param id  主键
* @return 逻辑删除的结果
*/
boolean logicDelete(Long id);

/**
* 根据条件获得一个列表.
* @param idList 条件列表
* @return 获取到的对象列表
*/
List<${className_d}> findByIdList(List
<String> idList);

    /**
    * 分页查询.
    * @param ${className_x} 条件对象
    * @return 获取到的对象列表
    */
    List<${className_d}> search${className_d}ForPage(${className_d} ${className_x});

    /**
    * 根据id获取对象.
    * @param id 要获取的对象的id
    * @return 获取到的对象
    */
${className_d} getBy${className_d}Id(Long id);

    }
