package com.sist.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sist.service.ProgramService;
@Configuration
@EnableScheduling
public class TaskConfig {

	@Autowired
	private ProgramService pService;
	@Scheduled(cron = "0 0 12 * * ?")
	    public void runAtNoon() {
		 	
		 	
		 
		
		//VNO 리스트
		 //봉사시작일과 오늘날짜가 같은거 가지고옴
		 List<Integer> vnoList=pService.updateRunStVnoList();
		 
		 //int vno로 순회하면서 #{vno} 와 스테이트가 #{봉사대기중} 인거 업데이트 
		 
		 for (int vno : vnoList) {
			 Map map= new HashMap();
			 map.put("vno", vno);
			 map.put("up", "봉사중");
			 map.put("wh", "봉사활동 대기중");
			
			 	pService.updateRunSt(map);
		 	}
		 
		 
		 
		//VNO 리스트
		 //봉사종료일과 오늘날짜가 같은거 가지고옴
		 List<Integer> vnoEndList=pService.updateEndStVnoList();
		 
		 //int vno로 순회하면서 #{vno} 와 스테이트가 #{봉사대기중} 인거 업데이트 
		 
		 for (int vno : vnoEndList) {
			
			 Map map= new HashMap();
			 map.put("vno", vno);
			 map.put("up", "봉사완료");
			 map.put("wh", "봉사중");
			 	pService.updateEndSt(map);
		 	}
		 
		 
		 System.out.println("업데이트완료");
	    }
	 
	 
}
