package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.CartDAO;
import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;
@Service 
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cDao;

	@Override
	public List<CartVO> cartListData(String userid) {
		// TODO Auto-generated method stub
		return cDao.cartListData(userid);
	}

	@Override
	public void cartDelete(int gcno) {
		// TODO Auto-generated method stub
		cDao.cartDelete(gcno);
	}

	@Override
	public void cartAllDelete(String userid) {
		// TODO Auto-generated method stub
		cDao.cartAllDelete(userid);
	}

	@Override
	public MemberVO buyInfo(String userid) {
		// TODO Auto-generated method stub
		return cDao.buyInfo(userid);
	}

	@Override
	public List<CartVO> buyPriceInfo(String userid) {
		// TODO Auto-generated method stub
		return cDao.buyPriceInfo(userid);
	}

	@Override
	public void orderInfo(CartVO vo) {
		// TODO Auto-generated method stub
		cDao.orderInfo(vo);
	}



}
