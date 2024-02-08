package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MoimListMapper;
import com.sist.vo.MoimListVO;

@Repository
public class MoimListDAO {
	@Autowired
	private MoimListMapper mapper;
	
	public List<MoimListVO> moimMainData()
	{
		return mapper.moimMainData();
	}
}
