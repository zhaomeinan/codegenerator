package ${packageName}.repository.irepository;

import java.util.*;
import ${packageName}.models.${className_d};

public interface I${className_d}Repository {

    Integer insert(${className_d} ${className_x});

    Integer update(${className_d} ${className_x});

    Integer delete(Integer id);

    ${className_d} select(Integer id);

    Integer cntByMap(Map<String,Object> map);

    List<Integer> getByMap(Map<String,Object> map);

    List<${className_d}> getByMapList(Map<String,Object> map);

    Integer updateByCode(${className_d} ${className_x});

    ${className_d} selectByBfCode(String bfCode);
}
