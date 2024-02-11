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
</head>
<body>
<!-- 모바일 -->

	
	
	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<div class="row g-0 align-items-center">
						<div class="col-2">
						<a href="../main/main.do" class="logo m-0 float-start">site<span class="text-primary">name</span></a>
						</div>
						<div class="col-8 text-center">
							<div>

							<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
								<li class="active"><a href="index.html">Home</a></li>
								<li class="has-children">
									<a href="category.html">드롭다운예시</a>
									<ul class="dropdown">
										<li><a href="search-result.html">Search Result</a></li>
										<li><a href="blog.html">Blog</a></li>
										<li><a href="single.html">Blog Single</a></li>
										<li><a href="category.html">Category</a></li>
										<li><a href="about.html">About</a></li>
										<li><a href="contact.html">Contact Us</a></li>
										<li><a href="#">Menu One</a></li>
										<li><a href="#">Menu Two</a></li>
										<li class="has-children">
											<a href="#">Dropdown</a>
											<ul class="dropdown">
												<li><a href="#">Sub Menu One</a></li>
												<li><a href="#">Sub Menu Two</a></li>
												<li><a href="#">Sub Menu Three</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><a href="../program/list.do">봉사프로그램</a></li>
								<li><a href="../goods/goods_main.do">상품</a></li>
								<li><a href="category.html">추가예정</a></li>
								<li><a href="category.html">추가예정</a></li>
								<li><a href="category.html">추가예정</a></li>
								<li><a href="category.html">추가예정</a></li>
								<li><a href="category.html">추가예정</a></li>
							</ul>
							
							<span style="float:right;"><a href="#"><img src="../Projectimages/shop.png" width="35px;"></a></span>
							</div>
						
						</div>
						<div class="col-2 text-end">
						   <div>
						   <c:if test="${sessionScope.id==null }">
							<span><a href="../program/login.do" style="color:black;"><img src="../Projectimages/login.png" width="20px;">Login</a></span>
							<span><a href="#" style="color:black;"><img src="../Projectimages/login.png" width="20px;">Join</a></span>
							</c:if>
							
							 <c:if test="${sessionScope.id!=null }">
								<span>${sessionScope.name } 님 환영합니다.</span>
								<span><a href="../myAndAdpage/mypage.do" style="color:black;"><img src="../Projectimages/login.png" width="20px;">mypage</a></span>
							<span><a href="../program/logout.do" style="color:black;"><img src="../Projectimages/login.png" width="20px;">Logout</a></span>
							
							</c:if>
						   </div>
						   
						   <div style=" float:right; margin-top:10px;">
						   	<span>보유 윙:0개..</span>
						   </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	
	
	
</body>
</html>