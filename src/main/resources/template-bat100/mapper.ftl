package ${packageName}.repository.mapper;

import java.util.*;
import ${packageName}.models.${className_d};
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ${className_d}Mapper{

    Integer insert(${className_d} ${className_x});

    Integer update(${className_d} ${className_x});

    Integer delete(@Param("id") Integer id);

    ${className_d} select(@Param("id") Integer id);

    Integer cntByMap(Map<String,Object> map);

    List<Integer> getByMap(Map<String,Object> map);

    List<${className_d}> getByMapList(Map<String,Object> map);

    Integer updateByCode(${className_d} ${className_x});

    ${className_d} selectByBfCode(@Param("bfCode") String bfCode);
}
