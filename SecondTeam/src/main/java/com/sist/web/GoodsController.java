package com.sist.web;

import java.net.http.HttpResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GoodsController {
@GetMapping("goods/goods_main.do")
public String goods_main()
{
	return "goods";
}
@GetMapping("goods/goods_before_detail.do")
public String goods_before_detail(int gno,RedirectAttributes ra,HttpServletResponse response) {
	
	Cookie cookie=new Cookie("goods_"+gno,String.valueOf(gno));
	// Cookie(String,String)
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	ra.addAttribute("gno",gno);
	return "redirect:../goods/goods_detail.do";
}
@GetMapping("goods/goods_detail.do")
String goods_detail(int gno,Model model)
{
	model.addAttribute("gno",gno);
	return "goods/goods_detail";
}
}
