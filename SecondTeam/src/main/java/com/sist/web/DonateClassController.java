package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("donateclass/")
public class DonateClassController {


	@GetMapping("list.do")
	public String dcList() {
		return "donateclass";
	}
}
