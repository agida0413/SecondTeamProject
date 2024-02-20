<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
<div class="container" id="donationReplyApp">

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
    			console.log(this.content_title)
    			console.log(this.content_content)
    			
    		 })
    	 },
    	 methods:{
    		 
    	 }
     }).mount('#donationReplyApp')
   </script>
</body>
</html>