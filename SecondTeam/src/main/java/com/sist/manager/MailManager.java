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
	
	//�Ϲ� ȸ�����Խ� ���� ���۵�
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
	       		     + ">"+vo.getUserName()+"���� ������ ȯ���մϴ�!</h1>"
	       		     +"<div style=\"padding:50px;\">"
	       		     + "<p style=\"color:#444;\">���� 000�� �����߱� ����Ʈ�̸� ,���ε��� �����ǽ�,���������� ������Ű���� ����մϴ�."
	       		     + " ���� ���(�ð�����,����ð� ȹ��) ���� ����, ���翡�� �ٸ� ����� ���� ����,���,���� �ǽ��� ������Ű���� ����ϰڽ��ϴ�.</p>"
	       		     +"</div>"
	       		     +"<div style=\"padding:50px;\">"
	       		     + "<p style=\"color:#999;\">���� �̸��� : "+vo.getEmail()+"</p>"
	       		     + "<p style=\"color:#999;\">���� ��ȭ��ȣ : "+vo.getPhone()+"</p>"
	       		     +"</div>"
	       		     + "</div>" //
	       		     +"</body>"
	       		     +"</html>";
			
			MimeMessage message=new MimeMessage(session);
        	message.setFrom(new InternetAddress(user));
        	
        	message.setContent(html,"text/html;charset=UTF-8");
        	message.addRecipient(Message.RecipientType.TO, 
        			new InternetAddress(vo.getEmail()));
        	message.setSubject("ȸ�� ������ �����մϴ�!");
        	Transport.send(message);
        	System.out.println("���� ���� �Ϸ�!!");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//���� ȸ�����Խ� ���� ���۵�
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
		       		     + ">"+vo.getCenterName()+"���� ������ ȯ���մϴ�!</h1>"
		       		     +"<div style=\"padding:50px;\">"
		       		     + "<p style=\"color:#444;\">���� 000�� �����߱� ����Ʈ�̸� ,���ε��� �����ǽ�,���������� ������Ű���� ����մϴ�."
		       		     + " ���� ���(�ð�����,����ð� ȹ��) ���� ����, ���翡�� �ٸ� ����� ���� ����,���,���� �ǽ��� ������Ű���� ����ϰڽ��ϴ�.</p>"
		       		     +"</div>"
		       		     +"<div style=\"padding:50px;\">"
		       		     + "<p style=\"color:#999;\">���� �̸��� : "+vo.getEmail()+"</p>"
		       		     + "<p style=\"color:#999;\">���� ��ȭ��ȣ : "+vo.getPhone()+"</p>"
		       		     +"</div>"
		       		     + "</div>" //
		       		     +"</body>"
		       		     +"</html>";
				
				MimeMessage message=new MimeMessage(session);
	        	message.setFrom(new InternetAddress(user));
	        	
	        	message.setContent(html,"text/html;charset=UTF-8");
	        	message.addRecipient(Message.RecipientType.TO, 
	        			new InternetAddress(vo.getEmail()));
	        	message.setSubject("ȸ�� ������ �����մϴ�!");
	        	Transport.send(message);
	        	System.out.println("���� ���� �Ϸ�!!");
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		
	//�ӽ� ��й�ȣ �߱�
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
      		     +"<h3>�ӽú�й�ȣ�� <b>"+tempPwd+"</b>"
      		     +"�Դϴ�.</h3>"
       		     +"<h3>�ӽú�й�ȣ�� �α��� �� ��й�ȣ�� �������ּ���!</h3>"
      		     + "</div>" 
      		     +"</body>"
      		     +"</html>";
    	
    	MimeMessage message=new MimeMessage(session);
    	message.setFrom(new InternetAddress(user));
    	message.setContent(html,"text/html;charset=UTF-8");
    	message.addRecipient(Message.RecipientType.TO, 
    			new InternetAddress(toEmail));
    	
    	message.setSubject("�ӽ� ��й�ȣ �Դϴ�.");
    	Transport.send(message);
    	System.out.println("�ӽú�й�ȣ ���� ���� �Ϸ�!!");
    	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}
