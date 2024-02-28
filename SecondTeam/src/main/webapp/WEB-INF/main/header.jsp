<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
<!-- 모바일 -->

	
	
	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<div class="row g-0 align-items-center">
						<div class="col-2" >
						<a href="../main/main.do" class="logo m-0 float-start">wi<span class="text-primary">ng&nbsp;<img src="../Projectimages/wing3.png" width="50px"></span></a>
						</div>
						<div class="col-8 text-center">
							<div>

							<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
								<li class="active"><a href="index.html">Home</a></li>
								<li class="has-children">
									<a href="../program/list.do">봉사 프로그램</a>
									<ul class="dropdown">
										
  
											<li><a href="../program/list.do"> 봉사프로그램 조회</a></li>

  
 											<li> <a href="../program/databoardList.do">자료실(양식다운)</a></li>
 												<li><a href="../program/statistics.do">통계정보</a></li>
  
											 <c:if test="${sessionScope.centername!=null }"><!--변경요망-->
											 <li><a href="../program/accessCertify.do">봉사활동인증 승인</a></li>
											    <li ><a href="../program/applyList.do">봉사신청 승인</a></li>
											  </c:if>
											  
											 
										
									</ul>
								</li>
								
								
								
									<li class="has-children">
									<a href="../donateclass/list.do?type=A">재능기부 클래스</a>
									<ul class="dropdown">
										
  
											<li><a href="../donateclass/list.do?type=A">재능기부 클래스</a></li>
											<li><a href="../donateclass/newclass.do">나의 재능등록</a></li>
  										
 											
										
									</ul>
								</li>
								
								<li><a href="../goods/goods_main.do">상품</a></li>
								<li><a href="../donation/donationMain.do">후원캠페인</a></li>
								<li class="has-children">
									<a href="../moim/list.do">소모임</a>
									<ul class="dropdown">
											<li><a href="../moim/list.do">소모임 리스트</a></li>
											<li><a href="../moim/reserve.do">소모임 예약하기</a></li>
									</ul>
								</li>
								<li><a href="category.html">추가예정</a></li>
								<li><a href="category.html">추가예정</a></li>
							
							</ul>
							
							<span style="float:right;"><a href="../cart/cart_main.do"><img src="../Projectimages/shop.png" width="35px;"></a></span>
							</div>
						
						</div>
						<div class="col-2 text-end">
						   <div>
						   <c:if test="${sessionScope.id==null }">
						   <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
						   <li class="has-children">
									<a href="#" style="color:#fff;"><i class="xi-user-plus"></i> JOIN</a>
									<ul class="dropdown">
											<li><a href="../member/join_u.do">일반회원가입</a></li>
											<li><a href="../member/join_c.do">센터회원가입</a></li>
									</ul>
								</li>
							</ul>
							&nbsp;
							<span><a href="../member/login.do" style="color:#fff; font-size: 14px;"><i class="xi-key"></i> LOGIN</a></span>
							</c:if>
							
							 <c:if test="${sessionScope.id!=null }">
								<span style="color:#fff; font-size: 14px;">${sessionScope.name } 님 환영합니다.</span><br>
								   <c:if test="${sessionScope.admin!=1 }">
                        <span><a href="../myAndAdpage/mypage.do" style="color:#fff; font-size: 14px;"><i class="xi-home"></i> MYPAGE</a></span>
                        </c:if>
                        
                        <c:if test="${sessionScope.admin==1 }">
                        <span><a href="../adminPage/adminMain.do" style="color:#fff; font-size: 14px;"><i class="xi-home"></i> ADMINPAGE</a></span>
                        </c:if>
							<span><a href="../member/logout.do" style="color:#fff; font-size: 14px;"><i class="xi-log-out"></i> LOGOUT</a></span>
							
							</c:if>
						   </div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	
	
	
</body>
</html>