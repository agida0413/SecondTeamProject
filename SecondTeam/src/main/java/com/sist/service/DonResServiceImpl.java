package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.DonResDAO;
import com.sist.vo.DonResVO;

@Service
public class DonResServiceImpl implements DonResService {
	@Autowired
	private DonResDAO dao;
	
	@Override
	public void donresInsert(DonResVO vo) {
		// TODO Auto-generated method stub
		dao.donresInsert(vo);
	}

}
