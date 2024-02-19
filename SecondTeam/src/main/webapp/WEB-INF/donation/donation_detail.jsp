<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
<div class="container" id="donationDetailApp">

      <div class="row blog-entries element-animate">

        <div class="main-content" style="border: 1px solid #e3e3e3">

          <div class="post-content-body detail_body">
            <h2 class="detail_cate">{{detail_data.d_cate}} > {{detail_data.d_smallcate}}</h2>
            <h3 class="detail_title">{{detail_data.d_title}}</h3>
            <h4>캠페인 소개</h4>
            <ul style="list-style: none; padding: 0">
              <div class="col-md-12 mb-4">
                <img :src="detail_data.d_image" style="width: 700px;height: 400px;">
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
            <h3 class="plan">
                <strong>기부금 사용계획</strong><span>여러분들의 소중한 기부금 이렇게 사용됩니다.</span>
            </h3>
        </div>
        <table cellspacing="0" border="1" summary="모금사용계획리스트입니다.">
            <caption>모금사용계획</caption>
            <col style="width:160px">
            <col>
            <col style="width:160px">
            <thead>
            <tr>
                <th scope="col" colspan="2">사용계획내용</th>
                <th scope="col">사용금액</th>
            </tr>
            </thead>
            <tbody>
            <tr class="total">
                <td class="use"><strong>총 집행금액</strong></td>
                <td colspan="2"><em>20,000,000</em> 원 (목표금액 20,000,000 원)</td>
            </tr>
            
                <tr >
                    <td class="use">사업비</td>
                    <td>아동 가정 생계지원 </td>
                    <td class="amount"><em>15,000,000</em>원</td>
                </tr>
            
                <tr >
                    <td class="use">사업비</td>
                    <td>아동 가정 교육지원 </td>
                    <td class="amount"><em>5,000,000</em>원</td>
                </tr>
            
            </tbody>
        </table>
        
        
            <div class="use_goal">
                <!-- [D] 수정 후 개설된 모금함 버전 -->
				<h3><strong>사업대상 및 기대효과</strong></h3>
				<table cellspacing="0" border="1" summary="사업 기간, 사업 대상, 대상 수, 기대효과" class="ex_lst">
					<caption>사업대상 및 기대효과</caption>
					<col width="126">
					<col>
					<tbody>
					<tr>
					    <th scope="row">사업 기간</th>
					    <td>
					    	2024.03.25
							~
							2024.08.25
					    </td>
					</tr>
					
					<tr>
					    <th scope="row">사업 대상</th>
					    <td>취약계층 아동•청소년</td>
					</tr>
					
					
					<tr>
					    <th scope="row">대상 수</th>
					    <td>1&nbsp;명</td>
					</tr>
					
					
					<tr>
					    <th scope="row">기대 효과</th>
					    <td>
					        <ul class="bullet_list" id="effectList">
					        </ul>
					    </td>
					</tr>
					
					</tbody>
				</table>
				<!-- //[D] 수정 후 개설된 모금함 버전 -->
            </div>
        
    </div>
            
          </div>


          <div class="pt-5">
            <p>Categories:  <a href="#">Food</a>, <a href="#">Travel</a>  Tags: <a href="#">#manila</a>, <a href="#">#asia</a></p>
          </div>


          <div class="pt-5 comment-wrap">
            <h3 class="mb-5 heading">6 Comments</h3>
            <ul class="comment-list">
              <li class="comment">
                <div class="vcard">
                  <img src="images/person_1.jpg" alt="Image placeholder">
                </div>
                <div class="comment-body">
                  <h3>Jean Doe</h3>
                  <div class="meta">January 9, 2018 at 2:21pm</div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                  <p><a href="#" class="reply rounded">Reply</a></p>
                </div>
              </li>

              <li class="comment">
                <div class="vcard">
                  <img src="images/person_2.jpg" alt="Image placeholder">
                </div>
                <div class="comment-body">
                  <h3>Jean Doe</h3>
                  <div class="meta">January 9, 2018 at 2:21pm</div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                  <p><a href="#" class="reply rounded">Reply</a></p>
                </div>

                <ul class="children">
                  <li class="comment">
                    <div class="vcard">
                      <img src="images/person_3.jpg" alt="Image placeholder">
                    </div>
                    <div class="comment-body">
                      <h3>Jean Doe</h3>
                      <div class="meta">January 9, 2018 at 2:21pm</div>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                      <p><a href="#" class="reply rounded">Reply</a></p>
                    </div>


                    <ul class="children">
                      <li class="comment">
                        <div class="vcard">
                          <img src="images/person_4.jpg" alt="Image placeholder">
                        </div>
                        <div class="comment-body">
                          <h3>Jean Doe</h3>
                          <div class="meta">January 9, 2018 at 2:21pm</div>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                          <p><a href="#" class="reply rounded">Reply</a></p>
                        </div>

                        <ul class="children">
                          <li class="comment">
                            <div class="vcard">
                              <img src="images/person_5.jpg" alt="Image placeholder">
                            </div>
                            <div class="comment-body">
                              <h3>Jean Doe</h3>
                              <div class="meta">January 9, 2018 at 2:21pm</div>
                              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                              <p><a href="#" class="reply rounded">Reply</a></p>
                            </div>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>

              <li class="comment">
                <div class="vcard">
                  <img src="images/person_1.jpg" alt="Image placeholder">
                </div>
                <div class="comment-body">
                  <h3>Jean Doe</h3>
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
      </div>
      
   </div>
   <script>
     let donationDetailApp=Vue.createApp({
    	 data(){
    		return{
    			detail_data:{},
    			dno:${dno},
    			content_title:{},
    			content_content:{}
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
    			console.log(this.content_title)
    			console.log(this.content_content)
    			
    		 })
    	 },
    	 methods:{
    		 
    	 }
     }).mount('#donationDetailApp')
   </script>
</body>
</html>