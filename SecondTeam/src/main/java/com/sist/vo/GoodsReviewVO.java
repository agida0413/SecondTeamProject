package com.sist.vo;

import lombok.Data;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;
@Data
public class GoodsReviewVO {
	private int rno,gno,score, filecount;
	private String userid,username,subject,content,dbday,filesize,filename;
	private Date regdate;
	private List<MultipartFile> files;
}
