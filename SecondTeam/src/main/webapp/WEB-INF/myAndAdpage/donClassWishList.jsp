<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 
  
.overff {
    white-space: nowrap; /* 텍스트가 한 줄을 넘어가지 않도록 설정합니다 */
    overflow: hidden; /* 넘치는 텍스트를 숨깁니다 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 "..."으로 대체합니다 */
    width: 520px; /* 텍스트 컨테이너의 너비를 설정하세요 */
}

.img-link img {
        width: 250px;
                height: 220px;
        
    }


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


				<div class="col-lg-12" id="donateClassList">
				 <div class=""><span style="font-weight:bold; font-size:30px; color:black;">원데이 클래스 관심목록</span></div>
				 <hr>
				<c:if test="${size==0 }">
 				
  			<div><h3>관심 프로그램이 존재하지 않습니다.</h3></div>
  			</c:if>
  			
					<c:forEach var="vo" items="${list }">
					<div class="blog-entry d-flex blog-entry-search-item" >
						<a href="../donateclass/detail_cookie.do?dcno=${vo.dcno }" class="img-link me-4">
							<img src="${vo.image }" alt="Image" class="img-fluid">
						</a>
						<div >
							<span class="date" style="margin-left:5px;">${vo.address }&bullet; ${vo.category } | &nbsp;${vo.id }</span>
							<h2 style="margin-left:5px; margin-top:5px;" class="overff"><a href="../donateclass/detail_cookie.do?dcno=${vo.dcno }">${vo.name }</a></h2>
									<div class="rating" style="margin-left:5px;"> 
									    <c:forEach begin="1" end="${vo.score}" var="i">
								        <span class="star">⭐️</span>
								    </c:forEach>
								    <c:if test="${vo.score % 1 >= 0.5}">
								        <span class="half-star">⭐️</span>
								    </c:if>	
									
									
										
									<span style="font-weight:bold;color:orange;  margin-left:20px; font-style: italic;">${vo.score }</span>
									
									</div>
							
							
							
									<table class="table" style="width:500px;">
										<tr style=" font-weight:bold;">
											<td style="border:none;" width="12%">소요시간</td>
											<td style="border:none;" width="12%">${vo.time }</td>
											<td style="border:none; vertical-align:middle; " rowspan="3" width="50%">
											<span  style="font-weight:bold; font-size:40px; color:black;">${vo.wing }&nbsp;<img src="../Projectimages/wing3.png" width="40px"></span>
											</td>
										</tr>
										<tr style=" font-weight:bold;">
											<td style="border:none;">수업인원</td>
											<td style="border:none;">${vo.full_num }&nbsp;명</td>
										</tr>
										<tr style=" font-weight:bold;">
											<td style="border:none;">난이도</td>
											<td style="border:none;">${vo.cls_level }</td>
										</tr>
										<tr></tr>
									</table>
							
								
									
									<div style="margin-top:5px;"></div>
									
									
						</div>
					</div>
			<hr>
				</c:forEach>

				  <div class="row">
  		   	 <ul class="pagination" >
  			 		<c:if test="${startpage>1 }">
				  <li class="page-item"><a href="../myAndAdpage/donClassWishList.do?page=${startpage-1 }" class="link page-link">&lt;</a></li>
				  </c:if>
				   <c:forEach var="i" begin="${startpage }" end="${endpage }">
				  <li class="page-item ${page == i ? 'active' : ''}" aria-current="${page == i ? 'page' : 'null'}">
				 
				  <a class="link page-link" href="../myAndAdpage/donClassWishList.do?page=${i }">${i }</a> 
				  </li>
				   </c:forEach>
				 <c:if test="${endpage<totalpage }">
				  <li  class="page-item"><a href="../myAndAdpage/donClassWishList.do?page=${endpage+1 }" class="link page-link">&gt;</a></li>
				   </c:if>
				   
				   
				</ul> 
  		   </div>

				</div>

		
	
</body>
</html>