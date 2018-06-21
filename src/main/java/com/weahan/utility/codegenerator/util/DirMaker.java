package com.weahan.utility.codegenerator.util;

import java.io.File;
import java.io.IOException;

/**
 * 文件夹处理类
 */
public class DirMaker {

    public static boolean createFile(File file) throws IOException {
        if (!file.exists()) {
            makeDir(file.getParentFile());
        }
        return file.createNewFile();
    }

    public static void makeDir(File dir) {
        if (!dir.getParentFile().exists()) {
            makeDir(dir.getParentFile());
        }
        dir.mkdir();
    }

}
