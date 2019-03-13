package com.project.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.domain.dao.AddressDao;
import com.project.domain.dao.FoodsDao;
import com.project.domain.dao.UserDao;
import com.project.domain.entity.Address;
import com.project.domain.entity.Food;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;

@Controller
@RequestMapping("/mine")
public class MineController {
	@Autowired
	UserDao userDao;
	@Autowired
	FoodsDao foodsDao;
	@Autowired 
	AddressDao addressDao;

	@RequestMapping("/toUpdateUserUI.do")
	public String updateUser(Long id, Model model) {

		User u = userDao.findById(id);
		model.addAttribute("user", u);
		return "front/user/editMineUI";
	}

	@RequestMapping("/toUpdateUser.do")
	public String updateUser(User user, HttpServletRequest res, Model model) throws GenericBusinessException {
		String photo="";
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) res;
		List<MultipartFile> picList = multipartRequest.getFiles("file");
		if (picList.size() > 0 && picList != null) {

			/* uploadPicture.upload(multipartFile, uid, imgType, last); */
			for (MultipartFile multipartFile : picList) {
				InputStream is = null;
				OutputStream os = null;

				String fileName = multipartFile.getOriginalFilename();
				// String path =
				String path = "F:/springmvc/School/src/main/webapp/images";
				/*String path = "F:/springmvc/tomcat7.0.12/webapps/resource";*/
				/*
				 * String fileName = multipartFile.getOriginalFilename(); String
				 * mark = fileName.substring(fileName.lastIndexOf("."));
				 */

				try {
					is = multipartFile.getInputStream();
					File file = new File(path + "/userUpload");
					if (!file.isDirectory()) {
						file.mkdirs();
					}
					os = new FileOutputStream(path + "/userUpload/" + fileName);
					int len = 0;
					while ((len = is.read()) != -1) {
						os.write(len);
					}

					photo = "/images/userUpload/" + fileName;
					
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						if (is != null)
							is.close();
						if (os != null)
							os.close();
					} catch (IOException e) {
					}
				}

			}
		}
		user.setPhoto(photo);
		userDao.updateUser(user);
		res.getSession().setAttribute("loginSession",user);
		User u = userDao.findById(user.getId());
		List<Food> aList=foodsDao.queryCommentedFoodsByUserId(u.getId());//已评论
		List<Food> bList=foodsDao.queryLovedFoodsByUserId(u.getId());//已收藏
		List<Food> cList=foodsDao.queryUploadedFoodsByUserId(u.getId());//已上传
		List<Address> aTList=addressDao.queryUploadedAddressByUserId(u.getId());//已上传的景点
		model.addAttribute("aList",aList);
		model.addAttribute("bList",bList);
		model.addAttribute("cList",cList);
		model.addAttribute("aTlist",aTList);
		model.addAttribute("user", u);
		model.addAttribute("msg", "修改成功!");
		return "front/user/mine";
	}

	// 进入个人页面
	@RequestMapping("/mineUI.do")
	public String indexTH(ModelMap map, HttpServletRequest res, User user,
			String nowPage, String doAction, String totalPages,
			String pageSize, String siteLang, Long id)
			throws GenericBusinessException {
		User u = (User) res.getSession().getAttribute("loginSession");
		List<Food> aList=foodsDao.queryCommentedFoodsByUserId(u.getId());//已评论
		List<Food> bList=foodsDao.queryLovedFoodsByUserId(u.getId());//已收藏
		List<Food> cList=foodsDao.queryUploadedFoodsByUserId(u.getId());//已上传
		List<Address> aTList=addressDao.queryUploadedAddressByUserId(u.getId());//已上传的景点
		map.addAttribute("aList",aList);
		map.addAttribute("bList",bList);
		map.addAttribute("cList",cList);
		map.addAttribute("aTlist",aTList);
		map.addAttribute("user", u);
		return "front/user/mine";
	}

}
