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
<div id="programAside" style="margin-right:40px;" >
 <ul class="list-group">
  <li class="list-group-item" style="font-size:35px; padding:25px; font-weight:bold;">봉사프로그램</li>
  
<a href="../program/list.do"> <li class="list-group-item ${cate == 'list' ? 'active' : ''}" style="padding: 18px;">봉사프로그램 조회</li></a>

  
  <a href="../program/databoardList.do"><li class="list-group-item ${cate == 'databoard' ? 'active' : ''}" style="padding:18px;">자료실(양식다운)</li></a>
 
   <a href="../program/statistics.do?type=A"><li class="list-group-item ${cate == 'statistics' ? 'active' : ''}" style="padding:18px;">통계정보</li></a>



 <li class="list-group-item focusLink ${cate == 'accessCertify' ? 'active' : ''}" style="padding:18px;" @click="moveCertify()">봉사활동인증 승인</li>
   <li class="list-group-item focusLink ${cate == 'applyList' ? 'active' : ''}"  style="padding:18px;" @click="moveApplyList()">봉사신청 승인</li>
  <li class="list-group-item focusLink ${cate == 'newProgram' ? 'active' : ''}"  style="padding:18px;" @click="moveNewProgram()">새로운 프로그램 등록</li>
  
 
</ul>

 <div style="margin-top:45px; max-height:2200px; ">
 <span class="text-center"><span style="font-size:25px; color:black; font-weight:bold;">맞춤형 추천 프로그램</span></span>
 
 <hr>
 <div class="row">
 <c:if test="${sessionScope.id==null }">
	<span style="font-weight:bold; font-size:20px; margin-left:17px;">로그인 후 이용가능합니다.</span>
 </c:if>
 <c:if test="${sessionScope.id!=null && size==0 }">
 <span style="font-weight:bold; font-size:20px; margin-left:17px;">추천 데이터가 부족합니다.</span>
 </c:if>
 <c:forEach var="vo" items="${recList }">
 <div class="blog-entry d-flex blog-entry-search-item" style="border:1px black solid; border-radius:5px; margin-top:23px; padding:15px; background-color:#f7f7f7;">
						
						<div>
							<span style="font-weight:bold;" class="date">
							${vo.si }&nbsp;${vo.gu }&nbsp;|&nbsp;${vo.major_field }
						
							</span>
								
								
							<h2><a href="single.html"></a></h2>
							<p><span style="font-size:18px; font-weight:bold; color:black;">${vo.title }</span></p>
							
							<p><a href="../program/detail.do?vno=${vo.vno}" class="btn btn-sm btn-outline-primary">Read More</a></p>
						</div>
					</div>
					
 </c:forEach>
 
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
		},
		moveNewProgram(){
			if(this.centername==='' ){
				alert('센터회원만 접근 가능합니다.')
				return;
			}else{
				location.href="../program/newprogram.do"
			}
		}
		
	}
}).mount('#programAside')

</script>
</html>