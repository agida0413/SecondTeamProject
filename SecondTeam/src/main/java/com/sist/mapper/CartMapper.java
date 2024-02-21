package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

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
public interface CartMapper {

@Results({//변경완료
		@Result(property = "gvo.gno" ,column="gno"),
		@Result(property = "gvo.g_name" , column = "g_name"),
		@Result(property = "gvo.g_img",column = "g_img"),
		@Result(property = "gvo.g_price",column = "g_price")
})//변경완료	
	
// 장바구니 목록
@Select("SELECT gc.gno,g_name,g_img,g_price,cart_price,cart_count,gcno FROM goodslist gl JOIN goods_cart gc "
		+ "ON gl.gno=gc.gno WHERE userid=#{userid}")
public List<CartVO> cartListData(String userid);
// 장바구니 비우기 (부분삭제)
@Delete("DELETE FROM goods_cart WHERE gcno=#{gcno}")
public void cartDelete(int gcno);
//장바구니 비우기 (전체삭제)
@Delete("DELETE FROM goods_cart WHERE userid=#{userid}")
public void cartAllDelete(String userid);
}
