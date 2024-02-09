package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.MoimListVO;
import com.sist.vo.OptionVO;

@Controller
public class MoimListController {
	
	@RequestMapping("moim/list.do")
	public String moim_list() {
		
		return "moim/list";
	}
	
}
