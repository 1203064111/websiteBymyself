package com.project.domain.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.dao.TodoListBO;
import com.project.domain.entity.Address;
import com.project.domain.entity.Food;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.BaseBOBean;
import com.project.utils.PaginationSupport;
import com.project.utils.StringTool;
@Repository   
@Transactional 
public class TodolistBOBean extends BaseBOBean implements TodoListBO {
	
	@Autowired  
	 SessionFactory  sessionFactory;  

	
	public PaginationSupport<Food> getFoodList(User user,
			PaginationSupport<Food> page, String type, String keyword)
			throws GenericBusinessException {
		try {
			StringBuffer jql = new StringBuffer();
			jql.append("select t from Article t left join fetch t.catalog tc WHERE 1=1 ");
			jql.append(" AND tc.code = 'news'");
			if(StringTool.isNotEmpty(keyword)){
				jql.append(" AND (t.title like '%" + keyword + "%'");
				jql.append(" or t.content like '%" + keyword + "%')");
			}
			jql.append(" ORDER BY t.id ASC ");

			if ("HOME".equals(type)) {
				page = super.pagedQueryByJpql(jql.toString(), page, null);

				List<Food> items = page.getItems();
				List<Food> newitems = new ArrayList<Food>();
				for (int i = 0; i < items.size(); i++) {
					// 最多5条
					if (i == 5) {
						break;
					}
					newitems.add(items.get(i));
				}
				page.setItems(newitems);
				return page;

			}
			return super.pagedQueryByJpql(jql.toString(), page, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public PaginationSupport<Address> getAddressList(User user,
			PaginationSupport<Address> page, String type, String keyword)
			throws GenericBusinessException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 首页查询美食三条
	 */
	
	public List<Food> queryNewFoods(User user)
			throws GenericBusinessException {
		
			StringBuffer sql = new StringBuffer();
		
			sql.append("select * from t_foods t  where t.status='1'   ");//非上传美食
			
			sql.append(" ORDER BY t.id ASC ");

			 Session  session=sessionFactory.getCurrentSession();  
			 Query query =session.createSQLQuery(sql.toString()).addEntity(Food.class).setFirstResult(0).setMaxResults(3);
			 
			 List<Food> list1 = query.list();
			 if(list1!=null&&list1.size()>0){
				 return list1;
			 }else{
				 return null;
			 }
			 
			
	}

	/**
	 * 首页查询景点三条
	 */
	
	public List<Address> queryNewAddress(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_address t  where t.status='1'  ");//非上传景点 
		
		sql.append(" ORDER BY t.id ASC ");

		 Session  session=sessionFactory.getCurrentSession();  
		 Query query =session.createSQLQuery(sql.toString()).addEntity(Address.class).setFirstResult(0).setMaxResults(3);
		 
		 List<Address> list = query.list();
		 if(list!=null&&list.size()>0){
			 return list;
		 }else{
			 return null;
		 }
	}

	/**
	 * 首页查询美食栏上传美食 三条
	 */
	
	public List<Food> queryInfrontFoods(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_foods t  where t.status='2'  ");//查询用户上传的美食
		
		sql.append(" ORDER BY t.CREATE_DATE desc ");

		 Session  session=sessionFactory.getCurrentSession();  
		 Query query =session.createSQLQuery(sql.toString()).addEntity(Food.class).setFirstResult(0).setMaxResults(3);
		 
		 List<Food> list1 = query.list();
		 if(list1!=null&&list1.size()>0){
			 return list1;
		 }else{
			 return null;
		 }
	}

	/**
	 * 首页查询旅行栏上传景点 三条
	 */
	
	public List<Address> queryInfrontAddress(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_address t   where t.status='2'  ");//查询用户上传的景点
		
		sql.append(" ORDER BY t.CREATE_DATE ASC ");

		 Session  session=sessionFactory.getCurrentSession();  
		 Query query =session.createSQLQuery(sql.toString()).addEntity(Address.class).setFirstResult(0).setMaxResults(3);
		 
		 List<Address> list = query.list();
		 if(list!=null&&list.size()>0){
			 return list;
		 }else{
			 return null;
		 }
	}

}
