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

import com.sist.service.ProgramService;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;

@Aspect
@Component
public class ProgramAOP {
@Autowired
private ProgramService service;

@After("execution(* com.sist.web.ProgramController*.*(..))")
public void recSend() {
	  HttpServletRequest request=((ServletRequestAttributes)
			    RequestContextHolder.getRequestAttributes()).getRequest();
	  HttpSession session=request.getSession();
	  String id= (String)session.getAttribute("id");
	  
	  Map map=new HashMap();
	  map.put("id", id);
	 if(id!=null) {
		 List<ProgramVO>list=service.recommandList(map);
			for (ProgramVO programVO : list) {
				System.out.println(programVO.getTitle());
			}
			request.setAttribute("recList", list);
			request.setAttribute("size", list.size());
	 }

}
}
