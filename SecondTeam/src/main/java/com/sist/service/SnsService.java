package com.sist.service;

import java.util.List;

import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

public interface SnsService {
	//�ӽú�ȣ�����Խñ� 5�� �������
	public List<SnsKeepVO> snsKeepList();
	//�ӽú�ȣ�����Խñ� 5�� ���̾�α� ���������
	public SnsKeepVO snsKeepDetailData(int kano);
	//sns������ ����+�ȷο� �Խñ� ���
	public List<SnsMyContentVO> snsMyContentList(String userid);
	//sns id ����� 4�� ������� (���ξ��̵�����)
		public List<SnsIdVO> snsIdList(String userId);
		//sns follow insert
		public void insertFollowData(String f_ing_UserId, String userId);
	
	//sns insert
	public void SnsInsert(SnsMyContentVO vo);
	//sns delete
	public void SnsDelete(int sno);
	//sns update
	public void SnsUpdate(SnsMyContentVO vo);
	//update������ �ϳ� �� ����
	public List<SnsMyContentVO> snsMyContentList2(int sno);

}
