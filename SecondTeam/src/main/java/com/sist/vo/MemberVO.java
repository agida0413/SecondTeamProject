package com.sist.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
private int mno,typeno,admin,wing,reportcount,enabled;
private String userId,userPwd,centerName,userName,sex,addr1,addr2,phone,email,content,dbBirthday;
private Date birth;
private String msg,phone1,phone2;
}
