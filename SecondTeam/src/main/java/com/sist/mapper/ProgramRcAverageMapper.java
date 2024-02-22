package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ProgramStatisticsVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;

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
	        "WHERE v_state IN ('보상지급완료', '봉사완료', '봉사인증 승인대기중','봉사중') " +
	        "AND EXTRACT(MONTH FROM V_END) = #{month}")
	public int monthCount(Map map);
	
	
	//2024 지역별 봉사완료 건수 
	@Select("SELECT COUNT(*) FROM v_program_apply " +
	        "JOIN v_program ON v_program_apply.vno = v_program.vno " +
	        "WHERE v_state IN ('보상지급완료', '봉사완료', '봉사인증 승인대기중','봉사중') " +
	        "AND si=#{si}")
	public int siCompleteCount(ProgramStatisticsVO vo);
	
	//봉사참여자 연령정보 
	@Select("SELECT COUNT(DISTINCT v_program_apply.id)  FROM v_program_apply "
			+"JOIN MEMBER ON v_program_apply.id=MEMBER.userid "
			+"WHERE v_state IN ('보상지급완료', '봉사완료', '봉사인증 승인대기중','봉사중') "
			+"AND "
			+"EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM birth) BETWEEN #{start} AND #{end}")
	public int ageTypeCount(@Param("start")int start,@Param("end")int end);
	
	
	//봉사  상태 분포 
	@Select("SELECT COUNT(*) FROM v_program_apply "
			+"WHERE v_state=#{state}"
	        )
	public int stateCount(String state);

	

	
	//추천프로그램, 추천검색어
@Results({
		
		@Result(property = "pvo.title",column = "title")
		
})
@Select("SELECT title FROM v_program_apply a JOIN V_PROGRAM b "
		+"ON a.vno=b.vno "
		+"WHERE id=#{id}" )
public List<String> recTitleData(Map map);




@Select("SELECT /*+ INDEX_DESC(b vano_pk) */ DISTINCT major_field "
		+ "    FROM v_program a "
		+ "    JOIN V_PROGRAM_apply b ON a.vno = b.vno "
		+ "    WHERE id = #{id} and collect_state='모집중'")
public List<ProgramVO> recCateData(Map map);

@Select("SELECT vno,title,si,gu,major_field FROM v_program "
		+"WHERE major_field LIKE '%'||#{mjf}||'%' "
		+"and ROWNUM=1 ")
public ProgramVO recommandList(Map map);



}
