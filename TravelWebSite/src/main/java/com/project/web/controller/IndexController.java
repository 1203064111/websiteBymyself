package com.project.web.controller;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.dao.FoodsDao;
import com.project.domain.dao.ShareDataDao;
import com.project.domain.dao.TodoListBO;
import com.project.domain.entity.Address;
import com.project.domain.entity.Food;
import com.project.domain.entity.ShareData;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.PaginationHelper;
import com.project.utils.PaginationSupport;

@Controller
@RequestMapping("/front")
public class IndexController {
	@Autowired  
    ShareDataDao shareDataDao;  
	@Autowired  
    FoodsDao foodsDao; 
	@Autowired
	TodoListBO todoListBO;
      
    @RequestMapping("/testInDb")  
    public String testInDb(Model model){  
        ShareData  shareData=new ShareData();  
        shareData.setShareCode("00023");  
        shareData.setShareName("万科");  
        shareData.setShareType("SZ");  
        Serializable result=shareDataDao.save(shareData);  
        model.addAttribute("result", result);  
        return "test/test";  
          
    }
     // 进入首页
 	@RequestMapping("/indexUI.do")
 	public String indexTH(ModelMap map, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,
 			String pageSize, String siteLang) throws GenericBusinessException {
 		 List<Food> list=todoListBO.queryNewFoods(user);
 		List<Address> aList=todoListBO.queryNewAddress(user);
 		
 		List<Food> ifList = todoListBO.queryInfrontFoods(user);
		List<Address> aiList=todoListBO.queryInfrontAddress(user);
 		map.addAttribute("foodList", list);
 		map.addAttribute("addressList", aList);
 		
 		map.addAttribute("infrontFoodList", ifList);//交流栏美食
 		map.addAttribute("infrontAddressList", aiList);//旅行栏景点
 		map.addAttribute("user", user);
 		return "front/index/index";
 	}
 	//首页搜索美食
 	@RequestMapping("/index/searchFoods.do")
 	public String searchFoods(ModelMap map, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,Food food,
 			String pageSize, String siteLang) throws GenericBusinessException {
 		PaginationSupport<Food> page = PaginationHelper.getPaginationSupport(nowPage, doAction, totalPages, pageSize);
 		page = foodsDao.findFoodsByPage(user, food, page);
 		map.addAttribute("page", page);
 		return "front/index/searchFoods";
 	}

}
