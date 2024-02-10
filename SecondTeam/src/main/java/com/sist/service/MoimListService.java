package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;

public interface MoimListService {
	
	//�����뿩����Ʈ
	public List<MoimListVO> moimListData(Map map);
	public int moimTotalPage(Map map);
	//�����뿩������
	public MoimListVO moimDetailData(int rno);
	//�����뿩������_���
	public List<MoimReplyVO> MoimReplyData(int mrno);
	//�߰�
	public void MoimReplyInsert(MoimReplyVO vo);
	//����
	public void MoimReplyUpdate(MoimReplyVO vo);
	//����
	public void MoimReplyDelete(int mrno);
}
