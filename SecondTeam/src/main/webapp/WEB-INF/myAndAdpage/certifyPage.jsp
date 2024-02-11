<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.image-group {
  display: flex;
  flex-wrap: wrap;
}

.image-item {
  max-width: calc(33.33% - 10px); /* 한 줄에 3개의 이미지이므로, 각 이미지의 너비를 33.33%로 설정 */
  max-height: 200px;
  margin-right: 15px; /* 이미지 간의 간격 */
  margin-bottom: 15px; /* 이미지 그룹 간의 간격 */
}

</style>
</head>
<body>
<div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 완료인증신청</span></div>
  <hr>
<div class="container" id="certify">
	<div class="row">
  				<div style="margin-top:20px;"></div>
	  			<table class="table" >
	  				<tr  style="background-color:#f0f0f0" class="text-center">
	  					<th width="35%">프로그램명</th>
	  					<th width="30%">센터이름</th>
	  					<th width="35%">봉사기간</th>
	  					
	  					
	  					
	  				</tr>
	  				
	  				<tr style="height:70px; vertical-align:middle;" class="text-center">
	  				<td >${vo.pvo.title }</td>
	  				<td >${vo.pvo.centername }</td>
	  					<td>${vo.pvo.dbV_start }&nbsp;~&nbsp;${vo.pvo.dbV_end }</td>
	  					
	  					
	  					
	  				</tr>
	  			</table>
				<div class="row">
				<div class="col-8">
				<ul style="margin-top:10px;">
				<li style="list-style-type: none; margin-bottom:10px; color:black; font-size:20px; font-weight:bold;">* 인증신청 시 유의사항</li>
			
				<li>인증신청 반려 시 재신청 가능합니다.</li>
				<li>인증신청 반려 시 자세한 내용은 해당센터에 문의바랍니다.</li>
				<li>봉사활동 근거를 충분히 인증할 수 있는 사진을 3장이상 첨부해주세요.</li>
				<li>명확하지 않은 사진이나 얼굴 식별이 불가능할 시 인증이 반려될 수 있습니다.</li>
				</ul>
				</div>
				
				<div class="col-4">
					<div style="margin-bottom:20px;"><span style="color:black; font-size:20px; font-weight:bold;">* 인증완료시 획득 가능한 보상</span></div>
					<div class="text-center">
				<span style="font-size:40px; color:black; font-weight:bold; ">10&nbsp;<img src="../Projectimages/wing3.png" width="80px"> </span>
				</div>
				</div>
			
          </div>
				
  		   </div>
  		   
  		   <hr>
  		 <div >
  <input type="file" ref="upfiles" class="input-sm" multiple="multiple" accept="image/*" @change="showImage" v-model="upfiles">
 
  <!-- 이미지가 보일 경우에만 이미지를 표시하는 div -->
  <div style="height:30px;"></div>
  <div v-if="upfileList.length > 0" class="image-group">
    <img v-for="(file, index) in upfileList" :key="index" :src="file" alt="uploaded image" class="image-item">
  </div>
  
 
  
</div>
			<hr>
  		   <div style="float:right;"><input type="button" class="btn btn-large btn-danger" value="인증신청하기" @click="certifySend()"></div>
  		   </div>
  		   
  		   
  		   <script>
  		 let certify = Vue.createApp({
  			  data() {
  			    return {
  			      upfileList: [],
  			      upfiles: '',
  			      vano:${vo.vano}
  			    };
  			  },
  			  methods: {
  			    showImage(event) {
  			      this.upfileList = []; // 이미지 목록 초기화
  			      const files = event.target.files; // 선택된 파일들을 가져옴
  			      for (let i = 0; i < files.length; i++) {
  			        const reader = new FileReader();
  			        reader.onload = (e) => {
  			          // 파일을 읽은 후에 업로드된 파일 목록에 추가
  			          this.upfileList.push(e.target.result);
  			        };
  			        reader.readAsDataURL(files[i]); // 파일을 base64 형식으로 읽음
  			      }
  			    },
  			    resetFiles() {
  			      // 파일 초기화 메서드
  			      this.upfiles = ''; // 파일 입력(input type="file") 요소 초기화
  			      this.upfileList = []; // 이미지 목록 초기화
  			    },
  			    certifySend(){
  			    
  			    	if(this.upfileList.length===0){
  			    		alert('사진을 첨부해주세요')
  			    		return;
  			    	}
  			    	
  			    	
  			    	let formData=new FormData();
  			    	
  			    	let leng=this.$refs.upfiles.files.length;
  			    	
  			    	if(leng>0)
  	    			{
  	    			    for(let i=0;i<leng;i++)
  	    			    {
  	    			    	formData.append("accesssImgs["+i+"]",this.$refs.upfiles.files[i])
  	    			    }
  	    		    }
  			    	
  			    	formData.append("vano",this.vano)
  			    	
  			    	axios.post('../myAndAdpage/certifyUpdate_vue.do',formData,{
  		    			header:{
  		    				'Content-Type':'multipart/form-data'
  		    			}
  		    		})
  		    		.then(response=>{
  		    			if(response.data==='yes')
  		    			{
  		    				alert('인증신청이 완료되었습니다.')
  		    				location.href="../myAndAdpage/programCertify.do?state=COMPLETE"
  		    			}
  		    			else
  		    			{
  		    			    alert(response.data)	
  		    			}
  		    		}).catch(error=>{
  		    			console.log(error.response)
  		    		})
  			    	
  			    }
  			  }
  			});

  		certify.mount('#certify');
  		</script>
</body>
</html>