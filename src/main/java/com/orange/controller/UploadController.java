package com.orange.controller;

import com.alibaba.fastjson.JSONObject;
import com.orange.util.Constants;
import com.orange.util.FileUtil;
import com.orange.util.ResponseUtil;
import net.fckeditor.response.UploadResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

/**

 * @Description: 处理文件上传（如图片上传）
 */
@Controller
@RequestMapping("/upload")
public class UploadController {

    private static final String SERVER_PATH = Constants.IMAGE_URL;
    private static final String PATH=Constants.PATH;
    @RequestMapping(value = "/uploadPic.do",method = RequestMethod.POST)
    public void uploadPic(HttpServletRequest request, HttpServletResponse response){
        String path = null;
        //使用MultipartHttpServletRequest,这样可以获取不知名称和任意个文件
        MultipartHttpServletRequest mprequest = (MultipartHttpServletRequest) request;
        //获取MultipartHttpServletRequest中文件（如图片）的map
        Map<String, MultipartFile> fileMap = mprequest.getFileMap();
        Set<Map.Entry<String,MultipartFile>> fileSet = fileMap.entrySet();
        //遍历map
        for (Map.Entry<String, MultipartFile> entry : fileSet) {
            MultipartFile file = entry.getValue();
            path = FileUtil.fileUp(file, PATH);
        }
        //将上传的文件路径返回。多个文件一起上传时只返回最后一个的
        String url =  SERVER_PATH+ path;
        JSONObject jo = new JSONObject();
        jo.put("url", url);
        jo.put("path",path);

        ResponseUtil.renderJson(response, jo.toString());

    }

    @RequestMapping(value = "/uploadFck.do")
    public void uploadFck(HttpServletRequest request,HttpServletResponse response){
        String path = null;
        //强转request  支持多个
        MultipartHttpServletRequest mr= (MultipartHttpServletRequest)request;
        //获取值  支持多个
        Map<String, MultipartFile> fileMap = mr.getFileMap();
        //遍历Map
        Set<Map.Entry<String, MultipartFile>> entrySet = fileMap.entrySet();
        for(Map.Entry<String, MultipartFile> entry : entrySet){
            MultipartFile file = entry.getValue();
            path = FileUtil.fileUp(file, PATH);
            //返回Url给Fck   fck-core...jar   ckeditor
            String url = SERVER_PATH + path;
            //要将这个上传后的图片的存放路径返回给fck
            UploadResponse ok = UploadResponse.getOK(url);
            //response 返回对象
            try {
                response.getWriter().print(ok);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
