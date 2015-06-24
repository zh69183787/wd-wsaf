package com.wonders.frame.console.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.console.dao.RoleDao;
import com.wonders.frame.console.dao.UserDao;
import com.wonders.frame.console.model.bo.Role;
import com.wonders.frame.console.model.bo.User;
import com.wonders.frame.console.service.UserService;
import com.wonders.frame.core.dao.RelationDao;
import com.wonders.frame.core.model.bo.Relation;


@Service("userService")
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private RoleDao roleDao;

	@Resource
	private RelationDao relationDao;


	public void changeInfomations(User user) {
		if (user == null) {
			throw new IllegalArgumentException("user为null");
		}
		
		if (user.getId() == null) {
			logger.debug("保存实体");
			userDao.save(user);
			return;
		}
		
		User mergedUser = userDao.findOne(user.getId());
		if (mergedUser == null) {
			logger.warn("没有找到要更新的实体");
			return;
		}
		
		logger.debug("更新实体");
		mergedUser.setGender(user.getGender());
		mergedUser.setEmail(user.getEmail());
		userDao.save(mergedUser);
	}

	@Override
	public User findUserById(Integer id) {
		return userDao.findOne(id);
	}

	@Override
	public boolean exists(Integer id, String password) {
		User user = findUserById(id);
		
		if (user != null) {
			String md5Pwd = DigestUtils.md5Hex(password);
			if (md5Pwd.equals(user.getPassword())) {
				return true;
			} else {
				logger.debug("密码不正确");
			}
		} else {
			logger.debug("没有找到实体");
		}
		return false;
	}

	@Override
	public void changePassword(Integer id, String password) {
		User user = userDao.findOne(id);
		if (user == null) {
			logger.debug("没有找到实体");
		} else {
			user.setPassword(DigestUtils.md5Hex(password));
			userDao.save(user);
		}
	}

	@Override
	public Page<User> findAll(Pageable pageable) {
		return userDao.findAll(pageable);
	}

	@Override
	public boolean hasRole(int userId, String roleName) {
		List<Role> tmpLists = new ArrayList();
		User user = userDao.findOne(userId);
		String pType = "U";
		if (user == null) return false;
		List<Relation> relations = relationDao.findByPIdAndPType(userId, pType);
		for(int i=0; i<relations.size(); i++){
			Role role = roleDao.findById(relations.get(i).getNid());
			tmpLists.add(role);
		}
		for (Role role : tmpLists) {
			if (role.getName().equals(roleName)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<User> findAll(){
		return userDao.findAll();
	}
	

	public User findByName(String username){
		return userDao.findByName(username);
	}

	@Override
	public void lock(Integer userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void unlock(Integer userId) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.wonders.frame.core.service.UserService#findAllCached()
	 */
	@Override
	public List<User> findAllCached() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserByNameAndPassword(String username, String password) {
		return userDao.findUserByNameAndPassword(username, password);
	}

}
