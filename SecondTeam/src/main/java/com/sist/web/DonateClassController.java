package com.sist.web;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.commons.CommonsFunction;
import com.sist.service.DonateClassService;
import com.sist.vo.DonClassReviewVO;
import com.sist.vo.DonClassVO;

@Controller
@RequestMapping("donateclass/")
public class DonateClassController {

@Autowired
private DonateClassService service;

@Autowired
private CommonsFunction cf;
	
	@GetMapping("list.do")
	public String dcList(String type,String ss,String page,Model model) {
		String category="";
		if(page==null) {
			
			page="1";
		}
		if(type==null) {
			category="";
		}
		if(ss==null) {
			ss="";
		}
		if(type.equals("A")) {
			category="";
		}
		if(type.equals("B")) {
			category="공예";
		}
		if(type.equals("C")) {
			category="요리";
		}
		if(type.equals("D")) {
			category="미술";
		}
		if(type.equals("E")) {
			category="뷰티";
		}
		if(type.equals("F")) {
			category="체험 및 기타";
		}
		
		int curpage=Integer.parseInt(page);
		int rowsize=5;
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		
		Map map =new HashMap();
		map.put("ss", ss);
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		
		int totalpage=service.donateClassTotalPage(map);
		
		List<DonClassVO> list=service.donateClassList(map);
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK, curpage);
		int endpage=cf.endPage(BLOCK, curpage, totalpage);
		
	
		
		model.addAttribute("ss",ss);
		model.addAttribute("page",curpage);
		model.addAttribute("type",type);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("list",list);
		
		return "donateclass";
	}
	
	//쿠키저장
	@GetMapping("detail_cookie.do")
	public String  dcDetail_cookie(int dcno,HttpServletResponse response,HttpSession session,RedirectAttributes rs) {
		
		
		String mno=(String)session.getAttribute("mno");
		System.out.println(mno);
		//비로그인 예외처리 쿠키전송
		if(mno!=null) {
			Cookie cookie=new Cookie(mno+"_dcno_"+dcno,String.valueOf(dcno) );
			 cookie.setPath("/");
	         cookie.setMaxAge(60*60*24);
	         response.addCookie(cookie);
		}
		rs.addAttribute("dcno",dcno);
		return "redirect:../donateclass/detail.do";
		
	}
	
	@GetMapping("detail.do")
	public String dcDetail(int dcno,Model model,HttpSession session) {
		DonClassVO vo = service.classDetailData(dcno);
		List<String> subImgList= service.classSubimageList(dcno);
		
		 DecimalFormat df = (DecimalFormat) NumberFormat.getCurrencyInstance(Locale.KOREA); // 원화 형식으로 DecimalFormat 생성
	        String formattedPrice = df.format(vo.getGoal_price()); // 포맷 적용
	        
	        String id=(String)session.getAttribute("id");
	        String state="NO";
	        if(id!=null) {
				Map map =new HashMap();
				map.put("id", id);
				map.put("dcno", dcno);
				
				int count =service.getWishCount(map);
				
				if(count==0) {
					map.put("state", "NO");
					service.insertWishList(map);
					state="NO";
				}
				else {
					state =service.getWishState(map);
				}
			}
	      
		model.addAttribute("subImglist",subImgList);
		model.addAttribute("vo",vo);
		model.addAttribute("formattedPrice",formattedPrice);
		model.addAttribute("state",state);
		
		
		return "donateclass/detail";
		
	}
	
	@GetMapping("newclass.do")
	public String newprogram() {
		return "donateclass/newclass";
	}
	
	
	
}
