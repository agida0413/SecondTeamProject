<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul class="list-group">
  <li class="list-group-item" style="font-size:40px; padding:25px; font-weight:bold;">마이페이지</li>
  
<a href="../myAndAdpage/mypage.do"> <li class="list-group-item ${cate == 'inform' ? 'active' : ''}" style="padding: 18px;">개인정보</li></a>

  
  <a href="../myAndAdpage/programHistory.do"><li class="list-group-item ${cate == 'programHistory' ? 'active' : ''}" style="padding:18px;">봉사신청내역/인증신청</li></a>
  <li class="list-group-item" style="padding:18px;">???</li>
  <li class="list-group-item" style="padding:18px;">???</li>
  <li class="list-group-item" style="padding:18px;">???</li>
 
</ul>



</body>
</html>