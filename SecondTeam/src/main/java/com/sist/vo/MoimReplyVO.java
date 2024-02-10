package com.sist.vo;
/*
 * CREATE TABLE Moim_Reply(
  mrno NUMBER,
  rno NUMBER,
  id varchar2(100),
  name varchar2(100) CONSTRAINT mr_name_nn NOT NULL,
  msg clob CONSTRAINT mr_msg_nn NOT NULL,
  regdate DATE DEFAULT sysdate,
  CONSTRAINT mr_mrno_pk PRIMARY KEY(mrno),
  CONSTRAINT mr_rno_fk FOREIGN KEY(rno) REFERENCES moim_list(rno),
  CONSTRAINT mr_id_fk FOREIGN KEY(id) REFERENCES member(id)
);
CREATE SEQUENCE mr_mrno_seq
start with 1
INCREMENT by 1
nocache
nocycle;
 */

import java.util.Date;

import lombok.Data;

@Data
public class MoimReplyVO {
	private int mrno,rno;
	private String name,id,msg,dbday;
	private Date regdate;
}
