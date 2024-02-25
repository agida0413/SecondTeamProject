package com.sist.vo;
import java.util.*;

import lombok.Data;

@Data
public class DonationReplyVO {
	private int rno,dno,group_id,group_tab,group_step,root,depth;
	private String writer,msg,dbday;
	private Date regdate; 
}	
