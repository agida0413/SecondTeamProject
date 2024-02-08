package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.TemptLoginMapper;
import com.sist.vo.MemberVO;

@Repository
public class TemptLoginDAO {
@Autowired
private TemptLoginMapper mapper;

	public MemberVO temptLogin(String id) {
		return mapper.temptLogin(id);
	}
}
