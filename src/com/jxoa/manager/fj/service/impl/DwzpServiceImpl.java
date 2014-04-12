package com.jxoa.manager.fj.service.impl;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.fj.bean.Dwzp;
import com.jxoa.manager.fj.service.DwzpService;
import org.apache.commons.beanutils.BeanUtils;
@Service
public class DwzpServiceImpl extends BaseServiceImpl implements DwzpService{

	public List selectdwmc(FormParam param, Dwzp a) {
		StringBuffer sb = new StringBuffer(" from Dwzp  where 1=1 ");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(a.getDwmc())) {
			sb.append("and dwmc like '%"+ a.getDwmc()+"%'");
		} 
		if (StringUtils.isNotBlank(a.getXqgw())) {
			sb.append(" and xqgw like '%"+ a.getXqgw()+"%'");
		}
		if (StringUtils.isNotBlank(param.getOrderField())) {
			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());
		} else {
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}
	
	public Long selectdwmcCount(Dwzp a) {
		StringBuffer sb = new StringBuffer("select count(*) from Dwzp  where 1=1 ");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(a.getDwmc())) {
			sb.append("and dwmc like '%"+ a.getDwmc()+"%'");
		} 
		if (StringUtils.isNotBlank(a.getXqgw())) {
			sb.append(" and xqgw like '%"+ a.getXqgw()+"%'");
		}
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	public String adddwmc(Dwzp a) {
			String id=(String)dao.saveReturnId(a);
			if(StringUtils.isNotBlank(id)){
				saveLog("添加招聘", "公司名称:"+a.getDwmc());
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
	}

	public String updatedwmc(Dwzp a) {
		Dwzp dwzp=dao.get(Dwzp.class, a.getDwzpguid());
			if(dwzp!= null){
				try {
					BeanUtils.copyProperties(dwzp, a);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				return "msg.data.hasdelete";//数据已经被删除
			}
		return MsgConfig.MSG_KEY_SUCCESS;
	}

	public boolean deletedwmc(String[] ids) {
		//等待删除的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			Dwzp r=dao.get(Dwzp.class, id);
			if(r!=null){
				saveLog("删除单位招聘信息", "单位名称:"+r.getDwmc());
				c.add(r);
			}
		}
		return dao.deleteAll(c);
	}
	
	
	public List selectById(String id) {
		StringBuffer sb = new StringBuffer(" from Dwzp  where 1=1 ");
		sb.append(" and dwzpguid='"+id+"'");
		return dao.find(sb.toString());
	}
}