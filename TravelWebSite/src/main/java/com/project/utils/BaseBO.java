package com.project.utils;

import java.util.List;

import com.project.exception.GenericBusinessException;

public interface BaseBO {
	/**
	 * 使用jpql分页查询.
	 * @param jpql 完整的jpql
	 * @param pageVO
	 * @param values
	 * @return
	 * @throws GenericBusinessException
	 */
	public PaginationSupport pagedQueryByJpql(final String jpql, PaginationSupport pageVO, final List<Object> values)throws GenericBusinessException ;

	
}
