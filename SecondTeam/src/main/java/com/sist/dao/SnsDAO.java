package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SnsMapper;
import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;

@Repository
public class SnsDAO {
	@Autowired
	private SnsMapper mapper;
	
	//임시보호동물게시글 5개 랜덤출력
	public List<SnsKeepVO> snsKeepList()
	{
		return mapper.snsKeepList();
	}
	
	//sns id 목록중 4명 랜덤출력
	public List<SnsIdVO> snsIdList()
	{
		return mapper.snsIdList();
	}
}
