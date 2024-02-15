package com.sist.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sist.dao.ProgramRcAverageDAO;
import com.sist.service.ProgramService;
import com.sist.vo.ProgramStatisticsVO;

@Component
public class ProgramManager {

	@Autowired
	private ProgramRcAverageDAO dao;
	//지역별 분포
	public List<ProgramStatisticsVO> siList(){
		
		List<ProgramStatisticsVO> list =dao.siList();
		List<ProgramStatisticsVO> newlist =new ArrayList<ProgramStatisticsVO>();
	
		for (ProgramStatisticsVO vo : list) {
				vo.setSi(vo.getSi().substring(0,2));
				
				newlist.add(vo);
		}
		
		return newlist;
	}
	
	//월별 봉사참여
	public List<ProgramStatisticsVO> monthList(){
		List<ProgramStatisticsVO>list = new ArrayList<ProgramStatisticsVO>();
		
		for(int i=1; i<=12;i++) {
			Map map =new HashMap();
			map.put("month", i);
			map.put("state", "봉사완료");
			
			int count = dao.monthCount(map);
			System.out.println("zkdns"+count);
			ProgramStatisticsVO vo = new ProgramStatisticsVO();
			vo.setMonth(i+"월");
			vo.setCount(count);
			
			list.add(vo);
			
			
		}
		
		return list;
		
	}
	//지역별 봉사참여
	public List<ProgramStatisticsVO> siCompleteList(){
		List<ProgramStatisticsVO>list = dao.siList();
		List<ProgramStatisticsVO>siCompleteList=new ArrayList<ProgramStatisticsVO>();
		for (ProgramStatisticsVO vo : list) {
			ProgramStatisticsVO sendVo =new ProgramStatisticsVO();
			int count = dao.siCompleteCount(vo);
			sendVo.setSi(vo.getSi().substring(0,2));
			sendVo.setCount(count);
			siCompleteList.add(sendVo);
		}
		
		return siCompleteList;
	}
	
	//봉사참여상태
	public List<ProgramStatisticsVO> stateList() {
		List<ProgramStatisticsVO> list = new ArrayList<ProgramStatisticsVO>();
		String state="";
		for(int i=1;i<=7;i++) {
			if(i==1) {
				state="거절";
			}
			if(i==2) {
				state="신청승인대기중";
			}
			if(i==3) {
				state="봉사활동대기중";
			}
			if(i==4) {
				state="봉사중";
			}
			if(i==5) {
				state="봉사완료";
			}
			if(i==6) {
				state="봉사인증 승인대기중";
			}
			if(i==7) {
				state="보상지급완료";
			}
			
			ProgramStatisticsVO vo = new ProgramStatisticsVO();
			int count = dao.stateCount(state);
			vo.setState(state);
			vo.setCount(count);
			list.add(vo);
		}
		
		return list;
		
	}
	
	
	
	//연령별 분포
	public List<ProgramStatisticsVO> ageTypeList(){
		List<ProgramStatisticsVO> list =new ArrayList<ProgramStatisticsVO>();
		
		
		for(int i=1; i<=6; i++) {
			int start=0;
			int end=0;
			int count =0;
			ProgramStatisticsVO vo = new ProgramStatisticsVO();
			if(i==1) {
				vo.setAgeType("10대미만");
				start=1;
				end=9;
				 count=dao.ageTypeCount(start, end);
			}
			if(i==2) {
				vo.setAgeType("10대");
				start=10;
				end=19;
				 count = dao.ageTypeCount(start, end);
			}
			if(i==3) {
				vo.setAgeType("20대");
				start=20;
				end=29;
				 count = dao.ageTypeCount(start, end);
			}
			if(i==4) {
				vo.setAgeType("30대");
				start=30;
				end=39;
				count = dao.ageTypeCount(start, end);
			}
			if(i==5) {
				vo.setAgeType("40대");
				start=40;
				end=49;
				count = dao.ageTypeCount(start, end);
			}
			if(i==6) {
				vo.setAgeType("50대이상");
				start=50;
				end=120;
				 count = dao.ageTypeCount(start, end);
			}
			
			vo.setCount(count);
			list.add(vo);
		}
		
	return list;	
	}
}
