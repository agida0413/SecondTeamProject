package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.CommonsFunction;
import com.sist.service.DonResService;
import com.sist.service.DonStoreService;
import com.sist.service.DonationService;
import com.sist.service.GoodsService;
import com.sist.vo.DonResVO;
import com.sist.vo.DonStoreVO;
import com.sist.vo.DonationVO;
import com.sist.vo.GoodsVO;

@RestController
public class MainRestController {
@Autowired
private DonStoreService service;
@Autowired
private CommonsFunction comm;
@Autowired
private DonationService dService;
@Autowired
private DonResService donService;
@Autowired
private GoodsService gService;

@GetMapping(value="donstore/search_vue.do",produces="text/plain;charset=UTF-8")
public String donstore_search_vue(String ss,int page) throws Exception
{
	
	int rowSize=5;
	int start=comm.start(rowSize, page);
	int end=comm.end(rowSize, page);
	Map map=new HashMap();
	map.put("start", start);
	map.put("end", end);
	map.put("ss", ss);
	List<DonStoreVO> list=service.dnoStoreSearch(map);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}
@GetMapping(value="donstore/page_vue.do",produces="text/plain;charset=UTF-8")
public String don_page_vue(String ss,int page) throws Exception
{
	
	int BLOCK=5;
	int startpage=comm.startPage(BLOCK, page);
	Map map=new HashMap();
	map.put("ss", ss);
	int totalpage=service.donTotalpage(map);
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
@GetMapping(value="donstore/detail_vue.do",produces="text/plain;charset=UTF-8")
public String donstore_detail_vue(int dno) throws Exception
{
	DonStoreVO vo=service.donDetailData(dno);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(vo);
	return json;
}

@GetMapping(value = "donation/donationHomeList.do",produces = "text/plain;charset=UTF-8")
	public String main_vue() throws Exception{
		List<DonationVO> list=dService.homeDonationListData();
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
	}
@PostMapping(value="main/donres_ok_vue.do",produces="text/plain;charset=UTF-8")
public void donres_ok(HttpSession session,DonResVO vo,int dno)
{
	String userid=(String)session.getAttribute("id");
	vo.setUserid(userid);
	donService.donresInsert(vo);
}

@GetMapping(value="main/getuserid.do",produces="text/plain;charset=UTF-8")
public String getuserid(HttpSession session) throws Exception
{
	String userid=(String)session.getAttribute("id");
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(userid);
	return json;
}
@GetMapping(value = "goods/mainGoodsList.do",produces = "text/plain;charset=UTF-8")
public String maingoods() throws Exception
{
	List<GoodsVO> list=gService.mainGoodsList();
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}
}
