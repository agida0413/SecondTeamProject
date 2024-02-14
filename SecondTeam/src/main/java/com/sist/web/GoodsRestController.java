package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.CommonsFunction;
import com.sist.service.GoodsService;
import com.sist.vo.DonStoreVO;
import com.sist.vo.GoodsVO;

@RestController
public class GoodsRestController {
@Autowired
private GoodsService gService;
@Autowired
private CommonsFunction comm;

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
// 상세페이지
@GetMapping(value="goods/goods_detail_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_detail_vue(int gno) throws Exception
{
	
	List<GoodsVO> list=gService.goodsDetailImg(gno);
	GoodsVO vo =gService.goodsDetailData(gno);
	Map map=new HashMap();
	map.put("goodsdetail_img", list);
	map.put("goodsdetail", vo);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(map);
	return json;
}
}

