package com.weahan.utility.codegenerator.util;

public class StringUtil {
    /**
     * 大写
     *
     * @param s
     * @return
     */
    public static final String upperFirst(String s) {
        int len = s.length();
        if (len <= 0)
            return "";

        StringBuffer sb = new StringBuffer();
        sb.append(s.substring(0, 1).toUpperCase());
        sb.append(s.substring(1, len));
        return sb.toString();
    }

    /**
     * 小写
     *
     * @param s
     * @return
     */
    public static final String lowerFirst(String s) {
        int len = s.length();
        if (len <= 0)
            return "";

        StringBuffer sb = new StringBuffer();
        sb.append(s.substring(0, 1).toLowerCase());
        sb.append(s.substring(1, len));
        return sb.toString();
    }

    /**
     * 去掉表名字中间的“_”, 然后根据驼峰规则生成表名
     *
     * @param tableName
     * @return
     */
    public static final String newTableName(String tableName) {
        String strS[] = tableName.split("_");
        String newStr = "";
        for (String st : strS) {
            newStr += StringUtil.upperFirst(st);
        }
        return newStr;
    }

    public static String underlineToCamel(String param) {
        if (param == null || param.length() < 1 || param.indexOf("_") < 0) {
            if (param == null || param.length() < 1) {
                return param;
            }
            return lowerFirst(param.toLowerCase());
        }
        String[] arr = param.split("_");
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < arr.length; i++) {
            sb.append(upperFirst(arr[i].toLowerCase()));
        }
        return lowerFirst(sb.toString());
    }

    public static void main(String[] args) {
        System.out.println("s".toUpperCase());
    }
}
