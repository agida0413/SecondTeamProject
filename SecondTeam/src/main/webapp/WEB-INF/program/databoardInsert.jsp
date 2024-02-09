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
  <div class="container" id="databoardInsert">
    <div class=""><span style="font-weight:bold; font-size:30px; color:black;">자료실(양식다운)</span></div>
  <hr>
    <div class="row">
     <%--
           form => 기본 기능 (서버로 데이터 전송)
                => 화면 reset
                => 기능을 동작하지 못하게 만든다 @submit.prevent
      --%>
     <form @submit.prevent="submitForm">
      <table class="table">
       <tr>
        <th width=15% class="text-center">이름</th>
        <td width=85%>
         <input type=text size=15 class="input-sm" v-model="name" ref="name">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">제목</th>
        <td width=85%>
         <input type=text size=40 class="input-sm" v-model="subject" ref="subject">
         <span style="margin-left:30px;"><input type="checkbox" v-model="Jcheck">&nbsp;&nbsp;중요글</span>
        </td>

        
       </tr>
       <tr>
        <th width=15% class="text-center">내용</th>
        <td width=85%>
         <textarea rows="10" cols="52" v-model="content" ref="content"></textarea>
        </td>
       </tr>
       <tr>
         <th width=15% class="text-center">첨부파일</th>
         <td width=85%>
           <input type=file ref="upfiles" class="input-sm" multiple="multiple" accept="upload/*" 
            v-model="upfiles">
         </td>
       </tr>
       <tr>
        <th width=15% class="text-center">비밀번호</th>
        <td width=85%>
         <input type=password size=15 class="input-sm" v-model="pwd" ref="pwd">
        </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
           <input type="submit" value="글쓰기" class="btn-success btn-sm">
           <input type="button" value="취소" onclick="javascript:history.back()"
            class="btn-info btn-sm"
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
    			name:'',
    			subject:'',
    			content:'',
    			pwd:'',
    			upfiles:'',
    			Jcheck:'',
    			check:2
    		}
    	},
    	// 멤버함수 설정
    	methods:{
    		// submit버튼 호출시에 => 데이터전송이 없이 submitForm()를 호출 
    		// @submit.prevent
    		// submit / a => defaultPrevent => 이벤트 동작을 중지 
    		submitForm(){
    			// NOT NULL => 유효성 검사 
    			if(this.name==="")
    			{
    				this.$refs.name.focus(); // ref는 태그를 제어 
    				return;
    			}
    			if(this.subject==="")
    			{
    				this.$refs.subject.focus(); // ref는 태그를 제어 
    				return;
    			}
    			if(this.content==="")
    			{
    				this.$refs.content.focus(); // ref는 태그를 제어 
    				return;
    			}
    			if(this.pwd==="")
    			{
    				this.$refs.pwd.focus(); // ref는 태그를 제어 
    				return;
    			}
    			
    			
    			if(this.Jcheck===true){
    				this.check=1	
    			}
    			if(this.Jcheck===false || this.Jcheck===''){
    				this.check=2
    			}
    			let formData=new FormData();
    			formData.append("name",this.name);
    			formData.append("subject",this.subject);
    			formData.append("content",this.content);
    			formData.append("pwd",this.pwd);
    			formData.append("v_check",this.check);
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
	    		axios.post('../program/databoardInsert_vue.do',formData,{
	    			header:{
	    				'Content-Type':'multipart/form-data'
	    			}
	    		})
	    		.then(response=>{
	    			if(response.data==='yes')
	    			{
	    				location.href="../program/databoardList.do"
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
    }).mount('#databoardInsert')
  </script>
</body>
</html>