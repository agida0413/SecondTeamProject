<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/donation.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.detail_cate{
	padding-bottom: 16px;
    font-size: 17px;
    font-weight: 400;
    color: #00ab33;
    letter-spacing: -.06em;
    line-height: 1;
}
.detail_title{
	font-size: 36px;
    font-weight: 400;
    color: #222;
    letter-spacing: .4px;
    line-height: 40px;
}
.detail_body{
	padding: 40px 50px 50px;
	float: left
}
.detail_subtit{
	color: #444444; 
	font-size: 19px;
	padding-top: 10px;
}
.detail_subcon{
	 padding-top: 10px;
	 color: #444444;
	 font-size: 16px;
}
h3.plan strong{
	float: left;
    font-weight: 400;
    font-size: 20px;
    line-height: 1.1;
    color: #222;
    letter-spacing: .01em;
}
.use_lst table {
    width: 100%;
    margin: 0;
    border: 1px solid #ccc;
    border-top-color: #ccc;
    border-width: 1px 0;
    font-size: 16px;
    color: #222222;
    margin-top: 10px;
    margin-bottom: 10px;
}
.use_lst table td{
    height: 56px;
    padding: 16px 0 15px 19px;
    border: none;
    border-top: 1px solid #ebebeb;
    color: #222;
    text-align: left;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.reply_content{
    font-size: 15px;
    line-height: 1.5;
    color: #202020;
    letter-spacing: -.3px;
}
.reply_time{
	font-size: 13px;
    color: #828282;
}
.reply_replybtn{
	height: 24px;
    padding: 1px 15px;
    margin-top: 6px;
    border-color: rgba(0,0,0,.15);
    border-radius: 2px;
    font-size: 13px;
    color: #202020;
}
.reply_likebtn{
	min-width: auto;
    height: 23px;
    padding: 3px 11px 0;
    margin-top: 5px;
    border-color: rgba(0,0,0,.15);
    border-radius: 2px;
    text-align: center;
}
.reply_block{
	padding: 16px 0 14px;
	border-bottom: 1px solid #ccc;
	height: 150px;
}
</style>
</head>
<body>
<div class="col-sm-8">
<div class="container" id="donationDetailApp">

      <div class="row blog-entries element-animate">

        <div class="main-content" style="border: 1px solid #ccc">

          <div class="post-content-body detail_body">
            <h2 class="detail_cate">{{detail_data.d_cate}} > {{detail_data.d_smallcate}}</h2>
            <h3 class="detail_title">{{detail_data.d_title}}</h3>
            
            <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" style="width: 243px; color: #000000">캠페인 소개</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" style="width: 243px; color: #000000">참여 내역</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false" style="width: 243px; color: #000000">응원 댓글</button>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			  
			  <div id="detailMain">
            <ul style="list-style: none; padding: 0">
              <div class="col-md-12 mb-4">
                <img :src="detail_data.d_image" style="width: 729px;height: 400px;">
              </div>
              <li v-for="(subtitle,index) in content_title">
                <dl>
                  <dt class="detail_subtit">{{subtitle}}</dt>
                  <dd class="detail_subcon">{{content_content[index]}}</dd>
                </dl>
              </li>
            </ul>
            
           
            <!-- 기부금 사용계획 -->

    <div class="use_lst">
        <div class="heading">
            <h3>
                <strong class="detail_subtit">기부금 사용계획</strong>
            </h3>
        </div>
        <table cellspacing="0" border="1" summary="모금사용계획리스트입니다.">
            <col style="width:160px">
            <col>
            <col style="width:160px">
            <thead>
            </thead>
            <tbody>
            <tr class="total">
                <td class="use"><strong>총 집행금액</strong></td>
                <td colspan="2"><em>{{detail_data.d_goal}}</em> 원 (목표금액 {{detail_data.d_goal}} 원)</td>
            </tr>
            
                <tr v-for="(pur,index) in content_purpose">
                    <td class="use">사업비</td>
                    <td>{{pur}} </td>
                    <td class="amount"><em>{{content_cost[index]}}</em>원</td>
                </tr>
            
            </tbody>
        </table>
        
        
            <div class="use_goal">
				<h3><strong class="detail_subtit">사업대상 및 기대효과</strong></h3>
				<table cellspacing="0" border="1" summary="사업 기간, 사업 대상, 대상 수, 기대효과" class="ex_lst">
					<col width="126">
					<col>
					<tbody>
					<tr>
					    <th scope="row">사업 기간</th>
					    <td>
					    	{{detail_data.d_startdate}}
							~
							{{detail_data.d_enddate}}
					    </td>
					</tr>
					
					<tr>
					    <th scope="row">사업 대상</th>
					    <td>{{detail_data.d_towho}}</td>
					</tr>
					
					
					<tr>
					    <th scope="row">대상 수</th>
					    <td>{{detail_data.d_person}}</td>
					</tr>
					
					</tbody>
				</table>
				<!-- //[D] 수정 후 개설된 모금함 버전 -->
            </div>
        
    	  </div>
            
         </div>
			  
			  </div>
			  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
			  
				  <!-- 참여내역 -->	
			  <div id="donationDetailPar">
			    <h3>참여내역</h3>
			  </div>
			  <!-- END 참여내역 -->	
			  
			  </div>
			  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
			  
			  <!-- 댓글목록 -->
			  <div id="donationDetailReply">
	            <div class="pt-5 comment-wrap">
	              <h3 class="mb-5 heading" style="margin-bottom: 5px;">6 Comments</h3>
	                <div class="reply_block">
		            	<div class="reply_header" style="padding-bottom: 5px;">
		            	  <b>유저아이디</b>
		            	</div> 
		            	<div class="reply_content">
		            	  이 모금함을 보며 중학교 입학하는 딸과 가방 쇼핑하던 생각났습니다. 직접 골라주지는 못하시만 작은 도움이 되었으면 합니다.
		            	</div>
		            	<div class="reply_time">등록시간</div>
		            	<div>
		            	  <span><a class="btn reply_replybtn" style="float: left">답글</a><a class="btn reply_replybtn" style="float: right">좋아요</a></span>
		            	</div>
	            	</div>
	                <div class="reply_block">
		            	<div class="reply_header">
		            	  <b>유저아이디</b>
		            	</div> 
		            	<div class="reply_content">
		            	  이 모금함을 보며 중학교 입학하는 딸과 가방 쇼핑하던 생각났습니다. 직접 골라주지는 못하시만 작은 도움이 되었으면 합니다.
		            	</div>
		            	<div class="reply_time">등록시간</div>
		            	<div>
		            	  <span><a class="btn reply_replybtn" style="float: left">답글</a><a class="btn reply_replybtn" style="float: right">좋아요</a></span>
		            	</div>
	            	</div>
	                <div class="reply_block">
		            	<div class="reply_header">
		            	  유저아이디
		            	</div> 
		            	<div class="reply_content">
		            	  이 모금함을 보며 중학교 입학하는 딸과 가방 쇼핑하던 생각났습니다. 직접 골라주지는 못하시만 작은 도움이 되었으면 합니다.
		            	</div>
		            	<div class="reply_time">등록시간</div>
		            	<div>
		            	  <span><a class="btn reply_replybtn" style="float: left">답글</a><a class="btn reply_replybtn" style="float: right">좋아요</a></span>
		            	</div>
	            	</div>
	            
	            <!-- END comment-list -->
				
				<!-- 댓글 작성창 -->
	            <div class="comment-form-wrap pt-5">
	              <h3 class="mb-5">Leave a comment</h3>
	            </div>
	            <!-- END 댓글 작성창 -->
            
          	    </div>
          	  </div>
          <!-- END 댓글목록 -->
			  
			  </div>
			</div>
            
            
		</div>
		
		 
			
		  
        </div>
      </div>
      
   </div>
   </div>
   
   <!-- 사이드바 -->
   <div class="col-sm-4">
  <div class="collect_side" id="donationSideDetailBar">
                <!-- 후원상태 -->
                <!-- [D]진행기간 마감일 경우 end 추가 -->
                <div class="section_status">
                            <div class="graph_status" style="padding-bottom: 75px;">
                                <span class="per"><strong class="num">{{detail_data.d_nowpercent}}</strong>%</span>
                            </div>
                            <div class="card_bar">
		                      <span class="card_bar_collection" style="width: 50%;"></span>
		                    </div>
                    

                    <div class="term_area">
                        <p>
                            <strong>
                            {{detail_data.d_startdate}}
							~
							{{detail_data.d_enddate}}
                            </strong><span>까지</span>
                        </p>
                         <div>
                            <span class="d_day">D<em class="bar">-</em>{{detail_data.dday}}</span>
                         </div>
                          
                    </div>
                    <div class="num_area">
                        <p class="status_num"><span>현재 모금:&nbsp;</span><strong>{{detail_data.d_now}}</strong><span>원</span></p>
                        <p class="status_num"><span>목표 :&nbsp;</span><strong>{{detail_data.d_goal}}</strong><span>원</span></p>
                        
                    </div>
                    
                </div>
                <!-- //후원상태 -->

                <!-- 버튼 -->
                <div class="section_btn">
                    <a href="#" class="btn donate jq_donate" data-google="모금함_View" data-stat="기부하기_상단_BTN_CLK">모금함 기부하기</a>
                </div>
  </div>
  </div>
   
   <script>
     let donationDetailApp=Vue.createApp({
    	 data(){
    		return{
    			detail_data:{},
    			dno:${dno},
    			content_title:{},
    			content_content:{},
    			content_purpose:{},
    			content_cost:{}
    		} 
    	 },
    	 mounted(){
    		 axios.get('../donation/donation_detail_vue.do',{
    			 params:{
    				 dno:this.dno
    			 }
    		 }).then(res=>{
    			console.log(res.data) 
    			this.detail_data=res.data
    			this.content_title=res.data.d_subtitle.split('|')
    			this.content_content=res.data.d_content.split('|')
    			this.content_purpose=res.data.d_purpose.split('|')
    			this.content_cost=res.data.d_cost.split('|')
    			console.log(res.data.dday)
    			
    		 })
    	 },
    	 methods:{
    		 
    	 }
     }).mount('#donationDetailApp')
     
     let donationSideDetailBar=Vue.createApp({
    	 data(){
    		return{
    			detail_data:{},
    			dno:${dno}
    		} 
    	 },
    	 mounted(){
    		 axios.get('../donation/donation_detail_vue.do',{
    			 params:{
    				 dno:this.dno
    			 }
    		 }).then(res=>{
    			console.log(res.data) 
    			this.detail_data=res.data
    			console.log(res.data.dday)
    		 })
    	 },
    	 methods:{
    		 
    	 }
     }).mount('#donationSideDetailBar')
     
    
   </script>
</body>
</html>