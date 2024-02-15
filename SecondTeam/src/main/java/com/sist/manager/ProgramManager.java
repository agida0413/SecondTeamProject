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
	
	public List<ProgramStatisticsVO> siList(){
		
		List<ProgramStatisticsVO> list =dao.siList();
		List<ProgramStatisticsVO> newlist =new ArrayList<ProgramStatisticsVO>();
		
		for (ProgramStatisticsVO vo : list) {
				vo.setSi(vo.getSi().substring(0,2));
				
				newlist.add(vo);
		}
		
		return newlist;
	}
	
	
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
}
