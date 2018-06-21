package com.weahan.utility.codegenerator.util;

import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) {

        List<String> list = new ArrayList<>();
        list.add("aaa");
        list.add("bbb");
        list.add("ccc");

        for (String test : list) {
            System.out.println(test);
        }

    }

}
