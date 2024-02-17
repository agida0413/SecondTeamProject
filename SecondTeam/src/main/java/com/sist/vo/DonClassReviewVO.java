package com.sist.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DonClassReviewVO {
private int revno,objno,typeno,imagetype;
private double score;
private String id,dbDay,content,filename,name;
private MultipartFile rmf;
private Date regdate;

}
