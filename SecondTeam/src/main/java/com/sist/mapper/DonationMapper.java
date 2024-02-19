package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface DonationMapper {
	// 메인홈 데이터
	@Select("SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent "
			+ "FROM donation_list ORDER BY dno ASC) "
			+ "WHERE rownum<5 ")
	public List<DonationVO> homeDonationListData();
	
	// 목록출력
	@Select("SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,num "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum as num "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum "
			+ "FROM donation_list ORDER BY dno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DonationVO> donationListData(@Param("start") int start, @Param("end") int end);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM donation_list")
	public int donationListTotalPage();
	
	// 카테고리별 목록(대분류,소분류)
	@Select("SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,num "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum as num "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum "
			+ "FROM donation_list "
			+ "WHERE d_cate LIKE '%'||#{d_cate}||'%' AND d_smallcate LIKE '%'||#{d_smallcate}||'%' "
			+ "ORDER BY dno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DonationVO> donationCateListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM donation_list "
			+ "WHERE d_cate LIKE '%'||#{d_cate}||'%' AND d_smallcate LIKE '%'||#{d_smallcate}||'%'")
	public int donationCateListTotalPage(Map map);
	
	// 카테고리별 목록(대분류만 소분류는 전체)
	@Select("SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,num "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum as num "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum "
			+ "FROM donation_list "
			+ "WHERE d_cate LIKE '%'||#{d_cate}||'%' "
			+ "ORDER BY dno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DonationVO> donationOnlyCateListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM donation_list "
			+ "WHERE d_cate LIKE '%'||#{d_cate}||'%'")
	public int donationOnlyCateListTotalPage(Map map);
	
	
	
	// 디테일 출력
	@Select("SELECT * FROM donation_list "
			+ "WHERE dno=#{dno}")
	public DonationVO donationDetailData(int dno);
	
	@Update("UPDATE donation_list SET d_hit=d_hit+1 "
			+ "WHERE dno=#{dno}")
	public void donationHitIncrement(int dno);
	
	
}
