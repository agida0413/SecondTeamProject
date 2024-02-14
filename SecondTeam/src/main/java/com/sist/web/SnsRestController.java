package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.SnsService;
import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

@RestController
@RequestMapping("sns/")
public class SnsRestController {
	
	@Autowired
	private SnsService service;
	
	//임시보호동물 게시글 랜덤 5개 출력
	@GetMapping(value = "list_keep_vue.do", produces =  "text/plain;charset=UTF-8")
	public String list_keep_vue() throws Exception
	{
		List<SnsKeepVO> list=service.snsKeepList();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	//임시보호동물게시글 5개 다이얼로그 디테일출력
	@GetMapping(value = "detail_keep_vue.do", produces = "text/plain;charset=UTF-8")
	public String detail_keep_vue(int kano) throws Exception
	{
		SnsKeepVO vo=service.snsKeepDetailData(kano);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	//sns페이지 본인+팔로우 게시글 출력
	//public List<SnsMyContentVO> snsMyContentList(String id)
	@GetMapping(value = "list_mycontent_vue.do", produces = "text/plain;charset=UTF-8")
	public String list_mycontnet_vue(String userid) throws Exception
	{
		List<SnsMyContentVO> list=service.snsMyContentList(userid);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	//sns id 목록중 4명 랜덤출력
	@GetMapping(value = "list_id_vue.do", produces = "text/plain;charset=UTF-8")
	public String list_id_vue() throws Exception
	{
		List<SnsIdVO> list=service.snsIdList();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	//sns crud
	//sns insert
	@GetMapping(value = "insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String sns_insert_vue(String content, HttpSession session) throws Exception
	{
		String userid=(String)session.getAttribute("id");
		String username=(String)session.getAttribute("name");
		SnsMyContentVO vo=new SnsMyContentVO();
		vo.setUserid(userid);
		vo.setUsername(username);
		vo.setContent(content);
		service.SnsInsert(vo);
		List<SnsMyContentVO> list=service.snsMyContentList(userid);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	//sns delete
	@GetMapping(value = "delete_vue.do", produces = "text/plain;charset=UTF-8")
	public String sns_delete_vue(int sno, HttpSession session) throws Exception
	{
		service.SnsDelete(sno);
		String userid=(String)session.getAttribute("id");
		List<SnsMyContentVO> list=service.snsMyContentList(userid);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	//sns update
//	@GetMapping(value = "update_vue.do", produces = "text/plain;charset=UTF-8")
//	public String sns_update_vue(SnsMyContentVO vo) throws Exception
//	{
//		service.SnsUpdate(vo);
//		List<SnsMyContentVO> list=service.snsMyContentList(String.valueOf(vo.getSno()));
//		ObjectMapper mapper=new ObjectMapper();
//		String json=mapper.writeValueAsString(list);
//		return json;
//	}
	@GetMapping(value = "update_vue.do", produces = "text/plain;charset=UTF-8")
	public String sns_update_vue(SnsMyContentVO vo) throws Exception
	{
		service.SnsUpdate(vo);
		List<SnsMyContentVO> list=service.snsMyContentList2(vo.getSno());
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
}
