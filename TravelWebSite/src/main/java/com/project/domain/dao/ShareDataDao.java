package com.project.domain.dao;

import java.io.Serializable;

import com.project.domain.entity.ShareData;
import com.project.domain.entity.User;

public interface ShareDataDao {
	Serializable save(ShareData shareData);  

	/** 
     * 批量是删除单项选择题 
     * @param long[] idArray 题目id数组 
     */  
    public void deleteOneChoiceQuestions(long[] idArray);
    /** 
     * 删除指定的单项选择题 
     * @param long id 单项选择题ID 
     */  
    public void deleteOneChoiceQuestions(long id);
    /** 
     * 按题目id查找题目 
     * @param id 
     * @return OneChoiceQuestions oneChoiceQuestions题目对象 
     */  
    public User findById(long id);
    /** 
     * 增加单项选择题 
     * @param OneChoiceQuestions oneChoiceQuestions 单项选择题对象 
     */  
    public void saveOneChoiceQuerstion(User oneChoiceQuestions);
    /** 
     * 修改指定的单项选择题 
     * @param OneChoiceQuestions oneChoiceQuestions 单项选择题对象 
     */  
    public void updateOneChoiceQuestions(User oneChoiceQuestions);
    
}
