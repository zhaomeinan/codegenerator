package ${packageName}.repository.mapper;

import java.util.*;
import ${packageName}.models.${className_d};
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ${className_d}Mapper{

    int insert(${className_d} ${className_x});

    int update(${className_d} ${className_x});

    int delete(@Param("id") Long id);

    ${className_d} select(@Param("id") Long id);

    Long cntByMap(Map<String,Object> map);

    List<Long> getByMap(Map<String,Object> map);

    List<${className_d}> getByMapList(Map<String,Object> map);

    int updateByCode(${className_d} ${className_x});
}
