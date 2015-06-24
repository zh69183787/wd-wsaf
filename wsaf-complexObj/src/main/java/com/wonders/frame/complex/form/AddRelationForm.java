package com.wonders.frame.complex.form;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.wonders.frame.complex.model.bo.GroupOld;
import com.wonders.frame.complex.model.bo.UserOld;
import com.wonders.frame.core.tags.OneToManyCustom;
import com.wonders.frame.core.tags.ShowInView;

/**
 * @author mengjie
 * 多表的联合，针对一对多的情况
 *
 */
public class AddRelationForm implements Serializable {

	@ShowInView(noUse=true)
	private static final long serialVersionUID = 4295798325688228185L;

	@OneToManyCustom(isOne=true)
	private GroupOld groupOld;
	
	@OneToManyCustom(isMany=true, name="userOld")
	private Map<String, UserOld> users;  
	
	public AddRelationForm() {
		super();
	}

	public Map<String, UserOld> getUsers() {
		return users;
	}

	public void setUsers(Map<String, UserOld> users) {
		this.users = users;
	}
	
	public GroupOld getGroupOld() {
		return groupOld;
	}

	public void setGroupOld(GroupOld groupOld) {
		this.groupOld = groupOld;
	}

	
	public List<UserOld> toUserOldList() {
		return Arrays.asList(users.values().toArray(new UserOld[0]));
//		List<UserOld> userOldList = new ArrayList<UserOld>();
//		return userOldList; 
		/*List<UserOld> userOldList = new ArrayList<UserOld>();
		for (Map.Entry<String, UserOld> userOlds : getUsers().entrySet()) {  
//		        System.out.println(userOlds.getKey() + ": " + userOlds.getValue().getName() + " - " +  
//		        		userOlds.getValue().getMobile1());  
			UserOld userOld = new UserOld() ;
	        userOld.setName(userOlds.getValue().getName());
	        userOld.setGender(userOlds.getValue().getGender());
	        userOld.setMobile1(userOlds.getValue().getMobile1());
	        userOld.setMobile2(userOlds.getValue().getMobile2());
	        userOld.setTelephone(userOlds.getValue().getTelephone());
	        userOldList.add(userOld);
	    }
		return userOldList;  */
	}
	
	public static void main(String[] args) {
		Field[] fields = AddRelationForm.class.getDeclaredFields();
		boolean isOne = false;
		boolean isMany = false;
		for (Field field : fields) {
			OneToManyCustom oneToManyCustom = field.getAnnotation(OneToManyCustom.class);
			if(oneToManyCustom!=null){
				isOne = oneToManyCustom.isOne();
				isMany = oneToManyCustom.isMany();
			}
			if(isMany){
//				Type t = AddRelationForm.class.getGenericSuperclass();
//				Class<?> entityClass;
//				entityClass = (Class<?>)((ParameterizedType)t).getActualTypeArguments()[1];   
//				System.out.println(entityClass);
			}
		}
		
	}
}
