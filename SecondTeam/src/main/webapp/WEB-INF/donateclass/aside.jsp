<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.fixedImg img {
        width: 300px;
                height: 100px;
        
    }
    .overffcookie {
    white-space: nowrap; /* 텍스트가 한 줄을 넘어가지 않도록 설정합니다 */
    overflow: hidden; /* 넘치는 텍스트를 숨깁니다 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 "..."으로 대체합니다 */
    width: 220px; /* 텍스트 컨테이너의 너비를 설정하세요 */
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-4 sidebar">
					
					<div class="sidebar-box search-form-wrap mb-4" id="searchDc">
						
							
							<div style="position: relative;">
					<input type="text" class="form-control" placeholder="${ss==''||ss==null?'검색어 입력':ss }" v-model="ss"
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
						<c:if test="${csize==0 && sessionScope.id!=null}">
						<span style="font-weight:bold;  font-size:25px;">최근 본 클래스가 없습니다.</span>
						</c:if>
						
						<c:if test="${sessionScope.id==null }">
						<span style="font-weight:bold;  font-size:25px;">로그인 후 이용가능합니다.</span>
						</c:if>
							<ul>
							<c:forEach var="vo" items="${clist }">
								<li>
									<a href="../donateclass/detail.do?dcno=${vo.dcno }" class="fixedImg">
										<img  src="${vo.image }" alt="Image placeholder" class="me-4 rounded">
										
										<div class="text">
										
											<h4 class="overffcookie">${vo.name }</h4>
											<div class="rating" style="margin-left:5px;"> 
									    <c:forEach begin="1" end="${vo.score}" var="i">
								        <span class="star">⭐️</span>
								    </c:forEach>
								    <c:if test="${vo.score % 1 >= 0.5}">
								        <span class="half-star">⭐️</span>
								    </c:if>	
									
									
										
									<span style="font-weight:bold;color:orange;  margin-left:20px; font-style: italic;">${vo.score }</span>
									
									</div>
									<div><span  style="font-weight:bold; font-size:25px; color:black;">${vo.wing }&nbsp;<img src="../Projectimages/wing3.png" style="width:30px;height:30px; display:inline;" ></span></div>
										
											
										</div>
									</a>
								</li>
								</c:forEach>
							
							</ul>
						</div>
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