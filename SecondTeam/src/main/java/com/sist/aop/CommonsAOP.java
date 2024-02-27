package com.sist.aop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.sist.vo.ProgramVO;

@Aspect
@Component
public class CommonsAOP {

	@Autowired
	private DonateClassService dService;
	
	@After("execution(* com.sist.web.*Controller.*(..))")
	public void commonsFooterSend() {
		  HttpServletRequest request=((ServletRequestAttributes)
				    RequestContextHolder.getRequestAttributes()).getRequest();
		
		  
		  DonClassVO dcVo = dService.footerDonclassAopData();
		  
		  request.setAttribute("dcvo", dcVo);
		  

	}
}
