package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;

import com.sist.vo.DonResVO;

public interface DonResMapper {
@Insert("INSERT INTO donres VALUES (dr_dresno_seq.nextval,#{dno},#{userid},#{don_resdate},#{don_restime},#{don_resinwon},0,SYSDATE)")
public void donresInsert(DonResVO vo);
}
