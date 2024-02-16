package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.DonateClassService;

@RestController
public class DonateClassRestController {

	@Autowired
	private DonateClassService service;
	@GetMapping(value="donateclass/wishlistUpdate_vue.do",produces = "text/plain;charset=UTF-8")
	   public String updateZzim(int dcno,String zzimstate,HttpSession sesion) {
		   String id=(String)sesion.getAttribute("id");
		   Map map =new HashMap();
		   map.put("id", id);
		   map.put("dcno", dcno);
		   if(zzimstate.equals("NO")) {
			   map.put("state","YES");   
		   }
		   
		   if(zzimstate.equals("YES")) {
			   map.put("state","NO");   
		   }
		   
		   String send=service.updateWishList(map);
		   
		   return send;
		   
	   }
}
