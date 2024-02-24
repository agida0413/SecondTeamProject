package com.sist.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class DonClassResHistoryVO {
private int rhno,dcno,rnum,wing,rno;
private String userid,state,dbRdate;
private Date rdate;
private String cdate;
}
