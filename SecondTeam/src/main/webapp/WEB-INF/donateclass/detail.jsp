<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="../css/shopping.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../css/product_review.css">
<style type="text/css">
.dCzzimBtnClick{
cursor:pointer;
}
#reserveApp {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
 .rounded2 {
      -moz-border-radius:20px 20px 20px 20px; 
      border-radius:20px 20px 20px 20px;
      border:solid 1px #ffffff;
      background-color:#214252;
      padding:10px;
      color:#ffffff;
    }
  td.link:hover{
    cursor: pointer;
  }
  .noStyle td{
  	border-top:1px black solid;
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
  			
  			
  			<div class="reserveAndZzim" style="margin-top:15px;">
  			
  					<div class=" text-center dCzzimBtnClick" @click="dCzzimBtnClick()"
						style="width: 200px; height: 60px; float:right;font-weight: bold; border:0.4px gray solid; background-color:#f2f2f2; border-radius:5px; padding:7px;">
						
						<span ><img v-if="zzimstate=='NO'" src="../Projectimages/emptyHeart.png" width="45px">
								<img v-if="zzimstate=='YES'"src="../Projectimages/fullHeart.png" width="45px">
						</span>
							
					</div>
					
				
  			<span style="margin-left:400px;"><button class="btn btn-xlarge btn-primary" style="width:210px;" @click="reserveFormOpen()">예약하기</button></span>
  		
  			</div>
       
        
       
          <div class="pt-5" style="margin-left:600px;">
         
            <span style="font-size:20px; font-weight:bold; margin-left:10px;">Created Day:&nbsp;</span>${vo.dbCreate_date }
          </div>
        <div id="reserveDialog" v-show="reserveFormShow">
        <dc-reserve-form></dc-reserve-form>
        </div>
           
          </div>




		<div>
  			 <div class="rating" style="margin-top:30px;"> 
									   
									
										
									
								  <c:forEach begin="1" end="${vo.score}" var="i">
								        <span class="star" style="font-size: 70px;">⭐️</span>
								    </c:forEach>
								    <c:if test="${vo.score % 1 >= 0.5}">
								        <span class="half-star" style="font-size: 70px; width:45px;">⭐️</span>
								    </c:if>	
									
									
										
									<span style="font-weight:bold;color:orange; font-size:70px; margin-left:20px; font-style: italic;">${vo.score }</span>
								
								
									</div>
									
									 
  			
  			
  	</div>		
       
          


          <div class="pt-5 comment-wrap" id="reviewApp">
          <div>
          <h3 style="margin-bottom:20px;">{{rNum}}&nbsp;Reviews</h3>
          </div>
            <h3 class="mb-5 heading">
            <span style="margin-right:5px;"><button :class="type === 'A' ? 'btn btn-small btn-danger' : 'btn btn-small btn-primary'" @click="descDate()">최신순</button></span>
            <span style="margin-right:5px;"><button :class="type === 'B' ? 'btn btn-small btn-danger' : 'btn btn-small btn-primary'" @click="ascDate()">오래된순</button></span>
             <span style="margin-right:5px;"><button :class="type === 'C' ? 'btn btn-small btn-danger' : 'btn btn-small btn-primary'" @click="descScore()">높은평점순</button></span>
              <span style="margin-right:5px;"><button :class="type === 'D' ? 'btn btn-small btn-danger' : 'btn btn-small btn-primary'" @click="ascScore()">낮은평점순</button></span>
             <span style="float:right;"><button class="btn btn-small btn-primary" @click="dcReviewForm()">리뷰 등록하기</button></span></h3>
          
         <div style="margin-bottom:10px;">
              </div> 
              <h2 v-if="rNum==0">아직 작성된 리뷰가 없습니다.</h2>
            <ul class="comment-list" v-if="rNum>0">
          
   
              <li class="comment" v-for="vo in reviewList">
            
              <div class="row">
              	<div class="col-4" style="width:250px; height:200px;">
              
                  <img :src="'../reviewImg/'+vo.filename" v-if="vo.filename!==null" alt="Image placeholder" style="width:100%; height:100%;">
               		<img src="../Projectimages/noImg.png" v-if="vo.filename===null" style="width:100%; height:100%;">
                </div>
                <div class="col-8">
                <div class="comment-body" style="word-wrap: break-word;">
                  <h3>{{vo.name}}</h3>
                  <div class="meta">{{vo.dbDay}}</div>
                   <div class="meta">
                    <div class="rating" style="margin-top:5px; margin-bottom:5px;"> 
									  
								        <span v-for="i in Math.floor(vo.score)" class="star" style="font-size: 15px;">⭐️</span>
     								    <span v-if="vo.score % 1 >= 0.5" class="half-star" style="font-size: 15px; width: 10px;">⭐️</span>
								   
										<span style="font-weight:bold;color:orange; font-size:15px; margin-left:20px; font-style: italic;">{{vo.score}}</span>
										
										
									
										
									</div>
                   </div>
                  <p>{{vo.content}}</p>
                  <p style="float:right;" v-if="vo.id==='${sessionScope.id }'"><a class="reply rounded" style="cursor:pointer; color:#ff9999;" @click="deleteReview(vo.revno)">삭제</a></p>
                </div>
                </div>
                </div>
              </li>

           

            
            </ul>
              <div class="row text-center">
  			 <ul class="pagination" v-if="totalpage!=0">
  			 		 
				  <li @click="prev()" class="page-item"><a v-if="startpage>1" class="link page-link">&lt;</a></li>
				  <li v-for="i in range(startpage,endpage)" @click="move(i)"  class="page-item" 
				  :class="{ 'active': curpage === i }" 
   				 :aria-current="curpage === i ? 'page' : null">
				  <a class="link page-link">{{i}}</a>
				  </li>
				 
				  <li @click="next()" class="page-item"><a v-if="endpage<totalpage" class="link page-link">&gt;</a></li>
				
				   
				   
				</ul> 
  			</div>
            <!-- END comment-list -->

          <div id="rdialog" v-show="isShow">
		<dc-review-form></dc-review-form>
	</div>
	
          </div>

	

        </div>
  <script src="../js/reviewComponent.js"></script>
     <script>
     const reserveComponent={
    		 template:`<div class="row" style="padding:30px;">
     					<div class="col-6">
     					<table class="table">
    		     <tr>
    		     
    		       <td class="text-center" width="60%">
    		         <table class="table">
    		          
    		           <tr>
    		             <td>
    		                <div class="calendar">
    		                  <h2>
    		                    <a style="cursor:pointer;" v-on:click="onClickPrev(currentMonth)">◀</a>
    		                    {{currentYear}}년 {{currentMonth}}월
    		                    <a style="cursor:pointer;" v-on:click="onClickNext(currentMonth)">▶</a>
    		                  </h2>
    		                  <table class="table table-hover">
    		                      <thead>
    		                        <tr>
    		                          <td v-for="(weekName, index) in weekNames" v-bind:key="index">
    		                            {{weekName}}
    		                          </td>
    		                        </tr>
    		                      </thead>
    		                      <tbody>
    		                        <tr v-for="(row, index) in currentCalendarMatrix" :key="index">
    		                          <td v-for="(day, index2) in row" :key="index2" style="padding:20px;" :class="(day>=realDay &&  sysMonth===currentMonth && sysYear===currentYear) || (sysMonth<currentMonth && sysYear===currentYear)?'link':''">
    		                            <span v-if="(day>=realDay &&  sysMonth===currentMonth && sysYear===currentYear) || (sysMonth<currentMonth && sysYear===currentYear)" @click="change(day) " style="color:black; font-weight:bold; ">
    		                               <span v-if="day===currentDay &&  sysMonth<= currentMonth" class="rounded2" >
    		                                 {{day}}
    		                               </span>
    		                               
    		                              
    		                               <span v-else >
    		                                 {{day}}
    		                               </span>
    		                            </span>
    		                            <span v-else style="color:gray; ">
    		                               {{day}}
    		                            </span>
    		                          </td>
    		                        </tr>
    		                      </tbody>
    		                  </table>    
    		              </div>
    		             </td>
    		           </tr>
    		         <table class="table" style="border:1px #f2f2f2 solid;">
    		         <tr >
    		         	<td colspan="3" style="background-color:#f2f2f2; "><span style="font-weight:bold;">예약가능시간</span></td>
    		         </tr>
    		         <tr style="border:1px #f2f2f2 solid;">
    		         	<td style="padding:20px; border:1px #f2f2f2  solid; background-color:#214252; color:white;"><span>13:00 ~ 15:00</span></td>
    		        	<td style="padding:20px; border:1px #f2f2f2  solid;"><span style="font-weight:bold;">13:00 ~ 15:00</span></td>
    		        	<td style="padding:20px; border:1px #f2f2f2  solid;"><span>13:00 ~ 15:00</span></td>
    		         </tr>
    		         </table>
    		       
    		        		 
    		         </table>
    		        
    		      
        		   
        		 
		         </div>
		       
    		       </td>
    		     </tr>
    		  
    		    
    		   
    		   </table>
    		  
    		   <div class="col-6">
    		   <div style="margin-bottom:7px;"> <span  style="color:gray;">수업인원( {{full_num}}명)</span></div>
    		   <div style="margin-bottom:15px;"><span style="font-weight:bold; color:gray; font-size:25px;">${vo.name}</span></div>
    		
    		<div style="width:500px; height:375px; "> 
    		<img src="${vo.image}" width=100% height="100%"style="border-radius:20px;">
    		
    		<div style="margin-top:20px;">
    		<ul style="color:gray; font-size:10px;">
    			<li style="font-weight:bold; font-size:15px; margin-top:10px;">* 주의사항</li>
    			<li style="margin-top:10px;">재능기부 수업은 현금결제 프로그램이 아니기 때문에 노쇼행위에 대해 불이익이 있을 수 있습니다.</li>
    			<li style="margin-top:10px;">예약 확정시 예약정보에 대한 내역을 회원가입시 기입한 이메일로 발송해 드립니다.</li>
    			<li style="margin-top:10px;">마이페이지에서 예약 취소가 가능하며 당일 취소는 wing환불이 불가합니다.</li>
    			<li style="margin-top:10px;">수업 간 마찰이나 폭언,욕설 등 으로 인해 회원탈퇴 처리 및 wing 회수가 될 수 있습니다.</li>
    			<li style="margin-top:10px;">후기로 인한 허위 사실 유포나 폭언 등은 호스트에 의해 제재 처리 될 수 있습니다.</li>
    			
    		</ul>
    		
    		</div>
    		</div>
    		  
    		   
    		 
    		   </div>
    		   
    		   <div class="col-6">
    		 
    		 		
    		 	<table class="table text-center" style="border:1px #f2f2f2 solid;">
    		 	<tr>
    		 	<td style="background-color:#f2f2f2; "><span style="font-weight:bold;">남은 자리</span></td>
    		 	<td style="background-color:#f2f2f2; "><span style="font-weight:bold;">예약인원 선택</span></td>
    			<td style="background-color:#f2f2f2; "><span style="font-weight:bold;">차감될 윙</span></td>
    		 	</tr>
    		 	<tr style="border:1px #f2f2f2 solid;">
    		 	<td style="padding:20px;"><span style="font-size:25px; font-weight:bold;">1 명</span></td>
    		 	<td style="padding:20px; padding-left:25px;">
    		 	 <button class="kyj_shoppingDecreseBtn" style="background-color:#214252; color:white; height:47px; width:30px; border-radius:5px;" @click="minusInwon()" >-</button>
                 <input class="kyj_shoppingCal" type="text" id="inwon" name="inwon" v-model="inwon" min="1" readonly>
                <button class="kyj_shoppingIncreseBtn" style="background-color:#214252; color:white; height:47px; width:30px; border-radius:5px;" @click="plusInwon()">+</button>
    		 	</td>
    		 	<td style="padding:20px;">
    		 <span><span style="font-size:25px; font-weight:bold;">600<span>&nbsp;<img src="../Projectimages/wing3.png" width="25px"></span>
    		 	</td>
    		 	</tr>
    		 	</table>
    		 		
    		 		
    		 	
    	               
    	               
    		 		
    		 	
    		   </div>
    		   
 				 <div class="col-6 text-center" style="margin-top:45px;">
		 				<div><button class="btn btn-xlarge btn-primary" style="width:500px; font-size:25px;">예약하기</button></div>
				 	</div>
    		   </div>
    		   </div>`,
    		   data(){
    		      return {
    		         weekNames: ["월요일", "화요일", "수요일","목요일", "금요일", "토요일", "일요일"],
    		            rootYear: 1904,
    		            rootDayOfWeekIndex: 4, // 2000년 1월 1일은 토요일
    		            currentYear: new Date().getFullYear(),
    		            currentMonth: new Date().getMonth()+1,
    		            sysMonth:new Date().getMonth()+1,
    		            sysYear:new Date().getFullYear(),
    		            currentDay: new Date().getDate(),
    		            currentMonthStartWeekIndex: null,
    		            currentCalendarMatrix: [],
    		            endOfDay: null,
    		            memoDatas: [],
    		            realDay:new Date().getDate(),
    		            dcno:${vo.dcno},
    		            inwon:1,
    		            full_num:${vo.full_num}
    		        
    		      }
    		   },
    		   mounted(){
    		      this.init()
    		 	
    		   },
    		   methods:{
    			 minusInwon(){
    				 if(this.inwon>1){
    					 this.inwon--;
    				 }
    				 
    			 },
    			 plusInwon(){
    				 this.inwon++;
    			 },
    		        init(){
    		           this.currentMonthStartWeekIndex = this.getStartWeek(this.currentYear, this.currentMonth);
    		           this.endOfDay = this.getEndOfDay(this.currentYear, this.currentMonth);
    		           this.initCalendar();
    		         },
    		         initCalendar(){
    		           this.currentCalendarMatrix = [];
    		           let day=1;
    		           for(let i=0; i<6; i++){
    		             let calendarRow = [];
    		             for(let j=0; j<7; j++){
    		               if(i==0 && j<this.currentMonthStartWeekIndex){
    		                 calendarRow.push("");
    		               }
    		               else if(day<=this.endOfDay){
    		                 calendarRow.push(day);
    		                 day++;
    		               }
    		               else{
    		                 calendarRow.push("");
    		               }
    		             }
    		             this.currentCalendarMatrix.push(calendarRow);
    		           }
    		         },
    		         getEndOfDay(year, month){
    		             switch(month){
    		                 case 1:
    		                 case 3:
    		                 case 5:
    		                 case 7:
    		                 case 8:
    		                 case 10:
    		                 case 12:
    		                   return 31;
    		                   break;
    		                 case 4:
    		                 case 6:
    		                 case 9:
    		                 case 11:
    		                   return 30;
    		                   break;
    		                 case 2:
    		                   if( (year%4 == 0) && (year%100 != 0) || (year%400 == 0) ){
    		                   return 29;   
    		                   }
    		                   else{
    		                       return 28;
    		                   }
    		                   break;
    		                 default:
    		                   console.log("unknown month " + month);
    		                   return 0;
    		                   break;
    		             }
    		         },
    		         getStartWeek(targetYear, targetMonth){
    		           let year = this.rootYear;
    		           let month = 1;
    		           let sumOfDay = this.rootDayOfWeekIndex;
    		           while(true){
    		             if(targetYear > year){
    		               for(let i=0; i<12; i++){
    		                 sumOfDay += this.getEndOfDay(year, month+i);
    		               }
    		               year++;
    		             }
    		             else if(targetYear == year){
    		               if(targetMonth > month){
    		                 sumOfDay += this.getEndOfDay(year, month);
    		                 month++;
    		               }
    		               else if(targetMonth == month){
    		                 return (sumOfDay)%7;
    		               }
    		             }
    		           }
    		         },
    		         onClickPrev(month){
    		           month--;
    		           if(month<=0){
    		             this.currentMonth = 12;
    		             this.currentYear -= 1;
    		           }
    		           else{
    		             this.currentMonth -= 1;
    		           }
    		           this.init();
    		         },
    		         onClickNext(month){
    		        	 this.currentDay=1;
    		           month++;
    		           if(month>12){
    		             this.currentMonth = 1;
    		             this.currentYear += 1;
    		           }
    		           else{
    		             this.currentMonth += 1;
    		           }
    		           this.init();
    		         },
    		         isToday: function(year, month, day){
    		           let date = new Date();
    		           return year == date.getFullYear() && month == date.getMonth()+1 && day == day; 
    		         },
    		         change(day){
    		           this.currentDay=day;
    		           
    		           //this.isToday(this.currentYear,.this.currentMonth,this.currentDay)
    		         }
    		         // 시간
    		         // 인원
    		         // 데이터 전송 (예약처리) => 화면변경 (Mypage)
    		     }
     }
    
     let dcDetailControll=Vue.createApp({
    	 data(){
    		 return{
    			 sessionId:'${sessionScope.id}',
    			 dcno:${vo.dcno},	
 				 zzimstate:'${state}',
 				 reserveFormShow:false
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
 			},
 			reserveFormOpen(){
 				this.reserveFormShow=true
 				 $('#reserveDialog').dialog({
    				 autoOpen:false,
    				 modal:true,
    				 width:1200,
    				 height:900
    			 }).dialog('open')
 			}
    	 },
    	 components:{
    		 'dc-reserve-form':reserveComponent
    	 }
     }).mount('#dcDetailControll')
     
     
     
     
     
     
     
     let reviewApp=Vue.createApp({
    	 data(){
    		 return{
    			 dcno:${vo.dcno},
    			 isShow:false,
    			 type:'A',
    			 curpage:1,
    			 totalpage:0,
    			 startpage:0,
    			 endpage:0,
    			 reviewList:[],
    			 rNum:0
    			 
    		 }
    	 },
    	 mounted(){
    		 this.dcReviewList()
    	 },
    	 methods:{
    		 dcReviewList(){
    			 axios.get('../donateclass/reviewList_vue.do',{
        			 params:{
        				 dcno:this.dcno,
        				 type:this.type,
        				 page:this.curpage
        			 }
        		 }).then(res=>{
        			
        			 this.reviewList=res.data
        			 console.log(this.reviewList)
        		 })
        		 this.paging()
    		 },
    		 paging(){
    			 axios.get('../donateclass/reviewList_vue_page.do',{
        			 params:{
        				 dcno:this.dcno,
        				 page:this.curpage
        				
        			 }
        		 }).then(res=>{
        			 this.totalpage=res.data.totalpage;
        		 	this.curpage=res.data.page;
        		 	this.startpage=res.data.startpage;
        		 	this.endpage=res.data.endpage;
        		 	this.rNum=res.data.rNum;
        		 })
    		 },
    		 range(start,end){
    				let arr=[]
    				
    				let size=end-start;
    				for(let i=0;i<=size;i++){
    					arr[i]=start;
    					start++;
    				}
    				return arr;
    			},
    			next(){
    				this.curpage=this.endpage+1
    				this.dcReviewList()
    			},
    			prev(){
    				this.curpage=this.startpage-1
    				this.dcReviewList()
    			},
    			move(page){
    				this.curpage=page
    				this.dcReviewList()
    			},
    			ascDate(){
    				this.curpage=1
    				this.type='B'
    				this.dcReviewList()
    			},
    			descDate(){
    				this.curpage=1
    				this.type='A'
        				this.dcReviewList()
    			},
    			ascScore(){
    				this.curpage=1
    				this.type='D'
        				this.dcReviewList()
    			},
    			descScore(){
    				this.curpage=1
    				this.type='C'
        				this.dcReviewList()
    			},
    		 dcReviewForm(){
    			 this.isShow=true
    			 $('#rdialog').dialog({
    				 autoOpen:false,
    				 modal:true,
    				 width:800,
    				 height:900
    			 }).dialog('open')
    		 },
    		 reviewSend(score,content,filename,rmf){
        	
        		 
        		 
        		 let formData=new FormData();
        		 
        		 if(filename!==''){
        			 formData.append("filename",filename)
        			 formData.append("imagetype",1)
        			  formData.append("rmf",rmf)
        		 }
        		 else{
        			 formData.append("filename","")
        			 formData.append("imagetype",2)
        		 }
        		 formData.append("objno",this.dcno)
        		 formData.append("content",content)
        		  formData.append("score",score)
        		    formData.append("typeno",1)
        		    
        		    
        		   
        		    
        		 
        		 axios.post('../donateclass/insert_dcReview_vue.do',formData,{
		    			header:{
		    				'Content-Type':'multipart/form-data'
		    			}
		    		})
		    		.then(response=>{
		    			if(response.data==='YES'){
		    				$('#rdialog').dialog('close');
		    				this.dcReviewList()
		    			}
		    			else{
		    				alert('로그인후 이용가능합니다.')
		    			}
		    			 
		    		}).catch(error=>{
		    			console.log(error.response)
		    		})
        	 },
        	 deleteReview(revno){
        		axios.get('../donateclass/deleteReview_vue.do',{
        			params:{
        				revno:revno,
        				objno:this.dcno
        			}
        		}).then(res=>{
        			this.dcReviewList()
        		})
        	 }
        	 
    		
    	 },
    	
    	 components:{
    		 'dc-review-form': dcReview
    		
         }
     }).mount('#reviewApp')
     
     </script>
    
</body>
</html>