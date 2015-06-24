package com.wonders.frame.console.service;

import java.util.List;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.console.model.bo.User;

@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public interface UserService {

	@Transactional
	public void changeInfomations(User user);

	@Transactional
	public void changePassword(Integer id, String password);

	public User findUserById(Integer id);

	public boolean exists(Integer id, String password);

	public Page<User> findAll(Pageable pageable);

	public boolean hasRole(int userId, String roleName);

	@Transactional
	public void lock(Integer userId);

	@Transactional
	public void unlock(Integer userId);

	public List<User> findAll();

	public List<User> findAllCached();

	public User findByName(String username);
	
	public User findUserByNameAndPassword(String username,String password);

}
