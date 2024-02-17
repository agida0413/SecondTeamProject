package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.DBPortPool.SemaphoresOut;
import com.sist.commons.CommonsFunction;
import com.sist.service.ProgramService;

import com.sist.vo.OptionVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VdataboardVO;
import com.sist.vo.VprogramApplyVO;

@RestController
public class ProgramRestController {
@Autowired
private ProgramService service;
	
@Autowired
private CommonsFunction cf;

	//위치변경
	@GetMapping(value="program/stateChange_vue.do",produces = "text/plain;charset=UTF-8")
	public String stateChange_vue(OptionVO vo) throws JsonProcessingException {
		ObjectMapper mapper=new ObjectMapper();
		String json="";
		List<OptionVO>list=new ArrayList<OptionVO>();
		if(!vo.getState().equals("전체")) {
			list=service.cityOption(vo.getState());
			json=mapper.writeValueAsString(list);
		}
		return json;
	}
	//카테고리변경
	@GetMapping(value="program/major_fieldChange_vue.do",produces = "text/plain;charset=UTF-8")
	public String major_fieldChange_vue(OptionVO vo) throws JsonProcessingException {
		
		ObjectMapper mapper=new ObjectMapper();
		String json="";
		List<OptionVO>list=new ArrayList<OptionVO>();
		if(!vo.getMajor_option().equals("전체")) {
			list=service.minorOption(vo.getMajor_option());
			json=mapper.writeValueAsString(list);
			
		}
		return json;
	}
	
	//검색
	@RequestMapping(value="program/find_vue.do",produces = "text/plain;charset=UTF-8")
	public String find_vue(@RequestParam("ssConditionString") String ssConditionString,
			@RequestParam("vtConditionString") String vtConditionString,
			@RequestParam("weekString") String weekString,
			int page,
            @RequestBody OptionVO vo) throws JsonProcessingException {
		 		
			String ssType[]=ssConditionString.split("");
			String weekType[]=weekString.split("");
			String vType[]=vtConditionString.split("");
			
			int rowSize=10;
			int start = cf.start(rowSize, page);
			int end=cf.end(rowSize, page);
			
		        Map map= new HashMap();
		        map.put("vo",vo);
		        map.put("ssType", ssType);
		        map.put("weekType",weekType);
		        map.put("vType", vType);
		        map.put("start", start);
		        map.put("end", end);
		        
		        List<ProgramVO> list= service.programListData(map);
		           
		        ObjectMapper mapper= new ObjectMapper();
		        String json=mapper.writeValueAsString(list);
		       
			
		return json;
	}
	
	
	
	//프로그램조회 페이징
	@RequestMapping(value="program/listPage_vue.do",produces = "text/plain;charset=UTF-8")
	public String listPage_vue(@RequestParam("ssConditionString") String ssConditionString,
			@RequestParam("vtConditionString") String vtConditionString,
			@RequestParam("weekString") String weekString,
			int page,
            @RequestBody OptionVO vo) throws JsonProcessingException {
		 		
			String ssType[]=ssConditionString.split("");
			String weekType[]=weekString.split("");
			String vType[]=vtConditionString.split("");
			
		        Map map= new HashMap();
		        map.put("vo",vo);
		        map.put("ssType", ssType);
		        map.put("weekType",weekType);
		        map.put("vType", vType);
		       
		        int count=service.programTotalPage(map);
		        int totalPage= (int)Math.ceil(count/10.0);
		     
				
				
		        final int BLOCK=10;
		        int startPage=cf.startPage(BLOCK, page);
		        int endPage=cf.endPage(BLOCK, page, totalPage);
		        
		        Map sendMap = new HashMap();
		     
		        
		        sendMap.put("totalpage",totalPage);
		        sendMap.put("start", startPage);
		        sendMap.put("end", endPage);
		        sendMap.put("curpage", page);
		        sendMap.put("startpage", startPage);
		        sendMap.put("endpage", endPage);
		        sendMap.put("size", count);
		        ObjectMapper mapper= new ObjectMapper();
		        String json= mapper.writeValueAsString(sendMap);
		        
		       
			
		return json;
	}
	
	
	//봉사신청 
	 @PostMapping(value="program/apply_vue.do",produces = "text/plain;charset=UTF-8")
	   public String program_apply_vue(VprogramApplyVO vo,int vno,HttpServletRequest request,HttpSession session)
	   {
		
		 String id=(String)session.getAttribute("id");
		 vo.setId(id);
		 vo.setVno(vno);
		 
		 int count=service.getApplyCount(vo);
		   String result="";
		   try
		   {
			   if(count>0) {
				   result="no";
			   }
			   else{
				   String path=request.getSession().getServletContext().getRealPath("/")+"applyUpload\\";
				   path=path.replace("\\", File.separator);// 운영체제의 호환 
				   // Hosting => AWS(리눅스)
				   File dir=new File(path);
				   if(!dir.exists())
				   {
					   dir.mkdir();
				   }
				
				   List<MultipartFile> list=vo.getFiles();//임시 저장
				
				   
				  
					   String filename="";
					   String filesize="";
					   for(MultipartFile mf:list)
					   {
						   String name=mf.getOriginalFilename();
						   File file=new File(path+name);
						   mf.transferTo(file);//  업로드
						   
						   filename+=name+",";// a.jpg,b.jpg,
						   filesize+=file.length()+",";
					   }
					   filename=filename.substring(0,filename.lastIndexOf(","));
					   filesize=filesize.substring(0,filesize.lastIndexOf(","));
					   vo.setV_filename(filename);
					   vo.setV_filesize(filesize);
					   vo.setV_filecount(list.size());
					   
					  
					   vo.setV_state("신청승인대기중");
				  service.programApplyInsert(vo);
				   result="yes";
			   }
			 
		   }catch(Exception ex)
		   {
			   result=ex.getMessage();   
		   }
		   return result;
	   }
	
	
	 //신청리스트
	 @GetMapping(value="program/applyList_vue.do",produces = "text/plain;charset=UTF-8")
		public String applyList_vue(int page,String type,HttpSession session) throws JsonProcessingException {
			String centername=(String)session.getAttribute("centername");
			Map map=new HashMap();
			map.put("centername", centername);
			int rowsize=10;
			int start=cf.start(rowsize, page);
			int end=cf.end(rowsize, page);
			map.put("start", start);
			map.put("end", end);
			map.put("type", type);
			List<VprogramApplyVO> list=service.applyList(map);
			
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(list);
			System.out.println(json);
			return json;
			
		}
	//신청 파일리스트
	 @GetMapping(value="program/applyListPage_vue.do",produces = "text/plain;charset=UTF-8")
	public String applyListPage_vue(int page,String type,HttpSession session) throws JsonProcessingException {
		 
		 String centername=(String)session.getAttribute("centername");
			Map map=new HashMap();
			map.put("centername", centername);
			map.put("type", type);
			
		int totalPage=service.applyListTotalPage(map);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK, page);
		int endpage=cf.endPage(BLOCK, page, totalPage);
			
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("curpage", page);
		map.put("totalpage", totalPage);
		
		
		 ObjectMapper mapper= new ObjectMapper();
		 String json=mapper.writeValueAsString(map);
		 System.out.println(json);
		 return json;
		
	}
	 
		 //신청 파일리스트
		 @GetMapping(value="program/applyListFiles_vue.do",produces = "text/plain;charset=UTF-8")
		public String applyListFiles_vue(int vano) throws JsonProcessingException {
		
			 VprogramApplyVO vo=service.getApplyFiles(vano);
			 
			 ObjectMapper mapper= new ObjectMapper();
			 String json=mapper.writeValueAsString(vo);
			 
			 return json;
			
		}
		 
		 
		 //신청승인
		 @GetMapping("program/applyAccess_vue.do")
		 public String applyAccess(int vano) {
			String result= service.updateAccess(vano);
			
			return result;
			 
		 }
	
		 
		 //신청거절
		 @GetMapping("program/applyRefuse_vue.do")
		 public void applyRefuse(int vano) {
			 service.updateRefuse(vano);
			
		 }
		 
		 
		 //센터인증승인
		 @GetMapping(value="program/accessCertifyDetail_vue.do",produces = "text/plain;charset=UTF-8")
		 public String accessCertifyDetail_vue(int vano,HttpServletRequest request) throws JsonProcessingException {
//			 String path=request.getSession().getServletContext().getRealPath("/")+"applyCertifyUpload\\";
//			   path=path.replace("\\", File.separator);// 운영체제의 호환 
			 String path="../applyCertifyUpload/";
			 
			 VprogramApplyVO vo=service.centerCertifyAccess(vano);
			
			Map map =new HashMap();
			map.put("vo", vo);
			map.put("path", path);
			
			ObjectMapper mapper= new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			System.out.println(json);
			return json;
			 
		 }
		 
		 
		 //센터 봉사인증 목록 디테일 승인
		 @GetMapping("program/updateCertifyAccesss_vue.do")
		 public String updateCertifyAccesss_vue(int vano) {
			 String result="";
			 try {
				 service.updateInformAfCertify(vano);
				 result="YES";
			} catch (Exception e) {
				// TODO: handle exception
				result="NO";
			}
			 
			 return result;
		 }
	
	//프로그램 자료실
	
	 @GetMapping(value="program/databoardList_vue.do",produces = "text/plain;charset=UTF-8")
	   public String databoard_list(int page) throws Exception
	   {
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   List<VdataboardVO> list=service.databoardListData(start, end);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
	   @GetMapping(value="program/databoardPage_vue.do",produces = "text/plain;charset=UTF-8")
	   public String databoard_page(int page) throws Exception
	   {
		   int totalpage=service.databoardTotalPage();
		   Map map=new HashedMap();
		   map.put("curpage", page);
		   map.put("totalpage", totalpage);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(map);// {curpage:1,totalpage:10}
		   return json;
	   }
	   
	   @PostMapping(value="program/databoardInsert_vue.do",produces = "text/plain;charset=UTF-8")
	   public String databoard_insert(VdataboardVO vo,HttpServletRequest request)
	   {
		 
		   System.out.println(vo.getV_check());
		   String result="";
		   try
		   {
			   String path=request.getSession().getServletContext().getRealPath("/")+"databoardUpload\\";
			   path=path.replace("\\", File.separator);// 운영체제의 호환 
			   // Hosting => AWS(리눅스)
			   File dir=new File(path);
			   if(!dir.exists())
			   {
				   dir.mkdir();
			   }
			
			   List<MultipartFile> list=vo.getFiles();//임시 저장
			
			   if(list==null) // 업로드가 없는 상태
			   {
				   vo.setFilename("");
				   vo.setFilesize("");
				   vo.setV_filecount(0);
			   }
			   else //업로드가 있는 상태 
			   {
				   String filename="";
				   String filesize="";
				   for(MultipartFile mf:list)
				   {
					   String name=mf.getOriginalFilename();
					   File file=new File(path+name);
					   mf.transferTo(file);//  업로드
					   
					   filename+=name+",";// a.jpg,b.jpg,
					   filesize+=file.length()+",";
				   }
				   filename=filename.substring(0,filename.lastIndexOf(","));
				   filesize=filesize.substring(0,filesize.lastIndexOf(","));
				   vo.setFilename(filename);
				   vo.setFilesize(filesize);
				   vo.setV_filecount(list.size());
			   }
			   service.databoardInsert(vo);
			   result="yes";
		   }catch(Exception ex)
		   {
			   result=ex.getMessage();   
		   }
		   return result;
	   }
	   
	   @GetMapping(value = "program/databoardDetail_vue.do",produces = "text/plain;charset=UTF-8")
	   public String databoard_detail(int dno) throws Exception
	   {
		   /*
		    *   no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,"
	    	   +"hit,filename,filesize,filecount
	    	   
	    	   response.data={"no":1,name:"",subject:""...filename:""}
	    	   a={"sabun":1,name:"홍길동"};
	    	   a.sabun a.name
		    */
		   VdataboardVO vo=service.databoardDetailData(dno);
		
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
	   @GetMapping(value="program/download.do")
	   public void databoard_download(String fn,String type,HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   
		   String dir="databoardUpload\\";
		   if(type.equals("apply")) {
			   dir="applyUpload\\";
		   }
		   String path=request.getSession().getServletContext().getRealPath("/")+dir;
		   path=path.replace("\\", File.separator);
		   
		   try
		   {
			   File file=new File(path+fn);
			   response.setHeader("Content-Disposition", "attachment;filename="
					                +URLEncoder.encode(fn, "UTF-8"));
			   response.setContentLength((int)file.length());
			   // => 다운로드 창을 보여준다 
			   
			   BufferedInputStream bis=
					   new BufferedInputStream(new FileInputStream(file));
			   // 서버에서 파일을 읽어 온다 
			   BufferedOutputStream bos=
					   new BufferedOutputStream(response.getOutputStream());
			   // 클라이언트 복사 영역
			   int i=0;
			   byte[] buffer=new byte[1024];
			   while((i=bis.read(buffer, 0, 1024))!=-1)
			   {
				   //i=읽은 바이트수 
				   //-1 EOF 
				   bos.write(buffer, 0, i);
			   }
			   bis.close();
			   bos.close();
			   
		   }catch(Exception ex) {}
	   }
	   
	   
	   
	   @GetMapping("program/databoardDelete_vue.do")
	   public String databoard_delete(int dno,HttpServletRequest request)
	   {
		   String path=request.getSession().getServletContext().getRealPath("/")+"databoardUpload\\";
		   path=path.replace("\\", File.separator);
		   String result="";
		   try
		   {
			   VdataboardVO vo=service.databoardFileInfoData(dno);
			
			   
				  
				   if(vo.getV_filecount()>0)
				   {
					   StringTokenizer st=
							   new StringTokenizer(vo.getFilename(),",");
					   while(st.hasMoreTokens())
					   {
						   File file=new File(path+st.nextToken());
						   file.delete();
					   }
				   }
				   
				   service.databoardDelete(dno);
				   result="yes";
			  
		   }catch(Exception ex) {
			   ex.printStackTrace();
			   result="no";
		   }
		   return result;
	   }
	
//관심목록 프로그램 담기
	   
	   @GetMapping(value="program/wishlistUpdate_vue.do",produces = "text/plain;charset=UTF-8")
	   public String updateZzim(int vno,String zzimstate,HttpSession sesion) {
		   String id=(String)sesion.getAttribute("id");
		   Map map =new HashMap();
		   map.put("id", id);
		   map.put("vno", vno);
		   if(zzimstate.equals("NO")) {
			   map.put("state","YES");   
		   }
		   
		   if(zzimstate.equals("YES")) {
			   map.put("state","NO");   
		   }
		   
		   String send=service.updateWishList(map);
		   
		   return send;
		   
	   }
	   
	   
	   
	   //새프로그램
	   @PostMapping(value="program/newprogramForm.do",produces = "text/plain;charset=UTF-8")
		  public String insertNewProgram(ProgramVO vo,HttpSession session) {
			
			  
			 String result="";
			  vo.setInt_runtime(0);
			  vo.setApply_num(0);
			  vo.setHit(0);
			  vo.setStack_apply(0);
			  vo.setStack_apply(0);
			  vo.setCollect_state("모집중");
			  String centername=(String)session.getAttribute("centername");
			  vo.setCentername(centername);
			  
			  try {
				  service.insertCenterProgram(vo);
				  result="OK";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				  result="NO";
			}
			
			  
			  return result;
		  }

}
