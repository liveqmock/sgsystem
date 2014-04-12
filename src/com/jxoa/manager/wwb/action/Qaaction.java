package com.jxoa.manager.wwb.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.wwb.bean.Question;
import com.jxoa.manager.wwb.bean.Type;
import com.jxoa.manager.wwb.service.IQaService;

@Controller
@RequestMapping("/jmdy")
public class Qaaction extends BaseAction {

	@Autowired
	private IQaService qaservice;

	/**
	 * 问题文件上传的保存路径
	 */
	private static final String SAVEPATH = BaseConfig.uploadPath + "question";

	/**
	 * 1.跳转到居民答疑列表加载页面
	 * 
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param,Question question,Date startDate,Date 

endDate,ModelMap map){
		map.addAttribute("questions", qaservice.selectQuestion(param, question, 

startDate, endDate));
		param.setAllCount(qaservice.selectQuestionCount(question, startDate, 

endDate));
		map.addAttribute("fromParam",param);
		
		return "communityService/qaa/load";
	}

	/**
	 * 2.跳转到对问题进行回复页面
	 */
	@RequestMapping("answer")
	public String answer(String id, ModelMap map, FormParam param) {
		Member me = ServletUtil.getMember();

		Question question = qaservice.get(Question.class, id);
		question.setResponser(me.getId());
		question.setResponseTime(DateUtil.currentTimestamp());
		map.addAttribute("question", question);

		return "communityService/qaa/answer";
	}

	/**
	 * 3.跳转到提问界面
	 * 
	 * @return
	 */
	@RequestMapping("toAsk")
	public String toAsk(HttpServletRequest request, ModelMap map) {
		
		List<Type> types = qaservice.findAllTypes();
		map.addAttribute("types", types);
		return "communityService/qaa/ask";
	}

	/**
	 * 4.新增问题：
	 */

	@RequestMapping("saveQuestion")
	public ModelAndView saveQuestion(@Valid Question question, Errors errors,
			String userIds, HttpServletRequest request, FileList files) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		Member me = ServletUtil.getMember();
		question.setId(me.getId());
		question.setPublishTime(DateUtil.currentTimestamp());

		return ajaxDone(qaservice.addQuestion(question, request, files,
				SAVEPATH));
	}

	

	/**
	 * 5.提交答复
	 */
	@RequestMapping(value = "saveAnswer")
	public String saveAnswer(Question question) {
		question.setQuestionStatus("1");
		ajaxDone(qaservice.update(question));
		return "communityService/qaa/load";
	}

	/**
	 * 6.对问题进行删除
	 */

	@RequestMapping("del")
	public ModelAndView del(String ids[]) {
		System.out.println(ids.length + ":" + ids[0]);
		return ajaxDone(qaservice.deleteQuestions(ids));
	}

	/**
	 * 7.点击查看问题详情：
	 */
	@RequestMapping("detail")
	public String detail(String id, ModelMap map) {
		Question question = qaservice.get(Question.class, id);
		map.addAttribute("question", question);
		return "communityService/qaa/details";
	}


}
