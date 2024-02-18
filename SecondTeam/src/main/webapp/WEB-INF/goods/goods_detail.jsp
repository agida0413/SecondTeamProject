<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- dialog -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- dialog -->
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<style type="text/css"> 	
#goodsDetail{
margin-top: 50px;
}
</style>
</head>
<body>
	<div class="container" id="goodsDetail">
		<div class="row">
			<div class="row mb-4">
				<div class="col-sm-6">
					<h2 class="posts-entry-title"></h2>
				</div>
				<div class="col-sm-6 text-sm-end">
					<a href="#" class="read-more" @click="goback()">Return List</a>
				</div>
			</div>
<table class="goodsDetailtab" style="width: 100%;">
    <tr>
        <td width="40%" class="text-center" rowspan="3">
            <img :src="goodsdetail.g_img" style="max-width: 100%; height: auto;">
        </td>
        <td width="60%" style="padding-left: 20px; vertical-align: top;">
            <div style="margin-bottom: 20px;">
                <span style="font-size: 24px; font-weight: bold;">{{goodsdetail.g_name}}</span>
            </div>
            <div style="margin-top: 20px;">
                <div v-for="(vo,index) in goodsdetail_img" :key="index" style="display: inline-block; margin-right: 10px;">
                    <img v-if="index < 2" :src="vo.type_img" style="max-width: 100%; max-height: 100%;">
                </div>
            </div>
            <div style="margin-top: 30px; font-size: 18px;">
                <span>{{goodsdetail.g_price}}</span>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="padding-left: 20px; vertical-align: top;">
            <div style="margin-top: 20px; display: flex; align-items: center;">
                <span style="margin-right: 20px; font-size: 16px;">수량</span>
                <div class="quantity-input" style="margin-right: 20px;">
                    <input type="text" id="quantity" name="quantity" v-model="quantity" min="1" style="width: 90px; height: 35px; padding: 5px; text-align: center;" readonly>
                   <button @click="increaseQuantity" style="width: 35px; height: 35px;"><i class="fas fa-arrow-up"></i></button>
<button @click="decreaseQuantity" style="width: 35px; height: 35px;"><i class="fas fa-arrow-down"></i></button>
                </div>
            </div>
            <div style="margin-top: 10px;">
                <span style="font-size: 16px;">총금액</span>&nbsp;
                <span>{{goodsdetail.intprice ? (goodsdetail.intprice * quantity).toLocaleString() : '0'}}</span>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="padding-left: 20px;">
            <div style="margin-top: 20px; display: flex;">
                <input type="button" class="form-control" value="장바구니" style="width: 180px; height: 50px; font-weight: bold; margin-right: 5px;">
                <input type="button" class="form-control" value="바로구매" style="width: 180px; height: 50px; font-weight: bold; margin-right: 5px;">
                <button class="form-control" style="width: 50px; height: 50px; margin-left: 1px; font-weight: bold; padding: 5px; display: flex; align-items: center; justify-content: center;">
                    <span style="font-size: 27px;"><i class="xi-heart-o"></i></span>
                </button>
            </div>
        </td>
    </tr>
</table>
</div>
			<div class="row" style="border-top: 1px solid grey; margin-top: 20px;">
				<div class="text-center" style="margin-top: 15px;">
					<span><a href="#">Details | </a></sapn> 
					<span><a href="#">Review | </a></sapn> 
					<span><a href="#">Q&A | </a></sapn>
					<span><a href="#">Order info</a></sapn>
				</div>
			</div> 
		<div class="subImgShow" id="image-container" style="height: 500px; overflow: hidden;">
		<div class="row" v-for="vo in goodsdetail_img" ref="subImg" style="margin-top: 20px;width: 100%; height: auto">
			<table class="table">
				<tr>
					<img :src="vo.g_subimg">
				</tr>
			</table>
		</div>
		</div>
		<input type="button" class="form-control" ref="subImg" value="상품상세보기" @click="subImgShow()">
		<div class="row mb-4">
			<div class="col-sm-6" style="margin-top: 50px;">
				<h2 class="posts-entry-title">상품후기</h2>
			</div>
			<div class="col-sm-6 text-sm-end"
				style="margin-top: 50px;">
				<a href="#" class="read-more"  @click="rWrite()">Write Review</a>
			</div>
			<div class="row"  style="border-top: 1px solid grey; margin-top: 20px;">
				<div class="text-center" style="background-color: #f5f5f5; width: 100%; height: 210px; margin-top: 30px; text-align: center;">
				
				</div>	
			</div>
			<div class="col-sm-3 text-sm-end"
				style="margin-top: 50px; display: none; height: 400px;" id="dialog" >
				  <h3 class="text-center" style="margin-top: -5px;">상품 리뷰 작성</h3>
		        <table class="table" style="text-align: left; border-collapse: collapse;">
		            <tr>
		                <th width="10%">아이디</th>
		                <td width="90%"><input type="text" size="15" class="input-sm" :value="userid" readonly></td>
		            </tr>
		            <tr>
		                <th width="10%">이름</th>
		                <td width="90%"><input type="text" size="15" class="input-sm" :value="username" readonly></td>
		            </tr>
		            <tr>
		                <th width="10%">제목</th>
		                <td width="90%"><input type="text" ref="subject" v-model="subject" size="50" class="input-sm" :readonly="editMode"></td>
		            </tr>
		            <tr>
		                <th width="10%">내용</th>
		                <td width="90%"><textarea rows="15" cols="70" ref="content" v-model="content"></textarea></td>
		            </tr>
					<tr>
						<th width="10%">별점</th>
						<td width="90%"><select v-model="score" class="form-control" @change="updateScore">
								<option value="1">★☆☆☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="3">★★★☆☆</option>
								<option value="4">★★★★☆</option>
								<option value="5">★★★★★</option>
						</select></td>
					</tr>
					<tr>
		                <td colspan="2" class="text-right inline">
		                    <div class="rBtn" style="display:flex; justify-content:flex-end;">
		                        <input type="button" :value="editMode===true?'리뷰수정':'리뷰작성'" class="form-control" @click="write()" style="width: 150px; height: 50px; margin-left: 10px;">
		                        <input type="button" value="취소" class="form-control" @click="close()" style="width: 150px; height: 50px;">
		                    </div>
		                </td>
		            </tr>
		        </table>
			</div>
			
		</div>
		
		<div class="text-center">
			<div class="row"  v-if="rList.length===0"
				style=" margin-top: 20px;">
				<div style="margin: 50px 0 230px 0">
					<span>등록된 상품 후기가 없습니다.</span>
				</div>
			</div>
		</div>
		
			<div class="text-left" style="margin-top: 30px;" v-else>
				<table class="review-table" v-for="vo in rList" style="width: 100%">
					<tr>
						<td width="20%">{{displayStars(vo.score)}}</td>
					</tr>
					<tr>
						<td width="10%">{{vo.userid}} | {{vo.dbday}}</td>
					</tr>
					<tr>
						<td width="50%">
							<p>{{vo.subject}}</p>
							<p>{{vo.content}}</p>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="display: flex; justify-content: flex-end;" v-if="vo.userid===userid">
							<button class="form-control" @click="upReview(vo.rno)" style="width: 60px; height: 40px;">수정</button>
							<button class="form-control" @click="delReview(vo.rno)" style="width: 60px; height: 40px;">삭제</button>
						</td>
					</tr>
				</table>
			</div>
		<div class="row mb-4">
			<div class="col-sm-6" style="margin-top: 50px;">
				<h2 class="posts-entry-title">상품문의</h2>
			</div>
			<div class="col-sm-6 text-sm-end" style="margin-top: 50px;">
				<a href="#" class="read-more">
				Q&A
				</a>
			</div>
		 <div class="text-center">
		 <div class="row" style="border-top: 1px solid grey; margin-top: 20px;">
		 	 <div style="margin: 50px 0 230px 0">
     			  <span>등록된 상품 문의가 없습니다.</span>
      		 </div>
		 </div>
		</div>
		</div>
	</div>
	<script>
let goodsDetail=Vue.createApp({
	data(){
		return{
			goodsdetail:{},
			goodsdetail_img:[],
			gno:${gno},
			isShow:false,
			rShow:false,
			quantity:1,
			subject:'',
			content:'',
			score:1,
			rList:[],
			maxScore:5,
			userid:'',
			username:'',
			editMode:false
		}
	},
	mounted(){
		this.detaildata()
	},
	methods:{
		detaildata(){
			axios.get("../goods/goods_detail_vue.do",{
				params:{
					gno:this.gno
				}
			}).then(res=>{
				console.log(res.data)
				
				this.goodsdetail=res.data.goodsdetail
				this.goodsdetail_img=res.data.goodsdetail_img
				this.rList=res.data.rList,
				this.userid=res.data.userid,
				this.username=res.data.username
			})
		},
		subImgShow(){
			 const imageContainer = document.getElementById('image-container');
             const subImgButton = this.$refs.subImg

             if (this.isShow===false) {
                 imageContainer.style.height = "auto"
                 subImgButton.value = "상세보기접기"
                 this.isShow=true
             } else {
                 imageContainer.style.height = "500px"
                 subImgButton.value = "상품상세보기"
                 this.isShow=false
             }
            
		},
		close(){
			 $("#dialog").dialog("close");
		},
		goback(){
			location.href="../goods/goods_main.do"
		},
		rWrite(){
			this.rShow=true;
			this.subject=''
			this.content=''
			if(this.userid===null)
			{
				alert("로그인 후 이용 가능합니다")
				this.detaildata()
			}
			else
			{
		    const scrollTop = $(window).scrollTop(); // 현재 스크롤 위치 저장
		    $("#dialog").dialog({
		        autoOpen:false,
		        modal:true,
		        width:900,
		        height:720,
		        open: function(event, ui) {
		            $("body").css("top", -scrollTop); 
		            $("body").addClass("dialog-open"); 
		        },
		        close: function(event, ui) {
		            $("body").css("top", 0);
		            $("body").removeClass("dialog-open"); 
		            $(window).scrollTop(scrollTop);
		        }
		    }).dialog("open");
			}
		},
		increaseQuantity() {
                this.quantity++;
        },
        decreaseQuantity() {
                if (this.quantity > 1) {
                    this.quantity--;
                }
        },
        updateScore() {
            this.score = this.score
 	   },
        displayStars(score) {
            let stars = '';
            for (let i = 0; i < 5; i++) {
                if (i < score) {
                    stars += '★';
                } else {
                    stars += '☆';
                }
            }
            return stars; // 별점 표시 반환
        },
       delReview(rno){
    	   axios.get("../goods/reviewDelete_vue.do",{
    		   params:{
    			   rno:rno,
    			   gno:this.gno
    		   }
    	   }).then(res=>{
    		   this.rList=res.data
    	   })
    	   this.detaildata()
       },
       upReview(rno){
    	   this.uprno = rno;
    	   this.rShow=true
    	   this.editMode=true
    	   const review = this.rList.find(review => review.rno === rno)
    	   if (review) 
    	   {
   				this.subject=review.subject
   				this.content=review.content
		   }
		    const scrollTop = $(window).scrollTop(); // 현재 스크롤 위치 저장
		    $("#dialog").dialog({
		        autoOpen:false,
		        modal:true,
		        width:900,
		        height:720,
		        open: function(event, ui) {
		            $("body").css("top", -scrollTop); 
		            $("body").addClass("dialog-open"); 
		        },
		        close: function(event, ui) {
		            $("body").css("top", 0);
		            $("body").removeClass("dialog-open"); 
		            $(window).scrollTop(scrollTop);
		        }
		    }).dialog("open");
       },
       write() {
    	   
    	   if(this.subject === '') {
               this.$refs.subject.focus();
               return;
           }
           if(this.content === '') {
               this.$refs.content.focus();
               return;
           }
           if(this.editMode===false)
           {
           axios.get("../goods/reviewInsert_vue.do", {
               params:{
               gno: this.gno,
               subject: this.subject,
               content: this.content,
               score: this.score
               },
               headers: {
	                'Content-Type': 'application/json;charset=UTF-8'
	            }
           }).then(res => {
               alert("리뷰작성이 완료되었습니다");
               $("#dialog").dialog("close");
               this.detaildata()
           }).catch(error => {
               console.error("Error occurred while sending review:", error);
           });
           }
           else
           {
           	axios.get("../goods/reviewUpdate_vue.do",{
           		params:{
           		    rno: this.uprno,
           			gno: this.gno,
                    subject: this.subject,
                    content: this.content,
                    score: this.score
           		},
                   headers: {
   	                'Content-Type': 'application/json;charset=UTF-8'
   	            }
           	}).then(res=>{
           		console.log("up:"+res.data)
           		this.rList=res.data
           		alert("리뷰수정이 완료되었습니다");
                $("#dialog").dialog("close");
                this.detaildata()
           	}).catch(error => {
                   console.error("Error occurred while sending review:", error);
               })
           	
           }
       }
	}
}).mount("#goodsDetail")
</script>
</body>
</html>