package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GoodsController {
@GetMapping("goods/goods_main.do")
public String goods_main()
{
	return "goods";
}
@GetMapping("goods/goods_detail.do")
String food_detail(int gno,Model model)
{
	model.addAttribute("gno",gno);
	return "goods/goods_detail";
}
}
