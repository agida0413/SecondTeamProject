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

@GetMapping(value="cart/cart_list_vue.do",produces =  "application/json;charset=UTF-8")
public String cart_list_vue(HttpSession session) throws Exception
{
	String userid=(String) session.getAttribute("id");
	System.out.println(userid);
	List<CartVO> cList=cService.cartListData(userid);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(cList);
	return json;
}

}
