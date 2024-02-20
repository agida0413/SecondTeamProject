package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.CartVO;

public interface CartService {
	public List<CartVO> cartListData(String userid);
}
