package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DonationController {
	@GetMapping("donation/donationMain.do")
	public String donation_main() {
		return "donation";
	}
	
	@GetMapping("donation/donation_detail.do")
	public String donation_detail(int dno,Model model) {
		model.addAttribute("dno",dno);
		return "donation/donation_detail";
	}
	
	@GetMapping("donation/donation_reply.do")
	public String donation_reply() {
		return "donation/donation_reply";
	}
	
	@GetMapping("donation/donation_pay.do")
	public String donation_pay(int dno,Model model) {
		model.addAttribute("dno",dno);
		return "donation/donation_pay";
	}
	
	@GetMapping("donation/donation_before_detail.do")
	public String donation_before_detail(int dno,RedirectAttributes ra, HttpServletResponse response) {
		Cookie cookie=new Cookie("donation_"+dno,String.valueOf(dno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		ra.addAttribute("dno",dno);
		return "redirect:../donation/donation_detail.do";
	}
	

	@GetMapping("myAndAdpage/donated_campaign.do")
	public String donated_campaign(Model model) {
		model.addAttribute("cate","donated_history");
		return "myAndAdpage/donatedHistory";
	}
	
}
