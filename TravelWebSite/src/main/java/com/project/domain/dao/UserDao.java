package com.project.domain.dao;

import com.project.domain.entity.User;

public interface UserDao {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User tologin(User user);
	/**
	 * 用户修改资料
	 * @param user
	 * @return
	 */
	public void updateUser(User user);

	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	public User toregister(User user);
	/**
	 * 查找用户
	 * @param id
	 * @return
	 */
	public User findById(Long id);
	/**
	 * 修改资料
	 * @param user
	 */
	public void update(User user);
	/**
	 * 保存用户
	 * @param user
	 */
	public void save(User user);
	
	
}
