package com.sist.web;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		mm.mailUserMemberSender(vo);
		
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
		mm.mailCenterMemberSender(vo);
		
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
		
		
	//��й�ȣ ã��� �̵�
	@GetMapping("member/login_pwdfind.do")
	public String member_login_pwdfind()
	{
		return "member/login_pwdfind";
	}
	
	//�ӽ� ��й�ȣ ���� ����
	 @RequestMapping("member/pwdfind_ok.do")
	  public void member_pwdfindok(HttpServletRequest request,
			  HttpServletResponse response) {

		  String id=request.getParameter("id");
		  String email=request.getParameter("email");
		  // �ӽú�� ����
		  Random rand=new Random();
		  // 4�ڸ��� 1000~9999 +++ ��ȣȭ
		  String x = String.valueOf(rand.nextInt(9000) + 1000);
		  String t = encoder.encode(x);
		  //System.out.println(t);
		  //System.out.println(x);
		  String res = service.pwdFind(id,email,t);
		  // id, email ������ �ӽú�� ������ ����
		  if(res.equals("SEND")) {
			  mm.TempPwdMailSend(email, x);
		  }
		  try {
			  PrintWriter out=response.getWriter();
			  out.write(res);
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }
	  }
	 
	//���̵� ã��� �̵�
	@GetMapping("member/login_idfind.do")
	public String member_login_idfind()
	{
		return "member/login_idfind";
	}
}
