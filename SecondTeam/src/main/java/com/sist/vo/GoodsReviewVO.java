package com.sist.vo;

import lombok.Data;
import java.util.*;
@Data
public class GoodsReviewVO {
	private int rno,gno,score;
	private String userid,username,subject,content,dbday;
	private Date regdate;
}
