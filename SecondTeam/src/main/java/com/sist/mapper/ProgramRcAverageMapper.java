package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
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
	
	//달 별 봉사완료 건수 
	
	@Select("SELECT COUNT(*) FROM v_program_apply " +
	        "JOIN v_program ON v_program_apply.vno = v_program.vno " +
	        "WHERE v_state IN ('보상지급완료', '봉사완료', '봉사인증 승인대기중') " +
	        "AND EXTRACT(MONTH FROM V_END) = #{month}")
	public int monthCount(Map map);
	
	
	//2024 지역별 봉사완료 건수 
	@Select("SELECT COUNT(*) FROM v_program_apply " +
	        "JOIN v_program ON v_program_apply.vno = v_program.vno " +
	        "WHERE v_state IN ('보상지급완료', '봉사완료', '봉사인증 승인대기중') " +
	        "AND si=#{si}")
	public int siCompleteCount(ProgramStatisticsVO vo);
	
	//봉사중/봉사완료자 연령정보 
	
	
	
}
