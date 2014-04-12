/**  
 * @Project: jxoa
 * @Title: EmailServiceImpl.java
 * @Package com.jxoa.manager.personalOffice.service.impl
 * @date 2013-5-28 下午03:50:27
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FileModel;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.FileUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.coordination.bean.XtNoticeFiles;
import com.jxoa.manager.personalOffice.bean.EmDraftbox;
import com.jxoa.manager.personalOffice.bean.EmDraftboxFile;
import com.jxoa.manager.personalOffice.bean.EmFiles;
import com.jxoa.manager.personalOffice.bean.EmInbox;
import com.jxoa.manager.personalOffice.bean.EmInboxFile;
import com.jxoa.manager.personalOffice.bean.EmInboxOutboxUser;
import com.jxoa.manager.personalOffice.bean.EmOutbox;
import com.jxoa.manager.personalOffice.bean.EmOutboxFile;
import com.jxoa.manager.personalOffice.bean.EmRecyclebox;
import com.jxoa.manager.personalOffice.bean.EmRecycleboxFile;
import com.jxoa.manager.personalOffice.bean.Email;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personalOffice.service.IEmailService;
import com.jxoa.manager.system.bean.SyUsers;

/**
 * 
 * 类名：EmailServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-28 下午03:50:27
 *
 */
@Service
public class EmailServiceImpl extends BaseServiceImpl implements IEmailService  {

	@Override
	public boolean addEmail(EmOutbox eo, String userIds,String type,String  id, String savePath,HttpServletRequest request,FileList files) {
		int num=1; //引用量 
		//上传文件
		List<MultipartFile> fileList=files.getFile();
		
		//先保发件箱表
		String eoid=(String)dao.saveReturnId(eo);
		//保存到收件箱
		EmInbox ei=new EmInbox();
		ei.setEiName(eo.getEoName());
		ei.setEiDate(eo.getEoDate());
		ei.setEiDetail(eo.getEoDetail());
		ei.setEiUid(eo.getEoUid());
		String eiid=(String)dao.saveReturnId(ei);
		//等待保存的对象集合
		List<Object> c=new ArrayList<Object>();
		//关联接收人员
		if(StringUtils.isNotBlank(userIds)){
			String[] ids=userIds.split(",");
			for(String d:ids){
				EmInboxOutboxUser eiou=new EmInboxOutboxUser();
				eiou.setEmInbox(ei);
				eiou.setEmOutbox(eo);
				SyUsers u=new SyUsers();
				u.setId(d);
				eiou.setSyUsers(u);
				eiou.setIoStatus("未读");
				c.add(eiou);
				num++;
			}
		}
		
		//查询数据库 草稿箱的附件表
		List<EmFiles> l=new ArrayList<EmFiles>();
		if(type.equals("in")){
			l=dao.find("select ef from EmInboxFile edf,EmFiles ef where edf.emFiles.id=ef.id and edf.emInbox.id=?",id);
		}
		else if(type.equals("out")){
			l=dao.find("select ef from EmOutboxFile edf,EmFiles ef where edf.emFiles.id=ef.id and edf.emOutbox.id=?",id);
		}
		for(int i=0;i<l.size();i++){
			int nu=0;
			EmFiles ef=l.get(i);
			//保存发件箱和上传文件表的关联表
			EmOutboxFile eof=new EmOutboxFile();
			eof.setEmFiles(ef);
			eof.setEmOutbox(eo);
			c.add(eof);
			//保存收件箱和上传文件表的关联表
			EmInboxFile eif=new EmInboxFile();
			eif.setEmFiles(ef);
			eif.setEmInbox(ei);
			c.add(eif);
			nu=2;
			//修改引用数量
			ef.setEfNum(nu);
			c.add(ef);
		}
	
		
		if(fileList!=null){
			for(MultipartFile f:fileList){
				if(f!=null&&!f.isEmpty()){
					String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
					String ext=FileUtils.getFileExt(f.getOriginalFilename());//获取文件后缀
					//保存文件
					File newFile = new File(savePath+"/"+uuid+"."+ext); 
					
						try {
							f.transferTo(newFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					
					
					EmFiles ef=new EmFiles();
					ef.setEfExt(ext);
					ef.setEfName(f.getOriginalFilename());
					ef.setEfNewName(uuid);
					ef.setEfSize((int)f.getSize());
					ef.setEfNum(num);
					
					//先上传文件
					String efid=(String)dao.saveReturnId(ef);
//					ef.setId(efid);
					//保存发件箱和上传文件表的关联表
					EmOutboxFile eof=new EmOutboxFile();
					eof.setEmFiles(ef);
					eof.setEmOutbox(eo);
					c.add(eof);
					//保存收件箱和上传文件表的关联表
					EmInboxFile eif=new EmInboxFile();
					eif.setEmFiles(ef);
					eif.setEmInbox(ei);
					c.add(eif);
				}
			}
			
			
		}
		
		
		
		
		return  dao.saveOrUpdateAll(c);
	}

	

	
	@Override
	public Map selectEmail(String id) {
		Member me = ServletUtil.getMember();
		Email em=new Email();
		List efList=dao.find("select ef from EmInboxFile eif,EmFiles ef where eif.emFiles.id=ef.id and eif.emInbox.id=?",id);
		EmInboxOutboxUser eiou=(EmInboxOutboxUser) dao.findOne("from EmInboxOutboxUser eiou where eiou.emInbox.id=? and eiou.syUsers.id=?", id,me.getId());
	
		
		EmInbox ei=(EmInbox) dao.findOne("from EmInbox where id=?",id);
		//修改内容
//		SyUsers users=(SyUsers) dao.findOne("from SyUsers where id=?", ei.getEiUid());
//		String detail=ei.getEiDetail();
//		detail="<p>&nbsp;</p><p>&nbsp;</p><p><strong>------------------ 原始邮件 ------------------</strong> </p><p><strong> 发件人："+users.getUserName()+"</strong></p><p> <strong>发送时间："+ei.getEiDate()+"</strong></p><p><strong> 主题："+ei.getEiName()+"</strong></p><p>"+detail+"</p><p><strong>------------------ End ------------------</strong> </p>";
//		ei.setEiDetail(detail);
		em.setEmInbox(ei);
		em.setEmInboxOutboxUser(eiou);
		Map map = new HashMap();
		map.put("emFile", efList);
		map.put("email", em);
		map.put("size", efList.size());
		
		map.put("uid", ei.getEiUid());
		map.put("date", ei.getEiDate());
		map.put("name", ei.getEiName());
		map.put("detail", ei.getEiDetail());
		return map;
	}
	@Override
	public Map findIn(String id) {
		Member me = ServletUtil.getMember();
		Email em=new Email();
		List efList=dao.find("select ef from EmInboxFile eif,EmFiles ef where eif.emFiles.id=ef.id and eif.emInbox.id=?",id);
		EmInboxOutboxUser eiou=(EmInboxOutboxUser) dao.findOne("from EmInboxOutboxUser eiou where eiou.emInbox.id=? and eiou.syUsers.id=?", id,me.getId());
	
		
		EmInbox ei=(EmInbox) dao.findOne("from EmInbox where id=?",id);
//		//修改内容
//		SyUsers users=(SyUsers) dao.findOne("from SyUsers where id=?", ei.getEiUid());
		em.setEmInbox(ei);
		em.setEmInboxOutboxUser(eiou);
		Map map = new HashMap();
		map.put("emFile", efList);
		map.put("email", em);
		map.put("size", efList.size());
		return map;
	}
	public boolean updateStatus(String id){
		Member me = ServletUtil.getMember();
		EmInboxOutboxUser eiou=(EmInboxOutboxUser) dao.findOne("select eiou from EmInboxOutboxUser eiou where eiou.emInbox.id=? and eiou.syUsers.id=?", id,me.getId());

		eiou.setIoStatus("已读");
		return dao.update(eiou);
	}
	
	
	
	@Override
	public Map selectOutbox(String id) {
		String name="";
		String uid="";
		Member me = ServletUtil.getMember();
		Email em=new Email();
		List efList=dao.find("select ef from EmOutboxFile eif,EmFiles ef where eif.emFiles.id=ef.id and eif.emOutbox.id=?",id);
		List<EmInboxOutboxUser> eiouList=dao.find("from EmInboxOutboxUser eiou where eiou.emOutbox.id=? ", id);
		
		
//		List<SyUsers> uList=dao.find("from SyUsers");
		for(int i=0;i<eiouList.size();i++){
			EmInboxOutboxUser eiou=eiouList.get(i);
//			for(int j=0;j<uList.size();j++){
//				SyUsers user=uList.get(j);
//				if(eiou.getSyUsers().getId().equals(user.getId())){
					if("".equals(uid)){
//						name=user.getUserName();
						uid=eiou.getSyUsers().getId();
					}else{
//						name=name+","+user.getUserName();
						uid=uid+","+eiou.getSyUsers().getId();
					}
					
			
		}
	
		

		EmOutbox ei=(EmOutbox) dao.findOne("from EmOutbox where id=?",id);
//		//修改内容
//		SyUsers users=(SyUsers) dao.findOne("from SyUsers where id=?", ei.getEoUid());
		
		em.setEmOutbox(ei);
		Map map = new HashMap();
		map.put("emFile", efList);
		map.put("email", em);
		map.put("size", efList.size());
		map.put("inName", name);
		map.put("inUid", uid);
		return map;
	}
	
	@Override
	public boolean saveEmail(EmOutbox eo, String userIds, String savePath,HttpServletRequest request,FileList files) {
		
		//上传文件
		List<MultipartFile> fileList=files.getFile();
		//保存到草稿箱
		EmDraftbox ed=new EmDraftbox();
		ed.setId(eo.getId());
		ed.setEdName(eo.getEoName());
		ed.setEdDate(eo.getEoDate());
		ed.setEdDetail(eo.getEoDetail());
		ed.setEdOutUid(eo.getEoUid());
		ed.setEdInUid(userIds);
		dao.save(ed);
		
		//等待保存的对象集合
		List<Object> c=new ArrayList<Object>();
		if(fileList!=null){
			for(MultipartFile f:fileList){
				if(f!=null&&!f.isEmpty()){
					String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
					String ext=FileUtils.getFileExt(f.getOriginalFilename());//获取文件后缀
					//保存文件
					File newFile = new File(savePath+"/"+uuid+"."+ext); 
					
						try {
							f.transferTo(newFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					
					
					EmFiles ef=new EmFiles();
					ef.setEfExt(ext);
					ef.setEfName(f.getOriginalFilename());
					ef.setEfNewName(uuid);
					ef.setEfSize((int)f.getSize());
					ef.setEfNum(1);
					
					//先上传文件
					String efid=(String)dao.saveReturnId(ef);
					//保存发件箱和上传文件表的关联表
					EmDraftboxFile edf=new EmDraftboxFile();
					edf.setEmFiles(ef);
					edf.setEmDraftbox(ed);
					c.add(edf);
				}
			}
			
			
		}
		
		
		return  dao.saveOrUpdateAll(c);
	}

	
	@Override
	public boolean update(EmOutbox eo, String userIds, String savePath,HttpServletRequest request,FileList files) {
		
		//上传文件
		List<MultipartFile> fileList=files.getFile();
		//保存到草稿箱
		EmDraftbox ed=new EmDraftbox();
		ed.setId(eo.getId());
		ed.setEdName(eo.getEoName());
		ed.setEdDate(eo.getEoDate());
		ed.setEdDetail(eo.getEoDetail());
		ed.setEdOutUid(eo.getEoUid());
		ed.setEdInUid(userIds);
		dao.update(ed);
		
		//等待保存的对象集合
		List<Object> c=new ArrayList<Object>();
		if(fileList!=null){
			for(MultipartFile f:fileList){
				if(f!=null&&!f.isEmpty()){
					String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
					String ext=FileUtils.getFileExt(f.getOriginalFilename());//获取文件后缀
					//保存文件
					File newFile = new File(savePath+"/"+uuid+"."+ext); 
					
						try {
							f.transferTo(newFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					
					
					EmFiles ef=new EmFiles();
					ef.setEfExt(ext);
					ef.setEfName(f.getOriginalFilename());
					ef.setEfNewName(uuid);
					ef.setEfSize((int)f.getSize());
					ef.setEfNum(1);
					
					//先上传文件
					String efid=(String)dao.saveReturnId(ef);
					//保存发件箱和上传文件表的关联表
					EmDraftboxFile edf=new EmDraftboxFile();
					edf.setEmFiles(ef);
					edf.setEmDraftbox(ed);
					c.add(edf);
				}
			}
			
			
		}
		
		
		return  dao.saveOrUpdateAll(c);
	}

	

	@Override
	public Map findDraftOne(String id) {
		
		EmDraftbox ed=(EmDraftbox) dao.findOne("from EmDraftbox where id=?",id);
		List<EmFiles> efList=dao.find("select ef from EmDraftboxFile edf,EmFiles ef where edf.emFiles.id=ef.id and edf.emDraftbox.id=?",id);
//		String name="";
//		 String [] str = ed.getEdInUid().split(",");
//		 for(int ii=0;ii<str.length;ii++)	{
//			List<SyUsers> uList=dao.find("from SyUsers");
//			for(int j=0;j<uList.size();j++){
//				SyUsers user=uList.get(j);
//				if(str[ii].equals(user.getId())){
//					if("".equals(name)){
//						name=user.getUserName();
//					}else{
//						name=name+","+user.getUserName();
//					}
//					
//				}
//				
//			}
//		}
		Map map=new HashMap();
		map.put("inUid", ed.getEdInUid());
		map.put("ed", ed);
		map.put("efList", efList);
		return map;
	}
	
	@Override
	public boolean addDraft(EmOutbox eo, String userIds, String savePath,HttpServletRequest request,FileList files) {
//		List<Object> cc=new ArrayList<Object>();
//		EmDraftbox ed=dao.get(EmDraftbox.class, edId);
//		cc.add(ed);
//		List<EmDraftboxFile> edfList=dao.find("from EmDraftboxFile where emDraftbox.id=?",edId);
//		for(int i=0;i<edfList.size();i++){
//			EmDraftboxFile edf=edfList.get(i);
//			cc.add(edf);
//			EmFiles ef=dao.get(EmFiles.class, edf.getEmFiles().getId());
//			cc.add(ef);
//		}
//		//删除有关草稿箱的记录 
//		dao.deleteAll(cc);
		
		
		
		//等待保存的对象集合
		List<Object> c=new ArrayList<Object>();
		int num=0; //引用量 
		//上传文件
		
		List<MultipartFile> fileList=files.getFile();
		
		//先保发件箱表
		String eoid=(String)dao.saveReturnId(eo);
		//保存到收件箱
		EmInbox ei=new EmInbox();
		ei.setEiName(eo.getEoName());
		ei.setEiDate(eo.getEoDate());
		ei.setEiDetail(eo.getEoDetail());
		ei.setEiUid(eo.getEoUid());
		String eiid=(String)dao.saveReturnId(ei);
		
		//关联接收人员
		if(StringUtils.isNotBlank(userIds)){
			String[] ids=userIds.split(",");
			for(String id:ids){
				EmInboxOutboxUser eiou=new EmInboxOutboxUser();
				eiou.setEmInbox(ei);
				eiou.setEmOutbox(eo);
				SyUsers u=new SyUsers();
				u.setId(id);
				eiou.setSyUsers(u);
				eiou.setIoStatus("未读");
				c.add(eiou);
				num++;
			}
		}
		//查询数据库 草稿箱的附件表
			List<EmFiles> l=dao.find("select ef from EmDraftboxFile edf,EmFiles ef where edf.emFiles.id=ef.id and edf.emDraftbox.id=?",eo.getId());
			
			for(int i=0;i<l.size();i++){
				int nu=0;
				EmFiles ef=l.get(i);
				//保存发件箱和上传文件表的关联表
				EmOutboxFile eof=new EmOutboxFile();
				eof.setEmFiles(ef);
				eof.setEmOutbox(eo);
				c.add(eof);
				//保存收件箱和上传文件表的关联表
				EmInboxFile eif=new EmInboxFile();
				eif.setEmFiles(ef);
				eif.setEmInbox(ei);
				c.add(eif);
				nu=2;
				//修改引用数量
				ef.setEfNum(nu);
				c.add(ef);
			}
		
		
		if(fileList!=null){
			for(MultipartFile f:fileList){
				if(f!=null&&!f.isEmpty()){
					String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
					String ext=FileUtils.getFileExt(f.getOriginalFilename());//获取文件后缀
					//保存文件
					File newFile = new File(savePath+"/"+uuid+"."+ext); 
					
						try {
							f.transferTo(newFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					
					
					EmFiles ef=new EmFiles();
					ef.setEfExt(ext);
					ef.setEfName(f.getOriginalFilename());
					ef.setEfNewName(uuid);
					ef.setEfSize((int)f.getSize());
					ef.setEfNum(num);
					
					//先上传文件
					String efid=(String)dao.saveReturnId(ef);
					//保存发件箱和上传文件表的关联表
					EmOutboxFile eof=new EmOutboxFile();
					eof.setEmFiles(ef);
					eof.setEmOutbox(eo);
					c.add(eof);
					//保存收件箱和上传文件表的关联表
					EmInboxFile eif=new EmInboxFile();
					eif.setEmFiles(ef);
					eif.setEmInbox(ei);
					c.add(eif);
				}
			}
			
			
		}
		
		
		return  dao.saveOrUpdateAll(c);
	}

	@Override
	public boolean deleteEmail(String[] ids,int type,String savePath) {
		List<Object> c=new ArrayList<Object>();
		List<Object> cc=new ArrayList<Object>();
		for (String id : ids) {
			if(type==1){
				EmInbox e = dao.get(EmInbox.class, id);
				List<EmFiles> l=dao.find("select ef from EmInboxFile eif,EmFiles ef where eif.emFiles.id=ef.id and eif.emInbox.id=?",id);
				for(int i=0;i<l.size();i++){
					EmFiles ef=l.get(i);
					int num=ef.getEfNum();
					if(num>1){
						ef.setEfNum((num-1));
						c.add(ef);
					}else{
						cc.add(ef);
						File file = new File(savePath+"/"+ef.getEfNewName()+"."+ef.getEfExt()); 
						file.delete();
					}
					
				}
				cc.add(e);
				
			}else if(type==2){
				EmOutbox e = dao.get(EmOutbox.class, id);
				
				List<EmFiles> l=dao.find("select ef from EmOutboxFile eof,EmFiles ef where eof.emFiles.id=ef.id and eof.emOutbox.id=?",id);
				for(int i=0;i<l.size();i++){
					EmFiles ef=l.get(i);
					int num=ef.getEfNum();
					if(num>1){
						ef.setEfNum((num-1));
						c.add(ef);
					}else{
						cc.add(ef);
						File file = new File(savePath+"/"+ef.getEfNewName()+"."+ef.getEfExt()); 
						file.delete();
					}
				}
				cc.add(e);
				}if(type==3){
					EmDraftbox e = dao.get(EmDraftbox.class, id);
					List<EmFiles> l=dao.find("select ef from EmDraftboxFile eif,EmFiles ef where eif.emFiles.id=ef.id and eif.emDraftbox.id=?",id);
					for(int i=0;i<l.size();i++){
						EmFiles ef=l.get(i);
						int num=ef.getEfNum();
						if(num>1){
							ef.setEfNum((num-1));
							c.add(ef);
						}else{
							cc.add(ef);
							File file = new File(savePath+"/"+ef.getEfNewName()+"."+ef.getEfExt()); 
							file.delete();
						}
					}
					cc.add(e);
					
				}
				
				
			
		}
			dao.saveOrUpdateAll(c);
			dao.deleteAll(cc);
			return true;
		
	}

	

	@Override
	public boolean deleteFile(String id,String savePath) {
		EmFiles ef=dao.get(EmFiles.class, id) ;
		int num=ef.getEfNum();
		if(num>1){
			ef.setEfNum((num-1));
		}else{
			dao.delete(ef);
			
			File file = new File(savePath+"/"+ef.getEfNewName()+"."+ef.getEfExt()); 
			file.delete();
		}
		return true;
	}

	
	
	
	
	
	@Override
	public Map selectEmDraftbox(FormParam param, Email e) {
//		String name="";
		List<EmDraftbox> emList=new ArrayList<EmDraftbox>();
		List<EmDraftbox> eiflist=new ArrayList<EmDraftbox>();
		List list = new ArrayList();
		Member me = ServletUtil.getMember();
		

		StringBuffer sb=new StringBuffer("from EmDraftbox where  edOutUid=?");
		list.add(me.getId());
		if(e.getName()!=null&&!"".equals(e.getName())){
			sb.append(" and edName like ?");
			list.add("%"+e.getName()+"%");
		}
		if(e.getDate1()!=null&&!"".equals(e.getDate1())){
			sb.append(" and edDate>=?");
			list.add(e.getDate1());
		}
		if(e.getDate2()!=null&&!"".equals(e.getDate2())){
			sb.append(" and edDate<=?");
			list.add(e.getDate2());
		}
		
		sb.append(" order by edDate  desc");
		
		List l=dao.findPage(sb.toString(), param.getPageNum(),param.getNumPerPage(), list);
		
		
		for(int i=0;i<l.size();i++){
			EmDraftbox ed=(EmDraftbox) l.get(i);
			
			
			emList.add(ed);
		}
		Map map = new HashMap();
		map.put("values", emList);
		return map;
	}
	
	@Override
	public List selectEmOutbox(FormParam param, Email e) {
		List<Email> emList=new ArrayList<Email>();
		List<EmInboxFile> eiflist=new ArrayList<EmInboxFile>();
		List list = new ArrayList();
		Member me = ServletUtil.getMember();
		
		StringBuffer sb=new StringBuffer("from EmOutbox where  eoUid=?");
		list.add(me.getId());
		
		if(e.getName()!=null&&!"".equals(e.getName())){
			sb.append(" and eoName like ?");
			list.add("%"+e.getName()+"%");
		}
		if(e.getDate1()!=null&&!"".equals(e.getDate1())){
			sb.append(" and eoDate>=?");
			list.add(e.getDate1());
		}
		if(e.getDate2()!=null&&!"".equals(e.getDate2())){
			sb.append(" and eoDate<=?");
			list.add(e.getDate2());
		}
		
		
		sb.append(" order by eoDate  desc");
		List l=dao.findPage(sb.toString(), param.getPageNum(),param.getNumPerPage(), list);
		
		for(int i=0;i<l.size();i++){
			EmOutbox eo=(EmOutbox) l.get(i);
			
			Email email=new Email();
				String uid="";
				//加载一下收件人
				List<EmInboxOutboxUser> eiouList=dao.find("from EmInboxOutboxUser where emOutbox.id=?",eo.getId());
//				List<SyUsers> uList=dao.find("from SyUsers");
				for(int ii=0;ii<eiouList.size();ii++){
					
					EmInboxOutboxUser eiou=eiouList.get(ii);
//					for(int j=0;j<uList.size();j++){
//						SyUsers user=uList.get(j);
//						if(eiou.getSyUsers().getId().equals(user.getId())){
							if("".equals(uid)){
								uid=eiou.getSyUsers().getId();
							}else{
								uid=uid+","+eiou.getSyUsers().getId();
							}
							
//						}
						
//					}
					
				}
				eo.setEoUid(uid);
				email.setEmOutbox(eo);
			emList.add(email);
		}

		return emList;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map> selectEmInbox(FormParam param, Email e,String status) {
		List<Email> emList=new ArrayList<Email>();
		List<EmInboxFile> eiflist=new ArrayList<EmInboxFile>();
		List list = new ArrayList();
		Member me = ServletUtil.getMember();
//		StringBuffer sb=new StringBuffer("from EmInboxOutboxUser eiou  where  eiou.syUsers.id=?");
//		list.add(me.getId());
//		
//		"select ei from EmInboxOutboxUser eiou ,EmInbox ei where eiou.emInbox.id=ei.id and eiou.syUsers.id=?";
//		
//		List l=dao.findPage(sb.toString(), param.getPageNum(),param.getNumPerPage(), list);
//		
//		for(int i=0;i<l.size();i++){
//			EmInboxOutboxUser eiou=(EmInboxOutboxUser) l.get(i);
//			
//			Email email=new Email();
//			email.setEmInboxOutboxUser(eiou);
//			
//			List inList=dao.find("from EmInbox where id=?",eiou.getEmInbox().getId());
//			for(int ii=0;ii<inList.size();ii++){
//				EmInbox emInbox=(EmInbox) inList.get(ii);
//				email.setEmInbox(emInbox);
//			}
//			emList.add(email);
//		}
		
		StringBuffer sb=new StringBuffer("select new Map(eiou as eiou,ei as ei )from EmInboxOutboxUser eiou ,EmInbox ei where eiou.emInbox.id=ei.id and eiou.syUsers.id=?");
		list.add(me.getId());
		
		if(e.getName()!=null&&!"".equals(e.getName())){
			sb.append(" and ei.eiName like ?");
			list.add("%"+e.getName()+"%");
		}
		if(e.getDate1()!=null&&!"".equals(e.getDate1())){
			sb.append(" and ei.eiDate>=?");
			list.add(e.getDate1());
		}
		if(e.getDate2()!=null&&!"".equals(e.getDate2())){
			sb.append(" and ei.eiDate<=?");
			list.add(e.getDate2());
		}
		if(status!= null&&!"".equals(status)){
			sb.append(" and eiou.ioStatus =?");
			list.add(status);
		}
		sb.append("order by ei.eiDate desc");
		List l=dao.findPage(sb.toString(), param.getPageNum(),param.getNumPerPage(), list);
//		for(int i=0;i<l.size();i++){
//			Map map=new h
//			Email email=new Email();
//			EmInbox emInbox=(EmInbox) l.get(i);
//			email.setEmInbox(emInbox);
//			EmInboxOutboxUser eiou=(EmInboxOutboxUser) dao.findOne("from  EmInboxOutboxUser eiou  where  eiou.emInbox.id=?",emInbox.getId());
//			email.setEmInboxOutboxUser(eiou);
//			emList.add(email);
//		}

		return l;
	}
	
	@Override
	public Long selectEmInboxCount(Email e,String status) {
		List list = new ArrayList();
		Member me = ServletUtil.getMember();
	
		StringBuffer sb=new StringBuffer("select count(ei) from EmInboxOutboxUser eiou ,EmInbox ei where eiou.emInbox.id=ei.id and eiou.syUsers.id=?");
		list.add(me.getId());
		
		
		if(e.getName()!=null&&!"".equals(e.getName())){
			sb.append(" and ei.eiName like ?");
			list.add("%"+e.getName()+"%");
		}
		if(e.getDate1()!=null&&!"".equals(e.getDate1())){
			sb.append(" and ei.eiDate>=?");
			list.add(e.getDate1());
		}
		if(e.getDate2()!=null&&!"".equals(e.getDate2())){
			sb.append(" and ei.eiDate<=?");
			list.add(e.getDate2());
		}
		if(status!= null&&!"".equals(status)){
			sb.append(" and eiou.ioStatus =?");
			list.add(status);
		}
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}
	@Override
	public Long selectEmOutboxCount(Email e) {
		List list = new ArrayList();
		Member me = ServletUtil.getMember();
		StringBuffer sb=new StringBuffer(" select count(*) from EmOutbox where  eoUid=?");
		list.add(me.getId());
		if(e.getName()!=null&&!"".equals(e.getName())){
			sb.append(" and eoName like ?");
			list.add("%"+e.getName()+"%");
		}
		if(e.getDate1()!=null&&!"".equals(e.getDate1())){
			sb.append(" and eoDate>=?");
			list.add(e.getDate1());
		}
		if(e.getDate2()!=null&&!"".equals(e.getDate2())){
			sb.append(" and eoDate<=?");
			list.add(e.getDate2());
		}
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}
	@Override
	public Long selectEmDraftboxCount(Email e) {
		List list = new ArrayList();
		Member me = ServletUtil.getMember();
		StringBuffer sb=new StringBuffer(" select count(*) from EmDraftbox where  edOutUid=? ");
		list.add(me.getId());
		if(e.getName()!=null&&!"".equals(e.getName())){
			sb.append(" and edName like ?");
			list.add("%"+e.getName()+"%");
		}
		if(e.getDate1()!=null&&!"".equals(e.getDate1())){
			sb.append(" and edDate>=?");
			list.add(e.getDate1());
		}
		if(e.getDate2()!=null&&!"".equals(e.getDate2())){
			sb.append(" and edDate<=?");
			list.add(e.getDate2());
		}
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}
	
}
