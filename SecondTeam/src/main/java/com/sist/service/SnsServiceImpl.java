package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.SnsDAO;
import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

@Service
public class SnsServiceImpl implements SnsService{
	@Autowired
	private SnsDAO dao;

	@Override
	public List<SnsKeepVO> snsKeepList() {
		// TODO Auto-generated method stub
		return dao.snsKeepList();
	}

	@Override
	public List<SnsMyContentVO> snsMyContentList(String userid) {
		// TODO Auto-generated method stub
		return dao.snsMyContentList(userid);
	}

	@Override
	public SnsKeepVO snsKeepDetailData(int kano) {
		// TODO Auto-generated method stub
		return dao.snsKeepDetailData(kano);
	}

	@Override
	public void SnsInsert(SnsMyContentVO vo) {
		// TODO Auto-generated method stub
		dao.SnsInsert(vo);
	}

	@Override
	public void SnsDelete(int sno) {
		// TODO Auto-generated method stub
		dao.SnsDelete(sno);
	}

	@Override
	public void SnsUpdate(SnsMyContentVO vo) {
		// TODO Auto-generated method stub
		dao.SnsUpdate(vo);
	}

	@Override
	public List<SnsMyContentVO> snsMyContentList2(int sno) {
		// TODO Auto-generated method stub
		return dao.snsMyContentList2(sno);
	}

	@Override
	public List<SnsIdVO> snsIdList(String userId) {
		// TODO Auto-generated method stub
		return dao.snsIdList(userId);
	}

	@Override
	public void insertFollowData(String f_ing_UserId, String userId) {
		// TODO Auto-generated method stub
		dao.insertFollowData(f_ing_UserId, userId);
	}
}
