package com.sist.vo;

import lombok.Data;

@Data
public class SnsIdVO {
	private int mno;
	private String userId,userName;
	
	private SnsFollowVO svo=new SnsFollowVO();
}
