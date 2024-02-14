package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ProgramRcAverageMapper;
import com.sist.vo.ProgramStatisticsVO;
@Repository
public class ProgramRcAverageDAO {

	@Autowired
	private ProgramRcAverageMapper mapper;
	//회원별 추천
	
	
	
	//시정보
	public List<ProgramStatisticsVO> siList(){
		List<ProgramStatisticsVO> list=mapper.siList();
		List<ProgramStatisticsVO> returnList=new ArrayList<ProgramStatisticsVO>();
		for (ProgramStatisticsVO vo : list) {
			ProgramStatisticsVO returnVo=new ProgramStatisticsVO();
			
			int count=mapper.siCount(vo);
			
			returnVo.setSi(vo.getSi());
			returnVo.setCount(count);
			
			returnList.add(returnVo);
			
		}
		
		return returnList;
		
	}
	
		
		
	
		
		
		
	
}
