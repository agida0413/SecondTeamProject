<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 완료인증신청</span></div>
  <hr>
  
  
<div class="conatainer">

<div style="margin-top:15px;margin-bottom:15px;">
<a href="../myAndAdpage/programCertify.do?state=COMPLETE" class="btn btn-large ${state=='COMPLETE'?'btn-danger':'btn-primary' }">인증신청가능 프로그램</a> 
<a href="../myAndAdpage/programCertify.do?state=WAITCERTIFY" class="btn btn-large ${state=='WAITCERTIFY'?'btn-danger':'btn-primary' }">인증승인 대기중</a> 
<a href="../myAndAdpage/programCertify.do?state=COMPLETECERTIFY" class="btn btn-large ${state=='COMPLETECERTIFY'?'btn-danger':'btn-primary' }">보상지급완료</a> 


</div>

<c:if test="${size==0 }">
<h3>내역이 존재하지 않습니다.</h3>
</c:if>


	<c:forEach var="vo" items="${list }">
		<div class="row" style="margin-top:20px; border: 1px solid #999999; padding:20px; border-radius:5px;">
  				<div class="programName" style="margin-bottom:15px;">
							<span style="font-size:25px; font-weight:bold;  color:black;">${vo.pvo.title }</span>
							<c:if test="${vo.v_state=='보상지급완료' }">
							<span  style="font-size:25px; font-weight:bold;  color: #9370DB; float:right;">획득한 보상[${vo.pvo.getwing }&nbsp;<span><img src="../Projectimages/wing3.png" width="20px;"></span>]</span>
								</c:if>
						</div>
	  			<table class="table">
	  				<tr  style="background-color:#f0f0f0">
	  					<th width="30%">센터이름</th>
	  					<th width="30%">봉사기간</th>
	  					
	  					<th width="20%">신청일시</th>
	  					<c:if test="${vo.v_state=='봉사완료' }">
	  					<th width="20%"></th>
	  					</c:if>
	  					
	  					<c:if test="${vo.v_state!='봉사완료' }">
	  					<th width="20%">상태</th>
	  					</c:if>
	  				</tr>
	  				
	  				<tr style="height:70px; vertical-align:middle;">
	  				<td >${vo.pvo.centername }</td>
	  					<td>${vo.pvo.dbV_start }&nbsp;~&nbsp;${vo.pvo.dbV_end }</td>
	  					
	  					<td>${vo.getVDbStateTime()}</td>
	  					<c:if test="${vo.v_state=='봉사완료' }">
	  					<td style="font-weight:bold; font-size:20px; color:blue;"><a href="../myAndAdpage/certifyPage.do?vno=${vo.pvo.vno }" class="btn btn-large btn-success">인증하러가기</a></td>
	  					</c:if>
	  					
	  					<c:if test="${vo.v_state!='봉사완료' }">
	  						<td style="font-weight:bold; font-size:18px; color:blue;">${vo.v_state }</td>
	  					</c:if>
	  				</tr>
	  			</table>
				
				
			
				
  		   </div>
  		   </c:forEach>
  		   <div style="height:20px;"></div>
  		   <div class="row">
  		   	 <ul class="pagination" >
  			 		<c:if test="${startpage>1 }">
				  <li class="page-item"><a href="../myAndAdpage/programCertify.do?page=${endpage+1 }&state=${state}" class="link page-link">&lt;</a></li>
				  </c:if>
				   <c:forEach var="i" begin="${startpage }" end="${endpage }">
				  <li class="page-item ${page == i ? 'active' : ''}" aria-current="${page == i ? 'page' : 'null'}">
				 
				  <a class="link page-link" href="../myAndAdpage/programCertify.do?page=${i }&state=${state}">${i }</a> 
				  </li>
				   </c:forEach>
				 <c:if test="${endpage<totalpage }">
				  <li  class="page-item"><a href="../myAndAdpage/programCertify.do?page=${startpage-1 }&state=${state}" class="link page-link">&gt;</a></li>
				   </c:if>
				   
				   
				</ul> 
  		   </div>
</div>
</body>
</html>