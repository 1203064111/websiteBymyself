package com.project.domain.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.dao.ShareDataDao;
import com.project.domain.entity.ShareData;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.BaseBOBean;
import com.project.utils.PaginationSupport;
import com.project.utils.StringTool;

@Repository   
@Transactional 
public class ShareDataDaoImpl extends BaseBOBean implements ShareDataDao {

	 @Autowired  
	 SessionFactory  sessionFactory;  
	  
	     
	 public Serializable save(ShareData shareData) {  
	    Session  session=sessionFactory.getCurrentSession();  
	    return   session.save(shareData);  
	 }


	
	public void deleteOneChoiceQuestions(long[] idArray) {
		User oneChoiceQuestions = new User();  
        for(int i=0;i<idArray.length;i++){  
            oneChoiceQuestions = (User)sessionFactory.getCurrentSession().get(User.class, idArray[i]);  
            sessionFactory.getCurrentSession().delete(oneChoiceQuestions);  
        } 
		
	}


	
	public void deleteOneChoiceQuestions(long id) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(  
                (User)sessionFactory.getCurrentSession().get(User.class, id)  
                );  
	}


	
	public User findById(long id) {
		// TODO Auto-generated method stub
		return (User)sessionFactory.getCurrentSession().get(User.class, id);  
	}


	
	public void saveOneChoiceQuerstion(User oneChoiceQuestions) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(oneChoiceQuestions);  
	}


	
	public void updateOneChoiceQuestions(User oneChoiceQuestions) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(oneChoiceQuestions);  
	}  
	
	public PaginationSupport<User> findUsersList(
			User user, PaginationSupport<User> page) throws GenericBusinessException {
		// where查询条件
		List<Object> param = new ArrayList<Object>();
		int pos = 1;// where查询条件中参数位置，必须从1开始，weblogic兼容
		StringBuffer jql = new StringBuffer();

		/*
		 * jql.append(
		 * "SELECT t  from User t   where 1=1 and t.isDealer = 'Y' AND (t.isDelete = 'N' OR t.isDelete IS NULL)"
		 * );
		 */
		jql.append("SELECT t  from User t   where 1=1 and t.isDealer = 'Y' AND (t.isDelete = 'N' OR t.isDelete IS NULL) ");
	
		// 查询条件:公司编码 公司名称 公司简称 公司状态 公司类型 公司区域
		if (StringTool.isNotEmpty(user.getName())) {
			jql.append(" and t.compCode like ?" + (pos++));
			param.add("%" + user.getName().trim() + "%");
		}
		
		/*
		 * if (StringTool.isNotEmpty(vo.getStatus())) {
		 * jql.append(" and t.status = ?" + (pos++));
		 * param.add(vo.getStatus().trim()); }
		 */
		

		
		
		jql.append(" order by id desc");
		
		//如果系统参数isChangeDealerSalesOrga配置的值为Y,表示需要将修改渠道编号为CN的经销商对应的销售区域为大陆地区
		/*if ("Y".equals(cacheSystemParamBO.findByParamKey("isChangeDealerSalesOrga"))) {
			changeDealerSaleOrga(loginUser);
		}*/
		
		return pagedQueryByJpql(jql.toString(), page, param);
	}

}
