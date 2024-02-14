package com.sist.manager;

import java.util.List;

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
		return dao.siList();
	}
}
