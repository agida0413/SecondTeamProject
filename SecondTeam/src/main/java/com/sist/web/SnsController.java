package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SnsController {
	
	@GetMapping("sns/list.do")
	public String sns_list() {
		
		return "sns/list";
	}
	
	@GetMapping("sns/schedule.do")
	public String sns_schedule() {
		
		return "sns/schedule";
	}
}
