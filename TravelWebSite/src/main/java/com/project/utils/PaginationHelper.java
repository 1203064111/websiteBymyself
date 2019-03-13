package com.project.utils;



/**
 * PaginationHelper 负责构造一个传递给BO的PaginationSupport对象。<br>
 * 
 * @author zhaoty at 2010-9-1 下午05:20:14
 * @version 1.0
 * @see PaginationSupport
 */
public class PaginationHelper {

	/**
	 * 使用自定义分页参数获取分页类
	 * 
	 * @param <E>
	 *            返回数据中列表项中的实体对象类型
	 * @param nowPageStr
	 *            当前第几页
	 * @param doAction
	 *            当前操作(first:首页;pre:前一页;next:后一页;last:末页)
	 * @param totalPagesStr
	 *            所有页数
	 * @param pageSizeStr
	 *            每页记录数
	 * @return PaginationSupport
	 * @see PaginationSupport.java
	 */
	public static <E extends Object> PaginationSupport<E> getPaginationSupport(String nowPageStr, String doAction, String totalPagesStr,
			String pageSizeStr) {
		int nowPage = 1;
		if (nowPageStr != null && !"".equals(nowPageStr)) {
			try{
			   nowPage = Integer.parseInt(nowPageStr);
			}catch(NumberFormatException nfe){
				nowPage=1;
			}
		}
		int totalPages = 1;
		if (totalPagesStr != null && !"".equals(totalPagesStr)) {
			try{
			   totalPages = Integer.parseInt(totalPagesStr);
			}catch(NumberFormatException nfe){
				totalPages=1;
			}
		}
		int pageSize = PaginationSupport.PAGESIZE;
		if (pageSizeStr != null && !"".equals(pageSizeStr)) {
			try{
			    pageSize = Integer.parseInt(pageSizeStr);
			}catch(NumberFormatException nfe){
				pageSize = PaginationSupport.PAGESIZE;
			}
		}
		if (doAction == null || "".equals(doAction)) {
			doAction = "first";
		}
		if ("first".equals(doAction)) {
			nowPage = 1;
		}
		else if ("pre".equals(doAction)) {
			if (nowPage > 1) {
				nowPage = nowPage - 1;
			}
		}
		else if ("next".equals(doAction)) {
			if (nowPage < totalPages) {
				nowPage = nowPage + 1;
			}
			else if (nowPage > totalPages) {
				nowPage = totalPages;
			}
		}
		else if ("last".equals(doAction)) {
			nowPage = totalPages;
		}
		return new PaginationSupport<E>(null, 0, pageSize, (nowPage - 1) * pageSize);
	}

}

