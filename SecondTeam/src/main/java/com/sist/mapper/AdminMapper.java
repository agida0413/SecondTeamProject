package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.MemberVO;

public interface AdminMapper {

   
   @Select("SELECT mno,userid,userpwd,typeno,centername,username,TO_CHAR(birth,'YYYY-MM-DD') as dbdbBirthday ,sex,addr1,addr2,phone,admin,wing,num "
         +"FROM (SELECT mno,userid,userpwd,typeno,centername,username,birth ,sex,addr1,addr2,phone,admin,wing,rownum as num "
         + "FROM "
         + "(SELECT mno,userid,userpwd,typeno,centername,username,birth ,sex,addr1,addr2,phone,admin,wing FROM member WHERE userid Like '%'||#{ss}||'%' "
         + "ORDER BY mno DESC "
         + ")) "
         +"WHERE num BETWEEN #{start} AND #{end}")
   public List<MemberVO> memberList(Map map);
   
@Select("SELECT CEIL(COUNT(*)/10.0) FROM member WHERE userid LIKE '%'||#{ss}||'%' ")
public int totalpage(Map  map);
}