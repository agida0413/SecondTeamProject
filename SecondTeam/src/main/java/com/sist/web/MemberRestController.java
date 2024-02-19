package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.*;
import com.sist.vo.MemberVO;

@RestController
public class MemberRestController {
	 
	@Autowired
	private MemberService service;
	
	@GetMapping(value="member/idcheck_vue.do",produces = "text/plain;charset=UTF-8")
	public String member_idcheck(String userId)
	{
	     int count=service.memberIdCount(userId);
		 return String.valueOf(count);
	}
	
	//로그인 실행
    @GetMapping(value = "member/login_ok_vue.do", produces = "text/plain;charset=UTF-8")
    public String member_login_ok_vue(String userId, String userPwd, boolean ck, HttpSession session, HttpServletResponse response)
    {
    	MemberVO vo=service.memberLogin(userId, userPwd);
    	//System.out.println(vo.getUserName());
    	if(vo.getMsg().equals("OK"))
    	{
    		session.setAttribute("id", vo.getUserId());
    		session.setAttribute("centername", vo.getCenterName());
    		session.setAttribute("username", vo.getUserName());
    		session.setAttribute("enabled", vo.getEnabled());
    		session.setAttribute("name", vo.getUserName());
			session.setAttribute("admin", vo.getAdmin());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("phone", vo.getPhone());
			session.setAttribute("mno", String.valueOf(vo.getMno()));
			
    		if(ck==true)
    		{
    			Cookie cookie=new Cookie("userId",vo.getUserId());
    	        cookie.setPath("/");
    	        cookie.setMaxAge(60*60*24);
    	        response.addCookie(cookie);
    		}
    	}
    	return vo.getMsg();
    }
}
