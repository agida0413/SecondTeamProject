<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 .star {
        color: #ffd700;
        margin-right: 5px;
      }
      
       .half-star {
  position: relative;
  display: inline-block;
  width: 12px; /* 별 크기에 따라 조절 */
  overflow: hidden;
}

.half-star::before {
  content: '⭐️'; /* 별 아이콘 */
  position: absolute;
  top: 0;
  left: 0;
  width: 50%; /* 반개 별을 나타내는 크기 조절 */
  overflow: hidden;
}
.rating {
        display: flex;
        align-items: center;
        
      }
  
.overff {
    white-space: nowrap; /* 텍스트가 한 줄을 넘어가지 않도록 설정합니다 */
    overflow: hidden; /* 넘치는 텍스트를 숨깁니다 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 "..."으로 대체합니다 */
    width: 520px; /* 텍스트 컨테이너의 너비를 설정하세요 */
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


  
<div class="container">

<div class="row">

<div class="section search-result-wrap">
		<div class="container">
		
			
			<div class="row posts-entry">
				<div class="col-lg-8">
					<div class="blog-entry d-flex blog-entry-search-item">
						<a href="single.html" class="img-link me-4">
							<img src="https://image.idus.com/image/files/121db4e69c034522946f295384915ab9_720.jpg" alt="Image" class="img-fluid">
						</a>
						<div>
							<span class="date" style="margin-left:5px;">서울 동작구 | 공예 &bullet; <a href="#">Hammer's Story</a></span>
							<h2 style="margin-left:5px; margin-top:5px;" class="overff"><a href="single.html">하나뿐인 실버주얼리 만들기sssssssssssssss</a></h2>
									<div class="rating" style="margin-left:5px;"> 
									    <span class="star">⭐️</span>	
									    <span class="star">⭐️</span>	
									    <span class="star">⭐️</span>	
									    <span class="star">⭐️</span>	
									    <span class="half-star">⭐️</span>
									
									</div>
							
							
							
									<table class="table" style="width:500px;">
										<tr style=" font-weight:bold;">
											<td style="border:none;" width="12%">소요시간</td>
											<td style="border:none;" width="12%">3 시간</td>
											<td style="border:none; vertical-align:middle; " rowspan="3" width="50%">
											<span  style="font-weight:bold; font-size:40px; color:black;">10000&nbsp;<img src="../Projectimages/wing3.png" width="40px"></span>
											</td>
										</tr>
										<tr style=" font-weight:bold;">
											<td style="border:none;">수업인원</td>
											<td style="border:none;">2명</td>
										</tr>
										<tr style=" font-weight:bold;">
											<td style="border:none;">난이도</td>
											<td style="border:none;">중</td>
										</tr>
										<tr></tr>
									</table>
							
								
								
										
								
									
									
									
									<div style="margin-top:5px;"></div>
									
								
								
								
								
								
									
						
								
								
							
						</div>
					</div>

				

					<div class="row text-start pt-5 border-top text-center">
						<div class="col-md-12">
							<div class="custom-pagination">
								<span>1</span>
								<a href="#">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<span>...</span>
								<a href="#">15</a>
							</div>
						</div>
					</div>

				</div>

				<div class="col-lg-4 sidebar">
					
					<div class="sidebar-box search-form-wrap mb-4">
						<form action="#" class="sidebar-search-form">
							<span class="bi-search"></span>
							<div style="position: relative;">
					<input type="text" class="form-control" placeholder="검색어 입력"
						
						style="background-color: black;"> <span class="bi bi-search" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);"></span>
							</div></form>
					</div>
					<!-- END sidebar-box -->
				
					<!-- END sidebar-box -->

					<div class="sidebar-box">
						<h3 class="heading">카테고리</h3>
						<ul class="categories">
							<li><a href="#">전체<span>(12)</span></a></li>
							<li><a href="#">공예<span>(22)</span></a></li>
							<li><a href="#">요리<span>(37)</span></a></li>
							<li><a href="#">미술<span>(42)</span></a></li>
							<li><a href="#">뷰티<span>(14)</span></a></li>
							<li><a href="#">체험 및 기타<span>(14)</span></a></li>
						</ul>
					</div>
					<!-- END sidebar-box -->
					
						<div class="sidebar-box">
						<h3 class="heading">최근본 원 데이 클래스</h3>
						<div class="post-entry-sidebar">
							<ul>
								<li>
									<a href="">
										<img src="images/img_1_sq.jpg" alt="Image placeholder" class="me-4 rounded">
										<div class="text">
											<h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
											<div class="post-meta">
												<span class="mr-2">March 15, 2018 </span>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="">
										<img src="images/img_2_sq.jpg" alt="Image placeholder" class="me-4 rounded">
										<div class="text">
											<h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
											<div class="post-meta">
												<span class="mr-2">March 15, 2018 </span>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="">
										<img src="images/img_3_sq.jpg" alt="Image placeholder" class="me-4 rounded">
										<div class="text">
											<h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
											<div class="post-meta">
												<span class="mr-2">March 15, 2018 </span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="sidebar-box">
						<h3 class="heading">Tags</h3>
						<ul class="tags">
							<li><a href="#">Travel</a></li>
							<li><a href="#">Adventure</a></li>
							<li><a href="#">Food</a></li>
							<li><a href="#">Lifestyle</a></li>
							<li><a href="#">Business</a></li>
							<li><a href="#">Freelancing</a></li>
							<li><a href="#">Travel</a></li>
							<li><a href="#">Adventure</a></li>
							<li><a href="#">Food</a></li>
							<li><a href="#">Lifestyle</a></li>
							<li><a href="#">Business</a></li>
							<li><a href="#">Freelancing</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>
  </div>	
</div>	
</body>
</html>