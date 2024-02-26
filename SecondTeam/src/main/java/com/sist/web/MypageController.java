package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.commons.CommonsFunction;
import com.sist.service.MypageService;
import com.sist.service.ProgramService;
import com.sist.vo.DonClassVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;

@Controller
public class MypageController {
@Autowired
private MypageService service;

@Autowired
private CommonsFunction cf;

@Autowired
private ProgramService pService;

//메인(개인정보)
	@GetMapping("myAndAdpage/mypage.do")
	public String mypage(Model model) {
		model.addAttribute("cate","inform");
		
		return "mypage";
	}
	
	
	//프로그램 신청현황
	@GetMapping("myAndAdpage/programHistory.do")
	public String programHistory(String page,Model model,String state,HttpSession session) {
		String sendState="";
		if(page==null) {
			page="1";
		}
		if(state==null) {
		sendState="신청승인대기중";
		
		}
		if(state.equals("WAIT")) {
			sendState="신청승인대기중";
		}
		if(state.equals("REJECT")) {
			sendState="거절";
		}
		if(state.equals("ACCESS")) {
			sendState="봉사활동 대기중";
		}
		
		if(state.equals("RUN")) {
			sendState="봉사중";
		}
		if(state.equals("COMPLETE")) {
			sendState="봉사완료";
		}
		
		
		
		String id=(String)session.getAttribute("id");
		Map map = new HashMap();
		map.put("id", id);
		map.put("state", sendState);
		int totalpage=service.applyHistotyTotalPage(map);
		int rowsize=10;
		int curpage=Integer.parseInt(page);
		
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK, curpage);
		int endpage=cf.endPage(BLOCK, curpage,totalpage);
		
		
		
		map.put("start", start);
		map.put("end", end);
		
		List<VprogramApplyVO> list=service.applyHistoryList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("page",curpage);
		model.addAttribute("cate","programHistory");
		model.addAttribute("size",list.size());
		model.addAttribute("state",state);
		
		return "myAndAdpage/programHistory";
	}
	
	
	
	//프로그램 완료인증신청
	@GetMapping("myAndAdpage/programCertify.do")
	public String programCertify(String page,Model model,String state,HttpSession session) {
		String sendState="";
		if(page==null) {
			page="1";
		}
		
		if(state.equals("COMPLETE")) {
			sendState="봉사완료";
		}
		if(state.equals("WAITCERTIFY")) {
			sendState="봉사인증 승인대기중";
		}
		if(state.equals("COMPLETECERTIFY"))
		{
			sendState="보상지급완료";
		}
		
		
		String id=(String)session.getAttribute("id");
		Map map = new HashMap();
		map.put("id", id);
		map.put("state", sendState);
		int totalpage=service.applyHistotyTotalPage(map);
		int rowsize=10;
		int curpage=Integer.parseInt(page);
		
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK, curpage);
		int endpage=cf.endPage(BLOCK, curpage,totalpage);
		
		
		
		map.put("start", start);
		map.put("end", end);
		
		List<VprogramApplyVO> list=service.applyHistoryList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("page",curpage);
		model.addAttribute("cate","programCertify");
		model.addAttribute("size",list.size());
		model.addAttribute("state",state);
		
		return "myAndAdpage/programCertify";
	}
	
	
	//프로그램 완료 인증신청 페이지(상세)
	@RequestMapping("myAndAdpage/certifyPage.do")
	public String certifyPage(int vno,Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		map.put("vno", vno);
		
		VprogramApplyVO vo= service.certifyDetail(map);
		model.addAttribute("cate","programCertify");
		model.addAttribute("vo",vo);
		return "myAndAdpage/certifyPage";
	}
	
	//프로그램 관심목록
	@RequestMapping("myAndAdpage/programwishList.do")
	public String programwishList(HttpSession session,String page, Model model) {
		
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		String id=(String)session.getAttribute("id");
		
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("state", "YES");
		
		int totalpage=service.wishListTotalPage(map);
		System.out.println(totalpage);
		int rowsize=10;
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK,curpage);
		int endpage=cf.endPage(BLOCK, curpage, totalpage);
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<ProgramVO>list=service.wishList(map);
		
		
		model.addAttribute("list",list);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("page",curpage);
		model.addAttribute("cate","wishlist");
		model.addAttribute("size",list.size());
		return "myAndAdpage/programwishList";
	}
	
	
	@GetMapping("program/Wishdetail.do")
	public String programDetail(String vno,Model model,HttpSession session) {
		
		int intVno=Integer.parseInt(vno);
		ProgramVO vo=pService.programDetailData(intVno);
		String state="";
		String id=(String)session.getAttribute("id");
		
		if(id!=null) {
			Map map =new HashMap();
			map.put("id", id);
			map.put("vno", intVno);
			
			int count =pService.getWishCount(map);
			
			if(count==0) {
				map.put("state", "NO");
				pService.insertWishList(map);
				state="NO";
			}
			else {
				state =pService.getWishState(map);
			}
		}
		model.addAttribute("vo",vo);	
		model.addAttribute("cate","list");
		model.addAttribute("state",state);
		return "program/detail";
	}
	
	@RequestMapping("myAndAdpage/centerProgram.do")
	public String centerProgram(HttpSession session,String page, Model model) {
		
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		String centername=(String)session.getAttribute("centername");
		
		
		Map map=new HashMap();
		map.put("centername", centername);
		
		
		int totalpage=service.centerProgramTotalPage(centername);
		
		int rowsize=10;
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK,curpage);
		int endpage=cf.endPage(BLOCK, curpage, totalpage);
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<ProgramVO>list=service.centerProgramList(map);
		
		
		model.addAttribute("list",list);
		model.addAttribute("size",list.size());
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("page",curpage);
		model.addAttribute("cate","centerProgram");
		return "myAndAdpage/centerProgram";
	}
	
	
	//클래스 위시리스트 
	
	@RequestMapping("myAndAdpage/donClassWishList.do")
	public String donClassWishList(HttpSession session,String page,Model model) {
		String id=(String)session.getAttribute("id");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		
		String state="YES";
		
		Map map =new HashMap();
		map.put("id", id);
		map.put("state", state);
		
		int totalpage=service.donClassWishTotalpage(map);
		
		int rowsize=5;
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		map.put("start", start);
		map.put("end", end);
		
		List<DonClassVO>list= service.donClassWishList(map);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK, curpage);
		int endpage=cf.endPage(BLOCK, curpage, totalpage);
	
	
		model.addAttribute("list",list);
		model.addAttribute("page",curpage);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("cate","classWishList");
		model.addAttribute("size",list.size());
		return "myAndAdpage/donClassWishList";
	}
	
	//원데이 클래스 예약내역
	@GetMapping("myAndAdpage/classResHistory.do")
	public String classHistoryLits(String page,Model model,HttpSession session) {
		String userid= (String)session.getAttribute("id");
		Map map =service.donClassReserveHistoryList(page, userid);
		
		
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("totalpage",map.get("totalpage"));
		model.addAttribute("startpage",map.get("startpage"));
		model.addAttribute("endpage",map.get("endpage"));
		model.addAttribute("page",map.get("page"));
		model.addAttribute("cate","classHistory");
		model.addAttribute("size",map.get("size"));
		return "myAndAdpage/classResHistory";
	}
	
	//나의 클래스
		@GetMapping("myAndAdpage/myclass.do")
		public String myclass(String page ,HttpSession session, Model model) {
			String id= (String)session.getAttribute("id");
			Map map = service.myDonClassList(id, page);
			
			model.addAttribute("cate","myclass");
			model.addAttribute("list",map.get("list"));
			model.addAttribute("totalpage",map.get("totalpage"));
			model.addAttribute("startpage",map.get("startpage"));
			model.addAttribute("endpage",map.get("endpage"));
			model.addAttribute("page",map.get("page"));
			model.addAttribute("size",map.get("size"));
			return "myAndAdpage/myclass";
		}
	
		
		@GetMapping("myAndAdpage/myclassResHistory.do")
		public String myclassResHistory(String page ,HttpSession session, Model model) {
			String userid= (String)session.getAttribute("id");
			Map map = service.myDonclassResHistoryList(userid, page);
			
			model.addAttribute("cate","myclassResHistory");
			model.addAttribute("list",map.get("list"));
			model.addAttribute("totalpage",map.get("totalpage"));
			model.addAttribute("startpage",map.get("startpage"));
			model.addAttribute("endpage",map.get("endpage"));
			model.addAttribute("page",map.get("page"));
			model.addAttribute("size",map.get("size"));
			return "myAndAdpage/myclassResHistory";
		}
	// 상품 위시 페이지
	@GetMapping("myAndAdpage/wishgoods.do")
	public String wishgoods() {
		return "myAndAdpage/wishgoods";
	}
	
	
	
}
