package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.commons.CommonsFunction;
import com.sist.service.MypageService;
import com.sist.vo.VprogramApplyVO;

@Controller
public class MypageController {
@Autowired
private MypageService service;

@Autowired
private CommonsFunction cf;
	@GetMapping("myAndAdpage/mypage.do")
	public String mypage(Model model) {
		model.addAttribute("cate","inform");
		
		return "mypage";
	}
	
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
	
	@RequestMapping("myAndAdpage/certifyPage.do")
	public String certifyPage(int vno,Model model) {
		VprogramApplyVO vo= service.certifyDetail(vno);
		model.addAttribute("vo",vo);
		return "myAndAdpage/certifyPage";
	}
	
}
