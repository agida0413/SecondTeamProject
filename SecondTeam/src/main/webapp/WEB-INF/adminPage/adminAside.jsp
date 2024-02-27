<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/vue@3"></script>
   <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.aLink{
cursor:pointer;
}
</style>
</head>
<body>
<ul class="list-group" id="mypageApp">
  <li class="list-group-item" style="font-size:40px; padding:25px; font-weight:bold;">관리자페이지</li>
  
<a href="../adminPage/adminMain.do"> <li class="list-group-item ${cate == 'adminA' ? 'active' : ''}" style="padding: 18px;">회원탈퇴처리/권한부여</li></a>
<a href="../adminPage/buyok.do"> <li class="list-group-item ${cate == 'buyok' ? 'active' : ''}" style="padding: 18px;">구매승인</li></a>

  
  
  

</ul>



</body>
</html>