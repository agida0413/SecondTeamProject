<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.focusLink{
cursor:pointer;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div id="programAside">
 <ul class="list-group">
  <li class="list-group-item" style="font-size:40px; padding:25px; font-weight:bold;">봉사프로그램</li>
  
<a href="../program/list.do"> <li class="list-group-item ${cate == 'list' ? 'active' : ''}" style="padding: 18px;">봉사프로그램 조회</li></a>

  
  <a href="../program/databoardList.do"><li class="list-group-item ${cate == 'databoard' ? 'active' : ''}" style="padding:18px;">자료실(양식다운)</li></a>
 
   <a href="../program/statistics.do?type=A"><li class="list-group-item ${cate == 'statistics' ? 'active' : ''}" style="padding:18px;">통계정보</li></a>



 <li class="list-group-item focusLink ${cate == 'accessCertify' ? 'active' : ''}" style="padding:18px;" @click="moveCertify()">봉사활동인증 승인</li>
   <li class="list-group-item focusLink ${cate == 'applyList' ? 'active' : ''}"  style="padding:18px;" @click="moveApplyList()">봉사신청 승인</li>
  
  
 
</ul>

 <div style="margin-top:45px; max-height:2200px;">
 <span class="text-center"><h3>맞춤형 추천 프로그램</h3></span>
 <hr>
 <div class="row">
 
 
 </div>
 
 </div>
 
 </div>
<script>
let programAside=Vue.createApp({
	data(){
		return{
			centername:'${sessionScope.centername}'
		}
	},
	methods:{
		moveCertify(){
			console.log(this.centername)
			if(this.centername==='' ){
				alert('센터회원만 접근 가능합니다.')
				return;
			}else{
				location.href="../program/accessCertify.do"
			}
		},
		moveApplyList(){
			if(this.centername==='' ){
				alert('센터회원만 접근 가능합니다.')
				return;
			}else{
				location.href="../program/applyList.do"
			}
		}
	}
}).mount('#programAside')

</script>
</html>