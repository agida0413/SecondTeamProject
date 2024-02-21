package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CartMapper;
import com.sist.vo.CartVO;

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
}
