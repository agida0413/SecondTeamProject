package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.CartDAO;
import com.sist.vo.CartVO;
@Service 
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cDao;

	@Override
	public List<CartVO> cartListData(String userid) {
		// TODO Auto-generated method stub
		return cDao.cartListData(userid);
	}


}
