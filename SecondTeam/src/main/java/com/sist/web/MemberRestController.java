package com.sist.web;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
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
    	        
    	        Cookie cookie2=new Cookie("loginId",vo.getUserId());
    	        cookie2.setPath("/");
    	        cookie2.setMaxAge(60*60*24);
    	        response.addCookie(cookie2);
    		}
    	}
    	return vo.getMsg();
    }
    
    //아이디찾기
    @RequestMapping("member/idfindemail_ok.do")
	  public String member_idfindemailok(String email) {
    	String res="";
    	try {
		  //System.out.println(email);
		  res=service.idemailFind(email);
		  //System.out.println("이메일로찾은아이디(controller):"+res);
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }
    	return res;
	  }
    
  //마이페이지 회원정보 불러오기
    @GetMapping(value = "member/update_vue.do", produces = "text/plain;charset=UTF-8")
    public String member_update(String userId) throws Exception
    {
    	MemberVO vo=service.memberUpdateDetail(userId);
    	ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
    }
    
    //마이페이지 회원정보 수정하기
    @PostMapping(value="member/update_ok_vue.do",produces = "text/plain;charset=UTF-8")
    public String member_update_ok(MemberVO vo)
    {
    	   String result=service.memberUpdate(vo);
    	   System.out.println("yes/no result값(CONTROLLER)"+result);
    	   return result;
    }
	  
}
