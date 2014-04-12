package com.jxoa.manager.fj.service.impl;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.cache.MyCache;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.fj.bean.Grqz;
import com.jxoa.manager.fj.service.GrqzService;
import org.apache.commons.beanutils.BeanUtils;
@Service
public class GrqzServiceImpl extends BaseServiceImpl implements GrqzService{

	public List selectgrqz(FormParam param, Grqz a) {
		StringBuffer sb = new StringBuffer("select new Map(js.grqzguid as grqzguids,js.djsj as djsjs,js.qzcs as qzcss,js.qzgw as qzgws,js.xjdy as xjdys, rk as rk) from Grqz as js,Rkjb as rk  where js.rkjbguid=rk.rkjbguid ");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(a.getXm())) {
			sb.append("and rk.xm like '%"+ a.getXm()+"%'");
		} 
		if (StringUtils.isNotBlank(param.getOrderField())) {
			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());
		} else {
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}
	
	public Long selectgrqzCount(Grqz a) {
		StringBuffer sb = new StringBuffer("select count(*) from Grqz as js,Rkjb as rk  where js.rkjbguid=rk.rkjbguid ");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(a.getXm())) {
			sb.append("and rk.xm like '%"+ a.getXm()+"%'");
		} 
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	public String addGrqz(Grqz a) {
		a.setRkjbguid(a.getRkjbguid1());
		Object obj=dao.findOne("from Grqz where rkjbguid=? ",a.getRkjbguid());
		if(obj==null){
			String id=(String)dao.saveReturnId(a);
			if(StringUtils.isNotBlank(id)){
				saveLog("添加个人求职", "人员ID:"+a.getRkjbguid());
				//更新角色id-->name  缓存
				MyCache.getInstance().updateCacheMap(MyCache.ROLE2NAME, id,a.getRkjbguid());
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.role.unique";//此人员已存在
		}
	}

	public String updateGrqz(Grqz a) {
		String guid = a.getRkjbguid2()==null?"":a.getRkjbguid2().toString();
		if(!"".equals(guid)){
			a.setRkjbguid(guid);
		}
		Object obj=dao.findOne(" from Grqz where rkjbguid =? and grqzguid <> ?",a.getRkjbguid(),a.getGrqzguid());
		if(obj==null){
			Grqz grqz=dao.get(Grqz.class, a.getGrqzguid());
			if(grqz!= null){
				try {
					BeanUtils.copyProperties(grqz, a);
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
		
		 }else{
			return "msg.role.unique";//此角色名称已存在
		  }
		return MsgConfig.MSG_KEY_SUCCESS;
	}

	public boolean deleteGrqz(String[] ids) {
		//等待删除的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			Grqz r=dao.get(Grqz.class, id);
			if(r!=null){
				saveLog("删除个人气质信息", "删除人员ID:"+r.getGrqzguid());
				c.add(r);
				MyCache.getInstance().removeCacheMap(MyCache.ROLE2NAME, id);
			}
		}
		return dao.deleteAll(c);
	}
	
	
}