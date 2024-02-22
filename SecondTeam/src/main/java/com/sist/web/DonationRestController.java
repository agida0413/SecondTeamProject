package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import com.sist.service.DonationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;

@RestController
@RequestMapping("donation/")
public class DonationRestController {
	@Autowired
	private DonationService service;
	
	String[] cateList= {
			"","전체","아동","어르신","장애인","다문화","지구촌","가족","시민사회","동물","환경","기타"
	};
	String[] smallcateList= {
			"","전체","문화예술","교육지원","연구조사","의료","생계","주거","인식"
	};
	
	
	@GetMapping(value="donation_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String donation_list_vue(int page,int cateno,int smallcateno) throws JsonProcessingException {
		
		// cate: 전체, small: 전체
		String d_cate=cateList[cateno];
		String d_smallcate=smallcateList[smallcateno];
		String json="";
		
		if(cateno==1) {
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=(rowSize*page);
			List<DonationVO> list=service.donationListData(start, end);
			
			final int BLOCK=10;
			int startPage=((page-1)/BLOCK*BLOCK)+1;
			int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
			int totalpage=service.donationListTotalPage();
			if(endPage>totalpage)
				endPage=totalpage;
			
			Map map=new HashMap();
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("totalpage", totalpage);
			map.put("curpage", page);
			map.put("list", list);
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(map);
		}
		else if(smallcateno==1 && cateno!=1){
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=(rowSize*page);
			
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("d_cate", d_cate);
			map.put("d_smallcate", d_smallcate);
			List<DonationVO> list=service.donationOnlyCateListData(map);
			
			final int BLOCK=10;
			int startPage=((page-1)/BLOCK*BLOCK)+1;
			int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
			int totalpage=service.donationOnlyCateListTotalPage(map);
			if(endPage>totalpage)
				endPage=totalpage;
			
			map=new HashMap();
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("totalpage", totalpage);
			map.put("curpage", page);
			map.put("list", list);
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(map);
		}
		else {
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=(rowSize*page);
			
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("d_cate", d_cate);
			map.put("d_smallcate", d_smallcate);
			List<DonationVO> list=service.donationCateListData(map);
			
			final int BLOCK=10;
			int startPage=((page-1)/BLOCK*BLOCK)+1;
			int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
			int totalpage=service.donationCateListTotalPage(map);
			if(endPage>totalpage)
				endPage=totalpage;
			
			map=new HashMap();
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("totalpage", totalpage);
			map.put("curpage", page);
			map.put("list", list);
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(map);
			
		}
		
		
		
		return json;
		
	}
	
	
	@GetMapping(value="donation_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String donation_detail_vue(int dno) throws JsonProcessingException, ParseException{
		DonationVO vo=service.donationDetailData(dno);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
		String todayFm=sdf.format(new Date(System.currentTimeMillis()));
		Date enddate=sdf.parse(vo.getD_enddate());
		Date today=sdf.parse(todayFm);
		
		
		long diffSec=(enddate.getTime() - today.getTime())/1000;
		long diffDays=diffSec / (24*60*60);
		vo.setDday(diffDays);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
}
