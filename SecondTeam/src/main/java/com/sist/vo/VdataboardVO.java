package com.sist.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class VdataboardVO {
	private int dno,hit,v_filecount,v_check;
	   private String name,subject,content,pwd,filename,filesize,dbday;
	   private Date regadate;
	   private List<MultipartFile> files;
	   
}
