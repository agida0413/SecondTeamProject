<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container" style="padding: 50px 0; width: 700px;">
    <h3 class="text-center">글쓰기</h3>
    <div class="row">
     <%--
           form => 기본 기능 (서버로 데이터 전송)
                => 화면 reset
                => 기능을 동작하지 못하게 만든다 @submit.prevent
      --%>
     <form @submit.prevent="submitForm" enctype="multipart/form-data">
      <table class="table">
       <tr>
        <th width=15% class="text-center">내용</th>
        <td width=85%>
         <textarea rows="10" cols="52" v-model="content" ref="content"></textarea>
        </td>
       </tr>
      <tr>
         <th width=15% class="text-center">첨부파일</th>
         <td width=85%>
         <div v-if="previewImagesArray.length > 0">
                <h5>미리 보기:</h5>
                <div v-for="(image, index) in previewImagesArray" :key="index">
                  <img :src="image" alt="이미지 미리 보기" style="max-width: 500px; max-height: 500px; margin: 5px;">
                </div>
              </div>
           <input type=file ref="upfiles" class="input-sm" multiple="multiple" accept="upload/*" 
            v-model="upfiles"  @change="previewImages">
         </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
           <input type="submit" value="글쓰기" class="btn btn-sm">
           <input type="button" value="취소" onclick="javascript:history.back()"
            class="btn btn-sm"
           >
         </td>
       </tr>
      </table>
     </form>
    </div>
  </div>
  <script>
    // Vue객체 생성 
    let app=Vue.createApp({
    	// 멤버변수 설정
    	data(){
    		return {
    			content:'',
    			upfiles:'',
    			previewImagesArray: [] // 미리 보기에 사용될 이미지 배열
    		}
    	},
    	// 멤버함수 설정
    	methods:{
    		  // 파일 선택시 미리 보기 이미지 설정
            previewImages(event) {
              const files = event.target.files;
              if (files && files.length > 0) {
                this.previewImagesArray = []; // 이전에 미리 보여준 이미지 초기화
                for (let i = 0; i < files.length; i++) {
                  const reader = new FileReader();
                  reader.onload = (e) => {
                    this.previewImagesArray.push(e.target.result); // 파일을 미리 보기 배열에 추가
                  };
                  reader.readAsDataURL(files[i]); // 이미지 파일을 Data URL로 변환하여 미리 보기 배열에 추가
                }
              }
            },
    		// submit버튼 호출시에 => 데이터전송이 없이 submitForm()를 호출 
    		// @submit.prevent
    		// submit / a => defaultPrevent => 이벤트 동작을 중지 
    		submitForm(){
    			// NOT NULL => 유효성 검사 
    			if(this.content==="")
    			{
    				this.$refs.content.focus(); // ref는 태그를 제어 
    				return;
    			}
    			
    			let formData=new FormData();
    			formData.append("content",this.content);
    			
    			let leng=this.$refs.upfiles.files.length;
    			//alert("leng="+leng)
    			// List => [0]
    			if(leng>0)
    			{
    			    for(let i=0;i<leng;i++)
    			    {
    			    	formData.append("files["+i+"]",this.$refs.upfiles.files[i])
    			    }
    		    }
    		
    		
    		// 서버로 전송 
	    		axios.post('../sns/insert_vue.do',formData,{
	    			headers: {
	    		        'Content-Type': 'multipart/form-data'
	    		    }
	    		})
	    		.then(response=>{
	    			if(response.data==='yes')
	    			{
	    				location.href="../sns/list.do"
	    			}
	    			else
	    			{
	    			    alert(response.data)	
	    			}
	    		}).catch(error=>{
	    			console.log(error.response)
	    		})
    		
    		}//submitForm() end
    	},
    	// CallBack => Vue에 의해 호출되는 함수
    	mounted(){
    		// 시작과 동시에 처리 
    	},
    	updated(){
    		// 데이터를 갱신 => component를 만든 경우 ****
    	}
    }).mount('.container')
  </script>
</body>
</html>
