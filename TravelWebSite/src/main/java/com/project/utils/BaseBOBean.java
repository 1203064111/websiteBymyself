package com.project.utils;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;









import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.exception.GenericBusinessException;

public class BaseBOBean implements BaseBO {
	@Autowired  
	 SessionFactory  sessionFactory;  
	
	public static int FlushMaxNum = 1000;
	public static int CommitMaxNum = 5000;
	//hibernate支持 select count(*) , EclipseLink只支持 select count(1)和 select count(u)
	//试试  sum(1) ?
	public static String SELECT_COUNT = " select count(*) ";

	
	public PaginationSupport pagedQueryByJpql(String jpql,
			PaginationSupport pageVO, List<Object> values)
			throws GenericBusinessException {
		List list =null;
		// Count查询
		String countQueryString = SELECT_COUNT + removeSelect(removeFetch(removeOrders(jpql)));
		//log.debug("replace jpa sql="+countQueryString);
		Query query = createJpqlQuery(countQueryString, values);
		Long totalCount =(Long) query.uniqueResult();
		pageVO.setTotalCount(totalCount.intValue());
		/**
		 * 分页查询结果
		 */
		query = createJpqlQuery(jpql, values);
		query.setFirstResult(pageVO.computeStartIndex());//从第几条开始
		query.setMaxResults(pageVO.getPageSize());//我要取多少条
		list= query.list();

		
		pageVO=new PaginationSupport(list, pageVO.getTotalCount(), pageVO.getPageSize(),pageVO.getStartIndex());
		return pageVO;
	}
	protected Query createJpqlQuery(String jpql, List<Object> values)  throws GenericBusinessException{
		Session session=sessionFactory.getCurrentSession();
		Query query = (Query) session.createQuery(jpql);
		if(values!=null && values.size()>0){
			for (int i = 0; i < values.size(); i++) {
				query.setParameter(i, values.get(i));
				/*query.setString(i, (String) values.get(i));*/
			}
		}		
		return query;
	}
	/**
	 * 去除hql的orderby 子句，用于pagedQuery.
	 * 
	 * @see #pagedQuery(String,int,int,Object[])
	 */
	private static String removeOrders(String jpql)  throws GenericBusinessException{
		
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(jpql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}

	private static String removeFetch(String jpql)  {
			
			Pattern p = Pattern.compile("fetch", Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(jpql);
			StringBuffer sb = new StringBuffer();
			while (m.find()) {
				m.appendReplacement(sb, "");
			}
			m.appendTail(sb);
			return sb.toString();
		}
	/**
	 * 去除hql的select 子句，未考虑union的情况,用于pagedQuery.
	 * 
	 * @see #pagedQuery(String,int,int,Object[])
	 */
	private static String removeSelect(String jpql) throws GenericBusinessException{
		
		int beginPos = jpql.toLowerCase().indexOf("from");
//		Assert.isTrue(beginPos != -1, " hql : " + hql + " must has a keyword 'from'");
		if(beginPos==-1) throw new GenericBusinessException("no from hql="+jpql);
		return jpql.substring(beginPos);
	}

}
