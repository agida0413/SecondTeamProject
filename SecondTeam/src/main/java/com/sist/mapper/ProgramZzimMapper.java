package com.sist.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	
}
