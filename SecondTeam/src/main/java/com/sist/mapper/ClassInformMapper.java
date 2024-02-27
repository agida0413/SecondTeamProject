package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.DonClassVO;

public interface ClassInformMapper {

	
	//재능기부 클래스 리스트 관련
	
	@Select("SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,num "
			+"FROM (SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,ROWNUM as num "
			+"FROM (SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score "
			+"FROM donate_class "
			+"WHERE name LIKE'%'||#{ss}||'%' AND "
			+"category LIKE'%'||#{category}||'%'))"
			+"WHERE num BETWEEN #{start} and #{end}")
	public List<DonClassVO> donateClassList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM donate_class "
			+"WHERE name LIKE'%'||#{ss}||'%' AND "
			+"category LIKE'%'||#{category}||'%'")
	public int donateClassTotalPage(Map map);
	
	@Select("SELECT COUNT(*) FROM donate_class "
			+"WHERE category LIKE'%'||#{category}||'%'")
	public int donateClassCategoryCount(String category);
	
	
	
	//쿠키정보 
	@Select("SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score "
			+"FROM donate_class "
			+"WHERE dcno=#{dcno}")
	public DonClassVO cookieList(int dcno);
	
	
	//상세정보
	@Select("SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,goal_price,now_price,TO_CHAR(create_date,'YYYY-MM-DD') as dbCreate_date,"
			+"int_time,create_state "
			+"FROM donate_class "
			+"WHERE dcno=#{dcno}")
	public DonClassVO classDetailData(int dcno);
	
	//서브 이미지 목록
	@Select("SELECT subimage FROM donate_class_subimg "
			+"WHERE dcno=#{dcno}")
	public List<String> classSubimageList(int dcno);
	
	
	//찜하기
	
	@Select("SELECT COUNT(*) FROM wishlist WHERE typeno=2 AND "
			+"id=#{id} "
			+"AND objno=#{dcno}")
	
	public int getWishCount(Map map);
	
	@Select("SELECT state FROM  wishlist "
			+"WHERE typeno=2 AND "
			+"id=#{id} AND "
			+"objno=#{dcno}")
	public String getWishState(Map map);
	
	@Insert("INSERT INTO wishlist VALUES("
			+"wishlist_seq.nextval,2,#{dcno},#{state},#{id})")
	public void insertWishList(Map map);
	
	
	@Update("UPDATE wishlist SET "
			+"state=#{state} "
			+"WHERE id=#{id} AND "
			+"typeno=2 AND "
			+"objno=#{dcno}"
			)
	public void updateWishList(Map map);
	
	
	
	@Select("SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,num "
			+ "	FROM (SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,ROWNUM as num "
			+ "	FROM (SELECT dcno,name,a.id,cls_level,time,full_num,image,address,category,wing,score "
			+ "	FROM donate_class a "
			+"JOIN wishlist b ON "
			+"dcno=objno "
			+"WHERE typeno=2 "
			+"AND b.id=#{id} "
			+"AND state=#{state} )) "
			+"WHERE num between #{start} AND #{end}"
			)
	public List<DonClassVO> donClassWishList(Map map);
	
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM wishlist "
			+"WHERE typeno=2 "
			+"AND id=#{id} "
			+"AND state=#{state}")
	public int donClassWishTotalpage(Map map);
	
	
	@Insert("INSERT INTO DONATE_CLASS VALUES("
			+"DONATE_CLASS_SEQ.nextval,#{name},#{id},#{cls_level},#{time},#{full_num},#{image},#{address},#{category},#{wing},2.5,0,0,sysdate,0,'창설완료')")
	public void newClassInsert(DonClassVO vo);
	@Select("select donate_class_seq.currval FROM DUAL")
	public int getDcSeq();
	
	@Insert("INSERT INTO donate_class_subimg VALUES("
			+"donate_class_subimg_seq.nextval,#{dcno},#{subimage})")
	public void newClassSubImgInsert(Map map);
	
	@Insert("INSERT INTO DC_RESERVE2 VALUES("
			+"DC_RESERVE2_SEQ.nextval,#{dcno},#{month},#{day},#{st},#{et},#{can_num})")
	public void newClassReserveInformInsert(Map map);
	
	
	
	//마이페이지 나의원데이클래스 내역
	@Select("SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,num "
			+"FROM (SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,ROWNUM as num "
			+"FROM (SELECT /*+INDEX_DESC(DONATE_CLASS DCNO_PK)*/dcno,name,id,cls_level,time,full_num,image,address,category,wing,score "
			+"FROM donate_class "
			+"WHERE id=#{id}))"
			+"WHERE num BETWEEN #{start} and #{end}")
	public List<DonClassVO> myDonClassList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM donate_class where id=#{id}")
	public int myDonClassTotalPage(String id);
	
	//푸터aop
	
	@Select("SELECT name,image,score,dcno FROM (SELECT name,image,score,dcno FROM DONATE_CLASS ORDER BY SCORE DESC ) WHERE rownum=1" )
	public DonClassVO footerDonclassAopData();
	
	
	
	@Select("SELECT name,image,score,dcno,TO_CHAR(create_date,'YYYY-MM-DD') as dbCreate_date FROM (SELECT name,image,score,dcno,create_date FROM DONATE_CLASS ORDER BY SCORE DESC ) WHERE rownum<=4" )
	public List<DonClassVO> mainDonclassData();
}
