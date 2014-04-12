package com.jxoa.manager.wwb.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.FileUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.wwb.bean.Question;
import com.jxoa.manager.wwb.bean.Type;
import com.jxoa.manager.wwb.service.IQaService;
@Service
public class QaServiceImpl extends BaseServiceImpl implements IQaService {
	@Override
	public boolean addQuestion(Question question,HttpServletRequest request,FileList files,
			String savePath) {
		// 上传文件
		List<MultipartFile> fileList = files.getFile(); // 获得实例
		if(fileList!=null){
			for(MultipartFile f:fileList){
				if(f!=null&&!f.isEmpty()){
					String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
					String ext=FileUtils.getFileExt(f.getOriginalFilename());//获取文件后缀
					//保存文件
					File newFile = new File(savePath+"/"+uuid+"."+ext); 
					
					question.setFileUrl(newFile.toString());
						try {
							f.transferTo(newFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
				}
			}
		}
		
		  Member me=ServletUtil.getMember();
	      question.setQuestionStatus("0");
		  question.setPublisher(me.getId());
		  
		return dao.save(question); 
	}

	/**
	 * 1.批量删除问题
	 */
	@Override
	public boolean deleteQuestions(String ids[]) {
		List<Object> d = new ArrayList<Object>();
		
		for (String id : ids) {
			Question question = dao.get(Question.class, id);
			if (question != null) {
				d.add(question);
			}
		}
		return dao.deleteAll(d);
	}


	@Override
	public List<Type> findAllTypes() {
		String hql = "from Type";
		return dao.find(hql);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Question> selectQuestion(FormParam param, Question question,
			Date startDate, Date endDate) {

		StringBuffer sb = new StringBuffer("from Question question where 1=1 ");
		List list = new ArrayList();

		/*
		 * 拼查询条件
		 */
		// 1.标题
		if (StringUtils.isNotBlank(question.getQuestionTitle())) {
			sb.append(" and question.questionTitle  like ? ");
			list.add("%" + question.getQuestionTitle() + "%");
		}
		// 2.问题类型
		if (StringUtils.isNotBlank(question.getQuestionType())) {
			sb.append(" and question.questionType =? ");
			list.add(question.getQuestionType());
		}
		// 3.问题状态
		
		if(StringUtils.isNotBlank(question.getQuestionStatus())){
			sb.append(" and question.questionStatus = ?");
			list.add(question.getQuestionStatus());
		}
		// 4.开始时间
		if (startDate != null) {
			sb.append(" and question.publishTime >=? ");
			list.add(startDate);
		}
		// 5.结束时间
		if (endDate != null) {
			sb.append(" and question.publishTime <=? ");
			list.add(endDate);
		}
		// 5.排序规则
		if (StringUtils.isNotBlank(param.getOrderField())) {
			sb.append(" order by question." + param.getOrderField() + " "
					+ param.getOrderDirection());
		} else {
			param.setOrderDirection("desc");
			sb.append(" order by question.isTop desc,question.publishTime desc");
		}

		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Long selectQuestionCount(Question question, Date startDate,
			Date endDate) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Question question where 1=1  ");
		List list = new ArrayList();
		/*
		 * 拼查询条件
		 */
		// 1.标题
		if (StringUtils.isNotBlank(question.getQuestionTitle())) {
			sb.append(" and question.questionTitle like ? ");
			list.add("%" + question.getQuestionTitle() + "%");
		}
		// 2.问题类型
		if (StringUtils.isNotBlank(question.getQuestionType())) {
			sb.append(" and question.questionType =? ");
			list.add(question.getQuestionType());
		}
		// 3.问题状态
		
		if(StringUtils.isNotBlank(question.getQuestionStatus())){
			sb.append(" and question.questionStatus = ?");
			list.add(question.getQuestionStatus());
		}
		// 4.开始时间
		if (startDate != null) {
			sb.append(" and question.publishTime >=? ");
			list.add(startDate);
		}
		// 5.结束时间
		if (endDate != null) {
			sb.append(" and question.publishTime <=? ");
			list.add(endDate);
		}
		return (Long)dao.findUniqueOne(sb.toString(),list);
	}

}
