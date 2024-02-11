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
<div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 신청내역</span></div>
  <hr>
  
  
<div class="conatainer">

	<c:forEach var="vo" items="${list }">
		<div class="row">
  				<div class="programName" style="margin-bottom:15px;">
							<span style="font-size:25px; font-weight:bold;  color:black;">${vo.pvo.title }</span>
						</div>
	  			<table class="table">
	  				<tr  style="background-color:#f0f0f0">
	  					<th width="30%">센터이름</th>
	  					<th width="35%">봉사기간</th>
	  					
	  					<th width="25%">신청일시</th>
	  					<th width="10%">신청상태</th>
	  				</tr>
	  				
	  				<tr style="height:70px; vertical-align:middle;">
	  				<td >${vo.pvo.centername }</td>
	  					<td>${vo.pvo.dbV_start }&nbsp;~&nbsp;${vo.pvo.dbV_end }</td>
	  					
	  					<td>${vo.getVDbStateTime()}</td>
	  					<td>${vo.v_state }</td>
	  				</tr>
	  			</table>
				
				
			
				
  		   </div>
  		   </c:forEach>
  		   
  		   <div class="row">
  		   	 <ul class="pagination" >
  			 		<c:if test="${startpage>1 }">
				  <li class="page-item"><a href="../myAndAdpage/programHistory.do?page=${endpage+1 }" class="link page-link">&lt;</a></li>
				  </c:if>
				   <c:forEach var="i" begin="${startpage }" end="${endpage }">
				  <li class="page-item ${page == i ? 'active' : ''}" aria-current="${page == i ? 'page' : 'null'}">
				 
				  <a class="link page-link" href="../myAndAdpage/programHistory.do?page=${i }">${i }</a> 
				  </li>
				   </c:forEach>
				 <c:if test="${endpage<totalpage }">
				  <li  class="page-item"><a href="../myAndAdpage/programHistory.do?page=${startpage-1 }" class="link page-link">&gt;</a></li>
				   </c:if>
				   
				   
				</ul> 
  		   </div>
</div>
</body>
</html>