package com.project.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
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

import com.alibaba.fastjson.JSON;
import com.project.domain.dao.AddressDao;
import com.project.domain.dao.FoodsDao;
import com.project.domain.dao.ShareDataDao;
import com.project.domain.entity.Address;
import com.project.domain.entity.Collection;
import com.project.domain.entity.Comment;
import com.project.domain.entity.Food;
import com.project.domain.entity.ShareData;
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.PaginationHelper;
import com.project.utils.PaginationSupport;

@Controller
@RequestMapping("/foods")
public class FoodsController {

	
	@Autowired  
    FoodsDao foodsDao;  
	
	@Autowired
	AddressDao addressDao;
      
   
     // 进入美食页面
	/**
	 * 进入美食列表页面
	 * @param map
	 * @param res
	 * @param user
	 * @param nowPage
	 * @param doAction
	 * @param totalPages
	 * @param pageSize
	 * @param siteLang
	 * @return
	 * @throws GenericBusinessException
	 */
 	@RequestMapping("/foodsUI.do")
 	public String indexTH(ModelMap map, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,
 			String pageSize, String siteLang) throws GenericBusinessException {
 		List<Food> hList = foodsDao.queryHotFoods(user);
 		map.addAttribute("hFood",hList);
 		
 		 List<Food> xcList = foodsDao.queryXiaoChiFoods(user);
 		map.addAttribute("xcFood",xcList);
 		
 		 List<Food> spList=foodsDao.querySpecialFoods(user);
 		 map.addAttribute("spFood",spList);
 		
 		map.addAttribute("user", user);
 		return "front/food/food";
 	}
 	/**
 	 * 上传美食图片以及保存美食信息
 	 * @param map
 	 * @param res
 	 * @param user
 	 * @param food
 	 * @return
 	 * @throws GenericBusinessException
 	 */
 	@RequestMapping("/foodsUpload.do")
 	public String foodsUpload(ModelMap map, HttpServletRequest res, User user,
 			Food food) throws GenericBusinessException {
 		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) res;
		List<MultipartFile> picList = multipartRequest.getFiles("file");
		if (picList.size() > 0 && picList != null) {
			
				/*uploadPicture.upload(multipartFile, uid, imgType, last);*/
				for (MultipartFile multipartFile : picList) {
					InputStream is= null;
					OutputStream os= null;
					
					String fileName = multipartFile.getOriginalFilename();
					String path = "F:/springmvc/School/src/main/webapp/images";
					/*String fileName = multipartFile.getOriginalFilename();
					String mark = fileName.substring(fileName.lastIndexOf("."));*/
					
						try {
							is=multipartFile.getInputStream();
							File file = new File(path + "/foodsUpload");
							if(!file.isDirectory()) {
								file.mkdirs();
							}
							os=new FileOutputStream(path + "/foodsUpload/"+fileName);
							int len=0;
							while((len=is.read())!=-1) {
								os.write(len);
							}
							Food f =new Food();
							String url="/images/foodsUpload/"+fileName;
							f.setName(food.getName());
							f.setInfomation(food.getInfomation());
							f.setUrl(url);
							f.setPrice(food.getPrice());
							f.setAddressName(food.getAddressName());
							Date date =new Date();
							String code = "uploadF"+date.toString();
							f.setCode(code);
							f.setReason(food.getReason());
							f.setStatus("2");//状态为2 表示上传
							f.setCreateDate(date);
							User u= (User) res.getSession().getAttribute("loginSession");
							f.setCreateId(u.getId());
							foodsDao.save(f);
						} catch (FileNotFoundException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}finally {
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
		User u=(User) res.getSession().getAttribute("loginSession");
		List<Food> aList=foodsDao.queryCommentedFoodsByUserId(u.getId());//已评论
		List<Food> bList=foodsDao.queryLovedFoodsByUserId(u.getId());//已收藏
		List<Food> cList=foodsDao.queryUploadedFoodsByUserId(u.getId());//已上传
		List<Address> aTList=addressDao.queryUploadedAddressByUserId(u.getId());//已上传的景点
		map.addAttribute("aList",aList);
		map.addAttribute("bList",bList);
		map.addAttribute("cList",cList);
		map.addAttribute("aTList",aTList);
		map.addAttribute("user", u);
		map.addAttribute("succeed", "上传成功");
		return "front/user/mine";
		
 	}
 	/**
 	 * 搜索美食
 	 * @param map
 	 * @param res
 	 * @param user
 	 * @param nowPage
 	 * @param doAction
 	 * @param totalPages
 	 * @param food
 	 * @param pageSize
 	 * @param siteLang
 	 * @return
 	 * @throws GenericBusinessException
 	 */
 	@RequestMapping("/searchFoods.do")
 	public String searchFoods(ModelMap map, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,Food food,
 			String pageSize, String siteLang) throws GenericBusinessException {
 		PaginationSupport<Food> page = PaginationHelper.getPaginationSupport(nowPage, doAction, totalPages, pageSize);
 		page = foodsDao.findFoodsByPage(user, food, page);
 		map.addAttribute("page", page);
 		return "front/food/searchFoods";
 	}
 	/**
 	 * 进入美食详情页面
 	 * @param map
 	 * @param id
 	 * @param content
 	 * @param res
 	 * @param user
 	 * @param nowPage
 	 * @param doAction
 	 * @param totalPages
 	 * @param pageSize
 	 * @param siteLang
 	 * @return
 	 * @throws GenericBusinessException
 	 */
 	@RequestMapping("/detailFoodsUI.do")
 	public String detailFoodsUI(ModelMap map,Long id,String content, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,
 			String pageSize, String siteLang)throws GenericBusinessException{
 		//美食详情
 		Food food =foodsDao.select(id);
 		map.addAttribute("food", food);
 		//美食评论分页
 		PaginationSupport<Comment> page = PaginationHelper.getPaginationSupport(nowPage, doAction, totalPages, pageSize);
 		page = foodsDao.findCommentsByFoodsId(user, id,content, page);
 		map.addAttribute("page", page);
 		return "front/food/detailFoods";
 	}
 	/**
 	 * 评论美食
 	 * @param userId
 	 * @param foodsId
 	 * @param content
 	 * @return
 	 * @throws GenericBusinessException
 	 */
 	@RequestMapping("/toCommentFoods.do")
	@ResponseBody
	public String deleteMainProduct(Long userId, Long foodsId,String content)
			throws GenericBusinessException {
		//根据前台传入的id,调用BO的删除方法,并返回结果
		String deleteResult = foodsDao.toCommentFood(content, foodsId, userId);
		return JSON.toJSONString(deleteResult);
	}
 	@RequestMapping("/isfavoriteFood.do")
 	@ResponseBody
 	public String isfavoriteFood(Long userId, Long foodsId) throws GenericBusinessException{
 		String flag="";
 		Collection collection1=null;
 		collection1 = foodsDao.findCollectionListByfoodId(userId, foodsId);
 		if(collection1!=null){
 			//已收藏
 			
 			flag="collectioned";
 		}else{
 			flag="not_collectioned";
 		}
 		return flag;
 	}
 	@RequestMapping("/addfavoriteFood.do")
 	@ResponseBody
 	public String addfavoriteFood(Long userId, Long foodsId) throws GenericBusinessException{
 		String flag="";
 		Food food = null;
 		food = foodsDao.select(foodsId);
 		Collection collection=null;
 		Collection collection1=null;
 		collection1 = foodsDao.findCollectionListByfoodId(userId, foodsId);
 		if(collection1!=null){
 			//已收藏
 			collection= collection1;
 		}else{
 			collection =new Collection();
 			collection.setFood(food);
 			collection.setUserId(userId);
 			collection.setCreateDate(new Date());
 			collection.setCreateId(userId);
 			foodsDao.save(collection);
 			
 		}
 		flag = "success_collection";
 		return flag;
 	}
 	@RequestMapping("/delfavoriteFood.do")
 	@ResponseBody
 	public String delfavoriteFood(Long userId, Long foodsId) throws GenericBusinessException{
 		String flag="";
 		flag=foodsDao.delCollectionByfoodId(userId, foodsId);
 		return flag;
 	}
 	

}
