/**  
 * @Project: jxoa
 * @Title: FileUtils.java
 * @Package com.jxoa.commons.util
 * @date 2013-4-12 下午4:30:05
 * @Copyright: 2013 
 */
package com.jxoa.commons.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FileModel;

/**
 * 
 * 类名：FileUtils
 * 功能：文件工具
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-12 下午4:30:05
 *
 */
public class FileUtils {
	
	public static Log log = LogFactory.getLog(FileUtils.class);
	
	public static long ONE_KB = 1024;
	public static long ONE_MB = ONE_KB * 1024;
	public static long ONE_GB = ONE_MB * 1024;
	public static long ONE_TB = ONE_GB * (long)1024;
	public static long ONE_PB = ONE_TB * (long)1024;
	
	
	
	
	/**
	 * 文件上传，保存文件
	 * @param savePath 保存的目录
	 * @param request
	 * @return
	 */
	public static List<FileModel> uploadFiles(String savePath,HttpServletRequest request){
		List<FileModel> fileList=null;
		try {
			
			if(request instanceof MultipartHttpServletRequest){
				MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest)request;
				Iterator<String>  it=multipartRequest.getFileNames();
				fileList=new ArrayList<FileModel>();
				while (it.hasNext()) {
					String key=it.next();
					MultipartFile file =multipartRequest.getFile(key);
					if(file!=null&&!file.isEmpty()){
						//获取文件名
						String name=file.getOriginalFilename();
						//获取文件后缀
						String ext=getFileExt(name);
						//获取uuid作为保存名字
						String uuid=getUUID();
						FileModel fm=new FileModel();
						fm.setKey(key);
						fm.setName(name);
						fm.setNewName(uuid);
						fm.setExt(ext);
						fm.setSize(getHumanReadableFileSize(file.getSize()));
						//保存文件
						File newFile = new File(savePath+"/"+uuid+"."+ext); 
						file.transferTo(newFile);
						fileList.add(fm);
					}
				}
		
			}
			return fileList;
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			return fileList;
		}

	}
	
	
	/**
	 * 文件下载
	 * @param savePath  文件保存目录
	 * @param oldName   原文件名
	 * @param nowName	保存时的新文件名
	 * @param ext		后缀
	 * @param request	
	 * @param response
	 * @return
	 * @throws Exception
	 */
    public static String down(String savePath,String oldName,String nowName,String ext,HttpServletRequest request,HttpServletResponse response){  
    	OutputStream toClient=null;
    	try{
	    	String path=savePath+"/"+nowName+"."+ext;
	        File file = new File(path);  
	        if(!file.exists()){
	        	//不存在
	        	request.setAttribute("name", EncodeUtils.strISO2UTF(oldName));
	        	return "download_error";//返回下载文件不存在
	        }
	        response.setContentType("application/octet-stream"); 
	        // 根据不同浏览器 设置response的Header
	        String userAgent = request.getHeader("User-Agent").toLowerCase();
	        
	        if(userAgent.indexOf("msie")!=-1){
	        	//ie浏览器
	        	System.out.println("ie浏览器");
	        	response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(oldName,"ISO-8859-1")); 
	        	
	        }else{
	        	response.addHeader("Content-Disposition", "attachment;filename=" + oldName);  
	        }
	        
	        response.addHeader("Content-Length", ""+file.length());   
	        //以流的形式下载文件  
	        InputStream fis = new BufferedInputStream(new FileInputStream(path));  
	        byte[] buffer = new byte[fis.available()];  
	        fis.read(buffer);  
	        fis.close();  
	        toClient = new BufferedOutputStream(response.getOutputStream());  
	        toClient.write(buffer);  
	        toClient.flush(); 
	        return null;
	      }catch (Exception e) {
	    	  e.printStackTrace();
	    	  response.reset(); 
	    	  return "exception";//返回异常页面
	      }finally{
				if(toClient!=null){
		           	 try {
		           		toClient.close();
					  } catch (IOException e) {
							e.printStackTrace();
						}
		            }
				}
    }  
	
	
	/**
	 * 获取文件后缀 不包括.
	 * @param fileName
	 * @return
	 */
    public static String getFileExt(String fileName){
    	if (fileName == null) return "";
    	String ext = "";
		int lastIndex = fileName.lastIndexOf(".");
		if (lastIndex >= 0) {
			ext = fileName.substring(lastIndex + 1).toLowerCase();
		}
		return ext;
    }
   /**
    * 获取UUID
    * @return
    */	
    public static String getUUID(){
    	return UUID.randomUUID().toString().replaceAll("-", "");
    }
    /**
     * 获取文件MD5值
     * @param fis
     * @return
     */
    public static String getFileMD5(InputStream fis){
    	if(fis==null){return null;}
		try {
			MessageDigest md=MessageDigest.getInstance("MD5");
		    byte[] buffer = new byte[8192];
		    int length;
		    while ((length = fis.read(buffer)) != -1) {
		            md.update(buffer, 0, length);
		     }
		    return new String(Hex.encodeHex(md.digest()));
		 } catch (Exception e) {    
		      return null;
    	} finally {
    	     try {
    		      if (fis != null) fis.close();
    	      } catch (IOException e) {
    	          e.printStackTrace();
    	      }
    	 }
    }
    /**
     * 文件大小人性化显示
     * @param fileSize
     * @return
     */
	public static String getHumanReadableFileSize(Long fileSize) {
		if(fileSize == null) return "";
		return getHumanReadableFileSize(fileSize.longValue());
	}
	
	public static String getHumanReadableFileSize(long fileSize) {
		if(fileSize < 0) {
			return String.valueOf(fileSize);
		}
		String result = getHumanReadableFileSize(fileSize, ONE_PB, "PB");
		if(result != null) {
			return result;
		}
		
		result = getHumanReadableFileSize(fileSize, ONE_TB, "TB");
		if(result != null) {
			return result;
		}
		result = getHumanReadableFileSize(fileSize, ONE_GB, "GB");
		if(result != null) {
			return result;
		}
		result = getHumanReadableFileSize(fileSize, ONE_MB, "MB");
		if(result != null) {
			return result;
		}
		result = getHumanReadableFileSize(fileSize, ONE_KB, "KB");
		if(result != null) {
			return result;
		}
		return String.valueOf(fileSize)+" B";
	}

	private static String getHumanReadableFileSize(long fileSize, long unit,String unitName) {
		if(fileSize == 0) return "0";
		
		if(fileSize / unit >= 1) {
			double value = fileSize / (double)unit;
			DecimalFormat df = new DecimalFormat("######.## "+unitName);
			return df.format(value);
		}
		return null;
	}
	/**
	 * 验证上传文件
	 * @param file
	 * @param maxSize		文件限制大小，单位b
	 * @param includeTypes	只能上传的类型
	 * @param excludeTypes	不能上传的类型，当includeTypes有值时，此参数无效
	 * @return
	 */
    public static ModelAndView validateFile(MultipartFile file,long maxSize,String[] includeTypes,String[] excludeTypes){
    	ModelAndView mav = new ModelAndView("ajaxMessage");
    	System.out.println("限制大小"+maxSize+"===="+getHumanReadableFileSize(maxSize));
    	System.out.println("文件大小:"+file.getSize());
    	if(file.getSize()>maxSize){
    		mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
			mav.addObject(MsgConfig.MESSAGE,"msg.file.size");//文件：{0}，大小超过{1}！
			mav.addObject(MsgConfig.MESSAGEVALUES, file.getOriginalFilename()+","+getHumanReadableFileSize(maxSize));//占位符赋值
			return mav;
    	}
    	String type=file.getContentType();
    	System.out.println("当前上传文件类型："+type);
    	if("application/octet-stream".equals(type)){
    		type=getFileExt(file.getOriginalFilename());//获取文件后缀
    		System.out.println("文件后缀"+type);
    	}
    	if(includeTypes!=null){
    		for(String t:includeTypes){
    			if(type.indexOf(t)==-1){
    				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
    				mav.addObject(MsgConfig.MESSAGE,"msg.file.includeType");//上传失败，文件:{0}，文件类型：{1}不支持此类型上传。只能上传类型：{2}
    				mav.addObject(MsgConfig.MESSAGEVALUES, file.getOriginalFilename()+","+type+","+StringUtils.join(includeTypes));//占位符赋值
    				return mav;
    			}
    		}
    	}
    	if(excludeTypes!=null){
    		for(String t:excludeTypes){
    			if(type.indexOf(t)!=-1){
    				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
    				mav.addObject(MsgConfig.MESSAGE,"msg.file.excludeType");//上传失败，文件:{0}，不能上传类型：{1}
    				mav.addObject(MsgConfig.MESSAGEVALUES, file.getOriginalFilename()+","+StringUtils.join(excludeTypes));//占位符赋值
    				return mav;
    			}
    		}
    	}
    	return null;
    }
    
	
	
    public static void main(String[] args){
    	
    	System.out.println(getHumanReadableFileSize(1024));
    	
    	System.out.println(DateUtil.currentTimestamp());
    	
    }
 

}
