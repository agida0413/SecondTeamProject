package com.sist.service;

import java.util.List;

import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

public interface SnsService {
	//임시보호동물게시글 5개 랜덤출력
	public List<SnsKeepVO> snsKeepList();
	//임시보호동물게시글 5개 다이얼로그 디테일출력
	public SnsKeepVO snsKeepDetailData(int kano);
	//sns페이지 본인+팔로우 게시글 출력
	public List<SnsMyContentVO> snsMyContentList(String userid);
	//sns id 목록중 4명 랜덤출력 (본인아이디제외)
		public List<SnsIdVO> snsIdList(String userId);
		//sns follow insert
		public void insertFollowData(String f_ing_UserId, String userId);
	
	//sns insert
	public void SnsInsert(SnsMyContentVO vo);
	//sns delete
	public void SnsDelete(int sno);
	//sns update
	public void SnsUpdate(SnsMyContentVO vo);
	//update용으로 하나 더 만듬
	public List<SnsMyContentVO> snsMyContentList2(int sno);

}
