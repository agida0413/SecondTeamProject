package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;

public interface CartService {
	public List<CartVO> cartListData(String userid);
	public void cartDelete(int gcno);
	public void cartAllDelete(String userid);
	public MemberVO buyInfo(String userid);
	public List<CartVO> buyPriceInfo(String userid);
	public void orderInfo(CartVO vo);
}
