package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.AdminDAO;
import com.sist.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	private AdminDAO dao;

	@Override
	public List<MemberVO> memberList(Map map) {
		// TODO Auto-generated method stub
		return dao.memberList(map);
	}

	@Override
	public int totalpage(Map map) {
		// TODO Auto-generated method stub
		return dao.totalpage(map);
	}
	
	
}
