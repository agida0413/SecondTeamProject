package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;

public interface MoimListService {
	
	//공간대여리스트
	public List<MoimListVO> moimListData(Map map);
	public int moimTotalPage(Map map);
	//공간대여디테일
	public MoimListVO moimDetailData(int rno);
	//공간대여디테일_댓글
	public List<MoimReplyVO> MoimReplyData(int mrno);
	//추가
	public void MoimReplyInsert(MoimReplyVO vo);
	//수정
	public void MoimReplyUpdate(MoimReplyVO vo);
	//삭제
	public void MoimReplyDelete(int mrno);
}
