package ${packageName}.repository.mapper;
import java.util.*;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import com.weahan.utility.data.mybatis.MybatisMapper;
import ${packageName}.model.${className_d};
/**
* ${className}.
* @author weahan qd
*/
@Mapper
@Component
public interface ${className_d}Mapper extends MybatisMapper<${className_d}>{

${className_d} getBy${className_d}Id(@Param("id") Long id);

List<${className_d}> search${className_d}ForPage(${className_d} ${className_x});

int logicDelete(Long id);

}
