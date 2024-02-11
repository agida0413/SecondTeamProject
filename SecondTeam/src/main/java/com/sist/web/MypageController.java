package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	public String programHistory(String page,Model model,HttpSession session) {
		if(page==null) {
			page="1";
		}
		String id=(String)session.getAttribute("id");
		int totalpage=service.applyHistotyTotalPage(id);
		int rowsize=10;
		int curpage=Integer.parseInt(page);
		
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK, curpage);
		int endpage=cf.endPage(BLOCK, curpage,totalpage);
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<VprogramApplyVO> list=service.applyHistoryList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("page",curpage);
		model.addAttribute("cate","programHistory");
		
		return "myAndAdpage/programHistory";
	}
}
