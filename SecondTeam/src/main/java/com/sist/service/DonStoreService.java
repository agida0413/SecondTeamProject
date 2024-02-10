package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.DonStoreVO;

public interface DonStoreService {
	public List<DonStoreVO> dnoStoreSearch(Map map);
	public int donTotalpage(Map map);
	public DonStoreVO donDetailData(int dno);
}
