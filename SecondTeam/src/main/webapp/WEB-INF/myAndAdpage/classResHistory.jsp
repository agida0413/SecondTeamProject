<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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


				<div class="col-lg-12"  id="classHistoryApp">
				 <div class=""><span style="font-weight:bold; font-size:30px; color:black;">원데이 클래스 예약내역</span></div>
				 <hr>
				<c:if test="${size==0 }">
 				
  			<div><h3>예약내역이 존재하지 않습니다.</h3></div>
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
							
							
								
									<table class="table" >
										<tr style=" font-weight:bold;">
											<td style="border:none;" >예약인원</td>
											<td style="border:none; color:gray;" >${vo.hvo.rnum } 명</td>
											<td style="border:none;">차감 wing</td>
											<td style="color:gray; border:none;"><img src="../Projectimages/wing3.png" width=20px>${vo.hvo.wing }</td>
										</tr>
										<tr style=" font-weight:bold;">
											<td style="border:none;">예약일</td>
											<td style="border:none;color:gray;">${vo.hvo.dbRdate}</td>
											<td style="border:none;">예약 상태</td>
											<td style="color:gray; border:none;">${vo.hvo.state }</td>
										</tr>
										<tr style=" font-weight:bold;">
											<td style="border:none;">수업일</td>
											<td style="border:none;color:gray;">${vo.hvo.cdate}</td>
											<c:if test="${vo.hvo.state!='예약취소' }">
											<td colspan="2" style="padding-left:80px; border:none;"><button class="btn btn-medium btn-danger text-center" @click="cancleRes(${vo.hvo.rhno},${ vo.hvo.rno},${vo.hvo.wing },'${vo.id}',${vo.hvo.rnum })">취소하기</button></td>
											</c:if>
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
				  <li class="page-item"><a href="../myAndAdpage/classResHistory.do?page=${startpage-1 }" class="link page-link">&lt;</a></li>
				  </c:if>
				   <c:forEach var="i" begin="${startpage }" end="${endpage }">
				  <li class="page-item ${page == i ? 'active' : ''}" aria-current="${page == i ? 'page' : 'null'}">
				 
				  <a class="link page-link" href="../myAndAdpage/classResHistory.do?page=${i }">${i }</a> 
				  </li>
				   </c:forEach>
				 <c:if test="${endpage<totalpage }">
				  <li  class="page-item"><a href="../myAndAdpage/classResHistory.do?page=${endpage+1 }" class="link page-link">&gt;</a></li>
				   </c:if>
				   
				   
				</ul> 
  		   </div>

				</div>

		
	<script>
	let classHistoryApp=Vue.createApp({
		data(){
			return{
			sessionid:'${sessionScope.id}'	
			}
		},
		mounted(){
			
		},
		methods:{
		cancleRes(rhno,rno,wing,id,rnum){
			
		axios.get('../myAndAdpage/cancleReserve.do',{
			params:{
				userid:this.sessionid,
				rhno:rhno,
				rno:rno,
				wing:wing,
				hostname:id,
				rnum:rnum
				
			}
		}).then(res=>{
			alert('취소가 완료되었습니다('+wing+'wing 환불)')
			location.href="../myAndAdpage/classResHistory.do"
		})
		}	
		}
	}).mount('#classHistoryApp')
	</script>
</body>
</html>