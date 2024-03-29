package com.sist.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class DonClassVO {
private int dcno,full_num,wing,goal_price,now_price,int_time;
private double score;
private String name,id,cls_level,time,image,address,category,create_state;
private Date create_date;
private String dbCreate_date; 
private WishListVO wvo=new WishListVO();
private DonClassResHistoryVO hvo=new DonClassResHistoryVO();
private MultipartFile mainimage;
private List<MultipartFile> subimages;
}
