package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
@GetMapping("cart/cart_main.do")
public String cart_main()
{
	return "cart";
}
@GetMapping("cart/cart_list.do")
public String cart_list()
{
	return "cart/cart_list";
}
}
