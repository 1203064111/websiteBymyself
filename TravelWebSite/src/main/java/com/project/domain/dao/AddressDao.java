package com.project.domain.dao;

import java.util.List;

import com.project.domain.entity.Address;
import com.project.domain.entity.Collection;
import com.project.domain.entity.Comment;
import com.project.domain.entity.Food;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.PaginationSupport;

public interface AddressDao {
	/**
	 * 修改景点信息
	 * @param address
	 */
	public void update(Address address);
	/**
	 * 删除
	 * @param id
	 */
	public void delete(Long id);
	/**
	 * 查询景点
	 * @param address
	 */
	public Address select(Long id);
	/**
	 * 保存景点信息
	 * @param address
	 */
	public void save(Address address);
	/**
	 * 查询景点信息
	 * @param user
	 * @param address
	 * @param page
	 * @return
	 * @throws GenericBusinessException
	 */
	public PaginationSupport<Address> findAddressByPage(User user,Address address,PaginationSupport<Address> page) throws GenericBusinessException;
	
	/**
	 * 评论景点
	 * @param content
	 * @param addressId
	 * @param userId
	 * @return
	 * @throws GenericBusinessException
	 */
	public String toCommentAddress(String content,Long addressId,Long userId)throws GenericBusinessException;
	
	/**
	 * 根据景点Id查找评论信息
	 * @param user
	 * @param addressId
	 * @param content
	 * @param page
	 * @return
	 * @throws GenericBusinessException
	 */
	public PaginationSupport<Comment> findCommentsByAddressId(User user,Long addressId,String content,PaginationSupport<Comment> page) throws GenericBusinessException;

	/**
	 * 查询热门景点
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Address> queryHotAddress(User user) throws GenericBusinessException;
	/**
	 * 查询自然特色景点
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Address> querySpecialAddress(User user) throws GenericBusinessException;
	/**
	 * 查询历史古迹景点
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Address> queryGujiAddress(User user) throws GenericBusinessException;
	
	/**
	 * 查询收藏的景点信息
	 * @param userId
	 * @param addressId
	 * @return
	 * @throws GenericBusinessException
	 */
	public Collection findCollectionListByaddressId(Long userId,Long addressId)throws GenericBusinessException;
	
	/**
	 * 删除收藏的景点
	 * @param userId
	 * @param addressId
	 * @return
	 * @throws GenericBusinessException
	 */
	public String delCollectionByaddressId(Long userId,Long addressId)throws GenericBusinessException;
	
	/**
	 * 保存收藏的景点
	 * @param c
	 */
	public void save(Collection c);
	
	/**
	 * 查询用户上传的景点
	 * @param userId
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Address> queryUploadedAddressByUserId(Long  userId) throws GenericBusinessException;
}
