package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;

public interface AdminMapper {

   
   @Select("SELECT mno,userid,userpwd,typeno,centername,username,TO_CHAR(birth,'YYYY-MM-DD') as dbBirthday ,sex,addr1,addr2,phone,admin,wing,num "
         +"FROM (SELECT mno,userid,userpwd,typeno,centername,username,birth ,sex,addr1,addr2,phone,admin,wing,rownum as num "
         + "FROM "
         + "(SELECT mno,userid,userpwd,typeno,centername,username,birth ,sex,addr1,addr2,phone,admin,wing FROM member WHERE userid Like '%'||#{ss}||'%' "
         + "ORDER BY mno DESC "
         + ")) "
         +"WHERE num BETWEEN #{start} AND #{end}")
   public List<MemberVO> memberList(Map map);
   
@Select("SELECT CEIL(COUNT(*)/10.0) FROM member WHERE userid LIKE '%'||#{ss}||'%' ")
public int totalpage(Map  map);


@Delete("DELETE FROM MEMBER WHERE mno=#{mno} ")
public void deleteMem(int mno);
@Update("UPDATE MEMBER SET "
		+"admin=1 "
		+"WHERE mno=#{mno}")
public void grantMem(int mno);

@Update("UPDATE MEMBER SET "
		+"admin=2 "
		+"WHERE mno=#{mno}")
public void revokeMem(int mno);

@Update("UPDATE MEMBER SET "
		+"wing=0 "
		+"where mno=#{mno}")
public void deleteMemWing(int mno);
	


@Results({
	@Result(property = "gvo.gno" ,column="gno"),
	@Result(property = "gvo.g_name" , column = "g_name"),
	@Result(property = "gvo.g_price" , column = "g_price")
})
@Select("SELECT gc.gcno, gl.gno, gc.userid, gc.cart_price, gc.cart_count, TO_CHAR(gc.buy_date, 'YYYY-MM-DD') as dbday, gc.buy_state, gc.recipient, gc.price, gl.g_name, gl.g_price, gl.g_img, gc.num "
		+ "FROM (SELECT gcno, gno, userid, cart_price, cart_count, buy_date, buy_state, recipient, price, ROWNUM AS num "
		+ "FROM goods_cart ORDER BY gcno DESC) gc "
		+ "JOIN goodslist gl ON gc.gno = gl.gno "
		+ "WHERE gc.num BETWEEN #{start} AND #{end} AND (buy_state='order' OR buy_state='buyOk') ")
public List<CartVO> buyList(Map map);

@Select("SELECT CEIL(COUNT(*)/5.0) FROM goods_cart")
public int buyTotalpage();

@Update("UPDATE goods_cart SET buy_state='buyOk' WHERE gcno=#{gcno}")
public void buyOk(int gcno);
}