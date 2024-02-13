package com.sist.mapper;

import java.lang.reflect.Member;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.MemberVO;

public interface TemptLoginMapper {

	@Select("SELECT * FROM MEMBER WHERE userid=#{id}")
	public MemberVO temptLogin(String id);
}
