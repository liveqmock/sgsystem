/**  
 * @Project: jxoa
 * @Title: DownLoadAction.java
 * @Package com.jxoa.manager.administrativeoffice.action
 * @date 2013-4-15 上午10:37:02
 * @Copyright: 2013 
 */
package com.jxoa.manager.base.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.BaseConfig;

/**
 * 
 * 类名：DownLoadAction
 * 功能：文件下载
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-15 上午10:37:02
 *
 */
@Controller
public class DownLoadAction extends BaseAction{
	
	/**
	 * 文件下载
	 * @param filepath  文件保存的路径及真实文件名
	 * @param fileName	文件上传时的名称
	 * @param request	
	 * @param response
	 * @throws Exception
	 */
    @RequestMapping(value = "/download")   
    public String down(String filepath,String fileName,HttpServletRequest request,HttpServletResponse response) throws Exception{  
       
    	String path=BaseConfig.webPath+"/"+BaseConfig.uploadPath+filepath;
    	response.setContentType("application/octet-stream");  
       
        File file = new File(path);  
        
        if(!file.exists()){
        	//不存在
        	return "download_error";
        }
        // 清空response  
        response.reset();  
      
        // 设置response的Header  
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);  
        response.addHeader("Content-Length", "" + file.length());   
       
            //以流的形式下载文件  
        InputStream fis = new BufferedInputStream(new FileInputStream(path));  
        byte[] buffer = new byte[fis.available()];  
        fis.read(buffer);  
        fis.close();  
        OutputStream toClient = new BufferedOutputStream(response.getOutputStream());  
        toClient.write(buffer);  
        toClient.flush();  
        toClient.close(); 
        
        return null;
       
    }  
}
