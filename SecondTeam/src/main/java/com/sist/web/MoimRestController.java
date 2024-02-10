package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MoimListService;
import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;

@RestController
@RequestMapping("moim/")
public class MoimRestController {
	
	@Autowired
	private MoimListService service;
	
	//공간대여리스트
	@GetMapping(value = "list_vue.do", produces = "text/plain;charset=UTF-8")
	public String moim_list_vue(int page, String tt) throws Exception
	{
		int rowSize=6;
		int start=(rowSize*page)-(rowSize-1);
	    int end=rowSize*page;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("tt", tt);
		List<MoimListVO> list=service.moimListData(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
		
	}
	
	@GetMapping(value = "page_vue.do", produces = "text/plain;charset=UTF-8")
	public String moim_page_vue(int page, String tt) throws Exception
	{
		final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   Map map=new HashMap();
		   map.put("tt", tt);
		   int totalpage=service.moimTotalPage(map);   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   map=new HashMap();
		   map.put("curpage", page);
		   map.put("totalpage", totalpage);
		   map.put("startPage", startPage);
		   map.put("endPage", endPage);
		   
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(map);
		   return json;
	}
	
	//공간대여디테일
	@GetMapping(value = "detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String moim_detail_vue(int rno) throws Exception
	{
		MoimListVO vo=service.moimDetailData(rno);
		ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	}
	
	//공간대여디테일_댓글
	public String commonsData(int rno) throws Exception
	   {
		   List<MoimReplyVO> list=service.MoimReplyData(rno);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
	@GetMapping(value = "detail_reply_vue.do",produces = "text/plain;charset=UTF-8")
	   public String detail_reply_vue(int rno) throws Exception
	   {
		  return commonsData(rno);
	   }
	   
	   @GetMapping(value = "detail_reply_insert_vue.do", produces = "text/plain;charset=UTF-8")
	   public String detail_reply_insert_vue(int rno,String msg,HttpSession session) throws Exception
	   {
		   String id=(String)session.getAttribute("id");
		   String name=(String)session.getAttribute("name");
		   MoimReplyVO vo=new MoimReplyVO();
		   vo.setRno(rno);
		   vo.setId(id);
		   vo.setName(name);
		   vo.setMsg(msg);
		   service.MoimReplyInsert(vo);
		   return commonsData(rno);
	   }
	   
	   @GetMapping(value = "detail_reply_delete_vue.do", produces = "text/plain;charset=UTF-8")
	   public String detail_reply_delete_vue(int mrno, int rno) throws Exception
	   {
		   service.MoimReplyDelete(mrno);
		   return commonsData(rno);
	   }
	   
	   @GetMapping(value = "detail_reply_update_vue.do", produces = "text/plain;charset=UTF-8")
	   public String detail_reply_update_vue(MoimReplyVO vo) throws Exception
	   {
		   service.MoimReplyUpdate(vo);
		   return commonsData(vo.getRno());
	   }

}
