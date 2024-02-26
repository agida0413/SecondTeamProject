package com.sist.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MoimReserveVO {
	private int mno,rno,reserve_ok;
	private String userId, rDate, rTime, rInwon, dbday;
	private Date regdate;
	
	//테이블 조인!
	private MoimListVO mvo=new MoimListVO();
}
