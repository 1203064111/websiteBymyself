package com.project.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.dao.TodoListBO;
import com.project.domain.dao.UserDao;
import com.project.domain.entity.Address;
import com.project.domain.entity.Food;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;

@Controller
@RequestMapping("/front/user")
public class LoginController {
	@Autowired  
	UserDao userDao;
	@Autowired
	TodoListBO todoListBO;
	/**
	 * 用户登录
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping("/toLogin.do")  
	public String toLogin(ModelMap model,User user,HttpServletRequest request,HttpServletResponse response)throws GenericBusinessException{  
		User u =userDao.tologin(user);
		model.addAttribute("user", u);
		request.getSession().setAttribute("loginSession",u);
		if(u==null){
			model.addAttribute("message", "false");
			return "front/user/login";
		}else{
			List<Food> list=todoListBO.queryNewFoods(user);
			List<Address> aList=todoListBO.queryNewAddress(user);
			
			List<Food> ifList = todoListBO.queryInfrontFoods(user);
			List<Address> aiList=todoListBO.queryInfrontAddress(user);
			model.addAttribute("addressList", aList);
			model.addAttribute("foodList", list);
			model.addAttribute("infrontFoodList", ifList);//交流栏美食
			model.addAttribute("infrontAddressList", aiList);//旅行栏景点
			model.addAttribute("message", "true");
			return "front/index/index";
		}
	}
	/**
	 * 用户注册
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping("/toRegister.do")  
	public String toRegister(ModelMap model,User user,HttpServletRequest request,HttpServletResponse response)throws GenericBusinessException{  
		User u=null;
		u=userDao.toregister(user);
		if(u!=null){
			request.getSession().setAttribute("loginSession",u);
			List<Food> list=todoListBO.queryNewFoods(user);
			List<Address> aList=todoListBO.queryNewAddress(user);
			model.addAttribute("addressList", aList);
			model.addAttribute("foodList", list);
			model.addAttribute("message", "true");
			model.addAttribute("user", u);
			return "front/index/index";
		}else{
			model.addAttribute("message", "false");
			return "front/user/register";
		}
	}
	
	@RequestMapping("/loginOut.do")  
	public String tologinOut(ModelMap model,User user,HttpServletRequest request,HttpServletResponse response)throws GenericBusinessException{  
		request.getSession().removeAttribute("loginSession");
		model.addAttribute("message", "true");

		return "front/user/login";
	}
		
	/**
	 * 跳转登录页面
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping("/loginUI.do") 
	public String toLoginUI(ModelMap model,HttpServletRequest request,HttpServletResponse response)throws GenericBusinessException{  
		return "front/user/login";
	}
	/**
	 * 跳转注册页面
	 * @param model
	 * @return
	 * @throws GenericBusinessException
	 */
	@RequestMapping("/registerUI.do") 
	public String toRegisterUI(ModelMap model,HttpServletRequest request,HttpServletResponse response)throws GenericBusinessException{  
		return "front/user/register";
	}
	

}
