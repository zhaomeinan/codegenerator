package ${packageName}.repository.irepository;

import java.util.*;
import ${packageName}.models.${className_d};

public interface I${className_d}Repository {

    int insert(${className_d} ${className_x});

    int update(${className_d} ${className_x});

    int delete(Long id);

    ${className_d} select(Long id);

    Long cntByMap(Map<String,Object> map);

    List<Long> getByMap(Map<String,Object> map);

    List<${className_d}> getByMapList(Map<String,Object> map);
}
