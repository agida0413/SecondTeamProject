package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.ProgramStatisticsVO;

public interface ProgramRcAverageMapper {

	//회원별 추천
	
	
	
	
	//통계정보
	
	//시정보
	@Select("SELECT DISTINCT SI FROM V_PROGRAM ")
public List<ProgramStatisticsVO> siList();
	
	@Select("SELECT count(*) FROM v_program "
			+"WHERE si=#{si}")
	public int siCount(ProgramStatisticsVO vo);
	
	
	
}
