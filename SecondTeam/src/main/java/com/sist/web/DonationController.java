package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
}
