package com.sist.vo;

import lombok.Data;
import java.util.*;
@Data
public class DonResVO {
	private int dresno,dno,don_resok;
	private String userid,don_resdate,don_restime,don_resinwon,dbday;
	private Date resdate;
	private DonStoreVO dvo=new DonStoreVO();
}
