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