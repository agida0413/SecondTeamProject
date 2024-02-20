package com.sist.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.CommonsFunction;
import com.sist.service.CartService;
import com.sist.service.GoodsService;
import com.sist.vo.CartVO;
import com.sist.vo.DonStoreVO;
import com.sist.vo.GoodsReviewVO;
import com.sist.vo.GoodsVO;

@RestController
public class GoodsRestController {
@Autowired
private GoodsService gService;
@Autowired
private CommonsFunction comm;
@Autowired
private CartService cService;

// 전체 리스트
@GetMapping(value="goods/goods_list_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_list_vue(int page,String ss) throws Exception{

	int rowSize=12;
	int start=comm.start(rowSize, page);
	int end=comm.end(rowSize, page);
	Map map=new HashMap();
	map.put("start", start);
	map.put("end", end);
	map.put("ss", ss);
	List<GoodsVO> list=gService.goodsListData(map);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}
// 전체 리스트 페이징
@GetMapping(value="goods/page_vue.do",produces="text/plain;charset=UTF-8")
public String don_page_vue(int page,String ss) throws Exception
{	
	Map map=new HashMap();
	map.put("ss", ss);
	int totalpage=gService.goodsTotalpage(map);
	int BLOCK=10;
	int startpage=comm.startPage(BLOCK, page);
	int endpage=comm.endPage(BLOCK, page, totalpage);
	 map=new HashMap();
	map.put("startpage", startpage);
	map.put("endpage", endpage);
	map.put("totalpage", totalpage);
	map.put("curpage", page);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(map);
	return json;
}
// 쿠키
@GetMapping(value = "goods/goods_cookie_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_cookie_vue(HttpServletRequest request) throws Exception {
	Cookie[] cookies=request.getCookies();
	List<GoodsVO> list=new ArrayList<GoodsVO>();
	int k=0;
	if(cookies!=null)
	{
		for(int i=cookies.length-1;i>=0;i--)
		{
			if(k<5)
			{
				if(cookies[i].getName().startsWith("goods_"))
				{
					String gno=cookies[i].getValue();
					GoodsVO vo=gService.goodsDetailData(Integer.parseInt(gno));
					list.add(vo);
				}
				k++;
			}
		}
	}
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}
// 카테고리 별 리스트
//String cate[]= {"","라이프스타일","반려동물","뷰티","식품","출산/유아동","패션"};
@RequestMapping(value="goods/goods_category_list_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_category_list_vue(int page, String category,String ss,String category_minor) throws Exception
{	
	if(category==null)
		category="전체";
	int rowSize=12;
	int start=comm.start(rowSize, page);
	int end=comm.end(rowSize, page);
	Map map=new HashMap();
	map.put("start", start);
	map.put("end", end);
	map.put("category", category);
	map.put("ss", ss);
	map.put("category_minor", category_minor);
	List<GoodsVO> list=gService.goodsCategoryList(map);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}
// 카테고리 별 페이징
@GetMapping(value="goods/goods_category_page_vue.do",produces="text/plain;charset=UTF-8")
public String goods_category_page_vue(int page,String category,String ss,String category_minor) throws Exception
{	
	Map map=new HashMap();
	map.put("category", category);
	map.put("ss", ss);
	map.put("category_minor", category_minor);
	int totalpage=gService.goodsCategoryTotalpage(map);
	
	int BLOCK=10;
	int startpage=comm.startPage(BLOCK, page);
	int endpage=comm.endPage(BLOCK, page, totalpage);
	map=new HashMap();
	map.put("startpage", startpage);
	map.put("endpage", endpage);
	map.put("totalpage", totalpage);
	map.put("curpage", page);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(map);
	return json;
}
// 카테고리 소분류 리스트 
@RequestMapping(value="goods/goods_cateminor_list_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_category_list_vue(String category) throws Exception
{	
	if(category==null)
		category="전체";
	List<GoodsVO> list=gService.goodsCateMinorList(category);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}
// 상세페이지, 리뷰 리스트
@GetMapping(value="goods/goods_detail_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_detail_vue(int gno,HttpSession session) throws Exception
{
	String userid=(String)session.getAttribute("id");
	String username=(String)session.getAttribute("name");
	GoodsVO vo=new GoodsVO();
	
	List<GoodsVO> list=gService.goodsDetailImg(gno);
	vo =gService.goodsDetailData(gno);
	vo.setIntprice(Integer.parseInt(vo.getG_price().replaceAll(",", "")));
	List<GoodsReviewVO> rList=gService.gReviewListData(gno);
	Map map=new HashMap();
	map.put("rList", rList);
	map.put("goodsdetail_img", list);
	map.put("goodsdetail", vo);
	map.put("userid", userid);
	map.put("username", username);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(map);
	return json;
}

// 리뷰 insert

@PostMapping(value="goods/reviewInsert_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_reviewInsert_vue(GoodsReviewVO vo, HttpServletRequest request,HttpSession session) throws Exception
{

	String result="";
	try
	{
		String userid=(String)session.getAttribute("id");
		String username=(String)session.getAttribute("name");
		vo.setUserid(userid);
		vo.setUsername(username);
		String path=request.getSession().getServletContext().getRealPath("/")+"goodsReview\\";
		path=path.replace("\\", File.separator); 
		File dir=new File(path);
		if(!dir.exists())
		{
			dir.mkdir(); 
		}
		
		List<MultipartFile> list=vo.getFiles(); 

		if(list==null)
		{
			vo.setFilename("");
			vo.setFilesize("");
			vo.setFilecount(0);
		}
		else 
		{
			String filename="";
			String filesize="";
			for(MultipartFile mf:list)
			{
				String name=mf.getOriginalFilename();
				File file=new File(path+name);
				mf.transferTo(file); 
				
				filename+=name+","; 
				filesize+=file.length()+",";	
			}
			filename=filename.substring(0,filename.lastIndexOf(","));
			filesize=filesize.substring(0,filesize.lastIndexOf(","));
			vo.setFilename(filename);
			
			vo.setFilesize(filesize);
			vo.setFilecount(list.size());
		}
		gService.gReviewInsert(vo);
		result="yes";
	}
	catch(Exception ex) 
	{
		result=ex.getMessage();
	}
	return result;

}

//리뷰 update
@PostMapping(value="goods/reviewUpdate_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_reviewUpdate_vue(GoodsReviewVO vo) throws Exception
{
	
	gService.gReviewUpdate(vo);
	List<GoodsReviewVO> rList=gService.gReviewListData(vo.getGno());
	
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(rList);
	return json;
}
// 리뷰 delete
@GetMapping(value="goods/reviewDelete_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_reviewDelete_vue(int rno,int gno) throws Exception
{
	gService.gReviewDelete(rno);
	List<GoodsReviewVO> rList=gService.gReviewListData(gno);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(rList);
	return json;
}
// 장바구니 insert
@PostMapping(value="goods/cartInsert_vue.do",produces="text/plain;charset=UTF-8")
public String goods_cartInsert_vue(CartVO vo) throws Exception
{
	gService.cartInsert(vo);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(vo);
	return json;
}
}

