/**  
 * @Title: TimingBackupDatabase.java
 * @date 2013-8-22 下午3:23:33
 * @Copyright: 2013 
 */
package com.jxoa.commons.job;

import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.DbBackupRes;

/**
 * 定时任务 备份数据库
 * @author	LiuJincheng
 * @version	 1.0
 *
 */
public class TimingBackupDatabase {

	/**
	 * 定时备份数据库
	 */
	 public void backupDatabase(){ 
	     
	      String fileName=DateUtil.currentTimestamp2String("MM月dd日HH时mm分");
	      
	      DbBackupRes.backupDatabase(fileName+".sql");
	      
	} 
	 
}
