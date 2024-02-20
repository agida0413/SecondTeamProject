package com.sist.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class ProgramReplyVO {
private int rno,like_count,hate_count,root,depth,objno,typeno,rtype;
private String content,userid,report_state,report_type,username,dbDay;
private Date regdate;
private double likepercent;
}
