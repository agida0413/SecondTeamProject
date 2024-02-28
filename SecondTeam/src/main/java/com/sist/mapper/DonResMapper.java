package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.DonResVO;

public interface DonResMapper {
@Insert("INSERT INTO donres VALUES (dr_dresno_seq.nextval,#{dno},#{userid},#{don_resdate},#{don_restime},#{don_resinwon},0,SYSDATE)")
public void donresInsert(DonResVO vo);

@Results({
	@Result(property = "dvo.name" ,column="name"),
	@Result(property = "dvo.phone" ,column="phone"),
	@Result(property = "dvo.address" ,column="address")
})
@Select("SELECT dresno,di.dno,di.name,di.address,di.phone,userid,don_resdate,don_restime,don_resinwon,TO_CHAR(resdate,'YYYY-MM-DD') as dbday FROM donres dr "
		+ "JOIN donationstoreInfo di ON dr.dno=di.dno "
		+ "WHERE userid=#{userid}")
public List<DonResVO> donResList(String userid);

@Delete("DELETE FROM donres WHERE dresno=#{dersno}")
public void donresCancel(int dresno);
}
