package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;

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
	
	// 구매관련
	// 트랜잭션 예정 (결제내역테이블에 저장, 후원금만큼 캠페인테이블에 현재후원금 증가, 현재후원금에 따른 퍼센트 증가)
	// 결제내역 테이블에 추가
	@Insert("INSERT INTO donation_pay VALUES(dp_payno_seq.nextval,#{price},#{dno},#{userid},SYSDATE)")
	public void donationPayInsert(DonationPayVO vo);
	
	// 현재후원금 증가
	@Update("UPDATE donation_list SET "
			+ "d_now=d_now+#{price} "
			+ "WHERE dno=#{dno}")
	public void donationPayNowUpdate(DonationPayVO vo);
	
	// 퍼센트 증가
	@Update("UPDATE donation_list SET "
			+ "d_nowpercent=(SELECT TRUNC(d_now*100/REGEXP_REPLACE(d_goal,'[^0-9]','')) "
			+ "FROM (SELECT d_now,d_goal FROM donation_list "
			+ "WHERE dno=#{dno})) WHERE dno=#{dno}")
	public void donationPayPercentUpdate(int dno);
	
	// 참여내역 리스트 출력
	@Select("SELECT payno,price,dno,userid,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,num "
			+ "FROM (SELECT payno,price,dno,userid,regdate,rownum as num "
			+ "FROM (SELECT payno,price,dno,userid,regdate "
			+ "FROM donation_pay "
			+ "WHERE dno=#{dno} ORDER BY payno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DonationPayVO> donationPayListData(Map map);
	
	// 참여내역 리스트 총페이지
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM donation_pay "
			+ "WHERE dno=#{dno}")
	public int donationPayTotalPage(int dno);
	
	// 관련캠페인 리스트
	@Select("SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum "
			+ "FROM donation_list "
			+ "WHERE d_cate LIKE '%'||#{d_cate}||'%' "
			+ "AND rownum<4")
	public List<DonationVO> donationCateRelatedListData(String d_cate);
	
	// 마이페이지 내 후원내역 리스트
	@Results({
		@Result(column="d_title",property="dvo.d_title"),
		@Result(column="d_goal",property = "dvo.d_goal"),
		@Result(column="d_startdate",property = "dvo.d_startdate"),
		@Result(column="d_enddate",property = "dvo.d_enddate"),
		@Result(column="d_now",property = "dvo.d_now"),
	})
	@Select("SELECT payno,price,dl.dno,userid,d_title,d_goal,d_startdate,d_enddate,d_now "
			+ "FROM donation_list dl,donation_pay dp "
			+ "WHERE dl.dno=dp.dno "
			+ "AND userid=#{userid} "
			+ "ORDER BY payno DESC")
	public List<DonationHistoryVO> donatedHistoryListData(String userid);
	
	// 사용자의 후원내역에서 가장많은 카테고리 가져오기
	@Select("SELECT d_cate,count(d_cate) "
			+ "FROM donation_list dl,donation_pay dp "
			+ "WHERE userid=#{userid} AND dl.dno=dp.dno "
			+ "GROUP BY d_cate "
			+ "HAVING count(d_cate)=(SELECT MAX(mycount) "
			+ "FROM (SELECT d_cate,count(d_cate) as mycount "
			+ "FROM donation_list dl2,donation_pay dp2 "
			+ "WHERE userid=#{userid} AND dl2.dno=dp2.dno "
			+ "GROUP BY d_cate))")
	public List<String> donatedMaxCategory(String userid);
	
	// 카테고리를 받아서 같은 카테고리의 캠페인 출력
	@Select("SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent,rownum "
			+ "FROM (SELECT dno,d_image,d_title,d_company,d_goal,d_now,d_nowpercent "
			+ "FROM donation_list "
			+ "WHERE d_cate LIKE '%'||#{d_cate}||'%' "
			+ "ORDER BY dno DESC) "
			+ "WHERE rownum<4")
	public List<DonationVO> donatedCateRelatedListData(String d_cate);
}
