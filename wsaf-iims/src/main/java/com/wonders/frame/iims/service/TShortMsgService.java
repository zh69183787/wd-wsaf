/** 
* @Title: TShortMsgService.java 
* @Package com.wonders.frame.iims.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.iims.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/** 
 * @ClassName: TShortMsgService 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
@Service
public class TShortMsgService {
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	public boolean sendNewShortMsg(String loginName,String content){
		boolean success=false;
		try{
			String sql="select nvl(nvl(a.mobile1,a.mobile2),0) mobile from cs_user a,T_CS_USER t where a.id=t.id and a.login_name like ? and t.msg_notice=1"; 
			List<Map<String,Object>> list=jdbcTemplate.queryForList(sql, new Object[]{loginName});
			String mobile="0";
			for(int i=0;i<list.size();i++){
				Map<String,Object> rec=list.get(i);
				mobile=(String)rec.get("mobile");
				if(!mobile.equals("0")){break;}
			}
			if(!mobile.equals("0")){
				sql="insert into t_short_msg(id,status,mobile,content) values(sys_guid(),'0',?,?)";
				int successRec=jdbcTemplate.update(sql, new Object[]{mobile,content});
				if(successRec>0){
					success=true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return success;
		
	}
	
	
	
}
