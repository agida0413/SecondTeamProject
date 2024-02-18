<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../css/product_review.css">
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
					
				
  			<span style="margin-left:400px;"><button class="btn btn-xlarge btn-primary" style="width:210px;">예약하기</button></span>
  		
  			</div>
       
        
       
          <div class="pt-5" style="margin-left:600px;">
         
            <span style="font-size:20px; font-weight:bold; margin-left:10px;">Created Day:&nbsp;</span>${vo.dbCreate_date }
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

     <script>
     
     const dcReview={
    		
    			template:`<div class="comment-form-wrap pt-5">
    	              <h3 class="mb-5">Leave a Review</h3>
    	          
    	                <div class="form-group">
    	              

    	                <div class="form-group">
    	                  <label for="message">Message</label>
    	                  <textarea name="" id="message" cols="30" rows="10" class="form-control" v-model="content" ref="content"></textarea>
    	                </div>
    	                <div id="product_half-stars-example">
    	        	    
    	    	           <div class="product_rating-group">
    	    	              
    	    	               <label aria-label="0.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-05"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-05" value="0.5" type="radio">
    	    	               <label aria-label="1 star" class="product_rating__label" for="product_rating2-10"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-10" value="1" type="radio">
    	    	               <label aria-label="1.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-15"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-15" value="1.5" type="radio">
    	    	               <label aria-label="2 stars" class="product_rating__label" for="product_rating2-20"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-20" value="2" type="radio">
    	    	               <label aria-label="2.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-25"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-25" value="2.5" type="radio" checked>
    	    	               <label aria-label="3 stars" class="product_rating__label" for="product_rating2-30"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-30" value="3" type="radio">
    	    	               <label aria-label="3.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-35"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-35" value="3.5" type="radio">
    	    	               <label aria-label="4 stars" class="product_rating__label" for="product_rating2-40"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-40" value="4" type="radio">
    	    	               <label aria-label="4.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-45"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-45" value="4.5" type="radio">
    	    	               <label aria-label="5 stars" class="product_rating__label" for="product_rating2-50"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
    	    	               <input @click="changeRating()" class="product_rating__input" name="product_rating2" id="product_rating2-50" value="5" type="radio">
    	    	         
    	    	               <span style="font-weight:bold;color:orange; font-size:30px; margin-left:10px; margin-top:5px;font-style: italic;">{{ rating }}&nbsp;/&nbsp;5</span>
    	    	               </div>
    	    	         
    	    	            
    	    	       </div>
    	    	       
    	    	       <input type="file" id="review_insert_img_file" name="review_upload" @change="previewImage($event)" style="margin-right:260px; margin-bottom:20px;" accept="image/*" ref="upfiles">   
    	    	       <div class="review_insert_img" v-if="imageUrl" style="width:250px; height:150px;">
    	    	         <img :src="imageUrl" style="width:100%; height:100%;">
    	    	       </div>
    	                
    	                <div class="form-group" style="float:right;">
    	                  <input type="submit" @click="sendContent()" value="Post Comment" class="btn btn-primary">
    	                </div>
    	                <div class="insert_star" style="margin-top:20px;">
    	             
    	             
    	     
    	             
    	      
    	     
    	       </div>
    	             
    	            </div>`,
    	            data() {
    	            return {
    	              rating: 2.5 ,
    	              imageUrl: null,
    	              filename:'',
    	              content:'',
    	              rmf:[]
    	              
    	            };
    	          },
    	          methods: {
    	            // 별을 클릭할 때 호출되는 메서드
    	            changeRating() {
    	              // 현재 클릭된 별의 값 가져오기
    	              
    	              const selectedRating = $('.product_rating__input:checked').val();
    	              // 데이터에 선택된 별점 값 저장
    	             
    	            	  this.rating = selectedRating;
    	              
    	              
    	            },
    	            previewImage(event) {
    	                const input = event.target;
    	                if (input.files && input.files[0]) {
    	                    const reader = new FileReader();

    	                    reader.onload = (e) => {
    	                        // Vue 데이터를 업데이트하여 이미지 URL을 저장합니다.
    	                        this.imageUrl = e.target.result;
    	                       
    	                        this.filename = input.files[0].name;
    	                       this.rmf=input.files[0]
    	                    }

    	                    reader.readAsDataURL(input.files[0]);
    	                } else {
    	                    // 파일이 없는 경우 이미지 URL을 초기화합니다.
    	                    this.imageUrl = '';
    	                }
    	                
    	            },
    	            sendContent(){
    	            	if(this.content===''){
    	            		alert('내용을 작성해주세요')
    	            		this.$refs.content.focus()
    	            		return;
    	            	}
    	            	this.$parent.reviewSend(this.rating,this.content,this.filename,this.rmf)
    	            }
    	          }
    	            
    		 }
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