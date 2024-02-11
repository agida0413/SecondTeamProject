package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.SnsDAO;
import com.sist.vo.SnsKeepVO;

@Service
public class SnsServiceImpl implements SnsService{
	@Autowired
	private SnsDAO dao;

	@Override
	public List<SnsKeepVO> snsKeepList() {
		// TODO Auto-generated method stub
		return dao.snsKeepList();
	}
}
