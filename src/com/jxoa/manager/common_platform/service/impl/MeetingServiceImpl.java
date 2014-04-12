/**  
 * @Project: jxoa
 * @Title: MeetingServiceImpl.java
 * @Package com.jxoa.manager.common_platform.service.impl
 * @date 2013-5-9 上午10:29:47
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.common_platform.bean.Mapping;
import com.jxoa.manager.common_platform.bean.Meeting;
import com.jxoa.manager.common_platform.service.IMeetingService;

/**
 * 
 * 类名：MeetingServiceImpl 功能： 详细： 作者：曹中德(caozhongde) 版本：1.0 日期：2013-5-9
 * 上午10:29:47
 * 
 */
@Service
public class MeetingServiceImpl extends BaseServiceImpl implements
		IMeetingService {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectMeeting(FormParam param, Meeting lv) {

		StringBuffer sb = new StringBuffer("from Meeting me where 1=1 ");
		List list = new ArrayList();
		// 查询条件

		if (lv.getMName() != null && !"".equals(lv.getMName())) {
			sb.append(" and me.MName like ? ");
			list.add("%" + lv.getMName() + "%");

		}
		if (lv.getRoom() != null && !"".equals(lv.getRoom())) {
			if (lv.getRoom().getId() != null
					&& !"".equals(lv.getRoom().getId())) {
				sb.append(" and me.room.id = ? ");
				list.add(lv.getRoom().getId());
			}
		}
		if (lv.getMDate() != null && !"".equals(lv.getMDate())) {
			sb.append(" and me.MDate >= ? ");
			list.add(lv.getMDate());
		}
		if (lv.getMDate2() != null) {
			sb.append(" and me.MDate <= ? ");
			list.add(lv.getMDate2());
		}
		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by me." + param.getOrderField() + " "
					+ param.getOrderDirection());

		} else {
			param.setOrderDirection("desc");
			sb.append(" order by me.MDate desc");
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);

	}

	public List selectMeetingTome(FormParam param, Meeting lv) {
		StringBuffer sb = new StringBuffer(
				"select distinct	me from Meeting me,Mapping mp where me.id=mp.mpMtid and (mp.mpFkid=? or mp.mpFkid=?) ");
		List list = new ArrayList();

		Member me = ServletUtil.getMember();
		list.add(me.getDeptId());
		list.add(me.getId());
		// 查询条件

		if (lv.getMName() != null && !"".equals(lv.getMName())) {
			sb.append(" and me.MName like ? ");
			list.add("%" + lv.getMName() + "%");

		}
		if (lv.getRoom() != null && !"".equals(lv.getRoom())) {
			if (lv.getRoom().getId() != null
					&& !"".equals(lv.getRoom().getId())) {
				sb.append(" and me.room.id = ? ");
				list.add(lv.getRoom().getId());
			}
		}
		if (lv.getMDate() != null && !"".equals(lv.getMDate())) {
			sb.append(" and me.MDate >= ? ");
			list.add(lv.getMDate());
		}
		if (lv.getMDate2() != null) {
			sb.append(" and me.MDate <= ? ");
			list.add(lv.getMDate2());
		}

		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);

	}

	@Override
	public List selectRoom() {
		return dao.find("from Room");

	}

	@Override
	public Long selectMeetingCount(Meeting lv) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Meeting me,Mapping mp where me.id=mp.mpMtid and (mp.mpFkid=? or mp.mpFkid=?) ");
		List list = new ArrayList();

		Member me = ServletUtil.getMember();
		list.add(me.getDeptId());
		list.add(me.getId());

		if (lv.getMName() != null && !"".equals(lv.getMName())) {
			sb.append(" and me.MName like ? ");
			list.add("%" + lv.getMName() + "%");

		}
		if (lv.getRoom() != null && !"".equals(lv.getRoom())) {
			if (lv.getRoom().getId() != null
					&& !"".equals(lv.getRoom().getId())) {
				sb.append(" and me.room.id = ? ");
				list.add(lv.getRoom().getId());
			}
		}
		if (lv.getMDate() != null && !"".equals(lv.getMDate())) {
			sb.append(" and me.MDate >= ? ");
			list.add(lv.getMDate());
		}
		if (lv.getMDate2() != null) {
			sb.append(" and me.MDate <= ? ");
			list.add(lv.getMDate2());
		}
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	public String addMeeting(Meeting m) {
		long sta = Long.valueOf(m.getMStatime().replaceAll("[:]", ""));
		long end = Long.valueOf(m.getMEndtime().replaceAll("[:]", ""));
		long result = end - sta;

		if (result > 0) {
			List<Meeting> me = dao
					.find("from Meeting where MDate=? and room.id=? and (MStatime<=? or MEndtime>=? )",
							m.getMDate(), m.getRoom().getId(), m.getMStatime(),
							m.getMEndtime());
			if (me.size() == 0) {
				Collection c = new ArrayList();
				String id = (String) dao.saveReturnId(m);
				String deptid = m.getDeptid();
				String userid = m.getUserid();
				if (deptid != null && !"".equals(deptid)) {
					String[] dept = deptid.split(",");

					String[] user = null;
					if (userid != null && !"".equals(userid)) {

						user = userid.split(",");
					}

					for (int i = 0; i < dept.length; i++) {
						if (dept[i] != null && !"".equals(dept[i])) {
							Mapping mp = new Mapping();
							mp.setMpMtid(id);
							mp.setMpFkid(dept[i]);
							mp.setMpType("1");
							c.add(mp);

						}

					}
					if (user != null && !"".equals(user)) {
						for (int i = 0; i < user.length; i++) {
							if (user[i] != null && !"".equals(user[i])) {

								Mapping mp = new Mapping();
								mp.setMpMtid(id);
								mp.setMpFkid(user[i]);
								mp.setMpType("2");
								c.add(mp);
							}

						}
					}
					saveMsgWarn(2, id, user, dept);
				}
				if (dao.saveOrUpdateAll(c)) {
					return MsgConfig.MSG_KEY_SUCCESS;
				} else {
					return MsgConfig.MSG_KEY_FAIL;
				}
			} else {

				return "msg.room.status";
			}
		} else {
			return "msg.meeting.date";
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map selectMapping(String id) {

		Meeting meeting = dao.get(Meeting.class, id);

		List<Mapping> li = dao.find("from Mapping where mpMtid=? ", id);
		Map<String, String> deptId2Name = (Map<String, String>) ServletUtil
				.getServletContextAttribute("deptId2Name");
		Map<String, String> userId2Name = ((Map<String, String>) ServletUtil
				.getServletContextAttribute("userId2Name"));

		List deptNames = new ArrayList();
		List deptIds = new ArrayList();
		List userNames = new ArrayList();
		List userIds = new ArrayList();
		for (Mapping m : li) {
			if (m.getMpType().equals("1")) {
				deptNames.add(deptId2Name.get(m.getMpFkid()));
				deptIds.add(m.getMpFkid());
			} else {
				userNames.add(userId2Name.get(m.getMpFkid()));
				userIds.add(m.getMpFkid());
			}
		}

		Map map = new HashMap();

		map.put("meeting", meeting);
		map.put("deptIds", StringUtils.join(deptIds, ","));
		map.put("deptNames", StringUtils.join(deptNames, ","));
		map.put("userIds", StringUtils.join(userIds, ","));
		map.put("userNames", StringUtils.join(userNames, ","));

		return map;

	}

	@Override
	public String updateMeeting(Meeting m) {
		long sta = Long.valueOf(m.getMStatime().replaceAll("[:]", ""));
		long end = Long.valueOf(m.getMEndtime().replaceAll("[:]", ""));
		long result = end - sta;

		if (result > 0) {
			List<Meeting> mee = dao
					.find("from Meeting where MDate=? and room.id=? and (MStatime<=? or MEndtime>=? )",
							m.getMDate(), m.getRoom().getId(), m.getMStatime(),
							m.getMEndtime());
			if (mee.size() == 0) {
				Collection<Object> c = new ArrayList<Object>();

				String deptid = m.getDeptid();
				String userid = m.getUserid();
				Meeting me = dao.get(Meeting.class, m.getId());
				me.setMDate(m.getMDate());
				me.setRoom(m.getRoom());
				me.setMType(m.getMType());
				me.setMName(m.getMName());
				me.setMHost(m.getMHost());
				me.setMStatime(m.getMStatime());
				me.setMEndtime(m.getMEndtime());
				me.setMSummary(m.getMSummary());
				me.setMRemark(m.getMRemark());
				c.add(me);
				List deptList = new ArrayList(Arrays.asList(deptid.split(",")));
				List dtList = dao
						.find("select mpFkid from Mapping where mpMtid=? and mpType=?",
								m.getId(), "1");
				List userList = new ArrayList(Arrays.asList(userid.split(",")));
				List uiList = dao
						.find("select mpFkid from Mapping where mpMtid=? and mpType=?",
								m.getId(), "2");

				List dList = dao
						.find("select mpFkid from Mapping where mpMtid=? and mpType=?",
								m.getId(), "1");
				List uList = dao
						.find("select mpFkid from Mapping where mpMtid=? and mpType=?",
								m.getId(), "2");

				dtList.removeAll(deptList);
				deptList.removeAll(dList);
				uiList.removeAll(userList);
				userList.removeAll(uList);
				// 发送信息
				saveMsgWarn(2, m.getId(), userList, deptList);

				for (int i = 0, l = dtList.size(); i < l; i++) {
					dao.delete("delete Mapping where mpMtid=? and mpFkid=? ",
							m.getId(), dtList.get(i));
				}
				for (int i = 0; i < deptList.size(); i++) {
					String fkid = deptList.get(i).toString();
					if (fkid != null && !"".equals(fkid)) {
						Mapping mp = new Mapping();

						mp.setMpMtid(m.getId());
						mp.setMpFkid(fkid);
						mp.setMpType("1");
						c.add(mp);

					}

				}

				for (int i = 0, l = uiList.size(); i < l; i++) {
					dao.delete(
							"delete Mapping where mpMtid=? and mpFkid=?  and mpType=? ",
							m.getId(), uList.get(i), "2");
				}
				for (int i = 0; i < userList.size(); i++) {
					String fkid = userList.get(i).toString();
					if (fkid != null && !"".equals(fkid)) {
						Mapping mp = new Mapping();

						mp.setMpMtid(m.getId());
						mp.setMpFkid(fkid);
						mp.setMpType("2");
						c.add(mp);
					}

				}

				if (dao.saveOrUpdateAll(c)) {
					return MsgConfig.MSG_KEY_SUCCESS;
				} else {
					return MsgConfig.MSG_KEY_FAIL;
				}
			} else {

				return "msg.room.status";
			}
		} else {
			return "msg.meeting.date";
		}
	}

	@Override
	public boolean deleteMeeting(String[] ids) {
		for (String id : ids) {
			dao.delete("delete Mapping where mpMtid=?", id);
			Meeting m = dao.get(Meeting.class, id);
			dao.delete(m);
		}

		return true;
	}

}
