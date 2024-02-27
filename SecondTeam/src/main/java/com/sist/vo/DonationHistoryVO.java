package com.sist.vo;

import java.util.Date;
import com.sist.vo.*;

import lombok.Data;

@Data
public class DonationHistoryVO {
	private int payno,price,dno;
	private String userid;
	private DonationVO dvo; 
}
