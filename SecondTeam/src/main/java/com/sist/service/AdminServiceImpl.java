package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.AdminDAO;
import com.sist.vo.CartVO;
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

	@Override
	public List<CartVO> buyList(Map map) {
		// TODO Auto-generated method stub
		return dao.buyList(map);
	}

	@Override
	public int buyTotalpage() {
		// TODO Auto-generated method stub
		return dao.buyTotalpage();
	}

	@Override
	public void buyOk(int gcno) {
		// TODO Auto-generated method stub
		dao.buyOk(gcno);
	}

	@Override
	public void memberControl(int mno, String type) {
		if(type.equals("1")) {
			dao.grantMem(mno);
		}
		else if (type.equals("2")) {
		dao.deleteMem(mno);	
		}
		else if (type.equals("3")) {
		dao.revokeMem(mno);			
				}
		else if (type.equals("4")) {
			dao.deleteMemWing(mno);
		}
		
	}

	
	
}
