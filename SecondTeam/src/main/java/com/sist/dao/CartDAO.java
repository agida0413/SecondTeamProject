package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CartMapper;
import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;

@Repository
public class CartDAO {
@Autowired
private CartMapper mapper;

public List<CartVO> cartListData(String userid){
	return mapper.cartListData(userid);
}
public void cartDelete(int gcno) {
	mapper.cartDelete(gcno);
}
public void cartAllDelete(String userId) {
	mapper.cartAllDelete(userId);
}

public MemberVO buyInfo(String userid) {
	return mapper.buyInfo(userid);
}

public List<CartVO> buyPriceInfo(String userid) {
	return mapper.buyPriceInfo(userid);
}
public void orderInfo(CartVO vo) {
	mapper.orderInfo(vo);
}
public List<CartVO> buyList(String userid){
	return mapper.buyList(userid);
}
public void buyCancle(CartVO vo) {
	mapper.buyCancle(vo);
}
}
