package com.sist.service;

import java.util.List;

import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

public interface SnsService {
	//임시보호동물게시글 5개 랜덤출력
	public List<SnsKeepVO> snsKeepList();
	//sns페이지 본인+팔로우 게시글 출력
	public List<SnsMyContentVO> snsMyContentList(String userid);
	//sns id 목록중 4명 랜덤출력
	public List<SnsIdVO> snsIdList();

}
