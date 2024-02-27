package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.CommonsFunction;
import com.sist.service.AdminService;
import com.sist.vo.MemberVO;

@RestController
public class AdminRestController {
@Autowired
private AdminService service;

@Autowired
private CommonsFunction cf;

@GetMapping(value="adminPage/memberList_vue.do",produces = "text/plain;charset=UTF-8")
public String adminPage(String ss, String page ) throws JsonProcessingException{
   System.out.println("실행");
   if(page==null) {
      page="1";
   }
   int curpage=Integer.parseInt(page);
   Map map =new HashMap();
   map.put("ss", ss);
   
   int rowsize=10;
   
int start= cf.start(rowsize, curpage);
   int end=cf.end(rowsize, curpage);
   
      map.put("start", start);
      map.put("end", end);
   List<MemberVO> list = service.memberList(map);
   
   ObjectMapper mapper= new ObjectMapper();
   String json= mapper.writeValueAsString(list);
         
   return json;
}


}