package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;

public interface SnsMapper {
	
	//임시보호동물게시글 5개 랜덤출력
	@Select("SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, rownum AS num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter "
			+ "FROM SNS_KEEP  ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 5 AND 9")
	public List<SnsKeepVO> snsKeepList();
	
	//sns페이지 콘텐츠 출력
	
	//sns id 목록중 4명 랜덤출력
	@Select("SELECT mno, id, name, num "
			+ "FROM (SELECT mno, id, name, rownum AS num "
			+ "FROM (SELECT mno, id, name "
			+ "FROM MEMBER WHERE TYPENO =2 ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 1 AND 4 ")
	public List<SnsIdVO> snsIdList();
}
