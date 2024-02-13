package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

public interface SnsMapper {
	
	//�ӽú�ȣ�����Խñ� 5�� �������
	@Select("SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, rownum AS num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter "
			+ "FROM SNS_KEEP  ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 5 AND 9")
	public List<SnsKeepVO> snsKeepList();
	
	//sns������ ����+�ȷο� �Խñ� ���
	@Select("SELECT sno, userid, pic, username, regdate, content "
			+ "FROM SNS_PAGE "
			+ "WHERE userid = #{userid} "
			+ "OR id IN ( "
			+ "SELECT sns_follow.f_id "
			+ "FROM SNS_FOLLOW "
			+ "WHERE sns_follow.userid = #{userid}) "
			+ "ORDER BY sno DESC ")
	public List<SnsMyContentVO> snsMyContentList(String userid);
	
	//sns id ����� 4�� �������
	@Select("SELECT mno, userid, username, num "
			+ "FROM (SELECT mno, userid, username, rownum AS num "
			+ "FROM (SELECT mno, userid, username "
			+ "FROM MEMBER WHERE TYPENO =2 ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 1 AND 4 ")
	public List<SnsIdVO> snsIdList();

}
