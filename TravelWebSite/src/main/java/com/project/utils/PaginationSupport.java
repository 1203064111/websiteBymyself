package com.project.utils;


import java.util.List;
import java.util.Map;

/**
 * 
 * 用于HTML 与 Action的参数传递，Action与BO的传递 1. HTML指定: 显示的页号(startIndex)、每页的记录数(pageSize) 2. BO 指定 总记录数(totalCount) 重新计算：currPageNo 从1开始 填写一页的业务数据列表 List<E> items
 * 
 * @param <E>
 */

@SuppressWarnings("serial")
public class PaginationSupport<E> implements java.io.Serializable {

	public final static int PAGESIZE = 3;

	private int pageSize = PAGESIZE;

	private List<E> items;

	private int totalCount;

	/**
	 * 重0开始，代表记录序号
	 */
	private int startIndex = 0;

	/**
	 * 总页数 , 每次计算
	 */

	public PaginationSupport(List<E> items, int totalCount) {
		setPageSize(PAGESIZE);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(0);
	}

	public PaginationSupport(List<E> items, int totalCount, int startIndex) {
		setPageSize(PAGESIZE);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);
	}

	public PaginationSupport(List<E> items, int totalCount, int pageSize, int startIndex) {
		setPageSize(pageSize);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);
	}

	public List<E> getItems() {
		return items;
	}

	public void setItems(List<E> items) {
		this.items = items;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		computeStartIndex();
	}

	public int getStartIndex() {
		return startIndex;
	}

	/**
	 * HTML提交，不能马上计算, 又了真正的 totalCount后，才能计算computeStartIndex()
	 * 
	 * @param startIndex
	 */
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	/**
	 * BO放入 totalCount后，要重新计算 当前页号 startIndex是从0开始的
	 */
	public int computeStartIndex() {
		if (totalCount <= 0) this.startIndex = 0;
		else if (startIndex >= totalCount) this.startIndex = (getTotalPages() - 1) * pageSize;
		else if (startIndex < 0) this.startIndex = 0;
		else {
		}
		return startIndex;
	}

	/**
	 * 取出当前页号，从1开始
	 * 
	 * @return
	 */
	public int getCurrPageNo() {
		return getStartIndex() / pageSize + 1;
	}

	/**
	 * 取出总页数，从1开始
	 * 
	 * @return
	 */
	public int getTotalPages() {
		int totalPages = getTotalCount() / pageSize;
		if (getTotalCount() % pageSize > 0) {
			totalPages++;
		}
		if (totalPages <= 0) {
			totalPages = 1;
		}
		return totalPages;
	}

	public int getNextIndex() {
		int nextIndex = getStartIndex() + pageSize;
		if (nextIndex >= totalCount) return getStartIndex();
		else return nextIndex;
	}

	public int getPreviousIndex() {
		int previousIndex = getStartIndex() - pageSize;
		if (previousIndex < 0) return 0;
		else return previousIndex;
	}

	private Map<String, Object> temParam;

	public Map<String, Object> getTemParam() {
		return temParam;
	}

	public void setTemParam(Map<String, Object> temParam) {
		this.temParam = temParam;
	}

}