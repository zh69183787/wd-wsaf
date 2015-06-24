/** 
* @Title: CcateDao.java 
* @Package com.wonders.frame.iims.dao 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.dao;

import com.wonders.frame.core.model.bo.Ccate;

/** 
 * @ClassName: CcateDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface CcateDao  extends GenericRepository<Ccate, Integer>{
	public Ccate findByType(String type);

}
