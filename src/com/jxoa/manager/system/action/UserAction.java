/**  
 * @Project: jxoa
 * @Title: UserAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-3-28 下午2:04:58
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.action;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.interfaces.RSAPublicKey;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.apache.commons.codec.binary.Hex;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.RSAUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.ListValues;
import com.jxoa.manager.system.bean.SyDept;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IUserService;

/**
 * 
 * 类名：UserAction 功能：系统管理--组织机构--用户管理 详细：用户的增删改查 作者：LiuJincheng 版本：1.0
 * 日期：2013-3-28 下午2:04:58
 * 
 */
@Controller
@RequestMapping("user")
public class UserAction extends BaseAction {

	@Autowired
	private IUserService service;

	/**
	 * 跳转到用户管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/load")
	public String load(ModelMap map) {

		return "system/organize/user/load";
	}

	/**
	 * 条件分页查询用户
	 * 
	 * @return
	 */
	@RequestMapping("queryUsers")
	public String selectUsers(FormParam param, SyUsers user, ModelMap map) {
		map.addAttribute("users", service.selectUsers(param, user));
		param.setAllCount(service.selectUsersCount(user));
		map.addAttribute("fromParam", param);
		
		return "system/organize/user/query";
	}

	/**
	 * 跳转到新增用户界面
	 * 
	 * @return
	 */
	@RequestMapping("addPage")
	public String addUsersPage(ModelMap map) {
		//生成加密密钥
		String pwd=UUID.randomUUID().toString();
		ServletUtil.getSession().setAttribute("jmpw", pwd);
		RSAPublicKey publicKey = RSAUtils.getPublicKey(pwd); 
		map.put("modulus",new String(Hex.encodeHex(publicKey.getModulus().toByteArray())));
		map.put("exponent",new String(Hex.encodeHex(publicKey.getPublicExponent().toByteArray())));
		return "system/organize/user/add";
	}

	/**
	 * 添加用户
	 * 
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid SyUsers user, Errors errors, String roleIds) throws UnsupportedEncodingException {
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		//解密
		String pwd=RSAUtils.decryptStringByJs((String)ServletUtil.getSession().getAttribute("jmpw"),user.getUserPassword());
		user.setUserPassword(URLDecoder.decode(pwd, "utf-8"));
		//验证密码长度是否符合规范
		if(user.getUserPassword().length()<6||user.getUserPassword().length()>20){
			List<String> errorMessages=new ArrayList<String>();
			errorMessages.add("密码长度必须在6-20之间。");
			ModelAndView mav = new ModelAndView("ajaxValidationMessage");
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
			mav.addObject("errorCount",1);
			mav.addObject(MsgConfig.MESSAGE,errorMessages);
			return mav;
		}
		return ajaxDone(service.addUser(user));
	}

	/**
	 * 跳转到用户编辑页面
	 * 
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id, ModelMap map) {
		SyUsers user = service.get(SyUsers.class, id);
		if (user == null) {
			return NODATA;
		}
		user.setUserPassword("");
		map.addAttribute("u", user);
		return "system/organize/user/update";
	}

	/**
	 * 修改用户
	 * 
	 * @param dept
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid SyUsers u, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors, "userName",
					"userPassword");
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.updateUser(u));

	}

	/**
	 * 跳转到用户密码重置界面
	 * 
	 * @return
	 */
	@RequestMapping("updatePwPage")
	public String updatePwPage(ModelMap map) {
		//生成加密密钥
		String pwd=UUID.randomUUID().toString();
		ServletUtil.getSession().setAttribute("jmpw", pwd);
		RSAPublicKey publicKey = RSAUtils.getPublicKey(pwd); 
		map.put("modulus",new String(Hex.encodeHex(publicKey.getModulus().toByteArray())));
		map.put("exponent",new String(Hex.encodeHex(publicKey.getPublicExponent().toByteArray())));
		return "system/organize/user/update_password";
	}

	/**
	 * 重置用户密码
	 * 
	 * @param id
	 * @param userPassword
	 * @param pw
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("updatePw")
	public ModelAndView updatePw(String id, String userPassword, String pwd) throws UnsupportedEncodingException {

		if(!userPassword.equals(pwd)){
			List<String> errorMessages=new ArrayList<String>();
			errorMessages.add("两次输入的新密码不一致！");
			ModelAndView mav = new ModelAndView("ajaxValidationMessage");
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
			mav.addObject("errorCount",1);
			mav.addObject(MsgConfig.MESSAGE,errorMessages);
			return mav;
		}
		
		//解密
		userPassword=RSAUtils.decryptStringByJs((String)ServletUtil.getSession().getAttribute("jmpw"),userPassword);
		userPassword=URLDecoder.decode(userPassword, "utf-8");
		//验证密码长度是否符合规范
		if(userPassword.length()<6||userPassword.length()>20){
			List<String> errorMessages=new ArrayList<String>();
			errorMessages.add("密码长度必须在6-20之间。");
			ModelAndView mav = new ModelAndView("ajaxValidationMessage");
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
			mav.addObject("errorCount",1);
			mav.addObject(MsgConfig.MESSAGE,errorMessages);
			return mav;
		}
		
		return ajaxDone(service.updatePassword(id, userPassword));
	}

	/**
	 * 跳转到个人设置，用户修改密码
	 * 
	 * @return
	 */
	@RequestMapping("updateMyPwPage")
	public String updateMyPwPage(ModelMap map) {
		//生成加密密钥
		String pwd=UUID.randomUUID().toString();
		ServletUtil.getSession().setAttribute("jmpw", pwd);
		RSAPublicKey publicKey = RSAUtils.getPublicKey(pwd); 
		map.put("modulus",new String(Hex.encodeHex(publicKey.getModulus().toByteArray())));
		map.put("exponent",new String(Hex.encodeHex(publicKey.getPublicExponent().toByteArray())));
		return "personalOffice/user_set/update_password";
	}

	/**
	 * 修改我的密码
	 * 
	 * @param oldPassword
	 * @param userPassword
	 * @param pw
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("updateMyPw")
	public ModelAndView updateMyPw(String oldPassword, String userPassword,String pwd) throws UnsupportedEncodingException {

		if(!userPassword.equals(pwd)){
			List<String> errorMessages=new ArrayList<String>();
			errorMessages.add("两次输入的新密码不一致！");
			ModelAndView mav = new ModelAndView("ajaxValidationMessage");
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
			mav.addObject("errorCount",1);
			mav.addObject(MsgConfig.MESSAGE,errorMessages);
			return mav;
		}
		
		//解密
		oldPassword=RSAUtils.decryptStringByJs((String)ServletUtil.getSession().getAttribute("jmpw"),oldPassword);
		oldPassword=URLDecoder.decode(oldPassword, "utf-8");
		//验证密码长度是否符合规范
		if(oldPassword.length()<6||oldPassword.length()>20){
			List<String> errorMessages=new ArrayList<String>();
			errorMessages.add("密码长度必须在6-20之间。");
			ModelAndView mav = new ModelAndView("ajaxValidationMessage");
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
			mav.addObject("errorCount",1);
			mav.addObject(MsgConfig.MESSAGE,errorMessages);
			return mav;
		}
		userPassword=RSAUtils.decryptStringByJs((String)ServletUtil.getSession().getAttribute("jmpw"),userPassword);
		userPassword=URLDecoder.decode(userPassword, "utf-8");
		//验证密码长度是否符合规范
		if(userPassword.length()<6||userPassword.length()>20){
			List<String> errorMessages=new ArrayList<String>();
			errorMessages.add("密码长度必须在6-20之间。");
			ModelAndView mav = new ModelAndView("ajaxValidationMessage");
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
			mav.addObject("errorCount",1);
			mav.addObject(MsgConfig.MESSAGE,errorMessages);
			return mav;
		}
		
		return ajaxDone(service.updateMyPassword(oldPassword, userPassword));
	}

	/**
	 * 删除用户
	 * 
	 * @param dept
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids) {

		return ajaxDone(service.deleteUser(ids));
	}

	/**
	 * 查看用户详情
	 * 
	 * @return
	 */
	@RequestMapping("show")
	public String showUser(String id, ModelMap map) {

		SyUsers user = service.get(SyUsers.class, id);
		if (user == null) {
			return NODATA;
		}
		user.setUserPassword("");
		map.addAttribute("u", user);

		return "system/organize/user/show";
	}

	/**
	 * 跳转到 用户--角色--修改页面 ，并 查询出所有的角色，和用户已有的角色
	 * 
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updateRolePage")
	public String updateRolesPage(String id, ModelMap map) {

		map.addAttribute("m",
				JSON.toJSONString(service.selectUserRolesAndIds(id)));

		return "system/organize/user/update_role";

	}

	/**
	 * 修改用户角色分配
	 * 
	 * @param userId
	 * @param addRoleIds
	 *            需要添加的角色id，多个用，隔开
	 * @param delRoleIds
	 *            需要删除的角色id，多个用，隔开
	 * @return
	 */
	@RequestMapping("updateRole")
	public ModelAndView updatePowers(String userId, String[] addRoleIds,
			String[] delRoleIds) {

		return ajaxDone(service.updateUserRoles(userId, addRoleIds, delRoleIds));

	}
	/**
	 * 查看用户权限页面
	 * @return
	 */
	@RequestMapping("showPowersPage")
	public String showUserPowersPage(){
		
		return "system/organize/user/show_powers";
	}
	/**
	 * 查看用户详情
	 * @return
	 */
	@RequestMapping("showPowers")
	public ModelAndView showUserPowers(String id){
		
		
		return ajaxJson(service.selectUserPowers(id));
	}
	

	/**
	 * 用户，查找带回
	 * 
	 * @param param
	 * @param user
	 * @param type
	 *            查到带回类型 1:单选，2:多选
	 * @param map
	 * @return
	 */
	@RequestMapping("lookUpPage")
	public String lookUpPage(ModelMap map) {

		return "system/organize/user/lookup";

	}

	/**
	 * 用户，查找带回
	 * 
	 * @param param
	 * @param user
	 * @param type
	 *            查到带回类型 1:单选，2:多选,3:手机号选择
	 * @param map
	 * @return
	 */
	@RequestMapping("lookUp")
	public String lookUp(FormParam param, SyUsers user, Integer type,
			ModelMap map) {
		user.setUserStatus((short) 1);

		map.addAttribute("users", service.selectUsersLookUp(param, user));
		param.setAllCount(service.selectUsersLookUpCount(user));
		map.addAttribute("fromParam", param);
		if (type != null) {
			if (type == 2) {
				// 多选
				return "system/organize/user/lookup_more_query";
			} else if (type == 3) {
				// 手机号选择
				return "system/organize/user/lookup_more_query_num";
			} else {
				// 单选
				return "system/organize/user/lookup_query";
			}
		} else {
			// 默认单选
			return "system/organize/user/lookup_query";
		}

	}

	/**
	 * 跳转到excel导入页面
	 * 
	 * @return
	 */
	@RequestMapping("excelPage")
	public String excelPage(FormParam param, ModelMap map) {
		return "system/organize/user/excel";

	}

	/***
	 * excel导入
	 * 
	 * @return
	 */
	@RequestMapping("excel")
	public ModelAndView excel(@Valid String group,
			@RequestParam MultipartFile file) {
		List<SyUsers> list = new ArrayList<SyUsers>();
		if (!file.isEmpty()) {
			try {
				list = userExcel(file.getInputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		 return ajaxDone(service.addExcel(list));

	}

	/***
	 * 用户导入读取excel文件中的内容
	 * 
	 * @param is
	 * @return
	 */

	@SuppressWarnings("rawtypes")
	public List<SyUsers> userExcel(InputStream is) {
		List<SyUsers> list = new ArrayList<SyUsers>();

		try {

			Workbook wb = WorkbookFactory.create(is);
			// 获取第一页
			Sheet sheet = wb.getSheetAt(0);
			// 遍历每行(去掉表头)
			for (int rowsNum = 1; rowsNum <= sheet.getLastRowNum(); rowsNum++) {
				if (null != sheet.getRow(rowsNum)) {

					// Map<Integer, String> map = new HashMap<Integer,
					// String>();
					SyUsers u = new SyUsers();
					Row row = sheet.getRow(rowsNum);

					// 遍历每列
					for (int cellNum = 0; cellNum <= row.getLastCellNum(); cellNum++) {
						if (null != row.getCell(cellNum)) {
							String value = "";
							Cell cell = row.getCell(cellNum);
							int cellType = cell.getCellType();
							if (cellType == Cell.CELL_TYPE_NUMERIC) {
								int dataFormat = cell.getCellStyle()
										.getDataFormat();
								if (dataFormat == 14 || dataFormat == 28
										|| dataFormat == 22
										|| dataFormat == 178
										|| dataFormat == 58
										|| dataFormat == 180
										|| dataFormat == 181
										|| dataFormat == 182) {
									Date date = cell.getDateCellValue();
									if (date != null) {
										value = new SimpleDateFormat(
												"yyyy-MM-dd").format(date);
									}
								} else {
									value = new DecimalFormat("0").format(cell
											.getNumericCellValue());
								}
							} else if (cellType == Cell.CELL_TYPE_STRING) {
								value = cell.getStringCellValue();
							}
							if (cellNum == 0) {
								if (value != null && !"".equals(value)) {
									SyDept d = service.selectDept(value);
									if (d != null) {
										u.setDeptId(d.getId());
									} else {
										u.setDeptId("");
									}
								} else {
									u.setDeptId("");
								}
							} else if (cellNum == 1) {
								if (value != null && !"".equals(value)) {
									u.setTrueName(value);
								} else {
									u.setTrueName("");
								}
							} else if (cellNum == 2) {
								if (value != null && !"".equals(value)) {
									if (value.equals("男")) {
										u.setUserSex((short) 1);
									} else if (value.equals("女")) {
										u.setUserSex((short) 0);
									}
								} else {
									u.setUserSex(null);
								}
							} else if (cellNum == 3) {
								if (value != null && !"".equals(value)) {
									ListValues v = service
											.selectListView(value);
									if (v != null) {
										u.setXltypeid(v.getId());
									} else {
										u.setXltypeid("");
									}
								} else {
									u.setXltypeid("");
								}
							} else if (cellNum == 4) {
								if (value != null && !"".equals(value)) {
									ListValues v = service
											.selectListView(value);
									if (v != null) {
										u.setDytypeid(v.getId());
									} else {
										u.setDytypeid("");
									}
								} else {
									u.setDytypeid("");
								}
							} else if (cellNum == 5) {
								if (value != null && !"".equals(value)) {
									u.setMobilePhoneNumber(value);
									u.setUserName(value);
									u.setUserPassword("H1AF2G39C90F59F00H5DHA574BA4EE3H");
									u.setUserStatus((short) 1);
								} else {
									u.setMobilePhoneNumber("");
									u.setUserStatus((short) 0);
								}
							} else if (cellNum == 6) {
								if (value != null && !"".equals(value)) {

									long tempTimeLong = Long.valueOf(value)
											.intValue(); // 将数字转化成long型

									long ss = (tempTimeLong - 70 * 365 - 17 - 2) * 24 * 3600 * 1000; // excel的那个数字是距离1900年的天数 java 是距离1970年天数，但是明明期间只有17个闰年  我尝试的结果要减19才能正确，原因不明

									Date dss = new Date(ss); // 用这个数字初始化一个Date
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
									String date = formatter.format(dss);
									u.setJoindate(date);
								} else {
									u.setJoindate("");
								}
							} else if (cellNum == 7) {
								if (value != null && !"".equals(value)) {
									ListValues v = service
											.selectListView(value);
									if (v != null) {
										u.setZwtypeid(v.getId());
									} else {
										u.setZwtypeid("");
									}
								} else {
									u.setZwtypeid("");
								}
							}

							// System.out.println(cellNum+"------"+value);
						}
					}
					Member me = ServletUtil.getMember();
					u.setRegisterUid(me.getId());
					Date date = new Date();
					u.setRegisterTime(DateUtil.currentTimestamp());
					u.setErrorCount((short) 0);
					list.add(u);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
