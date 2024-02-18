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
	
}
