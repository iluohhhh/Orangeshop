package com.orange.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**

 * @Description: 文件上传处理

 */
public class FileUtil {
    /**
     * 文件上传处理
     * @param file
     * @param path 文件存放的路径
     * @return
     */
    public static final String fileUp(MultipartFile file, String path) {
        //获取扩展名
        String originalName = file.getOriginalFilename();
        String ext = originalName.substring(originalName.lastIndexOf("."));
        StringBuilder sb = new StringBuilder();
        String newFileName = FileUtil.createNewFileName();
        sb.append(newFileName).append(ext);
        File uploadFile = new File(path +"//"+ sb.toString());
        if (!uploadFile.exists()) {
            uploadFile.mkdirs();
        }
        try {
            file.transferTo(uploadFile);
            return sb.toString();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    //图片生成策略
    public static final String createNewFileName() {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss-SSS");
        String name = df.format(new Date());
        StringBuilder sb = new StringBuilder();
        sb.append(name);
        Random r = new Random();
        for (int i = 0; i < 3; i++) {
            sb.append(r.nextInt(10));
        }
        return sb.toString();
    }
}
