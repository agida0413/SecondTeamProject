package com.sist.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MoimReserveVO {
	private int mno,rno,reserve_ok;
	private String userId, rDate, rTime, rInwon, dbday;
	private Date regdate;
	
	//���̺� ����!
	private MoimListVO mvo=new MoimListVO();
}
