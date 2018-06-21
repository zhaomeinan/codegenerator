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
    Long insert(${className_d} ${className_x});

    /**
    * 根据主键Id 更新${className}.
    * @param ${className_x} 要更新的对象
    * @return 更新结果
    */
    boolean update(${className_d} ${className_x});

    /**
    *
    * @param id  主键
    * @return 操作结果
    */
    boolean dataStatusChangeById(Long id,String dataStatus);

    /**
    *
    * @param id  主键
    * @return 操作结果
    */
    boolean dataStatusChangeById(Long id,byte dataStatus);

    /**
    *
    * @param ids  主键
    * @return 操作结果
    */
    boolean dataStatusChangeByArray(final Long[] ids, final String dataStatus);

    /**
    *
    * @param ids  主键
    * @return 操作结果
    */
    boolean dataStatusChangeByArray(final Long[] ids, final byte dataStatus);

    /**
    *
    * @param weahanCode  weahan_code
    * @return 操作结果
    */
    Long getId(String weahanCode);

    ///**
    //* 根据条件获得一个id列表.  该方法已过时   将来的版本可能会删除该方法
    //* @param idList 条件列表
    //* @return 获取到的对象列表
    //*/
    //@Deprecated
    //List<${className_d}> findByIdList(List<String> idList);

    /**
    * 根据条件获得一个列表.
    * @param idList 条件列表
    * @return 获取到的对象列表
    */
    //Long[] findIdByIdList(List<String> idList);

    /**
    * 分页查询.   该方法已过时   将来的版本可能会删除该方法
    * @param ${className_x} 条件对象
    * @return 获取到的对象列表
    */
    List<${className_d}> search${className_d}ForPage(${className_d} ${className_x});

    /**
    * 分页查询.
    * @param ${className_x} 条件对象
    * @return 获取到的对象列表
    */
    List< Long> search${className_d}IdForPage(${className_d} ${className_x});

    /**
    * 根据id获取对象.
    * @param id 要获取的对象的id
    * @return 获取到的对象
    */
    ${className_d} getBy${className_d}Id(Long id);

    /**
    * 根据id数组获取对象列表
    * @param id 要获取的对象的id
    * @return 获取到的对象
    */
    List<${className_d}> getBy${className_d}Id(List< Long> idList);

}
