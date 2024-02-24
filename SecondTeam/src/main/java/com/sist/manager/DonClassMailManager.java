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

import com.sist.vo.DonClassVO;
import com.sist.vo.MemberVO;
@Component
public class DonClassMailManager {
	
	public void sendMail(String email,DonClassVO vo) {
	String temp="";
	
	try
	{ 
//       FileReader fr=new FileReader("C:\\SpringDev\\mail.txt");
//        System.out.println("실행");
//        int i=0;
//        while((i=fr.read())!=-1)
//        { 
//        	temp+=String.valueOf((char)i);
//        }
     
      
	}catch(Exception ex) {}
    String host="smtp.naver.com";
    String user="agida0413@naver.com";
    String password="rla!87188718";
  
    Properties props=new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", 587);
    props.put("mail.smtp.auth", "true");
    
    Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator() {
    	  protected PasswordAuthentication getPasswordAuthentication() {
    		  return new PasswordAuthentication(user, password);
    	  }
    });
    try
    {	
    	
    	String html = String.format("<div class=\"blog-entry d-flex blog-entry-search-item\">" +
    	        "<img src=\"%s\" alt=\"Image\" class=\"img-fluid\">" +
    	        "<div>" +
    	        "<span class=\"date\" style=\"margin-left:5px;\">%s &bullet; %s  | &nbsp;%s</span>" +
    	        "<h2 style=\"margin-left:5px; margin-top:5px;\" class=\"overff\">%s</h2>" +
    	        "<table class=\"table\">" +
    	        "<tr style=\" font-weight:bold;\">" +
    	        "<td style=\"border:none;\">예약인원</td>" +
    	        "<td style=\"border:none; color:gray;\">%d 명</td>" +
    	        "<td style=\"border:none;\">차감 wing</td>" +
    	        "<td style=\"color:gray; border:none;\">%d wing</td>" +
    	        "</tr>" +
    	        "<tr style=\" font-weight:bold;\">" +
    	        "<td style=\"border:none;\">예약일</td>" +
    	        "<td style=\"border:none;color:gray;\">%s</td>" +
    	        "<td style=\"border:none;\">예약 상태</td>" +
    	        "<td style=\"color:gray; border:none;\">%s</td>" +
    	        "</tr>" +
    	        "<tr style=\" font-weight:bold;\">" +
    	        "<td style=\"border:none;\">수업일</td>" +
    	        "<td style=\"border:none;color:gray;\">%s</td>" +
    	        "</tr>" +
    	        "<tr></tr>" +
    	        "</table>" +
    	        "<div style=\"margin-top:5px;\"></div>" +
    	        "</div>" +
    	        "</div>",
    	        vo.getImage(),
    	        vo.getAddress(),
    	        vo.getCategory(),
    	        vo.getId(),
    	        vo.getName(),
    	        vo.getHvo().getRnum(),
    	        vo.getHvo().getWing(),
    	        vo.getHvo().getDbRdate(),
    	        vo.getHvo().getState(),
    	        vo.getHvo().getCdate());

    
    	
    	MimeMessage message=new MimeMessage(session);
    	message.setFrom(new InternetAddress(user));
    	
    	message.setContent(html,"text/html;charset=UTF-8");
    	message.addRecipient(Message.RecipientType.TO, 
    			new InternetAddress(email));
    	message.setSubject("재능기부 원데이클래스 예약내역");
    	Transport.send(message);
    	
    	
    }catch(Exception ex) {ex.printStackTrace();}
}

}
