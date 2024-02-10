package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DonStoreMapper;
import com.sist.vo.DonStoreVO;

@Repository
public class DonStoreDAO {
@Autowired
private DonStoreMapper mapper;
public List<DonStoreVO> dnoStoreSearch(Map map){
	return mapper.dnoStoreSearch(map);
}
public int donTotalpage(Map map) {
	return mapper.donTotalpage(map);
}
public DonStoreVO donDetailData(int dno) {
	return mapper.donDetailData(dno);
}

}
