package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.TemptLoginDAO;
import com.sist.vo.MemberVO;

@Controller
public class TemptLoginController {

	@Autowired
	private TemptLoginDAO dao;
	@PostMapping("program/login_ok.do")
	public String TemptLogin_ok(String id , String pwd,HttpSession session) {
		MemberVO vo = dao.temptLogin(id);
		if(vo.getUserid().equals(id) && vo.getUserpwd().equals(pwd)) {
			session.setAttribute("id", vo.getUserid());
			session.setAttribute("centername", vo.getCentername());
			session.setAttribute("name", vo.getUsername());
			session.setAttribute("admin", vo.getAdmin());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("phone", vo.getPhone());
			
			
		}
		
		
		
		return "main";
	}
	
	
	@RequestMapping("program/login.do")
	public String TemptLogind() {
		return "program/login";
	}
	
	@RequestMapping("program/logout.do")
	public String Temptlogout(HttpSession session) {
	session.invalidate();
		
		return "main";
	}
}
