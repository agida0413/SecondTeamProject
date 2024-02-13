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

				
			
	
</body>
</html>