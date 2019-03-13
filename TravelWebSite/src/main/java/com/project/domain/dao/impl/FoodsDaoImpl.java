package com.project.domain.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.dao.FoodsDao;
import com.project.domain.dao.UserDao;
import com.project.domain.entity.Collection;
import com.project.domain.entity.Comment;
import com.project.domain.entity.Food;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.BaseBOBean;
import com.project.utils.PaginationSupport;
import com.project.utils.StringTool;

@Repository   
@Transactional 
public class FoodsDaoImpl extends BaseBOBean implements FoodsDao {
	
	@Autowired  
	 SessionFactory  sessionFactory;  
	@Autowired  
	 UserDao  userDao;

	 
	public void update(Food f) {
		// TODO Auto-generated method stub

	}

	 
	public void delete(Long id) {
		// TODO Auto-generated method stub

	}

	
	 
	public Food select(Long id) {
		return (Food)sessionFactory.getCurrentSession().get(Food.class, id);
	}

	 
	public void save(Food f) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(f);  
	}
	
	 
	public void save(Collection c) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(c);  
	}

	 
	public PaginationSupport<Food> findFoodsByPage(User user, Food food,
			PaginationSupport<Food> page) throws GenericBusinessException {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		int pos = 0;// where查询条件中参数位置
		StringBuffer jpql = new StringBuffer(300);
		jpql.append("select f from Food f  where 1=1 ");//查询状态为1（非上传） 的美食
		if (StringTool.isNotEmpty(food.getName())) {
			jpql.append(" and f.name like ?" );
			params.add("%" + food.getName() + "%");
		}
		page = super.pagedQueryByJpql(jpql.toString(), page, params);
		return page;
	}

	 
	public String toCommentFood(String content, Long foodsId,Long userId)
			throws GenericBusinessException {
		Comment comment = new Comment();
		comment.setFoodsId(foodsId);
		comment.setContent(content);
		comment.setCreateDate(new Date());
		if(userId>0){
			User	user=userDao.findById(userId);
			comment.setUser(user);
		}
		
		sessionFactory.getCurrentSession().save(comment);  
		
		Session session = sessionFactory.getCurrentSession();  
		Food f =select(foodsId);
		int i=f.getCommentTimes()+1;
        session.beginTransaction();  
        String hql = ("update Food u set u.commentTimes = ? where u.id = ?");    
        Query query = session.createQuery(hql);  
        query.setParameter(0, i);  
        query.setParameter(1, foodsId);  
        query.executeUpdate();  
        session.flush();
        session.clear();
        session.getTransaction().commit();   
		
		
		return "success";
	}

	 
	public PaginationSupport<Comment> findCommentsByFoodsId(User user,
			Long foodsId,String content, PaginationSupport<Comment> page)
			throws GenericBusinessException {
		List<Object> params = new ArrayList<Object>();
		int pos = 0;// where查询条件中参数位置
		StringBuffer jpql = new StringBuffer(300);
		jpql.append("select f from Comment f left join fetch f.user   where 1=1 ");//查询美食 的评论
		if (StringTool.isNotEmpty(foodsId)) {
			jpql.append(" and f.foodsId = ?" );
			params.add(foodsId);
		}
		if (StringTool.isNotEmpty(content)) {
			jpql.append(" and f.content like ?" );
			params.add("%"+content+"%");
		}
		page = super.pagedQueryByJpql(jpql.toString(), page, params);
		return page;
	}

	 
	public List<Food> queryHotFoods(User user) throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_foods t  where t.status='1' and t.type='1'  ");//非上传美食 并且类型为 1热门   注:2小吃 3 特色 
		
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

	 
	public List<Food> queryXiaoChiFoods(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_foods t  where t.status='1' and t.type='2'  ");//非上传美食 并且类型为 1热门   注:2小吃 3 特色 
		
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

	 
	public List<Food> querySpecialFoods(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_foods t  where t.status='1' and t.type='3'  ");//非上传美食 并且类型为 1热门   注:2小吃 3 特色 
		
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

	 
	public Collection findCollectionListByfoodId(Long userId, Long foodsId)
			throws GenericBusinessException {
		Session  session=sessionFactory.getCurrentSession();  
		List<Object> param = new ArrayList<Object>();
		StringBuffer jql = new StringBuffer();
		jql.append("select * from t_collection t left join t_foods f on t.FOODS_ID=f.id ");
		jql.append(" where  t.USER_ID ='"+userId+"'and t.FOODS_ID='"+foodsId+"'");
		List<Collection> list = session.createSQLQuery(jql.toString()).addEntity(Collection.class).list();
		if (list == null || list.isEmpty()) { return null; }
		return list.get(0);
	}

	 
	public String delCollectionByfoodId(Long userId, Long foodsId)
			throws GenericBusinessException {
		Session  session=sessionFactory.getCurrentSession();
		StringBuffer jql = new StringBuffer();
		jql.append("delete from t_collection  ");
		jql.append(" where  USER_ID ='"+userId+"'and FOODS_ID='"+foodsId+"'");
		Query query=session.createSQLQuery(jql.toString());
		query.executeUpdate();  
		
		return "delete_success";
	}

	 
	public List<Food> queryCommentedFoodsByUserId(Long userId)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_foods t  where t.id in ( select FOODS_ID from t_comment c  where  c.CREATE_ID="+userId+")");
		
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

	 
	public List<Food> queryLovedFoodsByUserId(Long userId)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_foods t  where t.id in ( select FOODS_ID from t_collection c  where  c.CREATE_ID="+userId+")");
		
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

	 
	public List<Food> queryUploadedFoodsByUserId(Long userId)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_foods t  where t.CREATE_ID="+userId+"  ");
		
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
	

}
