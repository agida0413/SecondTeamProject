package com.sist.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
private int mno,typeno,admin,wing,reportcount;
private String id,pwd,centername,name,sex,addr1,addr2,phone,email,content,dbBirthday;
private Date birth;
}
