package com.sist.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.ProgramZzimMapper;
import com.sist.vo.WishListVO;

@Repository
public class ProgrmaZzimDAO {

	@Autowired
	private ProgramZzimMapper mapper;
	
	
	public int getWishCount(Map map) {
		return mapper.getWishCount(map);
	}
	
	public String getWishState(Map map) {
		return mapper.getWishState(map);
	}
	
	public void insertWishList(Map map) {
		 mapper.insertWishList(map);
	}
	
	
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public String updateWishList(Map map) {
		mapper.updateWishList(map);
		
		return mapper.getWishState(map);
		
	}
}
