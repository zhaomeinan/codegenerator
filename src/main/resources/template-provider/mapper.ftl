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

    List< Long> search${className_d}ForPage(${className_d} ${className_x});

    int dataStatusChange(@Param("id") Long id,@Param("dataStatus") byte dataStatus);

    Long add${className_d}(${className_d} jsonString);

    int edit${className_d}(${className_d} jsonString);

    Long getIdByCode(String code);
}
