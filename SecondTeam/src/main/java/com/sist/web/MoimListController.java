package com.sist.web;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import com.sist.vo.MoimListVO;

@Controller
public class MoimListController {
	
	@RequestMapping("moim/list.do")
	public String moim_list() {
		
		return "moim/list";
	}
	
	@GetMapping("moim/detail.do")
	public String moim_detail(int rno,Model model)
	{
		model.addAttribute("rno",rno);
		return "moim/detail";
	}
	
	@GetMapping("moim/before_detail.do")
	public String moim_before_detail(int rno, RedirectAttributes ra,
			   HttpServletResponse response)
	{
		Cookie cookie=new Cookie("moim_"+rno, String.valueOf(rno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		ra.addAttribute("rno", rno);
		return "redirect:../moim/detail.do";
	}
	
	@GetMapping("moim/schedule.do")
	public String sns_insert() {
		
		return "moim/schedule";
	}
}
