package com.sist.service;

import java.util.List;

import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

public interface SnsService {
	//�ӽú�ȣ�����Խñ� 5�� �������
	public List<SnsKeepVO> snsKeepList();
	//sns������ ����+�ȷο� �Խñ� ���
	public List<SnsMyContentVO> snsMyContentList(String userid);
	//sns id ����� 4�� �������
	public List<SnsIdVO> snsIdList();

}
