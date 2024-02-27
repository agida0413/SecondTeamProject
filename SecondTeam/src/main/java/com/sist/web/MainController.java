package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.MoimListDAO;
import com.sist.service.DonateClassService;
import com.sist.vo.DonClassVO;
import com.sist.vo.MoimListVO;
import org.springframework.ui.Model;
@Controller
public class MainController {

	@Autowired
	private MoimListDAO mdao;
	
	@Autowired
	private DonateClassService dService;
	@RequestMapping("main/main.do")
	public String main_main(Model model) {
		
		List<MoimListVO> mlist=mdao.moimMainData();
		model.addAttribute("mlist",mlist);
		
		List<DonClassVO>dcList=dService.mainDonclassData();
		model.addAttribute("dcList",dcList);
		//System.out.println(mlist);
		return"main";
	}
}
