package com.jxoa.manager.wwb.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.wwb.bean.Question;
import com.jxoa.manager.wwb.bean.Type;
public interface IQaService  extends IBaseService {
	
	/**
	 * 1.分页查询问题的方法：
	 */
	public List<Question> selectQuestion(FormParam param,Question question, Date startDate,Date endDate);
	
	/**
	 * 2.获得总数的方法：
	 */
	public Long selectQuestionCount(Question question, Date startDate,Date endDate);
	
	
	/**
	 * 3.增加问题的方法
	 * @return
	 */
	public boolean addQuestion(Question eo,HttpServletRequest request,FileList files,String savePath);
	
	
	
	/**
	 * 4.批量删除问题的方法：
	 */
	public boolean deleteQuestions(String ids[]);
	
	
	/**
	 * 5.查找所有问题类型的方法：
	 * @return  所有问题类型的集合
	 */
	public List<Type> findAllTypes();
	
}

