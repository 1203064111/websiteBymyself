package com.project.domain.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.dao.UserDao;
import com.project.domain.entity.User;
import com.project.utils.StringTool;

@Repository   
@Transactional 
public class UserDaoImpl implements UserDao {
	
	 @Autowired  
	 SessionFactory  sessionFactory;  

	@SuppressWarnings("unchecked")
	
	public User tologin(User user) {
		List<User> usersList = sessionFactory.getCurrentSession().createQuery("select a from User a where 1=1 and a.loginName=:i and a.password=:p")  
                .setParameter("i", user.getLoginName()).setParameter("p", user.getPassword()).list(); 
		User user2=null;
		if(usersList.size()>=1){  
			user2=usersList.get(0);
            return user2;  
        }else{  
            return user2;  
        }  
	}

	
	public void updateUser(User user) {
		
		Session session = sessionFactory.getCurrentSession();  
        session.beginTransaction();  
        String hql = ("update User u set u.name = ?,u.age = ?,u.phone = ?,u.email = ?,u.birthday = ?,u.area = ?,u.info = ?,u.photo=? where u.id = ?");    
        Query query = session.createQuery(hql);  
        query.setParameter(0, user.getName());  
        query.setParameter(1, user.getAge());  
        query.setParameter(2, user.getPhone());  
        query.setParameter(3, user.getEmail());  
        query.setParameter(4, user.getBirthday());  
        query.setParameter(5, user.getArea());  
        query.setParameter(6, user.getInfo());  
        query.setParameter(7, user.getPhoto());  
        query.setParameter(8, user.getId());  
        query.executeUpdate();  
        session.flush();
        session.clear();
        session.getTransaction().commit();   
		/*//根据id查找用户
		User u = findById(user.getId());
		//设置用户资料
		if(StringTool.isNotEmpty(user.getName())){
			u.setName(user.getName());
		}
		if(StringTool.isNotEmpty(user.getAge())){
			u.setAge(user.getAge());
		}
		if(StringTool.isNotEmpty(user.getArea())){
			u.setArea(user.getArea());
		}
		if(StringTool.isNotEmpty(user.getBirthday())){
			u.setBirthday(user.getBirthday());
		}
		if(StringTool.isNotEmpty(user.getPhone())){
			u.setPhone(user.getPhone());
		}
		if(StringTool.isNotEmpty(user.getSex())){
			u.setSex(user.getSex());
		}
		if(StringTool.isNotEmpty(user.getInfo())){
			u.setInfo(user.getInfo());
		}
		//保存修改
		update(u);*/
		
	}

	
	public User toregister(User user) {
		// TODO Auto-generated method stub
		User u = new User();
		u.setName(user.getName());
		u.setLoginName(user.getLoginName());
		u.setPassword(user.getPassword());
		u.setPhone(user.getPhone());
		u.setSex(user.getSex());
		save(u);
		User s =null;
		s=tologin(u);
		if(s!=null){
			return s;
		}else{
			return null;
		}
		
	}


	public User findById(Long id) {
		// TODO Auto-generated method stub
		return (User)sessionFactory.getCurrentSession().get(User.class, id);
	}
	
	public void update(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(user);  
		
	}  
	
	public void save(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(user);  
	}


}
