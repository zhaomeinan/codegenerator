package com.weahan.utility.codegenerator.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * 方便直接将生成的文件拷贝到相应的文件中
 * Created by linna on 2017-04-26.
 */
public class CopyFile {

    /**
     * 删除指定目录下的所有文件
     *
     * @param path
     */
    public static void deleteSrcFiles(File path) {
        File[] files = path.listFiles();
        if (null != files) {
            for (int i = 0; i < files.length; i++) {
                if (files[i].isDirectory()) {
                    deleteSrcFiles(files[i]);
                    files[i].delete();
                }
                else {
                    files[i].delete();
                }
            }
        }
        if (path != null) path.delete();
    }


    /**
     * 拷贝文件
     *
     * @param srcFile
     * @param destFile
     */
    public static void copy(String srcFile, String destFile) {

        // 源文件判断
        File srcObj = new File(srcFile);
        if (!srcObj.exists()) {
            System.out.println("源文件不存在:" + srcFile);
            return;
        }
        else if (!srcObj.isFile()) {
            System.out.println("源不是文件");
            return;
        }
        //System.out.println("srcFile:" + srcFile);

        // 判断目标文件是否存在
        File destObj = new File(destFile);
        if (destObj.exists()) {
            new File(destFile).delete();
        }
        else {
            // 如果文件夹不存在，则创建
            if (!destObj.getParentFile().exists()) {
                DirMaker.makeDir(destObj.getParentFile());
//                if (!destObj.getParentFile().mkdirs()) {
//                    System.out.println("创建目标文件夹失败！");
//                    return;
//                }
            }
        }

        // 开始复制文件
        int byteread = 0;
        InputStream in = null;
        OutputStream out = null;
        try {
            in = new FileInputStream(srcFile);
            out = new FileOutputStream(destFile);
            byte[] buffer = new byte[1024];
            while ((byteread = in.read(buffer)) != -1) {
                out.write(buffer, 0, byteread);
            }

        }
        catch (IOException ee) {
            ee.printStackTrace();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (out != null) out.close();
                if (in != null) in.close();
            }
            catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}
