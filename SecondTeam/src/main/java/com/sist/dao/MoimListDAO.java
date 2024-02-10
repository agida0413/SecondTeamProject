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

@Repository
public class MoimListDAO {
	@Autowired
	private MoimListMapper mapper;
	
	//�����������
	public List<MoimListVO> moimMainData()
	{
		return mapper.moimMainData();
	}
	
	//�����뿩����Ʈ
	public List<MoimListVO> moimListData(Map map){
		return mapper.moimListData(map);
	}
	public int moimTotalPage(Map map) {
		return mapper.moimTotalPage(map);
	}
	//�����뿩������
	public MoimListVO moimDetailData(int rno)
	{
		return mapper.moimDetailData(rno);
	}
	
	//�����뿩������_���
		public List<MoimReplyVO> MoimReplyData(int mrno){
			return mapper.MoimReplyData(mrno);
		}
		
		//�߰�
		public void MoimReplyInsert(MoimReplyVO vo) {
			mapper.MoimReplyInsert(vo);
		}
		
		//����
		public void MoimReplyUpdate(MoimReplyVO vo) {
			mapper.MoimReplyUpdate(vo);
		}
		
		//����
		public void MoimReplyDelete(int mrno) {
			mapper.MoimReplyDelete(mrno);
		}

}
