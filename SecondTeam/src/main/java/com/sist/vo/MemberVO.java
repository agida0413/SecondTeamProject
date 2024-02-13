package com.sist.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
private int mno,typeno,admin,wing,reportcount,enabled;
private String userid,userpwd,centername,username,sex,addr1,addr2,phone,email,content,dbBirthday;
private Date birth;
}
