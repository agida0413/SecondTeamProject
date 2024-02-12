package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ProgramVO;
import com.sist.vo.WishListVO;

public interface ProgramZzimMapper {

	
	@Select("SELECT COUNT(*) FROM wishlist WHERE typeno=1 AND "
			+"id=#{id} "
			+"AND objno=#{vno}")
	
	public int getWishCount(Map map);
	
	@Select("SELECT state FROM  wishlist "
			+"WHERE typeno=1 AND "
			+"id=#{id} AND "
			+"objno=#{vno}")
	public String getWishState(Map map);
	
	@Insert("INSERT INTO wishlist VALUES("
			+"wishlist_seq.nextval,1,#{vno},#{state},#{id})")
	public void insertWishList(Map map);
	
	
	@Update("UPDATE wishlist SET "
			+"state=#{state} "
			+"WHERE id=#{id} AND "
			+"typeno=1 AND "
			+"objno=#{vno}"
			)
	public void updateWishList(Map map);
	
	
	//마이페이지 찜목록
	@Results({
		@Result(property = "wvo.wno" ,column="wno"),
		@Result(property = "wvo.typeno" ,column="typeno"),
		@Result(property = "wvo.objno" ,column="objno"),
		@Result(property = "wvo.state" ,column="state"),
		@Result(property = "wvo.id" ,column="id"),
	
		
})
	@Select("SELECT getwing,vno,active_Type,major_field,minor_field,title,"
			+ "TO_CHAR(collect_start,'YYYY.MM.DD') as dbCollect_start,"
			+ "TO_CHAR(collect_end,'YYYY.MM.DD') as dbCollect_end,"
			+ "TO_CHAR(v_start,'YYYY.MM.DD') as dbV_start,"
			+ "TO_CHAR(v_end,'YYYY.MM.DD') as dbV_end,"
			+ "runtime,si,gu,centername,collect_state,typeno,objno,state,id,num "
			+ "FROM (SELECT getwing,vno,active_type,major_field,minor_field,title,collect_start,collect_end,v_start,v_end,runtime,si,gu,centername,collect_state,typeno,objno,state,id,rownum as num "
			+ "FROM (SELECT /*+INDEX(wishlist wno_pk)*/getwing,vno,active_type,major_field,minor_field,title,collect_start,collect_end,v_start,v_end,runtime,si,gu,centername,collect_state,typeno,objno,state,id "
			+ "FROM v_program "
			+"JOIN wishlist ON "
			+"vno=objno "
			+"WHERE id=#{id} AND "
			+"state=#{state} AND "
			+"typeno=1)) "
			+"WHERE num BETWEEN #{start} and #{end}")
	public List<ProgramVO> wishList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wishlist "
			+"WHERE typeno=1 AND "
			+"id=#{id} AND "
			+"state=#{state}")
	public int wishListTotalPage(Map map);
	
	
}
