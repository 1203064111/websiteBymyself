package com.project.domain.dao;

import java.util.List;

import com.project.domain.entity.Address;
import com.project.domain.entity.Food;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.PaginationSupport;

public interface TodoListBO {
	
	/**
	 * 查询美食
	 * */
	public PaginationSupport<Food> getFoodList(User user,
			PaginationSupport<Food> page, String type, String keyword)
			throws GenericBusinessException;
	/**
	 * 查询景点
	 * */
	public PaginationSupport<Address> getAddressList(User user,
			PaginationSupport<Address> page, String type, String keyword)
			throws GenericBusinessException;
	/**
	 * 首页推荐美食（三个）
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> queryNewFoods(User user) throws GenericBusinessException;
	/**
	 * 首页推荐景点（三个）
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Address> queryNewAddress(User user) throws GenericBusinessException;
	/**
	 * 首页社区交流美食栏（三个）
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> queryInfrontFoods(User user) throws GenericBusinessException;
	/**
	 * 社区交流旅行栏（三个）
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Address> queryInfrontAddress(User user) throws GenericBusinessException;
}
