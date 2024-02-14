package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.commons.CommonsFunction;
import com.sist.service.DonateClassService;
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
		
		int Acount=service.donateClassCategoryCount("");
		int Bcount=service.donateClassCategoryCount("공예");
		int Ccount=service.donateClassCategoryCount("요리");
		int Dcount=service.donateClassCategoryCount("미술");
		int Ecount=service.donateClassCategoryCount("뷰티");
		int Fcount=service.donateClassCategoryCount("체험 및 기타");
		
		model.addAttribute("ss",ss);
		model.addAttribute("page",curpage);
		model.addAttribute("type",type);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("list",list);
		model.addAttribute("Acount",Acount);
		model.addAttribute("Bcount",Bcount);
		model.addAttribute("Ccount",Ccount);
		model.addAttribute("Dcount",Dcount);
		model.addAttribute("Ecount",Ecount);
		model.addAttribute("Fcount",Fcount);
		return "donateclass";
	}
	
	
	
}
