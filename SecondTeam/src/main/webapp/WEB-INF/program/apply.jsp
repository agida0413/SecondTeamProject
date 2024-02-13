<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.applyTitle{

vertical-align:middle;
text-align:center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<div >
			<span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 신청</span>
			</div>
		
            	
            <hr>
            	<span><input type="button" class="btn btn-medium btn-primary" value="돌아가기" onClick="javascript:history.back()"></span>	
            	
           
            	
         		  
         <div id="applyApp">		   
<div class="container" style="border: 1px solid #cccccc; border-radius: 20px; margin-top:20px; padding:30px;">
 			<!-- 프로그램정보 -->
	<div class="row">
				<div class="col-8">
				   	<div style="margin-top:90px; margin-bottom:20px;">  
						<span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 정보</span>
					</div>
	
			  			
            		  
	            		  <table class="table">
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2; font-weight:bold;">프로그램이름</td>
	            		  		<td width="70%">${vo.title }</td>
	            		  	</tr>
	            		  		<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">봉사기간</td>
	            		  		<td width="70%">${vo.dbV_start}&nbsp;~&nbsp;${vo.dbV_end}</td>
	            		  	</tr>
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">봉사시간</td>
	            		  		<td width="70%">${vo.runtime}</td>
	            		  	</tr>
	            		  		<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">활동요일</td>
	            		  		<td width="70%">${vo.rundate }</td>
	            		  	</tr>
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">봉사자 유형</td>
	            		  		<td width="70%">${vo.volunteer_type }</td>
	            		  	</tr>
	            		  		<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">봉사분야</td>
	            		  		<td width="70%">${vo.major_field}&nbsp;&gt;&nbsp;${vo.minor_field }</td>
	            		  	</tr>
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">봉사위치</td>
	            		  		<td width="70%">${vo.si }&nbsp;${vo.gu }</td>
	            		  	</tr>
	            		  		<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">상세위치</td>
	            		  		<td width="70%">${vo.centername }</td>
	            		  	</tr>
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">활동방식</td>
	            		  		<td width="70%">${vo.active_type }</td>
	            		  	</tr>
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">봉사대상</td>
	            		  		<td width="70%">${vo.target }</td>
	            		  	</tr>
	            		  </table>
            		  
              </div>
              
              	<div class="col-4">
				   	<div style="margin-bottom:15px;">  
						<span style="font-weight:bold; font-size:30px; color:black;">회원정보</span>
					</div>
					
			  		
            		  
	            		  <table class="table">
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2; font-weight:bold;">이름</td>
	            		  		<td width="70%">${sessionScope.name }</td><!--변경요망-->
	            		  	</tr>
	            		  	
	            		  	<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">전화번호</td>
	            		  		<td width="70%">${sessionScope.phone }</td><!--변경요망-->
	            		  	</tr>
	            		  	
	            		  			<tr>
	            		  		<td width="30%" class="applyTitle" style="background-color:#f2f2f2;">이메일</td>
	            		  		<td width="70%">${sessionScope.email }</td><!--변경요망-->
	            		  	</tr>
	            		  </table>
	            		  
	            		  
	            		  	<div class="row"	style=" border: 1px solid #cccccc; border-radius: 10px; padding:20px;">
				
						   	<div style="margin-bottom:15px;">  
								<span style="font-weight:bold; font-size:30px; color:black;">양식첨부</span>
							</div>
							
							<div class="fileInform">
							<span>*필수 첨부양식</span><br>
							
								<span>-&nbsp;봉사활동 계획서 1부</span><br>
								<span>-&nbsp;신분증 사본 1부</span><br>
								<span>-&nbsp;봉사활동 서약서 1부</span><br>
								<br>
								<span>*주의사항</span><br>
								
								<span>- 양식에 맞지않게 신청 할 시 거절사유가 될 수있습니다.</span><br>
								<span>- 노쇼 행위 시 불이익이 발생할 수 있습니다.</span><br>
								<div style="margin-top:15px;">
								 <input type=file ref="upfiles" class="input-sm" multiple="multiple" accept="upload/*" 
            					 v-model="upfiles">
								</div>
							</div>
							</div>
            		  
              </div>
            		  
            		  
            		  
	</div>
	
	
			
			
			
			
			<!-- 신청양식 -->
			
	
			
</div>
	<div style="margin-top:20px;"><input type="button" value="신청하기" class="btn btn-xlarge btn-danger" style="float:right;" @click="submitForm()"></div>	
	</div>		
</body>

<script>
let applyApp=Vue.createApp({
	// 멤버변수 설정
	data(){
		return {
			vno:${vo.vno},
			upfiles:''
		
		}
	},
	// 멤버함수 설정
	methods:{
		// submit버튼 호출시에 => 데이터전송이 없이 submitForm()를 호출 
		// @submit.prevent
		// submit / a => defaultPrevent => 이벤트 동작을 중지 
		submitForm(){
			// NOT NULL => 유효성 검사 
		
		if (this.$refs.upfiles.files.length === 0) {
   
					 alert('신청파일을 첨부해주세요.')
					 return;
					} 
			
			
			
			
			let formData=new FormData();
			formData.append("vno",this.vno);
		
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
    		axios.post('../program/apply_vue.do',formData,{
    			header:{
    				'Content-Type':'multipart/form-data'
    			}
    		})
    		.then(response=>{
    			if(response.data==='yes')
    			{
    				alert('신청이 완료되었습니다.')
    				location.href="../program/list.do"
    			}
    			else
    			{
    			   alert('이미 신청한 프로그램입니다.')
    				location.href="../program/list.do"
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
}).mount('#applyApp')


</script>
</html>