package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.manager.MailManager;
import com.sist.service.MoimListService;
import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;
import com.sist.vo.MoimReserveVO;

@RestController
@RequestMapping("moim/")
public class MoimRestController {
	
	@Autowired
	private MailManager mm;
	
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
		   String userid=(String)session.getAttribute("id");
		   String username=(String)session.getAttribute("name");
		   MoimReplyVO vo=new MoimReplyVO();
		   vo.setRno(rno);
		   vo.setUserid(userid);
		   vo.setUsername(username);
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
	   
	   //list.jsp cookie
	   @GetMapping(value = "moim_cookie_vue.do", produces = "text/plain;charset=UTF-8")
	   public String moim_cookie(HttpServletRequest request) throws Exception
	   {
		   Cookie[] cookies=request.getCookies();
		   List<MoimListVO> list=new ArrayList<MoimListVO>();
		   int k=0;
		   if(cookies!=null)
		   {
			   for(int i=cookies.length-1;i>=0;i--)
			   {
			       if(k<9)
			       {
			    	   if(cookies[i].getName().startsWith("moim_"))
			    	   {
			    		   String rno=cookies[i].getValue();
			    		   MoimListVO vo=service.moimDetailData(Integer.parseInt(rno));
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

	   //공간예약하기 type나눠서 출력
	   @GetMapping(value = "reserve_list_vue.do", produces = "text/plain;charset=UTF-8")
	   public String moim_list(String type) throws Exception
	   {
		   List<MoimListVO> list=service.moimReserveData(type);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
	   
	   //공간대여 추가하기
	   @PostMapping(value = "reserve_ok.do", produces = "text/plain;charset=UTF-8")
	   public String reserve_ok(int rno, String rDate, String rTime, String rInwon, HttpSession session)
	   {
		   String result="no";
		   try {
			   String userId=(String)session.getAttribute("id");
			   MoimReserveVO vo=new MoimReserveVO();
			   vo.setRno(rno);
			   vo.setUserId(userId);
			   vo.setRDate(rDate);
			   vo.setRTime(rTime);
			   vo.setRInwon(rInwon);
			   //System.out.println("userId:"+vo.getUserId());
			   service.moimReserveInsert(vo);

			   return "yes";
			   
		   }catch(Exception ex)
			{
				ex.printStackTrace();
				result="no";
			}
			return result;
	   }
	   
	   //마이페이지 예약내역
	   @GetMapping(value = "mypage_list_vue.do", produces = "text/plain;charset=UTF-8")
	   public String mypage_list(HttpSession session) throws Exception
		{
		   String userId=(String)session.getAttribute("id");
			List<MoimReserveVO> list=service.reserveMyPageData(userId);
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(list);
			return json;
		}
	   
	   //마이페이지 예약내역 취소
	   @GetMapping(value = "reserve_cancel_vue.do", produces = "text/plain;charset=UTF-8")
		public String reserve_cancel(int mno) throws Exception
		{
		   String result="";
			try {
				result="yes";
				service.reserveMypageCancel(mno);
			}catch(Exception ex)
			{
				result="no";
				ex.printStackTrace();
			}
			return result;
		}
	   
	   
}
