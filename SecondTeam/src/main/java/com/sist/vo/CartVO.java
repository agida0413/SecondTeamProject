package com.sist.vo;

import lombok.Data;
import java.util.*;
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
@Data
public class CartVO {
	private int gcno,gno,cart_count,price;
	private String cart_price,dbday,buy_state,recipient,phone,buy_post,buy_addr1,buy_addr2,buy_request,userid;
	private Date buy_date;
	private GoodsVO gvo=new GoodsVO();
}
