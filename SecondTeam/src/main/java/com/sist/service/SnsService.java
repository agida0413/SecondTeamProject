package com.sist.service;

import java.util.List;

import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;

public interface SnsService {
	//임시보호동물게시글 5개 랜덤출력
	public List<SnsKeepVO> snsKeepList();
	//sns id 목록중 4명 랜덤출력
	public List<SnsIdVO> snsIdList();
}
