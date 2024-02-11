package com.sist.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class VprogramApplyVO {
	private Date v_state_time;
private int vno,vano,v_filecount,v_ok_filecount;
private String id,v_state,v_filename,v_filesize,v_ok_filename,v_ok_filesize,vDbStateTime,state;

private List<MultipartFile>files;
private List<MultipartFile>accesssImgs;
private ProgramVO pvo=new ProgramVO();
private MemberVO mvo=new MemberVO();
}
