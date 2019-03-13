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
import com.project.domain.entity.User;
import com.project.exception.GenericBusinessException;
import com.project.utils.PaginationHelper;
import com.project.utils.PaginationSupport;

@Controller
@RequestMapping("/travel")
public class TravelController {
	@Autowired  
    ShareDataDao shareDataDao;  
	@Autowired
	AddressDao addressDao;
	@Autowired
	FoodsDao foodsDao;
      
    /*@RequestMapping("/testInDb")  
    public String testInDb(Model model){  
        ShareData  shareData=new ShareData();  
        shareData.setShareCode("00023");  
        shareData.setShareName("万科");  
        shareData.setShareType("SZ");  
        Serializable result=shareDataDao.save(shareData);  
        model.addAttribute("result", result);  
        return "test/test";  
          
    }*/
     // 进入旅行页面
	/**
	 * 进入景点列表页面
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
 	@RequestMapping("/travelUI.do")
 	public String indexTH(ModelMap map, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,
 			String pageSize, String siteLang) throws GenericBusinessException {
 		List<Address> hList=addressDao.queryHotAddress(user);
 		map.addAttribute("hAddress", hList);
 		List<Address> sList=addressDao.querySpecialAddress(user);
 		map.addAttribute("sAddress", sList);
 		List<Address> gList=addressDao.queryGujiAddress(user);
 		map.addAttribute("gAddress", gList);
 		map.addAttribute("user", user);
 		return "front/travel/travel";
 	}
 	/**
 	 * 上传景点图片以及保存景点信息
 	 * @param map
 	 * @param res
 	 * @param user
 	 * @param a
 	 * @return
 	 * @throws GenericBusinessException
 	 */
 	@RequestMapping("/addressUpload.do")
 	public String addressUpload(ModelMap map, HttpServletRequest res, User user,
 			Address a) throws GenericBusinessException {
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
							File file = new File(path + "/addressUpload");
							if(!file.isDirectory()) {
								file.mkdirs();
							}
							os=new FileOutputStream(path + "/addressUpload/"+fileName);
							int len=0;
							while((len=is.read())!=-1) {
								os.write(len);
							}
							Address address =new Address();
							String url="/images/addressUpload/"+fileName;
							address.setName(a.getName());
							address.setInformation(a.getInformation());
							address.setFoodsName(a.getFoodsName());
							address.setPrice(a.getPrice());
							address.setReason(a.getReason());
							Date date = new Date();
							address.setCode("uploadA"+date.toString());
							address.setUrl(url);
							address.setStatus("2");//状态为2 表示上传
							address.setCreateDate(date);
							User u= (User) res.getSession().getAttribute("loginSession");
							address.setCreateId(u.getId());
							addressDao.save(address);
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
 	 * 景点搜索
 	 * @param map
 	 * @param res
 	 * @param user
 	 * @param nowPage
 	 * @param doAction
 	 * @param totalPages
 	 * @param address
 	 * @param pageSize
 	 * @param siteLang
 	 * @return
 	 * @throws GenericBusinessException
 	 */
 	@RequestMapping("/searchAddress.do")
 	public String searchFoods(ModelMap map, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,Address address,
 			String pageSize, String siteLang) throws GenericBusinessException {
 		PaginationSupport<Address> page = PaginationHelper.getPaginationSupport(nowPage, doAction, totalPages, pageSize);
 		page = addressDao.findAddressByPage(user, address, page);
 		map.addAttribute("page", page);
 		return "front/travel/searchAddress";
 	}
 	/**
 	 * 查看景点详情
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
 	@RequestMapping("/detailAddressUI.do")
 	public String detailFoodsUI(ModelMap map,Long id,String content, HttpServletRequest res, User user,
 			String nowPage, String doAction, String totalPages,
 			String pageSize, String siteLang)throws GenericBusinessException{
 		//景点详情
 		Address address =addressDao.select(id);
 		map.addAttribute("address", address);
 		//景点评论分页
 		PaginationSupport<Comment> page = PaginationHelper.getPaginationSupport(nowPage, doAction, totalPages, pageSize);
 		page = addressDao.findCommentsByAddressId(user, id, content, page);
 		map.addAttribute("page", page);
 		return "front/travel/detailAddress";
 	}
 	/**
 	 * 评论景点
 	 * @param userId
 	 * @param addressId
 	 * @param content
 	 * @return
 	 * @throws GenericBusinessException
 	 */
 	@RequestMapping("/toCommentAddress.do")
	@ResponseBody
	public String toCommentAddress(Long userId, Long addressId,String content)
			throws GenericBusinessException {
		//根据前台传入的id,调用BO的删除方法,并返回结果
		String deleteResult = addressDao.toCommentAddress(content, addressId, userId);
		return JSON.toJSONString(deleteResult);
	}
 	
 	@RequestMapping("/isfavoriteAddress.do")
 	@ResponseBody
 	public String isfavoriteAddress(Long userId, Long addressId) throws GenericBusinessException{
 		String flag="";
 		Collection collection1=null;
 		collection1 = addressDao.findCollectionListByaddressId(userId, addressId);
 		if(collection1!=null){
 			//已收藏
 			
 			flag="collectioned";
 		}else{
 			flag="not_collectioned";
 		}
 		return flag;
 	}
 	@RequestMapping("/addfavoriteAddress.do")
 	@ResponseBody
 	public String addfavoriteAddress(Long userId, Long addressId) throws GenericBusinessException{
 		String flag="";
 		Address address = null;
 		address = addressDao.select(addressId);
 		Collection collection=null;
 		Collection collection1=null;
 		collection1 = addressDao.findCollectionListByaddressId(userId, addressId);
 		if(collection1!=null){
 			//已收藏
 			collection= collection1;
 		}else{
 			collection =new Collection();
 			collection.setAddress(address);
 			collection.setUserId(userId);
 			collection.setCreateDate(new Date());
 			collection.setCreateId(userId);
 			addressDao.save(collection);
 			
 		}
 		flag = "success_collection";
 		return flag;
 	}
 	@RequestMapping("/delfavoriteAddress.do")
 	@ResponseBody
 	public String delfavoriteAddress(Long userId, Long addressId) throws GenericBusinessException{
 		String flag="";
 		flag=addressDao.delCollectionByaddressId(userId, addressId);
 		return flag;
 	}
 	
 	
}
