<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

 <ul class="list-group">
  <li class="list-group-item" style="font-size:40px; padding:25px; font-weight:bold;">봉사프로그램</li>
  
<a href="../program/list.do"> <li class="list-group-item ${cate == 'list' ? 'active' : ''}" style="padding: 18px;">봉사프로그램 조회</li></a>

  <li class="list-group-item" style="padding:18px;">이달의 봉사자</li>
  <a href="../program/databoardList.do"><li class="list-group-item ${cate == 'databoard' ? 'active' : ''}" style="padding:18px;">자료실(양식다운)</li></a>
  <li class="list-group-item" style="padding:18px;">Q/A</li>
  <li class="list-group-item" style="padding:18px;">자주하는질문</li>
  <li class="list-group-item" style="padding:18px;">통계정보</li>
 <c:if test="${sessionScope.centername!=null }">
  <li class="list-group-item" style="padding:18px;">봉사활동인증 승인</li>
    <a href="../program/applyList.do"><li class="list-group-item ${cate == 'applyList' ? 'active' : ''}"  style="padding:18px;">봉사신청 승인</li></a>
  </c:if>
  
  <c:if test="${sessionScope.id!=null && sessionScope.centername==null }">
  <li class="list-group-item" style="padding:18px;">회원님을 위한 추천봉사프로그램</li>
  </c:if>	
</ul>

 

</html>