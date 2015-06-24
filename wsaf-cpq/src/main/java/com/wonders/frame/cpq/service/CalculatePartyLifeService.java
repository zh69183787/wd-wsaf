/** 
* @Title: TShortMsgService.java 
* @Package com.wonders.frame.iims.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.cpq.service;

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
public class CalculatePartyLifeService {
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	public String getCountNum(String year){
		String cnt="0,0,0,0,0,0,0,0,0,0,0,0";
		try{
			String sql="select nvl(sum(jan),0)||','||nvl(sum(feb),0)||','||nvl(sum(mar),0)||','||nvl(sum(apr),0)||','||nvl(sum(may),0)||','||nvl(sum(jun),0)" +
					"||','||nvl(sum(jul),0)||','||nvl(sum(aug),0)||','||nvl(sum(sep),0)||','||nvl(sum(oct),0)||','||nvl(sum(nov),0)||','||nvl(sum(dece),0) cnt " +
					"from cpq_party_life a where a.year = ? and a.removed=0"; 
			List<Map<String,Object>> list=jdbcTemplate.queryForList(sql, new Object[]{year});
			
			for(int i=0;i<list.size();i++){
				Map<String,Object> rec=list.get(i);
				cnt=(String)rec.get("cnt");				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return cnt;
		
	}
	
	
	
}
