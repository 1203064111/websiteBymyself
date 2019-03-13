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

import com.project.domain.dao.AddressDao;
import com.project.domain.dao.UserDao;
import com.project.domain.entity.Address;
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
public class AddressDaoImpl extends BaseBOBean implements AddressDao {
	
	@Autowired  
	 SessionFactory  sessionFactory;  
	@Autowired
	UserDao userDao;

	
	public void update(Address address) {
		// TODO Auto-generated method stub

	}

	
	public void delete(Long id) {
		// TODO Auto-generated method stub

	}
	
	
	public Address select(Long id) {
		// TODO Auto-generated method stub
		return (Address)sessionFactory.getCurrentSession().get(Address.class, id);
	}

	
	public void save(Address address) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(address);  
	}

	
	public PaginationSupport<Address> findAddressByPage(User user,
			Address address, PaginationSupport<Address> page)
			throws GenericBusinessException {
		List<Object> params = new ArrayList<Object>();
		int pos = 0;// where查询条件中参数位置
		StringBuffer jpql = new StringBuffer(300);
		jpql.append("select f from Address f  where 1=1 ");//查询状态为1（非上传） 的景点
		if (StringTool.isNotEmpty(address.getName())) {
			jpql.append(" and f.name like ?" );
			params.add("%" + address.getName() + "%");
		}
		page = super.pagedQueryByJpql(jpql.toString(), page, params);
		return page;
	}

	

	
	public String toCommentAddress(String content, Long addressId, Long userId)
			throws GenericBusinessException {
		// TODO Auto-generated method stub
		Comment comment = new Comment();
		comment.setAddressId(addressId);
		comment.setContent(content);
		comment.setCreateDate(new Date());
		if(userId>0){
			User	user=userDao.findById(userId);
			comment.setUser(user);
		}
		
		sessionFactory.getCurrentSession().save(comment);  
		
		Session session = sessionFactory.getCurrentSession();  
		Address f =select(addressId);
		int i=f.getCommentTimes()+1;
        session.beginTransaction();  
        String hql = ("update Address u set u.commentTimes = ? where u.id = ?");    
        Query query = session.createQuery(hql);  
        query.setParameter(0, i);  
        query.setParameter(1, addressId);  
        query.executeUpdate();  
        session.flush();
        session.clear();
        session.getTransaction().commit();   
		
		return "success";
	}

	
	public PaginationSupport<Comment> findCommentsByAddressId(User user,
			Long addressId, String content, PaginationSupport<Comment> page)
			throws GenericBusinessException {
		List<Object> params = new ArrayList<Object>();
		int pos = 0;// where查询条件中参数位置
		StringBuffer jpql = new StringBuffer(300);
		jpql.append("select f from Comment f left join fetch f.user   where 1=1 ");//查询美食 的评论
		if (StringTool.isNotEmpty(addressId)) {
			jpql.append(" and f.addressId = ?" );
			params.add(addressId);
		}
		if (StringTool.isNotEmpty(content)) {
			jpql.append(" and f.content like ?" );
			params.add("%"+content+"%");
		}
		page = super.pagedQueryByJpql(jpql.toString(), page, params);
		return page;
	}

	 
	public List<Address> queryHotAddress(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_address t  where t.status='1' and t.type='1'  ");//非上传景点  1 热门 2 自然 3 古迹
		
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

	 
	public List<Address> querySpecialAddress(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_address t  where t.status='1' and t.type='2'  ");//非上传景点  1 热门 2 自然 3 古迹
		
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

	 
	public List<Address> queryGujiAddress(User user)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_address t  where t.status='1' and t.type='3'  ");//非上传景点  1 热门 2 自然 3 古迹
		
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

	 
	public Collection findCollectionListByaddressId(Long userId, Long addressId)
			throws GenericBusinessException {
		Session  session=sessionFactory.getCurrentSession();  
		List<Object> param = new ArrayList<Object>();
		StringBuffer jql = new StringBuffer();
		jql.append("select * from t_collection t left join t_address f on t.ADDRESS_ID=f.id ");
		jql.append(" where  t.USER_ID ='"+userId+"'and t.ADDRESS_ID='"+addressId+"'");
		List<Collection> list = session.createSQLQuery(jql.toString()).addEntity(Collection.class).list();
		if (list == null || list.isEmpty()) { return null; }
		return list.get(0);
	}

	 
	public String delCollectionByaddressId(Long userId, Long addressId)
			throws GenericBusinessException {
		Session  session=sessionFactory.getCurrentSession();
		StringBuffer jql = new StringBuffer();
		jql.append("delete from t_collection  ");
		jql.append(" where  USER_ID ='"+userId+"'and ADDRESS_ID='"+addressId+"'");
		Query query=session.createSQLQuery(jql.toString());
		query.executeUpdate();  
		
		return "delete_success";
	}

	 
	public void save(Collection c) {
		sessionFactory.getCurrentSession().save(c);  
	}

	 
	public List<Address> queryUploadedAddressByUserId(Long userId)
			throws GenericBusinessException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select * from t_address t  where t.CREATE_ID="+userId+"  ");
		
		sql.append(" ORDER BY t.id ASC ");

		 Session  session=sessionFactory.getCurrentSession();  
		 Query query =session.createSQLQuery(sql.toString()).addEntity(Address.class).setFirstResult(0).setMaxResults(3);
		 
		 List<Address> list1 = query.list();
		 if(list1!=null&&list1.size()>0){
			 return list1;
		 }else{
			 return null;
		 }
	}

}
