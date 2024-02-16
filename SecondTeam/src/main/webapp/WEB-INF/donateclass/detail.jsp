<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">
.dCzzimBtnClick{
cursor:pointer;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 

 <div class="row" style="margin-bottom:30px;">
<span><a href="../donateclass/list.do?type=A" class="btn btn-large btn-primary">목록으로</a></span>
</div>

   

        <div class="col-md-12 col-lg-8 main-content">
        <div style="margin-bottom:5px;"><span class="date" style="margin-left:5px;">${vo.address }&bullet; ${vo.category } | &nbsp;${vo.id }</span></div>
	<div class="docTitle" style="margin-bottom:15px;"><span style="font-size:40px; font-weight:bold; color:black;">${vo.name }</span></div>
          <div class="post-content-body" id="dcDetailControll">
           
           <div class="row" style="height:500px;">
           <img src="${vo.image }"  style="border-radius:30px; width:100%; height:100%;">
           </div>
           
            <div class="row" style="margin-top:10px;  border-bottom:0.7px lightgray solid; padding-top:10px; padding-bottom:15px;">
          
              <c:forEach var="ivo" items="${subImglist }">
            	<div class="col-4" style="width:210px; height:150px; margin-top:10px;">
            	<img src="${ivo }" style="border-radius:20px; width:100%; height:100%;">
            	</div>
             </c:forEach>
           
           
								
							
            </div>
            
               <div class="rating" style="margin-top:10px;"> 
									    <span class="star" style="font-size:70px;">⭐️</span>	
									    <span class="star" style="font-size:70px;">⭐️</span>	
									    <span class="star" style="font-size:70px;">⭐️</span>	
									    <span class="star" style="font-size:70px;">⭐️</span>	
									    <span class="half-star" style="font-size:70px; width:55px;">⭐️</span>
										<span style="font-weight:bold;color:orange; font-size:70px; margin-left:20px; font-style: italic;">4.5</span>
										
										
									</div>
            
            
            <hr>
            <div class="row">
            <div class="col-6">
        		 
					<table  class="table" >
					<tr style="border-right:1px #f2f2f2 solid ;"><td style="font-size:60px;color:gray;">예상차감</td></tr>
						<tr style="border-right:1px #f2f2f2 solid ;">
							<td>
								<span style="font-size:100px; color:black; font-weight:bold; margin-left:10px;">${vo.wing }<img src="../Projectimages/wing3.png" width=80px;></span>	
							</td>
						</tr>
					
					</table>
					
			</div>	
			
			 <div class="col-6">		
  			<table  class="table">
  			<tr>
  			
	  			<td style="font-size:25px; color:black; font-weight:bold;">위치</td>
	  			<td style="font-size:25px; color:black; font-weight:bold;">${vo.address }</td>
  			</tr>
  			
  			<tr>
  				
	  			<td width="25%" style="font-size:25px; color:black; font-weight:bold;">난이도</td>
	  			<c:if test="${vo.cls_level=='상' }">
	  			<td width="25%" style="font-size:25px; color:red; font-weight:bold;">${vo.cls_level }</td>
	  			</c:if>
	  			
	  			<c:if test="${vo.cls_level=='중' }">
	  			<td width="25%" style="font-size:25px; color:blue; font-weight:bold;">${vo.cls_level }</td>
	  			</c:if>
	  			
	  			<c:if test="${vo.cls_level=='하' }">
	  			<td width="25%" style="font-size:25px; color:green; font-weight:bold;">${vo.cls_level }</td>
	  			</c:if>
  			</tr>
  				
  				<tr>
	  			<td style="font-size:25px; color:black; font-weight:bold;">소요시간</td>
	  			<td style="font-size:25px; color:black; font-weight:bold;">${vo.time }</td>
  			</tr>
  			
  				<tr>
	  			<td style="font-size:25px; color:black; font-weight:bold;">수업인원</td>
	  			<td style="font-size:25px; color:black; font-weight:bold;">${vo.full_num }&nbsp;명</td>
  			</tr>
  			
  				<tr>
	  			<td style="font-size:25px; color:black; font-weight:bold;">창설금액</td>
	  			<td style="font-size:25px; color:black; font-weight:bold;">${formattedPrice }</td>
  			</tr>
  			
  			</table>
  			</div>
  			</div>
  			
  			<div class="reserveAndZzim">
  			
  					<div class=" text-center dCzzimBtnClick" @click="dCzzimBtnClick()"
						style="width: 200px; height: 60px; float:right;font-weight: bold; border:0.4px gray solid; background-color:#f2f2f2; border-radius:5px; padding:7px;">
						
						<span ><img v-if="zzimstate=='NO'" src="../Projectimages/emptyHeart.png" width="45px">
								<img v-if="zzimstate=='YES'"src="../Projectimages/fullHeart.png" width="45px">
						</span>
							
					</div>
					
				
  			<span style="margin-left:400px;"><button class="btn btn-xlarge btn-primary" style="width:210px;">예약하기</button></span>
  		
  			</div>
       
          <div class="pt-5" style="margin-left:600px;">
         
            <span style="font-size:20px; font-weight:bold; margin-left:10px;">Created Day:&nbsp;</span>${vo.dbCreate_date }
          </div>
          
           
          </div>





       
          


          <div class="pt-5 comment-wrap">
            <h3 class="mb-5 heading">6 Reviews</h3>
            <ul class="comment-list">
            
           
              <li class="comment">
                <div class="vcard">
                  <img src="../images/person_1.jpg" alt="Image placeholder">
                </div>
                <div class="comment-body">
                  <h3>김용준</h3>
                  <div class="meta">January 9, 2018 at 2:21pm</div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                  <p><a href="#" class="reply rounded">Reply</a></p>
                </div>
              </li>

           

              
            </ul>
            <!-- END comment-list -->

            <div class="comment-form-wrap pt-5">
              <h3 class="mb-5">Leave a comment</h3>
              <form action="#" class="p-5 bg-light">
                <div class="form-group">
                  <label for="name">Name *</label>
                  <input type="text" class="form-control" id="name">
                </div>
                <div class="form-group">
                  <label for="email">Email *</label>
                  <input type="email" class="form-control" id="email">
                </div>
                <div class="form-group">
                  <label for="website">Website</label>
                  <input type="url" class="form-control" id="website">
                </div>

                <div class="form-group">
                  <label for="message">Message</label>
                  <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                </div>
                <div class="form-group">
                  <input type="submit" value="Post Comment" class="btn btn-primary">
                </div>

              </form>
            </div>
          </div>

        </div>

     <script>
     let dcDetailControll=Vue.createApp({
    	 data(){
    		 return{
    			 sessionId:'${sessionScope.id}',
    			 dcno:${vo.dcno},	
 				 zzimstate:'${state}'
    		 }
    	 },
    	 methods:{
    		 dCzzimBtnClick(){
 				if(this.sessionId===''){<!--변경요망-->
 					alert('로그인 후 이용가능합니다')
 					return;
 				}
 				
 				axios.get('../donateclass/wishlistUpdate_vue.do',{
 					params:{
 						zzimstate:this.zzimstate,
 						dcno:this.dcno
 					}
 				}).then(res=>{
 					this.zzimstate=res.data
 				})
 			}
    	 }
     }).mount('#dcDetailControll')
     </script>
</body>
</html>