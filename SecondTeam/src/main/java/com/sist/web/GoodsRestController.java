package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
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

@GetMapping(value="goods/goods_list_vue.do",produces = "text/plain;charset=UTF-8")
public String goods_list_vue(int page) throws Exception{
	int rowSize=12;
	int start=comm.start(rowSize, page);
	int end=comm.end(rowSize, page);
	Map map=new HashMap();
	map.put("start", start);
	map.put("end", end);
	List<GoodsVO> list=gService.goodsListData(map);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}
@GetMapping(value="goods/page_vue.do",produces="text/plain;charset=UTF-8")
public String don_page_vue(String ss,int page) throws Exception
{	
	int totalpage=gService.goodsTotalpage();
	int BLOCK=10;
	int startpage=comm.startPage(BLOCK, page);
	int endpage=comm.endPage(BLOCK, page, totalpage);
	Map map=new HashMap();
	map.put("startpage", startpage);
	map.put("endpage", endpage);
	map.put("totalpage", totalpage);
	map.put("curpage", page);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(map);
	return json;
	
}
}
