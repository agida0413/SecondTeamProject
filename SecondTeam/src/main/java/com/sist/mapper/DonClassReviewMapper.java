package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.DonClassReviewVO;
import com.sist.vo.DonClassVO;

public interface DonClassReviewMapper {

	
	@Select("SELECT COUNT(*) FROM REVIEW "
			+"WHERE objno=#{objno}")
	public int reviewNum(DonClassReviewVO vo);
	
	@Select("SELECT NVL(SUM(score),0.0) FROM REVIEW "
			+"WHERE objno=#{objno}")
	public int reviewTotal(DonClassReviewVO vo);
	
	
	@Update("UPDATE donate_class SET "
			+"score=#{score} "
			+"WHERE dcno=#{dcno}")
	public void updateClassScore(DonClassVO vo);
	
	@Insert("INSERT INTO review VALUES("
			+"REVIEW_SEQ.nextval,#{objno},#{id},sysdate,#{content},#{filename},#{score},#{typeno},#{name},#{imagetype})")
	public void insertReview(DonClassReviewVO vo);
	
	
	
}
