package com.project.domain.dao;

import java.util.List;

import com.project.domain.entity.Collection;
import com.project.domain.entity.Comment;
import com.project.domain.entity.Food;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.PaginationSupport;

public interface FoodsDao {
	/**
	 * 修改美食信息
	 * @param f
	 */
	public void update(Food f);
	/**
	 * 删除
	 * @param id
	 */
	public void delete(Long id);
	/**
	 * 查询美食
	 * @param id
	 */
	public Food select(Long id );
	/**
	 * 保存美食信息
	 * @param f
	 */
	public void save(Food f);
	
	/**
	 * 保存收藏
	 * @param c
	 */
	public void save(Collection c);
	
	/**
	 * 查询美食
	 * @param user
	 * @param food
	 * @param page
	 * @return
	 * @throws GenericBusinessException
	 */
	public PaginationSupport<Food> findFoodsByPage(User user,Food food,PaginationSupport<Food> page) throws GenericBusinessException;

	/**
	 * 添加美食评论
	 * @param content
	 * @param foodsId
	 * @param userId
	 * @return
	 * @throws GenericBusinessException
	 */
	public String toCommentFood(String content,Long foodsId,Long userId)throws GenericBusinessException;
	
	/**
	 * 根据美食Id查找美食评论
	 * @param user
	 * @param foodsId
	 * @param page
	 * @return
	 * @throws GenericBusinessException
	 */
	public PaginationSupport<Comment> findCommentsByFoodsId(User user,Long foodsId,String content,PaginationSupport<Comment> page) throws GenericBusinessException;

	/**
	 * 查询热门美食
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> queryHotFoods(User user) throws GenericBusinessException;
	
	/**
	 * 查询小吃美食
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> queryXiaoChiFoods(User user) throws GenericBusinessException;
	
	/**
	 * 查询特色美食
	 * @param user
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> querySpecialFoods(User user) throws GenericBusinessException;
	
	/**
	 * 查询收藏表是否存在收藏记录
	 * @param userId
	 * @param foodsId
	 * @return
	 * @throws GenericBusinessException
	 */
	public Collection findCollectionListByfoodId(Long userId,Long foodsId)throws GenericBusinessException;
	
	/**
	 * 删除收藏信息
	 * @param userId
	 * @param foodsId
	 * @return
	 * @throws GenericBusinessException
	 */
	public String delCollectionByfoodId(Long userId,Long foodsId)throws GenericBusinessException;
	
	
	/**
	 * 通过用户id查找已评论的美食
	 * @param userId
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> queryCommentedFoodsByUserId(Long  userId) throws GenericBusinessException;
	
	/**
	 * 查询用户收藏过的美食
	 * @param userId
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> queryLovedFoodsByUserId(Long  userId) throws GenericBusinessException;
	
	/**
	 * 查询用户已上传的美食
	 * @param userId
	 * @return
	 * @throws GenericBusinessException
	 */
	public List<Food> queryUploadedFoodsByUserId(Long  userId) throws GenericBusinessException;
}
