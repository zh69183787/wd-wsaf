package com.wonders.frame.complex.form;

import com.wonders.frame.complex.model.bo.GroupOld;
import com.wonders.frame.complex.model.bo.RoleOld;
import com.wonders.frame.complex.model.bo.UserOld;
import com.wonders.frame.core.tags.ComplexRelation;
import com.wonders.frame.core.tags.ShowInView;

/**
 * @author mengjie
 * 多表的联合查询
 *
 */
public class RelationVoImpl implements RelationVo  {

	@ShowInView(noUse=true)
	private static final long serialVersionUID = -4931459148374111646L;

	private GroupOld groupOld;
	
	private UserOld userOld;
	
	private RoleOld roleOld;
	
	
	
//	select * from AF_USER_OLD t where t.groupold_id in( select a.id from Af_Group_Old a  where a.id='129') 
//	@ComplexRelation(sign="in",condition="UserOld_groupOldID&GroupOld_id")
	@Override
	@ComplexRelation(sign="in",showEntity="UserOld",condition="o.groupOldID in( select g.id from GroupOld g) ")
	public void relationIn() {
		
	}
	
	@Override
//	@ComplexRelation(sign="=",condition="GroupOld_id&UserOld_groupOldID")
//	@ComplexRelation(sign="=",condition="GroupOld_id&UserOld_groupOldID,RoleOld_id&UserOld_roleOldID")
	public void relationEqual() {
	}
	
	@Override
	public void relationBetween() {
		// TODO Auto-generated method stub
		
	}
	
	public GroupOld getGroupOld() {
		return groupOld;
	}

	public void setGroupOld(GroupOld groupOld) {
		this.groupOld = groupOld;
	}

	public UserOld getUserOld() {
		return userOld;
	}

	public void setUserOld(UserOld userOld) {
		this.userOld = userOld;
	}

	public RoleOld getRoleOld() {
		return roleOld;
	}

	public void setRoleOld(RoleOld roleOld) {
		this.roleOld = roleOld;
	}

}
