package com.sist.aop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sist.service.DonateClassService;
import com.sist.vo.DonClassVO;

@Aspect
@Component
public class DonateClassAOP {

	@Autowired
	private DonateClassService service;
	
	  @After("execution(* com.sist.web.*DonateClassController.*(..))")
	   public void footerSend()
	   {
		   
			int Acount=service.donateClassCategoryCount("");
			int Bcount=service.donateClassCategoryCount("공예");
			int Ccount=service.donateClassCategoryCount("요리");
			int Dcount=service.donateClassCategoryCount("미술");
			int Ecount=service.donateClassCategoryCount("뷰티");
			int Fcount=service.donateClassCategoryCount("체험 및 기타"); 
		  
			
			
		   HttpServletRequest request=((ServletRequestAttributes)
				    RequestContextHolder.getRequestAttributes()).getRequest();
		   request.setAttribute("Acount",Acount);
			request.setAttribute("Bcount",Bcount);
			request.setAttribute("Ccount",Ccount);
			request.setAttribute("Dcount",Dcount);
			request.setAttribute("Ecount",Ecount);
			request.setAttribute("Fcount",Fcount);
			
			HttpSession session=request.getSession();
			String mno=(String)session.getAttribute("mno");
			
			 Cookie[] cookies=request.getCookies();
		  
			 List<DonClassVO> list=new ArrayList<DonClassVO>();
			  if(cookies!=null) {
	               int  count =0;
	               for(int i=cookies.length-1;i>=0;i--) {
	                  
	                  if (cookies[i].getName().startsWith(mno+"_dcno_")) {
	                     String cvalue=cookies[i].getValue();
	                     
	                     int cpno=Integer.parseInt(cvalue);
	                     DonClassVO vo=service.cookieList(cpno);
	                    
	                  
	                     
	                     list.add(vo);
	                     count ++;
	                     
	                     
	                    
	                     if(count==3) {
	                        break;
	                     }
	                     
	                  }   
	               }
	               }
			 
			  request.setAttribute("clist", list);
			  request.setAttribute("csize", list.size());
		
				   
	   }
	
}
