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
<div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 신청현황</span></div>
  <hr>
  
  
<div class="conatainer">

<div style="margin-top:15px;margin-bottom:15px;">
<a href="../myAndAdpage/programHistory.do?state=WAIT" class="btn btn-large ${state=='WAIT'?'btn-danger':'btn-primary' }">신청승인 대기중</a> 
<a href="../myAndAdpage/programHistory.do?state=REJECT" class="btn btn-large ${state=='REJECT'?'btn-danger':'btn-primary' }">승인거절된 프로그램</a> 
<a href="../myAndAdpage/programHistory.do?state=ACCESS" class="btn btn-large ${state=='ACCESS'?'btn-danger':'btn-primary' }">시작대기중 프로그램</a> 
<a href="../myAndAdpage/programHistory.do?state=RUN" class="btn btn-large ${state=='RUN'?'btn-danger':'btn-primary' }">봉사중</a> 
<a href="../myAndAdpage/programHistory.do?state=COMPLETE" class="btn btn-large ${state=='COMPLETE'?'btn-danger':'btn-primary' }">봉사완료</a> 
</div>

<c:if test="${size==0 }">
<h3>내역이 존재하지 않습니다.</h3>
</c:if>

<c:if test="${state=='COMPLETE' }">
<div style="margin-top:15px;margin-bottom:15px; color:orange; opacity:0.7;">
<h2 >봉사완료프로그램 인증신청으로 이동하여 보상을 받으세요</h2>
</div>
</c:if>
	<c:forEach var="vo" items="${list }">
	
		<div class="row" style="margin-top:20px; border: 1px solid #999999; padding:20px; border-radius:5px;">
  				<div class="programName" style="margin-bottom:15px;">
							<span style="font-size:25px; font-weight:bold;  color:black;">${vo.pvo.title }</span>
						</div>
	  			<table class="table">
	  				<tr  style="background-color:#f0f0f0">
	  					<th width="30%">센터이름</th>
	  					<th width="30%">봉사기간</th>
	  					
	  					<th width="20%">신청일시</th>
	  					<th width="20%">신청상태</th>
	  				</tr>
	  				
	  				<tr style="height:70px; vertical-align:middle;">
	  				<td >${vo.pvo.centername }</td>
	  					<td>${vo.pvo.dbV_start }&nbsp;~&nbsp;${vo.pvo.dbV_end }</td>
	  					
	  					<td>${vo.getVDbStateTime()}</td>
	  					<td style="font-weight:bold; font-size:20px; color:blue;">${vo.v_state }</td>
	  				</tr>
	  			</table>
				
				
			
				
  		   </div>
  		   </c:forEach>
  		    <div style="height:20px;"></div>
  		   <div class="row">
  		   	 <ul class="pagination" >
  			 		<c:if test="${startpage>1 }">
				  <li class="page-item"><a href="../myAndAdpage/programHistory.do?page=${startpage-1 }&state=${state}" class="link page-link">&lt;</a></li>
				  </c:if>
				   <c:forEach var="i" begin="${startpage }" end="${endpage }">
				  <li class="page-item ${page == i ? 'active' : ''}" aria-current="${page == i ? 'page' : 'null'}">
				 
				  <a class="link page-link" href="../myAndAdpage/programHistory.do?page=${i }&state=${state}">${i }</a> 
				  </li>
				   </c:forEach>
				 <c:if test="${endpage<totalpage }">
				  <li  class="page-item"><a href="../myAndAdpage/programHistory.do?page=${endpage+1 }&state=${state}" class="link page-link">&gt;</a></li>
				   </c:if>
				   
				   
				</ul> 
  		   </div>
</div>
</body>
</html>