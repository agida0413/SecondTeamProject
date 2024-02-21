package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.CartService;
import com.sist.vo.CartVO;
import com.sist.vo.GoodsVO;

@RestController
public class CartRestController {
@Autowired
private CartService cService;

public String cart_commonsList(HttpSession session) throws Exception
{
	String userid=(String) session.getAttribute("id");
	List<CartVO> cList=cService.cartListData(userid);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(cList);
	return json;
}

@GetMapping(value="cart/cart_list_vue.do",produces =  "application/json;charset=UTF-8")
public String cart_list_vue(HttpSession session) throws Exception
{
	return cart_commonsList(session);
}
@GetMapping(value="cart/cart_delete_vue.do",produces =  "application/json;charset=UTF-8")
public String cart_delete_vue(int gcno,HttpSession session) throws Exception
{
	cService.cartDelete(gcno);
	return cart_commonsList(session);
}
@GetMapping(value="cart/cart_alldelete_vue.do",produces =  "application/json;charset=UTF-8")
public String cart_alldelete_vue(String userid,HttpSession session) throws Exception
{
	System.out.println((String)session.getAttribute("id"));
	cService.cartAllDelete((String)session.getAttribute("id"));
	return cart_commonsList(session);
}
}
