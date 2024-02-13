package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ClassInformMapper;
import com.sist.vo.DonClassVO;

@Repository
public class ClassInformDAO {
	@Autowired
private ClassInformMapper mapper;
	
	//재능기부 리스트 관련 
	public List<DonClassVO> donateClassList(Map map){
		return mapper.donateClassList(map);
	}
	
	public int donateClassTotalPage(Map map) {
		return mapper.donateClassTotalPage(map);
	}
	
	public int donateClassCategoryCount(String category) {
		return mapper.donateClassCategoryCount(category);
	}
}
