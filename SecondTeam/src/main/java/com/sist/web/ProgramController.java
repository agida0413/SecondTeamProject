package com.sist.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.commons.CommonsFunction;
import com.sist.manager.ProgramManager;
import com.sist.service.MypageService;
import com.sist.service.ProgramService;
import com.sist.vo.OptionVO;
import com.sist.vo.ProgramStatisticsVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;
import com.sist.vo.WishListVO;

@Controller
public class ProgramController {

	@Autowired
	private ProgramService service;
	
	@Autowired 
	private MypageService mService;
	
	@Autowired
	private CommonsFunction cf;
	
	@Autowired
	private ProgramManager mgr;
	@GetMapping("program/list.do")
	public String programList(OptionVO vo,Model model) {
		
		if(vo.getMajor_option()==null) {
			vo.setMajor_option("");
		}
		if(vo.getState()==null) {
			vo.setState("");
		}
		if(vo.getCity()==null) {
			vo.setCity("");
		}
		if(vo.getMinor_option()==null) {
			vo.setMinor_option("");
		}
		List<OptionVO> sList=service.stateOption();
		
		List<OptionVO> mjList=service.majorOption();
		
		
		model.addAttribute("ovo",vo);
		model.addAttribute("sList",sList);
		model.addAttribute("mjList",mjList);
		model.addAttribute("cate","list");
		return "program";
	}
	
	
	@GetMapping("program/detail.do")
	public String programDetail(int vno,Model model,HttpSession session) {
		
		ProgramVO vo=service.programDetailData(vno);
		String state="";
		String id=(String)session.getAttribute("id");
		
		if(id!=null) {
			Map map =new HashMap();
			map.put("id", id);
			map.put("vno", vno);
			
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
		model.addAttribute("vo",vo);	
		model.addAttribute("cate","list");
		model.addAttribute("state",state);
		return "program/detail";
	}
	
	
	@GetMapping("program/apply.do")
	public String programApply(int vno,HttpSession session,Model model) {
		ProgramVO vo=service.programDetailData(vno);
		String id=(String)session.getAttribute("id");
		model.addAttribute("vo",vo);
		model.addAttribute("cate","list");
		
		return "program/apply";
		
	}
	
	
	
	
		@GetMapping("program/applyList.do")
	public String programApplyList(HttpSession session,Model model) {
		
		
		model.addAttribute("cate","applyList");
		
		
		return "program/applyList";
		
	}
	//프로그램 자료실
	
	  @GetMapping("program/databoardList.do")
	   public String databoard_list(Model model)
	   {
		  model.addAttribute("cate","databoard");
		   return "program/databoardList";
	   }
	   @GetMapping("program/databoardInsert.do")
	   public String databoard_insert(Model model)
	   {	
		   model.addAttribute("cate","databoard");
		   return "program/databoardInsert";
	   }
	   @GetMapping("program/databoardDetail.do")
	   public String databoard_detail(int dno,Model model)
	   {
		   model.addAttribute("dno" ,dno);
		   model.addAttribute("cate","databoard");
		   return "program/databoardDetail";
	   }
	
	
	//인증신청리스트
	   
	   @GetMapping("program/accessCertify.do")
		public String programCertify(Model model) {
			
			model.addAttribute("cate","accessCertify");
			
			
			return "program/accessCertify";
		}
	   
	   @GetMapping("program/accessCertifyDetail.do")
	 		public String accessCertifyDetail(Model model,int vano) {
	 		
	 			model.addAttribute("cate","accessCertify");
	 			model.addAttribute("vano",vano);
	 			
	 			return "program/accessCertifyDetail";
	 		}
	   
	 
		//통계정보
	   
	   @GetMapping("program/statistics.do")
	   public String statistics(String type,Model model) {
		   List<ProgramStatisticsVO> siList =mgr.siList();
		   List<ProgramStatisticsVO> monthList=mgr.monthList();
		   List<ProgramStatisticsVO> siCompleteList=mgr.siCompleteList();
		   List<ProgramStatisticsVO> stateList=mgr.stateList();
		   List<ProgramStatisticsVO> ageTypeList=mgr.ageTypeList();
		   
		   int sListTotal=0;
		   int monthListTotal=0;
		   int siCompleteListTotal=0;
		   int stateTotal=0;
		   int ageTypeTotal=0;
		   
		   for (ProgramStatisticsVO svo : siList) {
			sListTotal+=svo.getCount();
		   }
		   for (ProgramStatisticsVO svo : monthList) {
				monthListTotal+=svo.getCount();
			   }
		   for (ProgramStatisticsVO svo : siCompleteList) {
				siCompleteListTotal+=svo.getCount();
			   }
		   
		   for (ProgramStatisticsVO svo : stateList) {
			   stateTotal+=svo.getCount();
		   }
		   
		   for(ProgramStatisticsVO svo : ageTypeList) {
			   ageTypeTotal+=svo.getCount();
		   }
		   
		   
		   model.addAttribute("siList",siList);
		   model.addAttribute("monthList",monthList);
		   model.addAttribute("siCompleteList",siCompleteList);
		   model.addAttribute("cate","statistics");
		   model.addAttribute("stateList",stateList);
		   model.addAttribute("ageTypeList",ageTypeList);
		   
		   model.addAttribute("ageTypeTotal",ageTypeTotal);
		   model.addAttribute("stateTotal",stateTotal);
		   model.addAttribute("sListTotal",sListTotal);
		   model.addAttribute("monthListTotal",monthListTotal);
		   model.addAttribute("siCompleteListTotal",siCompleteListTotal);
		   
		   model.addAttribute("type",type);
		   return "program/statistics";
	   }
	   
	
}
