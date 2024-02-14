package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SnsMapper;
import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

@Repository
public class SnsDAO {
	@Autowired
	private SnsMapper mapper;
	
	//임시보호동물게시글 5개 랜덤출력
	public List<SnsKeepVO> snsKeepList()
	{
		return mapper.snsKeepList();
	}
	//임시보호동물게시글 5개 다이얼로그 디테일출력
	public SnsKeepVO snsKeepDetailData(int kano)
	{
		return mapper.snsKeepDetailData(kano);
	}
	
	//sns id 목록중 4명 랜덤출력
	public List<SnsIdVO> snsIdList()
	{
		return mapper.snsIdList();
	}
	
	//sns crud
	//sns페이지 본인+팔로우 게시글 출력
	public List<SnsMyContentVO> snsMyContentList(String userid)
	{
		return mapper.snsMyContentList(userid);
	}
	
	//insert
	public void SnsInsert(SnsMyContentVO vo)
	{
		mapper.SnsInsert(vo);
	}
    //update
	//delete
	public void SnsDelete(int sno)
	{
		mapper.SnsDelete(sno);
	}
	
	
}
