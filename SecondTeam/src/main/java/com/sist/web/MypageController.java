package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	@GetMapping("myAndAdpage/mypage.do")
	public String mypage(Model model) {
		model.addAttribute("cate","inform");
		
		return "mypage";
	}
	
	@GetMapping("myAndAdpage/programHistory.do")
	public String programHistory(Model model) {
		model.addAttribute("cate","programHistory");
		
		return "myAndAdpage/programHistory";
	}
}
