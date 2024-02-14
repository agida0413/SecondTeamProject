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
	public List<SnsIdVO> snsIdList() {
		// TODO Auto-generated method stub
		return dao.snsIdList();
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

}
