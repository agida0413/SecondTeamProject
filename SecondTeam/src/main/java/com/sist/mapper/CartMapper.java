package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CartVO;
/*
 * gcno NUMBER,
	gno NUMBER,
	userid VARCHAR2(100) CONSTRAINT gc_userid_nn NOT NULL,
	cart_price VARCHAR2(100) CONSTRAINT gc_cp_nn NOT NULL,
	cart_count NUMBER,
	buy_date DATE DEFAULT SYSDATE,
	buy_state VARCHAR2(50),
	recipient VARCHAR2(100) CONSTRAINT gc_rp_nn NOT NULL,
	phone VARCHAR2(100) CONSTRAINT gc_phone_nn NOT NULL,
	buy_post VARCHAR2(100) CONSTRAINT gc_bp_nn NOT NULL,
	buy_address VARCHAR2(100)CONSTRAINT gc_ba_nn NOT NULL,
	buy_request CLOB,
	CONSTRAINT gct_gcno_pk PRIMARY KEY(gcno)
 */
import com.sist.vo.GoodsVO;
import com.sist.vo.MemberVO;
public interface CartMapper {

@Results({
		@Result(property = "gvo.gno" ,column="gno"),
		@Result(property = "gvo.g_name" , column = "g_name"),
		@Result(property = "gvo.g_img",column = "g_img"),
		@Result(property = "gvo.g_price",column = "g_price")
})
	
// 장바구니 목록
@Select("SELECT gc.gno,g_name,g_img,g_price,cart_price,cart_count,gcno,price,buy_state FROM goodslist gl JOIN goods_cart gc "
		+ "ON gl.gno=gc.gno WHERE userid=#{userid}")
public List<CartVO> cartListData(String userid);
// 장바구니 비우기 (부분삭제)
@Delete("DELETE FROM goods_cart WHERE gcno=#{gcno}")
public void cartDelete(int gcno);
//장바구니 비우기 (전체삭제)
@Delete("DELETE FROM goods_cart WHERE userid=#{userid}")
public void cartAllDelete(String userid);

@Select("SELECT userid,username,phone,email,addr1,addr2 FROM member "
		+ "WHERE userid=#{userid}")
public MemberVO buyInfo(String userid);

@Select("SELECT price,cart_count FROM goods_cart WHERE userid=#{userid}")
public List<CartVO> buyPriceInfo(String userid);

@Update("UPDATE goods_cart SET buy_date=SYSDATE,buy_state='order',recipient=#{recipient},phone=#{phone}"
		+ ",buy_post=#{buy_post},buy_addr1=#{buy_addr1},buy_addr2=#{buy_addr2},buy_request=#{buy_request} "
		+ "WHERE userid=#{userid}")
public void orderInfo(CartVO vo);
/*
 * gcno NUMBER,
	gno NUMBER,
	userid VARCHAR2(100) CONSTRAINT gc_userid_nn NOT NULL,
	cart_price VARCHAR2(100) CONSTRAINT gc_cp_nn NOT NULL,
	cart_count NUMBER,
	buy_date DATE DEFAULT SYSDATE,
	buy_state VARCHAR2(50),
	recipient VARCHAR2(100) CONSTRAINT gc_rp_nn NOT NULL,
	phone VARCHAR2(100) CONSTRAINT gc_phone_nn NOT NULL,
	buy_post VARCHAR2(100) CONSTRAINT gc_bp_nn NOT NULL,
	buy_address VARCHAR2(100)CONSTRAINT gc_ba_nn NOT NULL,
	buy_request CLOB,
	CONSTRAINT gct_gcno_pk PRIMARY KEY(gcno)
 */
@Results({
	@Result(property = "gvo.gno" ,column="gno"),
	@Result(property = "gvo.g_name" , column = "g_name"),
	@Result(property = "gvo.g_img",column = "g_img"),
	@Result(property = "gvo.g_price",column = "g_price")
})
@Select("SELECT userid,cart_count,TO_CHAR(buy_date,'YYYY-MM-DD') as dbday,buy_state,recipient,phone,buy_post,buy_addr1,buy_addr2,buy_request,price,"
		+ "gl.gno,g_name,g_img,g_price "
		+ "FROM goods_cart gc JOIN goodslist gl ON gc.gno=gl.gno WHERE userid=#{id}")
public List<CartVO> buyList(String userid);
}
