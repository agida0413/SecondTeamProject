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
	public List<SnsMyContentVO> snsMyContentList(String id) {
		// TODO Auto-generated method stub
		return dao.snsMyContentList(id);
	}

	@Override
	public void snsPageInsert(SnsMyContentVO vo) {
		// TODO Auto-generated method stub
		dao.snsPageInsert(vo);
	}
}
