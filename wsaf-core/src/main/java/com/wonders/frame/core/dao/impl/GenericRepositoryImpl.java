package com.wonders.frame.core.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.core.model.vo.PageInfo;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.utils.ReflectUtil;



/**
 * {@link GenericRepository}接口实现类，并在{@link SimpleJpaRepository}基础上扩展。
 * @param <T> ORM对象
 * @param <ID> 主键ID	
 */
@NoRepositoryBean   // 必须的
public class GenericRepositoryImpl<T, ID extends Serializable> extends
		SimpleJpaRepository<T, ID> implements GenericRepository<T, ID> {

	static Logger logger = Logger.getLogger(GenericRepositoryImpl.class);
    private final EntityManager em;
    private final Class<T> entityClass;
    private final String entityName;
    

	/**
	 * 构造函数
     * @param domainClass
     * @param em
     */
	public GenericRepositoryImpl(final JpaEntityInformation<T, ?> entityInformation, EntityManager entityManager) {
		
		super(entityInformation, entityManager);
		this.em = entityManager;
		this.entityClass=entityInformation.getJavaType();
		this.entityName=entityInformation.getEntityName();
	}
	
	/**
	 * 构造函数
	 * @param domainClass
	 * @param em
	 */
	public GenericRepositoryImpl(Class<T> domainClass, EntityManager em) {
        this(JpaEntityInformationSupport.getMetadata(domainClass, em), em); 
    }
	
	@Override
    public List<T> findAll(HashMap<String,Object> queryParams,
    		LinkedHashMap<String, String> orderby){        
		 
		String whereHql=buildWhereQuery(queryParams);
		String orderHql=buildOrderby(orderby);
	
		String hql = "select o from "+entityName+" o where o.removed=0"; 
		Query query=createQuery(hql+whereHql+orderHql,queryParams);

		List<T> list=(List<T>)query.getResultList();
		return list;    
	}
	
    
    @Override
	public SimplePage<T> findByPage(HashMap<String,Object> queryParams,
			LinkedHashMap<String, String> orderby, Integer pageSize,Integer pageNum) {
    	
    	return findByPage(queryParams,buildOrderby(orderby), pageSize, pageNum);

	}
    @Override
    public SimplePage<T> findByPage(HashMap<String,Object> queryParams,
			String orderby, Integer pageSize,Integer pageNum) {
               		 
		String whereHql=buildWhereQuery(queryParams);
		String orderHql=orderby;
		
		String hql="select count(*) from "+ entityName+ " o where o.removed=0 "; 
		Query query=createQuery(hql+whereHql+orderHql,queryParams);
		PageInfo pageInfo=new PageInfo(((Long)query.getSingleResult()).intValue(),pageSize);
		pageInfo.refresh(pageNum);
        

        hql = "select o from "+ entityName+ " o where o.removed=0 ";
        query=createQuery(hql+whereHql+orderHql,queryParams);
        query.setFirstResult(pageInfo.getStartRecord()).setMaxResults(pageInfo.getPageSize());  

        return new SimplePage<T>(pageInfo,query.getResultList());
	}
    
    private Query createQuery(String hql,HashMap<String,Object> queryParams){
    	Query query = em.createQuery(hql);
		setQueryParams(query, queryParams);
		return query;
    }
//    private Query createComplexQuery(String hql,HashMap<String,Object> queryParams,HashMap<String,Object> complexParams){
//    	Query query = em.createQuery(hql);
//    	setQueryParams(query, queryParams);
////    	setComplexQueryParams(query, complexParams);
//    	
//    	return query;
//    }
    
 	public SimplePage<T> findComplexByPage(HashMap<String,Object> queryParams,HashMap<String,Object> complexParam,
 			LinkedHashMap<String, String> orderby, Integer pageSize,Integer pageNum) {
     	
     	return findComplexByPage(queryParams,complexParam,buildOrderby(orderby), pageSize, pageNum);

 	}
    
    public SimplePage<T> findComplexByPage(HashMap<String,Object> queryParams,HashMap<String,Object> complexParam,
    		String orderby, Integer pageSize,Integer pageNum) {
    	String fromSql = "";
    	String removeSql = "";
    	String whereHql=buildWhereQuery(queryParams);
    	String whereComplexHql=buildComplexWhereQuery(complexParam);
    	String orderHql=orderby;
    	List queryEntity = (List) complexParam.get("queryEntity");
    	if(complexParam.get("sign").equals("=")){
    		for(int i=0;i<queryEntity.size();i++){
        		fromSql +=  queryEntity.get(i)+" "+StringUtils.uncapitalize((String) queryEntity.get(i))+","; 
        		removeSql += StringUtils.uncapitalize((String) queryEntity.get(i))+".removed=0 and ";
        	}
        	fromSql = fromSql.substring(0, fromSql.lastIndexOf(","));
        	removeSql = removeSql.substring(0, removeSql.lastIndexOf("and"));
        	
        	String hql="select count(*) from "+ fromSql+ " where "+removeSql+" "; 
        	Query query=createQuery(hql+whereHql+whereComplexHql+orderHql,queryParams);
        	PageInfo pageInfo=new PageInfo(((Long)query.getSingleResult()).intValue(),pageSize);
        	pageInfo.refresh(pageNum);
        	
        	
        	hql = "from "+ fromSql+ "  where "+removeSql+" ";
        	query=createQuery(hql+whereHql+whereComplexHql+orderHql,queryParams);
        	query.setFirstResult(pageInfo.getStartRecord()).setMaxResults(pageInfo.getPageSize()); 
        	return new SimplePage<T>(pageInfo,query.getResultList());
    	}else if(complexParam.get("sign").equals("in")){
    		String entityName = (String) complexParam.get("showEntity");
    		String hql="select count(*) from "+ entityName+ " o where o.removed=0 "; 
    		Query query=createQuery(hql+whereHql+whereComplexHql+orderHql,queryParams);
    		PageInfo pageInfo=new PageInfo(((Long)query.getSingleResult()).intValue(),pageSize);
    		pageInfo.refresh(pageNum);
            

            hql = "select o from "+ entityName+ " o where o.removed=0 ";
            query=createQuery(hql+whereHql+whereComplexHql+orderHql,queryParams);
            query.setFirstResult(pageInfo.getStartRecord()).setMaxResults(pageInfo.getPageSize());  

            return new SimplePage<T>(pageInfo,query.getResultList());
    	}
		return null;
    }
    
	@Override
	public SimplePage<T> findByPageWithWhereHql(String whereHql, HashMap<String,Object> queryParams, Integer pageSize,Integer pageNum) {
        
		String hql="select count(*) from "+ entityName+ " o where o.removed=:removed ";  
		if(whereHql==null){
			whereHql="";
		}

		Query query = em.createQuery(hql+whereHql);
		setQueryParams(query, queryParams);
		PageInfo pageInfo=new PageInfo(((Long)query.getSingleResult()).intValue(),pageSize);
		pageInfo.refresh(pageNum);
        

        hql = "select o from "+ entityName+ " o where o.removed=:removed ";
        query = em.createQuery(hql+whereHql);        
        setQueryParams(query, queryParams);
        query.setFirstResult(pageInfo.getStartRecord()).setMaxResults(pageInfo.getPageSize());  

        return new SimplePage<T>(pageInfo,query.getResultList());
	}
	
	@Override
	public SimplePage<T> findByPageWithSql(String sql, HashMap<String,Object> queryParams, Integer pageSize,Integer pageNum) {

		Query query = em.createNativeQuery("select count(*) from ("+sql+")");  
		setQueryParams(query, queryParams);
		
		PageInfo pageInfo=new PageInfo(((Long)query.getSingleResult()).intValue(),pageSize);
		pageInfo.refresh(pageNum);
		
		query = em.createNativeQuery(sql);
		setQueryParams(query, queryParams);
        query.setFirstResult(pageInfo.getStartRecord()).setMaxResults(pageInfo.getPageSize());  

		return new SimplePage<T>(pageInfo,query.getResultList());
	}
	
	private void setQueryParams(Query query, HashMap<String, Object> queryParams){
		if(queryParams!=null && queryParams.size()>0){
			for(String key : queryParams.keySet()){
				Class clazz=ReflectUtil.getFieldType(this.entityClass, key.replaceAll("_sl", "").replaceAll("_el", "").replaceAll("_l", "").replaceAll("_s","").replaceAll("_e", "").replaceAll("_in", ""));
				if(clazz!=null && clazz.equals(String.class) && !key.endsWith("_in")){
					if(key.endsWith("_el")){
						query.setParameter(key, '%'+queryParams.get(key).toString());
					}else if(key.endsWith("_sl")){
						query.setParameter(key, queryParams.get(key).toString()+'%');
					}else if(key.endsWith("_l")){
						query.setParameter(key, '%'+queryParams.get(key).toString()+'%');
					}else{
						query.setParameter(key, queryParams.get(key).toString());
					}
				}else{
					query.setParameter(key, queryParams.get(key));
				}

			}
		}
	}
	private void setComplexQueryParams(Query query, HashMap<String, Object> complexParam){
		if(complexParam!=null && complexParam.size()>0){
			for(String key : complexParam.keySet()){
				query.setParameter(key, complexParam.get(key));
			}
		}
	}

	private String buildOrderby(LinkedHashMap<String, String> orderby) {
		// TODO Auto-generated method stub
		StringBuffer orderbyql = new StringBuffer("");
		if(orderby!=null && orderby.size()>0){
			orderbyql.append(" order by ");
			for(String key : orderby.keySet()){
				orderbyql.append("o.").append(key).append(" ").append(orderby.get(key)).append(",");
			}
			orderbyql.deleteCharAt(orderbyql.length()-1);
		}
		
		return orderbyql.toString();
	}
	
	private String buildWhereQuery(HashMap<String, Object> queryParams) {
		// TODO Auto-generated method stub
		StringBuffer whereQueryHql = new StringBuffer("");
		if(queryParams!=null && queryParams.size()>0){
			for(String key : queryParams.keySet()){
//				if(key.equalsIgnoreCase("id")){
//					whereQueryHql.append(" and ").append("o.").append(key).append(" in(:").append(key).append(")");
//				}else 
				if(key.endsWith("_s")){
					whereQueryHql.append(" and ").append("o.").append(key.replace("_s", "")).append(" >=:").append(key);
				}else if(key.endsWith("_e")){
					whereQueryHql.append(" and ").append("o.").append(key.replace("_e", "")).append(" <=:").append(key);
				}else if(key.endsWith("_in")){
					whereQueryHql.append(" and ").append("o.").append(key.replace("_in", "")).append(" in:").append(key);
				}else{
					Class clazz=ReflectUtil.getFieldType(this.entityClass, key.replaceAll("_sl", "").replaceAll("_el", "").replaceAll("_l", "").replaceAll("_s","").replaceAll("_e", "").replaceAll("_in", ""));
					if(clazz!=null && clazz.equals(String.class)){
						if(key.endsWith("_el")){
							whereQueryHql.append(" and ").append("o.").append(key.replace("_el", "")).append(" like :").append(key);
						}else if(key.endsWith("_sl")){
							whereQueryHql.append(" and ").append("o.").append(key.replace("_sl", "")).append(" like :").append(key);
						}else if(key.endsWith("_l")){
							whereQueryHql.append(" and ").append("o.").append(key.replace("_l", "")).append(" like :").append(key);
						}else{
							whereQueryHql.append(" and ").append("o.").append(key).append(" =:").append(key);
						}						
					}else{
						whereQueryHql.append(" and ").append("o.").append(key).append(" =:").append(key);
					}
					
				}
			}
		}
		
		return whereQueryHql.toString();
	}
	
	private String buildComplexWhereQuery(HashMap<String, Object> complexParams) {
		// TODO Auto-generated method stub
		StringBuffer whereQueryHql = new StringBuffer("");
		if(complexParams!=null && complexParams.size()>0){
			for(String key : complexParams.keySet()){
				if(key.equals("sign")){
					if(complexParams.get("sign").equals("=") || complexParams.get("sign").equals("in")){
						whereQueryHql.append(" and ").append(complexParams.get("appendSql"));
					}
				}else{
					whereQueryHql.append("");
				}
			}
		}
		
		return whereQueryHql.toString();
	}

	@Override
	public List<T> findAllBySql(Class<T> entityClass, String sql) {
          //创建原生SQL查询QUERY实例,指定了返回的实体类型
          Query query =  em.createNativeQuery(sql,entityClass);
          //执行查询，返回的是实体列表,
          List<T> EntityList = query.getResultList();
		return EntityList;
	}

	public String getUniqueResultBySql(String sql,HashMap<String,Object> queryParams){
		Query query =  em.createNativeQuery(sql);
		for(String key : queryParams.keySet()){
			query.setParameter(key, queryParams.get(key));
		}
        //执行查询，返回的是实体列表,
        String result = (String)query.getSingleResult();
       return result;
	}

	public List<String> findRuleByPIdAndType(Integer pid, String type){
		String sql = "select (select distinct t.p_type from af_relation_rule t where t.p_id="+pid+" )||sys_connect_by_path(a.n_type, '>') Path "
				+ "from af_relation_rule a connect by prior a.n_id =a.p_id "
				+ "start with a.p_id="+pid+" and a.type='"+type+"'";
		 Query query =  em.createNativeQuery(sql);
         //执行查询，返回的是实体列表,
         List<String> EntityList = query.getResultList();
		return EntityList;
	}
	
//	@Transactional
//	public void updateModelNameAndModelId(String modelName, Integer modelId, String[] ids){
//		String idsString ="";
//		if(ids==null || ids.length<1) return;
//		for(int i=0; i<ids.length; i++){
//			try {
//				Long.valueOf(ids[i]);
//			} catch (NumberFormatException e) {
//				return;
//			}
//			idsString += ids[i] +",";
//		}
//		idsString = idsString.substring(0,idsString.length()-1);
//		String hql ="update Attach a set a.modelName ="+modelName+", a.modelId ="+modelId+" where a.id in ("+idsString+")";
//		createQuery(hql, null).executeUpdate();
//	}

}