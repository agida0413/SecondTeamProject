<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/donation.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery.js"></script>
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
.reply_replybtn:hover{
	background-color: #ccc;
	color: #000000;
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
.reply_box{
	padding: 0 30px;
    background-color: #00000005;
    border-top: 1px solid #dcdcdc;
}
.reply_inner{
	border-color: #ccc;
    border-radius: 3px;
}
.reply_write_area{
	max-width: 100%;
    padding: 17px 0 8px;
}
.reply_write_box{
	position: relative;
    padding: 0 15px;
    background-color: #fff;
    border: 1px solid #dcdcdc;
}
.reply_text_area{
	height: 120px;
    font-size: 13px;
    letter-spacing: 0;
    display: block;
    overflow-x: hidden;
    overflow-y: auto;
    position: relative;
    width: 100%;
    border: none;
    color: #333;
    background-color: rgba(255,255,255,.001);
    line-height: 18px;
    padding: 0;
}
.history_title {
    display: table;
    width: 100%;
    min-height: 65px;
    background-color: #fcfcfc;
    border-top: 1px solid rgba(0,0,0,.05);
    border-bottom: 1px solid rgba(0,0,0,.05);
}
.history_title_inner {
    display: table-cell;
    padding: 20px 70px;
    font-family: NanumSquareWebFont,Sans-serif;
    font-size: 17px;
    line-height: 1.5;
    letter-spacing: -.5px;
    color: #333;
    text-align: center;
    word-break: keep-all;
    word-wrap: break-word;
    vertical-align: middle;
}
.history_list{
	border-bottom: 1px solid rgba(0,0,0,.05);
	list-style: none;
}
.history_item{
	border-top: 1px solid rgba(0,0,0,.05);
}
.history_card{
	position: relative;
    padding: 13px 20px 10px;
    letter-spacing: 0;
}
.history_card_date{
    display: block;
    position: relative;
    z-index: 10;
    margin-bottom: 4px;
    font-size: 13px;
    color: #828282;
}
.history_card_name {
    position: relative;
    font-size: 15px;
    font-weight: 400;
    color: #202020;
}
.history_card_amount {
    position: relative;
    margin-left: 12px;
    font-size: 15px;
    color: #666;
}
.number {
    position: relative;
    color: #00ab33;
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
            </div>
        
    	  </div>
            
         </div>
			  
			  </div>
			  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
			  
				  <!-- 참여내역 -->	
			  <div id="donationDetailPar">
			    <div class="history_title">
			      <p class="history_title_inner">
			      	총
			        <strong>{{paysize}}</strong>
			        건이 기부되었습니다.
			      </p>
			    </div>
			    <ul class="history_list">
			      <li class="history_item" v-for="pvo in pay_list">
			        <div class="history_card">
			          <span class="history_card_date">{{pvo.dbday}}</span>
			          <strong class="history_card_name">{{pvo.userid}}</strong>
			          <span class="history_card_amount">
			            <span class="number">{{pvo.price}}</span>
			            원 참여
			          </span>
			        </div>
			      </li>
			    </ul>
			  </div>
			  <!-- END 참여내역 -->	
			  
			  </div>
			  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
			  
			  <!-- 댓글목록 -->
			  <div id="donationDetailReply">
	            <div class="pt-5 comment-wrap">
	              <h3 class="mb-5 heading" style="margin-bottom: 5px;">{{reply_list.length}} Comments<span style="float: right"><a class="btn reply_replybtn" @click="replyWrite()">댓글쓰기</a></span></h3>
	                <div class="reply_box" v-show="replyShow">
	                  <div class="reply_inner">
	                    <div class="reply_write_area">
	                      <div class="reply_write_box">
	                        <textarea v-model="replymsg" ref="replymsg" rows="5" cols="50" class="reply_text_area" placeholder="응원의 댓글 부탁드립니다."></textarea>
	                      </div>
	                       <span>
	                          <a class="btn reply_replybtn" style="float: right;" @click="replyCancel()">취소</a>
	                          <a class="btn reply_replybtn" style="float: right;" @click="replyMainWrite()">작성</a>
	                       </span>
	                    </div>
	                  </div>
	                </div>
	                
	                <div class="reply_block" v-for="vo in reply_list">
	                  <div>
		            	<div class="reply_header" style="padding-bottom: 5px;">
		            	  <b>{{vo.writer}}</b>
		            	</div> 
		            	<div class="reply_content">
		            	  {{vo.msg}}
		            	</div>
		            	<div class="reply_time">{{vo.dbday}}</div>
		            	<div>
		            	  <span>
		            	    <a v-if="vo.writer==dSessionId" class="btn reply_replybtn" style="float: left">수정</a>
		            	    <a v-if="vo.writer==dSessionId"  class="btn reply_replybtn" style="float: left">삭제</a>
		            	    <a v-if="dSessionId"  class="btn reply_replybtn" style="float: right">좋아요</a>
		            	  </span>
		            	</div>
		              </div>
		              <!-- 대댓글목록 (답글버튼누를시 show) -->
		              
		              <!-- //대댓글목록 -->
		              
		              
		            	<!-- 대댓글 작성창 -->
		            	<!-- <div class="reply_box" :id="'subReply'+vo.rno">
		                  <div class="reply_inner">
		                    <div class="reply_write_area">
		                      <div class="reply_write_box">
		                        <textarea v-model="replySubmsg" ref="replySubmsg" rows="5" cols="50" class="reply_text_area" placeholder="응원의 댓글 부탁드립니다."></textarea>
		                      </div>
		                       <span>
		                          <a class="btn reply_replybtn" style="float: right;" @click="replySubCancel(vo.rno)">취소</a>
		                          <a class="btn reply_replybtn" style="float: right;" @click="replySubWrite(vo.rno)">작성</a>
		                       </span>
		                    </div>
		                  </div>
		                </div> -->
		            	<!-- //대댓글 작성창 -->
		            	
	            	</div>
	            
	            <!-- END comment-list -->
				
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
   <div class="col-sm-4" id="donationSideDetailBar">
  <div class="collect_side">
                <!-- 후원상태 -->
                <!-- [D]진행기간 마감일 경우 end 추가 -->
                <div class="section_status">
                            <div class="graph_status" style="padding-bottom: 75px;">
                                <span class="per"><strong class="num">{{detail_data.d_nowpercent}}</strong>%</span>
                            </div>
                            <div class="card_bar">
		                      <span class="card_bar_collection" :style="'width:'+detail_data.d_nowpercent+'%'"></span>
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
                        <p class="status_num"><span>현재 모금:&nbsp;</span><strong>{{now_data}}</strong><span>원</span></p>
                        <p class="status_num"><span>목표 :&nbsp;</span><strong>{{detail_data.d_goal}}</strong><span>원</span></p>
                        
                    </div>
                    
                </div>
                <!-- //후원상태 -->

                <!-- 버튼 -->
                <div class="section_btn">
                    <a href="../donation/donation_pay.do?dno=${dno }" class="btn donate jq_donate" data-google="모금함_View" data-stat="기부하기_상단_BTN_CLK">모금함 기부하기</a>
                </div>
                
                
  </div>
  					<!-- END sidebar-box -->
					<div class="sidebar-box" style="margin-top: 20px;width: 278px;">
						<h3 class="heading">관련 캠페인</h3>
						<div class="post-entry-sidebar">
							<ul>
								<li v-for="revo in related_data">
									<a :href="'../donation/donation_before_detail.do?dno='+revo.dno" style="text-decoration: none;">
										<img :src="revo.d_image" class="rounded" style="width: 110px;height: 80px;">
										<div class="text" style="margin-left: 5px;">
											<h6>{{revo.d_title}}</h6>
											<div class="post-meta">
												<span class="mr-2">목표:{{revo.d_goal}}원</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- END sidebar-box -->
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
    			content_cost:{},
    			replyShow:false,
    			replymsg:'',
    			replyCurpage:1,
    			replyTotalpage:0,
    			reply_list:[],
    			replySubmsg:'',
    			historyCurpage:1,
    			pay_list:[],
    			payTotalpage:0,
    			paysize:0,
    			dSessionId:''
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
    		 this.historyDataSend()
    		 this.replyDataSend()
    	 },
    	 methods:{
    		 subReplyShow(rno){
    			 $('#subReply'+rno).show();
    		 },
    		 replySubCancel(rno){
    			 $('#subReply'+rno).hide("slow"); 
    		 },
    		 replyCancel(){
    			 this.replyShow=false;
    		 },
    		 replyWrite(){
    			 this.replyShow=true;
    		 },
    		 replyMainWrite(){
    			 if(this.replymsg===''){
    				 this.$refs.replymsg.focus()
    				 return
    			 }
    			 axios.post('../donation/donation_reply_write_vue.do',null,{
    				 params:{
    					 dno:this.dno,
    					 msg:this.replymsg,
    				     root:0,
    				     depth:0
    				 }
    			 }).then(res=>{
    				 if(res.data==='yes'){
    					 alert('소중한 응원 댓글 감사합니다.')
    					 this.replymsg='';
    					 this.replyShow=false;
    					 this.replyDataSend()
    				 } else {
    					 alert(res.data);
    				 }
    			 })
    		 },
    		 replyDataSend(){
    			 axios.get('../donation/donation_reply_list_vue.do',{
    				 params:{
    				     page:this.replyCurpage,
    				     dno:this.dno
    				 }
    			 }).then(res=>{
    				console.log(res.data); 
    				this.reply_list=res.data.reply_list;
    				this.replyTotalpage=res.data.totalpage;
    				this.dSessionId=res.data.dSessionId;
    			 })
    		 },
    		 historyDataSend(){
    			 axios.get('../donation/donation_pay_list_vue.do',{
    				 params:{
    					 page:this.historyCurpage,
    					 dno:this.dno
    				 }
    			 }).then(res=>{
    				 console.log(res.data)
    				 this.pay_list=res.data.list
    				 this.payTotalpage=res.data.totalpage
    				 this.paysize=res.data.size
    			 })
    		 }
    	 }
     }).mount('#donationDetailApp')
     
     let donationSideDetailBar=Vue.createApp({
    	 data(){
    		return{
    			detail_data:{},
    			dno:${dno},
    			related_data:{},
    			now_data:''
    		} 
    	 },
    	 mounted(){
    		 axios.get('../donation/donation_related_vue.do',{
    			 params:{
    				 dno:this.dno
    			 }
    		 }).then(res=>{
    			 console.log(res.data)
    			 this.detail_data=res.data.detail_data
    			 this.related_data=res.data.related_data
    			 this.now_data=res.data.detail_data.d_now.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		 })
    	 },
    	 methods:{
    		 
    	 }
     }).mount('#donationSideDetailBar')
     
    
   </script>
</body>
</html>