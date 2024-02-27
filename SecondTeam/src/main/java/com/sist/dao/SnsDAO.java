package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SnsMapper;
import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

@Repository
public class SnsDAO {
	@Autowired
	private SnsMapper mapper;
	
	//�ӽú�ȣ�����Խñ� 5�� �������
	public List<SnsKeepVO> snsKeepList()
	{
		return mapper.snsKeepList();
	}
	//�ӽú�ȣ�����Խñ� 5�� ���̾�α� ���������
	public SnsKeepVO snsKeepDetailData(int kano)
	{
		return mapper.snsKeepDetailData(kano);
	}
	
	//sns id ����� 4�� ������� (���ξ��̵�����)
		public List<SnsIdVO> snsIdList(String userId)
		{
			return mapper.snsIdList(userId);
		}
		//sns follow insert
		public void insertFollowData(String f_ing_UserId, String userId)
		{
			mapper.insertFollowData(f_ing_UserId, userId);
		}
	
	//sns crud
	//sns������ ����+�ȷο� �Խñ� ���
	public List<SnsMyContentVO> snsMyContentList(String userid)
	{
		return mapper.snsMyContentList(userid);
	}
	
	//insert
	public void SnsInsert(SnsMyContentVO vo)
	{
		mapper.SnsInsert(vo);
	}
    //update
	public void SnsUpdate(SnsMyContentVO vo)
	{
		mapper.SnsUpdate(vo);
	}
	public List<SnsMyContentVO> snsMyContentList2(int sno)
	{
		return mapper.snsMyContentList2(sno);
	}
	//delete
	public void SnsDelete(int sno)
	{
		mapper.SnsDelete(sno);
	}
	
	
}
