package com.weahan.familydoctor.po.${dbName};

import com.weahan.familydoctor.po.BasePO;
import com.weahan.familydoctor.consumer.${dbName}.${className_d}Consumer;
import com.weahan.familydoctor.model.${className_d};
import com.weahan.util.result.ResultProvider;
import org.springframework.beans.factory.annotation.Autowired;

public class ${className_d}PO extends BasePO<${className_d}> {

@Autowired
private ${className_d}Consumer ${className_x}Consumer;

@Override
public void insert() {
String jsonString = toJson(entity);
${className_x}Consumer.add${className_d}(jsonString);
}

@Override
public void update() {
String jsonString = toJson(entity);
${className_x}Consumer.update${className_d}ById(jsonString);
}

@Override
public ${className_d} query() {
String jsonString = toJson(entity);
final ResultProvider resultProvider = ${className_x}Consumer.get${className_d}ById(entity.getId());
return (${className_d}) resultProvider.getRows();
}
}
