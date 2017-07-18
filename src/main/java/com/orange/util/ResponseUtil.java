package com.orange.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

/**

 * @Description: 用于返回json數據

 */
public final class ResponseUtil {

    public static final void render(HttpServletResponse response, String contentType, String data){
        response.setContentType(contentType);
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setContentType("UTF-8");
        try {
            Writer writer = response.getWriter();
            writer.write(data);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static final void renderJson(HttpServletResponse response,String data){
        render(response,"application/json",data);
    }
    public static final void renderTxt(HttpServletResponse response,String data){
        render(response, "text/plain;charset=UTF-8", data);
    }
}
