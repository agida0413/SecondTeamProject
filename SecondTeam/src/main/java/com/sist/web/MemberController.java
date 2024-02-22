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

import com.sist.manager.MailManager;
import com.sist.service.*;
import com.sist.vo.MemberVO;

@Controller
public class MemberController {
	//���Ϻ�����
	@Autowired
	private MailManager mm;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	//�Ϲ�ȸ������ ������ �̵�
	@GetMapping("member/join_u.do")
	public String member_join_u()
	{
		return "member/join_u";
	}
	//����ȸ������ ������ �̵�
	@GetMapping("member/join_c.do")
	public String member_join_c()
	{
		return "member/join_c";
	}
	
	//�Ϲ� ȸ������+��й�ȣ��ȣȭ
	@PostMapping("member/join_ok.do")
	public String member_join_ok(MemberVO vo)
	{
		vo.setPhone(vo.getPhone1()+"-"+vo.getPhone2());
		//System.out.println(vo.getUserPwd());
		String enPwd=encoder.encode(vo.getUserPwd());
		vo.setUserPwd(enPwd);
		service.memberInsert(vo);
		
		//���Ϻ�����
		mm.mailMemberSender(vo);
		
		return "main";
	}
	//���� ȸ������+��й�ȣ��ȣȭ ++1234��ȣȭ�κ�
	@PostMapping("member/join_ok_c.do")
	public String member_join_ok_c(MemberVO vo)
	{
		vo.setPhone(vo.getPhone1()+"-"+vo.getPhone2());
		//System.out.println(vo.getUserPwd());
		String enPwd=encoder.encode(vo.getUserPwd());
		
		//1234��ȣȭ�Ϸ�����θ���
		//String num=encoder.encode("1234");
		//System.out.println(num);
		
		vo.setUserPwd(enPwd);
		service.memberInsertCenter(vo);
		
		//���Ϻ�����
		mm.mailMemberSender(vo);
		
		return "main";
	}
	
	//�α��� �̵�
		@GetMapping("member/login.do")
		public String member_login()
		{
			return "member/login";
		}
		
		//�α׾ƿ� �̵�
//		@GetMapping("member/logout.do")
//		public String member_logout(HttpSession session)
//		{
//			//�������� ����
//			session.invalidate();
//			return "redirect:../main/main.do";
//		}
		
		// �α׾ƿ� �̵�
		@GetMapping("member/logout.do")
		public String member_logout(HttpSession session, 
				HttpServletResponse response, HttpServletRequest request) {

			// �������� ����
			session.invalidate();

			// ��Ű ����
			Cookie[] cookies=request.getCookies();
	    	if(cookies!=null)
	    	{
	    	    for(int i=0;i<cookies.length;i++)
	    	    {
	    	    	if(cookies[i].getName().equals("userId"))
	    	    	{
	    	    		cookies[i].setPath("/");
	    	    		cookies[i].setMaxAge(0);
	    	    		response.addCookie(cookies[i]);
	    	    		break;
	    	    	}
	    	    }
	    	}
			return "redirect:../main/main.do";
		}
}
