package com.sist.vo;

import lombok.Data;
import java.util.*;

@Data
public class DonationPayVO {
	private int payno,price,dno;
	private String userid,dbday;
	private Date regdate;
}
