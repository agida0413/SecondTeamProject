<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<link rel="stylesheet" href="../css/star.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<footer class="site-footer" style="height:700px;">
		<div class="container">
			<div class="row">
			
				<div class="col-lg-8">
				
				
			
					<div class="widget">
						<h3 class="mb-4">Quick menu</h3>
						<ul class="list-unstyled float-start links">
							<li style="font-weight:bold; font-size:20px;"><a href="#">봉사프로그램</a></li>
						
							<li ><a href="../program/list.do"> 봉사프로그램 조회</a></li>
								<li ><a href="../program/databoardList.do"> 자료실(양식다운)</a></li>
							<li ><a href="../program/statistics.do?type=A"> 통계정보</a></li>
						
						
						</ul>
						<ul class="list-unstyled float-start links">
							<li style="font-weight:bold; font-size:20px;"><a href="#">재능기부</a></li>
							<li><a href="../donateclass/list.do?type=A">재능기부 클래스</a></li>
											<li><a href="../donateclass/newclass.do">나의 재능등록</a></li>
							
						</ul>
						<ul class="list-unstyled float-start links">
							<li style="font-weight:bold; font-size:20px;"><a href="#">소모임</a></li>
							<li><a href="../moim/list.do">소모임 리스트</a></li>
							<li><a href="../moim/reserve.do">소모임 예약하기</a></li>
						</ul>
						<ul class="list-unstyled float-start links">
							<li style="font-weight:bold; font-size:20px;"><a href="../donation/donationMain.do">후원 캠페인</a></li>
							<li><a href="../donation/donationMain.do">캠페인 후원하기</a></li>
						</ul>
						<ul class="list-unstyled float-start links">
							<li style="font-weight:bold; font-size:20px;"><a href="#">주메뉴</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Vision</a></li>
							<li><a href="#">Mission</a></li>
							<li><a href="#">Terms</a></li>
							<li><a href="#">Privacy</a></li>
						</ul>
						<ul class="list-unstyled float-start links">
							<li style="font-weight:bold; font-size:20px;"><a href="#">주메뉴</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Vision</a></li>
							<li><a href="#">Mission</a></li>
							<li><a href="#">Terms</a></li>
							<li><a href="#">Privacy</a></li>
						</ul>
						<ul class="list-unstyled float-start links">
							<li style="font-weight:bold; font-size:20px;"><a href="#">주메뉴</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Vision</a></li>
							<li><a href="#">Mission</a></li>
							<li><a href="#">Terms</a></li>
							<li><a href="#">Privacy</a></li>
						</ul>
					</div> <!-- /.widget -->
				
				
				
				</div>
				
				
				
				<div class="col-lg-4">
					<div class="widget">
						<h3 class="mb-4">Recent Post Entry</h3>
						<div class="post-entry-footer">
							<ul>
								<li>
									<a href="../donateclass/detail_cookie.do?dcno=${dcvo.dcno }">
										<img src="${dcvo.image }" alt="Image placeholder" class="me-4">
										<div class="text">
											<h4>이달의 재능</h4>
											<div class="post-meta">
												<span class="mr-2">${dcvo.name }</span>
													<div class="rating" style="margin-left:5px;"> 
									    <c:forEach begin="1" end="${dcvo.score}" var="i">
								        <span class="star">⭐️</span>
								    </c:forEach>
								    <c:if test="${dcvo.score % 1 >= 0.5}">
								        <span class="half-star">⭐️</span>
								    </c:if>	
									
									
										
									<span style="font-weight:bold;color:orange;  margin-left:20px; font-style: italic;">${dcvo.score }</span>
									
									</div>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="../donation/donation_before_detail.do?dno=${dovo.dno }">
										<img src="${dovo.d_image }" class="me-4">
										<div class="text">
											<h4>이달의 캠페인</h4>
											<div class="post-meta">
												<span class="mr-2">${dovo.d_title }</span>
												<p class="mr-2">목표:${dovo.d_goal }원</p>
												
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="../goods/goods_before_detail.do?gno==${gvo.gno }">
										<img src="${gvo.g_img }" class="me-4">
										<div class="text">
											<h4>이달의 상품</h4>
											<div class="post-meta">
												<span class="mr-2">${gvo.g_name }</span>
												<p class="mr-2">상품가격:${gvo.g_price }원</p>
												
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="">
										<img src="../images/img_1_sq.jpg" alt="Image placeholder" class="me-4 ">
										<div class="text">
											<h4>이달의 xxx</h4>
											<div class="post-meta">
												<span class="mr-2">부내용</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>


					</div> <!-- /.widget -->
				</div> <!-- /.col-lg-4 -->
						<div class="widget">
						<h3 class="mb-4"><span class="logo m-0 ">W<sub><span style="font-size:20px;">e all have potential to</span></sub></span><span class="text-primary"></span>
						<span class="logo m-0 ">I<sub><span style="font-size:20px;">ncrease the</span></sub></span><span class="text-primary"></span>
						<span class="logo m-0 ">N<sub><span style="font-size:20px;">ecessary </span></sub></span><span class="text-primary"></span>
						<span class="logo m-0 ">G<sub><span style="font-size:20px;">ood influence  </span></sub></span><span class="text-primary"></span>
					
						</h3>
					
					</div>
					
					
					
			</div> <!-- /.row -->

		
      </div> <!-- /.container -->
    </footer> <!-- /.site-footer -->
</body>
</html>