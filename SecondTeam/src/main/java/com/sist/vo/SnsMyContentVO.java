package com.sist.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SnsMyContentVO {
	private int sno,filecount;
	private String userid,pic,username,regdate,filename,filesize,dbday,content;
	//private Date regdate;
	private List<MultipartFile> files;
}
