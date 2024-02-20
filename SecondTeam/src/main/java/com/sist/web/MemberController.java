package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.service.*;
import com.sist.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	//일반회원가입 페이지 이동
	@GetMapping("member/join_u.do")
	public String member_join_u()
	{
		return "member/join_u";
	}
	//센터회원가입 페이지 이동
	@GetMapping("member/join_c.do")
	public String member_join_c()
	{
		return "member/join_c";
	}
	
	//일반 회원가입+비밀번호암호화
	@PostMapping("member/join_ok.do")
	public String member_join_ok(MemberVO vo)
	{
		vo.setPhone(vo.getPhone1()+"-"+vo.getPhone2());
		//System.out.println(vo.getUserPwd());
		String enPwd=encoder.encode(vo.getUserPwd());
		vo.setUserPwd(enPwd);
		service.memberInsert(vo);
		return "main";
	}
	//일반 회원가입+비밀번호암호화 ++1234암호화부분
	@PostMapping("member/join_ok_c.do")
	public String member_join_ok_c(MemberVO vo)
	{
		vo.setPhone(vo.getPhone1()+"-"+vo.getPhone2());
		//System.out.println(vo.getUserPwd());
		String enPwd=encoder.encode(vo.getUserPwd());
		
		//1234암호화하려고따로만듬
		//String num=encoder.encode("1234");
		//System.out.println(num);
		
		vo.setUserPwd(enPwd);
		service.memberInsertCenter(vo);
		return "main";
	}
	
	//로그인 이동
		@GetMapping("member/login.do")
		public String member_login()
		{
			return "member/login";
		}
		
		//로그아웃 이동
//		@GetMapping("member/logout.do")
//		public String member_logout(HttpSession session)
//		{
//			//세션정보 해제
//			session.invalidate();
//			return "redirect:../main/main.do";
//		}
		
		// 로그아웃 이동
		@GetMapping("member/logout.do")
		public String member_logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

			// 세션정보 해제
			session.invalidate();

			// 쿠키 삭제
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}

			return "redirect:../main/main.do";
		}
}
