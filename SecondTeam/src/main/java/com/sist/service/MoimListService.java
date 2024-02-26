package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;
import com.sist.vo.MoimReserveVO;

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
	//모임예약하기 타입따라 출력
	public List<MoimListVO> moimReserveData(String type);
	//예약한값 테이블에 추가하기
	public void moimReserveInsert(MoimReserveVO vo);
	//예약한값 마이페이지 출력
	public List<MoimReserveVO> reserveMyPageData(String userId);
	//마이페이지 예약취소
	public void reserveMypageCancel(int mno);
}
