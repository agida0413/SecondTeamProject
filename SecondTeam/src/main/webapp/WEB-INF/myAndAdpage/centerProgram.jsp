<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.aType{
 height:100px;
 width: 100px; 
 border:1px black solid;        
 borderRadius:5px; 
  background-color:#FF6347;
}
.bType{
 height:100px;
 width: 100px; 
 border:1px black solid;        
 borderRadius:5px; 
  background-color:#ADD8E6;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class=""><span style="font-weight:bold; font-size:30px; color:black;">센터's 프로그램</span></div>
  
<div class="container">

		<div class="row">
	
  			
  			
  			
  			<c:forEach var="vo" items="${list }">
  			<a href="../program/Wishdetail.do?vno=${ vo.vno}"style="color:black">
  			<div class="row nextline"></div>
  			<div class="row findList">
  				
	  			<div class="col-10">
	  				<div class="" style="margin-top:15px; margin-bottom:10px;">
	  				
	  				<div style="margin-bottom:10px;"><span><span style="font-weight:bold; color:blue;">획득가능한 보상&nbsp;</span><span style="font-weight:bold;">[&nbsp;${vo.getwing}&nbsp;<img src="../Projectimages/wing3.png" width="20px;">]</span></span></div>
						<!-- 봉사 분야 -->	
						<span class="">
						${vo.active_type} &nbsp;&nbsp;|&nbsp;&nbsp;<span style="font-weight:bold;">${vo.major_field}</span>&nbsp;&gt;&nbsp;${vo.minor_field}
						</span>
					</div>
					<!-- 봉사프로그램정보 -->
					<div class="">
						<div class="programName">
							<span style="font-size:20px; font-weight:bold;">${vo.title}</span>
						</div>
						
						<div style="margin-top:7px;">
						<span class="programSubinformAll"><span style="font-weight:bold;">[봉사기간]</span><span class="programSubinform">${vo.dbV_start}~${vo.dbV_end}</span></span>
						 <span class="programSubinformAll"><span style="font-weight:bold;">[모집기간]</span><span class="programSubinform">${vo.dbCollect_start} ~ ${vo.dbCollect_end}</span></span> 
						  <span class="programSubinformAll"><span style="font-weight:bold;">[봉사시간]</span><span class="programSubinform">${vo.runtime}</span></span>
						</div>
						
						<div style="margin-top:7px;">
						<span class="programSubinformAll"><span style="font-weight:bold;">[지역]</span><span class="programSubinform">${vo.si}&nbsp;${vo.gu} </span></span> 
						<span class="programSubinformAll"><span style="font-weight:bold;">[모집기관]</span><span class="programSubinform">${vo.centername}</span></span>
						</div>
					</div>
				</div>
				
				<div class="col-2">
					<!-- 모집상태 -->
					<div style="margin:30px;">
						<div class="closeBox ${vo.collect_state == '모집완료' ? 'aType' : 'bType'}">
						<div style="margin-top:35px; font-weight:bold; color:white;" class="text-center" >${vo.collect_state}</div>
						</div>
							
					</div>
					
				</div>				
				
  		   </div>
  		   
  		   </a>
  		 </c:forEach>
  		
  		</div>
  		
  		
  		<div style="height:30px;"></div>
  		
  		 <div class="row">
  		   	 <ul class="pagination" >
  			 		<c:if test="${startpage>1 }">
				  <li class="page-item"><a href="../myAndAdpage/centerProgram.do?page=${startpage-1 }" class="link page-link">&lt;</a></li>
				  </c:if>
				   <c:forEach var="i" begin="${startpage }" end="${endpage }">
				  <li class="page-item ${page == i ? 'active' : ''}" aria-current="${page == i ? 'page' : 'null'}">
				 
				  <a class="link page-link" href="../myAndAdpage/centerProgram.do?page=${i }">${i }</a> 
				  </li>
				   </c:forEach>
				 <c:if test="${endpage<totalpage }">
				  <li  class="page-item"><a href="../myAndAdpage/centerProgram.do?page=${endpage+1 }" class="link page-link">&gt;</a></li>
				   </c:if>
				   
				   
				</ul> 
  		   </div>
  		
  		
  		</div>
  		<!-- 페이징 -->
  			
</body>
</html>