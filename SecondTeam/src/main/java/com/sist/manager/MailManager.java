package com.sist.manager;

import java.io.FileReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.sist.vo.MemberVO;

@Component
public class MailManager {
	
	//일반 회원가입시 메일 전송됨
	public void mailUserMemberSender(MemberVO vo)
	{
		String temp="";
		try
		{
            FileReader fr=new FileReader("c:\\springDev\\mail.txt");
            int i=0;
            while((i=fr.read())!=-1)
            {
            	temp+=String.valueOf((char)i);
            }
		}catch(Exception ex) {}
		
		String host="smtp.naver.com";
		String user="officeight@naver.com";
		String password=temp;
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		
		Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			String html="<html>"
	       		     +"<head>"
	       		     +"</head>"
	       		     +"<body style=\"background-color:#c8c8c8;\">"
	       		     + "<div style=\"width:500px; margin:100px auto;\">"
	       		     + "<h1 "
	       		     + "style=\"text-align: center; border-bottom: 2px solid #444; padding-bottom:50px; color:#444;\""
	       		     + ">"+vo.getUserName()+"님의 가입을 환영합니다!</h1>"
	       		     +"<div style=\"padding:50px;\">"
	       		     + "<p style=\"color:#444;\">저희 000은 공익추구 사이트이며 ,국민들의 봉사의식,도움정신을 촉진시키고자 노력합니다."
	       		     + " 기존 방식(시간인증,봉사시간 획득) 목적 도움, 봉사에서 다른 방법을 통해 봉사,헌신,도움 의식을 촉진시키고자 노력하겠습니다.</p>"
	       		     +"</div>"
	       		     +"<div style=\"padding:50px;\">"
	       		     + "<p style=\"color:#999;\">가입 이메일 : "+vo.getEmail()+"</p>"
	       		     + "<p style=\"color:#999;\">가입 전화번호 : "+vo.getPhone()+"</p>"
	       		     +"</div>"
	       		     + "</div>" //
	       		     +"</body>"
	       		     +"</html>";
			
			MimeMessage message=new MimeMessage(session);
        	message.setFrom(new InternetAddress(user));
        	
        	message.setContent(html,"text/html;charset=UTF-8");
        	message.addRecipient(Message.RecipientType.TO, 
        			new InternetAddress(vo.getEmail()));
        	message.setSubject("회원 가입을 축하합니다!");
        	Transport.send(message);
        	System.out.println("메일 전송 완료!!");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//센터 회원가입시 메일 전송됨
		public void mailCenterMemberSender(MemberVO vo)
		{
			String temp="";
			try
			{
	            FileReader fr=new FileReader("c:\\springDev\\mail.txt");
	            int i=0;
	            while((i=fr.read())!=-1)
	            {
	            	temp+=String.valueOf((char)i);
	            }
			}catch(Exception ex) {}
			
			String host="smtp.naver.com";
			String user="officeight@naver.com";
			String password=temp;
			Properties props=new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.auth", true);
			
			Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			
			try {
				String html="<html>"
		       		     +"<head>"
		       		     +"</head>"
		       		     +"<body style=\"background-color:#c8c8c8;\">"
		       		     + "<div style=\"width:500px; margin:100px auto;\">"
		       		     + "<h1 "
		       		     + "style=\"text-align: center; border-bottom: 2px solid #444; padding-bottom:50px; color:#444;\""
		       		     + ">"+vo.getCenterName()+"님의 가입을 환영합니다!</h1>"
		       		     +"<div style=\"padding:50px;\">"
		       		     + "<p style=\"color:#444;\">저희 000은 공익추구 사이트이며 ,국민들의 봉사의식,도움정신을 촉진시키고자 노력합니다."
		       		     + " 기존 방식(시간인증,봉사시간 획득) 목적 도움, 봉사에서 다른 방법을 통해 봉사,헌신,도움 의식을 촉진시키고자 노력하겠습니다.</p>"
		       		     +"</div>"
		       		     +"<div style=\"padding:50px;\">"
		       		     + "<p style=\"color:#999;\">가입 이메일 : "+vo.getEmail()+"</p>"
		       		     + "<p style=\"color:#999;\">가입 전화번호 : "+vo.getPhone()+"</p>"
		       		     +"</div>"
		       		     + "</div>" //
		       		     +"</body>"
		       		     +"</html>";
				
				MimeMessage message=new MimeMessage(session);
	        	message.setFrom(new InternetAddress(user));
	        	
	        	message.setContent(html,"text/html;charset=UTF-8");
	        	message.addRecipient(Message.RecipientType.TO, 
	        			new InternetAddress(vo.getEmail()));
	        	message.setSubject("회원 가입을 축하합니다!");
	        	Transport.send(message);
	        	System.out.println("메일 전송 완료!!");
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		
	//임시 비밀번호 발급
	public void TempPwdMailSend(String toEmail, String tempPwd)
	{
		String temp="";
		try
		{
            FileReader fr=new FileReader("c:\\springDev\\mail.txt");
            int i=0;
            while((i=fr.read())!=-1)
            {
            	temp+=String.valueOf((char)i);
            }
		}catch(Exception ex) {}
		
		String host="smtp.naver.com";
		String user="officeight@naver.com";
		String password=temp;
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		
		Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
    	
    	String html="<html>"
      		     +"<head>"
      		     +"</head>"
      		     +"<body style=\"background-color:#c8c8c8;\">"
      		     + "<div style=\"width:500px; margin:100px auto;\">"
      		     +"<h3>임시비밀번호는 <b>"+tempPwd+"</b>"
      		     +"입니다.</h3>"
       		     +"<h3>임시비밀번호로 로그인 후 비밀번호를 변경해주세요!</h3>"
      		     + "</div>" 
      		     +"</body>"
      		     +"</html>";
    	
    	MimeMessage message=new MimeMessage(session);
    	message.setFrom(new InternetAddress(user));
    	message.setContent(html,"text/html;charset=UTF-8");
    	message.addRecipient(Message.RecipientType.TO, 
    			new InternetAddress(toEmail));
    	
    	message.setSubject("임시 비밀번호 입니다.");
    	Transport.send(message);
    	System.out.println("임시비밀번호 메일 전송 완료!!");
    	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}
