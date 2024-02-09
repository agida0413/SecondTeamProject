package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ProgramDataboardMapper;
import com.sist.vo.VdataboardVO;
@Repository
public class ProgramDataboardDAO {
@Autowired
private ProgramDataboardMapper mapper;

public List<VdataboardVO> databoardListData(int start,int end)
{
	  return mapper.databoardListData(start, end);
}
public int databoardTotalPage()
{
	  return mapper.databoardTotalPage();
}
public void databoardInsert(VdataboardVO vo)
{
	  mapper.databoardInsert(vo);
}

public VdataboardVO databoardDetailData(int dno)
{
	  mapper.hitIncrement(dno);
	  return mapper.databoardDetailData(dno);
}

public void databoardDelete(int dno) {
	mapper.databoardDelete(dno);
}

public VdataboardVO databoardFileInfoData(int dno) {
	return mapper.databoardFileInfoData(dno);
}
}
