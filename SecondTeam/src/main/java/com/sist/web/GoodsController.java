package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GoodsController {
@GetMapping("goods/goods_main.do")
public String goods_main()
{
	return "goods";
}
}
