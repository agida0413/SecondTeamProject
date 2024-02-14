<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-4 sidebar">
					
					<div class="sidebar-box search-form-wrap mb-4" id="searchDc">
						
							
							<div style="position: relative;">
					<input type="text" class="form-control" placeholder="${ss==''?'검색어 입력':ss }" v-model="ss"
					@keyup.enter="search()"	
						style="background-color: black;"> <span class="bi bi-search" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);" @click="search()"></span>
							</div>
					</div>
					<!-- END sidebar-box -->
				
					<!-- END sidebar-box -->

					<div class="sidebar-box">
						<h3 class="heading">카테고리</h3>
						<ul class="categories">
							<li><a href="../donateclass/list.do?type=A" style="${type=='A'?'background-color: #CCCCCC; border-radius: 5px;':'' }">전체<span style="color:black;">(${Acount })</span></a></li>
							<li><a href="../donateclass/list.do?type=B" style="${type=='B'?'background-color: #CCCCCC; border-radius: 5px;':'' }">공예<span style="color:black;">(${Bcount })</span></a></li>
							<li><a href="../donateclass/list.do?type=C" style="${type=='C'?'background-color: #CCCCCC; border-radius: 5px;':'' }">요리<span style="color:black;">(${Ccount })</span></a></li>
							<li><a href="../donateclass/list.do?type=D" style="${type=='D'?'background-color: #CCCCCC; border-radius: 5px;':'' }">미술<span style="color:black;">(${Dcount })</span></a></li>
							<li><a href="../donateclass/list.do?type=E" style="${type=='E'?'background-color: #CCCCCC; border-radius: 5px;':'' }">뷰티<span style="color:black;">(${Ecount })</span></a></li>
							<li><a href="../donateclass/list.do?type=F" style="${type=='F'?'background-color: #CCCCCC; border-radius: 5px;':'' }">체험 및 기타<span style="color:black;">(${Fcount })</span></a></li>
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
				
				
						
			<script>
			let donateList=Vue.createApp({
				data(){
					return{
						ss:''
						
						
					}
				},
				methods:{
					search(){
						
						location.href="../donateclass/list.do?type=A&ss="+this.ss
					}
				}
			}).mount('#searchDc')
			</script>
</body>
</html>