package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MoimListMapper;
import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;
import com.sist.vo.MoimReserveVO;

@Repository
public class MoimListDAO {
	@Autowired
	private MoimListMapper mapper;
	
	//공간메인출력
	public List<MoimListVO> moimMainData()
	{
		return mapper.moimMainData();
	}
	
	//공간대여리스트
	public List<MoimListVO> moimListData(Map map){
		return mapper.moimListData(map);
	}
	public int moimTotalPage(Map map) {
		return mapper.moimTotalPage(map);
	}
	//공간대여디테일
	public MoimListVO moimDetailData(int rno)
	{
		return mapper.moimDetailData(rno);
	}
	
	//공간대여디테일_댓글
		public List<MoimReplyVO> MoimReplyData(int mrno){
			return mapper.MoimReplyData(mrno);
		}
		
		//추가
		public void MoimReplyInsert(MoimReplyVO vo) {
			mapper.MoimReplyInsert(vo);
		}
		
		//수정
		public void MoimReplyUpdate(MoimReplyVO vo) {
			mapper.MoimReplyUpdate(vo);
		}
		
		//삭제
		public void MoimReplyDelete(int mrno) {
			mapper.MoimReplyDelete(mrno);
		}
		
		//모임예약하기 타입따라 출력
		public List<MoimListVO> moimReserveData(String type)
		{
			return mapper.moimReserveData(type);
		}
		
		//예약한값 테이블에 추가하기
		public void moimReserveInsert(MoimReserveVO vo)
		{
			mapper.moimReserveInsert(vo);
		}
		//예약한값 마이페이지 출력
		public List<MoimReserveVO> reserveMyPageData(String userId)
		{
			return mapper.reserveMyPageData(userId);
		}
		//예약취소
		public void reserveMypageCancel(int mno)
		{
			mapper.reserveMypageCancel(mno);
		}

}
