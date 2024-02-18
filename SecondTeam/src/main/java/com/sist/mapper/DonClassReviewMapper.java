package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.DonClassReviewVO;
import com.sist.vo.DonClassVO;

public interface DonClassReviewMapper {

	
	@Select("SELECT COUNT(*) FROM REVIEW "
			+"WHERE objno=#{objno}")
	public int reviewNum(DonClassReviewVO vo);
	
	@Select("SELECT NVL(SUM(score), 0.0) FROM REVIEW "
			+"WHERE objno=#{objno}")
	public double reviewTotal(DonClassReviewVO vo);
	
	
	@Update("UPDATE donate_class SET "
			+"score=#{score} "
			+"WHERE dcno=#{dcno}")
	public void updateClassScore(DonClassVO vo);
	
	@Insert("INSERT INTO review VALUES("
			+"REVIEW_SEQ.nextval,#{objno},#{id},sysdate,#{content},#{filename},#{score},#{typeno},#{name},#{imagetype})")
	public void insertReview(DonClassReviewVO vo);
	
	
	@Select("SELECT revno,objno,id,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbDay,content,filename,score,typeno,name,imagetype,num "
			+"FROM(SELECT revno,objno,id,regdate,content,filename,score,typeno,name,imagetype,rownum as num "
			+"FROM(SELECT /*+INDEX(REVIEW ${index})*/revno,objno,id,regdate,content,filename,score,typeno,name,imagetype "
			+"FROM REVIEW "
			+"WHERE objno=#{dcno} AND typeno=#{typeno} AND revno>0 ${msg})) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<DonClassReviewVO> reviewList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM REVIEW "
			+"WHERE objno=#{dcno} AND "
			+"typeno=#{typeno}")
	public int reviewTotalpage(Map map);
	
	
	
	
	
	//삭제
	
	@Delete("DELETE FROM REVIEW "
			+"WHERE revno=#{revno}")
	public void deleteReview(DonClassReviewVO vo);
	
	//파일정보
	@Select("SELECT filename FROM REVIEW "
			+"WHERE revno=#{revno}")
	public String getFilename(DonClassReviewVO vo);
	
}
