package com.wonders.frame.complex.form;

import java.io.Serializable;

/**
 * @author mengjie
 * 多表的联合查询
 *
 */
public interface RelationVo extends Serializable {

	public void relationIn();
	public void relationEqual();
	public void relationBetween();
	
}
