package com.sist.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SnsMyContentVO {
	private int sno;
	private String userid,username,dbday,content;
	private Date regdate;
}
