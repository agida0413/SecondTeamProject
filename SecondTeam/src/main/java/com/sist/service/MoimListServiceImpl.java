package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MoimListDAO;
import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;
import com.sist.vo.MoimReserveVO;

@Service
public class MoimListServiceImpl implements MoimListService{
	@Autowired
	private MoimListDAO mdao;

	@Override
	public List<MoimListVO> moimListData(Map map) {
		// TODO Auto-generated method stub
		return mdao.moimListData(map);
	}

	@Override
	public int moimTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mdao.moimTotalPage(map);
	}

	@Override
	public MoimListVO moimDetailData(int rno) {
		// TODO Auto-generated method stub
		return mdao.moimDetailData(rno);
	}

	@Override
	public List<MoimReplyVO> MoimReplyData(int mrno) {
		// TODO Auto-generated method stub
		return mdao.MoimReplyData(mrno);
	}

	@Override
	public void MoimReplyInsert(MoimReplyVO vo) {
		// TODO Auto-generated method stub
		mdao.MoimReplyInsert(vo);
	}

	@Override
	public void MoimReplyUpdate(MoimReplyVO vo) {
		// TODO Auto-generated method stub
		mdao.MoimReplyUpdate(vo);
	}

	@Override
	public void MoimReplyDelete(int mrno) {
		// TODO Auto-generated method stub
		mdao.MoimReplyDelete(mrno);
	}

	@Override
	public List<MoimListVO> moimReserveData(String type) {
		// TODO Auto-generated method stub
		return mdao.moimReserveData(type);
	}

	@Override
	public void moimReserveInsert(MoimReserveVO vo) {
		// TODO Auto-generated method stub
		mdao.moimReserveInsert(vo);
	}

	@Override
	public List<MoimReserveVO> reserveMyPageData(String userId) {
		// TODO Auto-generated method stub
		return mdao.reserveMyPageData(userId);
	}

	@Override
	public void reserveMypageCancel(int mno) {
		// TODO Auto-generated method stub
		mdao.reserveMypageCancel(mno);
	}


	
	
}
