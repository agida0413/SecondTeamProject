<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>




<style type="text/css">

.table td{
border:none;
}
  
  .custom-select {
  position: relative;
  font-family: Arial, sans-serif;
}
.bord{
margin-top:20px;
padding:20px;
border:1px #f7f7f7 solid;
background-color:#f7f7f7;

}





  

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 
 <div class="row" style="margin-bottom:30px;">
<span><a href="../donateclass/list.do?type=A" class="btn btn-large btn-primary">클래스 리스트로</a></span>
</div>

   

        <div class="col-md-12 col-lg-8 main-content" id="newprogrmaApp">
        
      <form action="../donateclass/insertNewProgram.do" method="post" @submit.prevent="insertNewProgram" id="form" enctype="multipart/form-data">
	
          <div class="post-content-body" id="dcDetailControll" style="height:500px;">
            <div class="row" style="height:500px;">
           <img id="preview" :src="imageUrl" style="width::100%; height:100%">
           </div>
       
           
          
            
             
            
            
           
            <div class="row  bord">
            <div class="col-6">
        		 
						<table  class="table" >
  			<tr>
  			
	  			<td style="font-size:25px; color:black; font-weight:bold; ">주 이미지등록</td>
	  			<td style="font-size:25px; color:black; font-weight:bold; ">
	  			
	  			</td>
  			</tr>
  			<tr><td><input type="file" ref="mainimage" class="input-sm" accept="image/*" @change="showImage" name="mainimage" ></td></tr>
  			
  			<tr>
  				
	  			<td width="25%" style="font-size:25px; color:black; font-weight:bold;">서브 이미지등록</td>
	  		
	  			<td width="25%" style="font-size:25px; color:blue; font-weight:bold;">
	  		
	  			</td>
	  		</tr>
  			
  			<tr>
  			<td>
  			<input type="file"  class="input-sm" multiple="multiple" accept="image/*"  name="subimages" ref="subimages">
  			</td>
  			</tr>
  				
  			<tr>
  				
	  			<td width="25%" style="font-size:25px; color:black; font-weight:bold;">보상 wing</td>
	  		
	  			<td width="25%" style="font-size:25px; color:blue; font-weight:bold;">
	  		
	  			</td>
	  		</tr>
  			
  			<tr>
  			<td>
  			<input type="number" min=1 value="500" max=2000 name="wing" ref="wing">
  			</td>
  			</tr>
  		
  			
  			</table>
					
			</div>	
			
			 <div class="col-6">		
  			<table  class="table">
  			<tr>
  			
	  			<td style="font-size:25px; color:black; font-weight:bold;">위치</td>
	  			<td style=" color:black; font-weight:bold;">
	  			<input type="text" placeholder="위치입력(ex) 서울 종로구)" name="address" ref="address">
	  			</td>
  			</tr>
  			
  			<tr>
  				
	  			<td width="25%" style="font-size:25px; color:black; font-weight:bold;">난이도</td>
	  			
	  			
	  		
	  			<td width="25%" style="font-size:25px;  font-weight:bold;">
	  			<select name="cls_level" ref="cls_level">
	  			<option  value="상">상</option>
	  			<option  value="중">중</option>
	  			<option value="하">하</option>
	  			</select>
	  			
	  			
	  			</td>
	  			
	  			
	  		
	  			
  			</tr>
  				
  				<tr>
	  			<td style="font-size:25px; color:black; font-weight:bold;">소요시간</td>
	  			<td style="font-size:25px; color:black; font-weight:bold;">
	  		<div class="custom-select" style="width:200px;">
  <select name="time" ref="time">
    <option value="1 시간">1 시간</option>
    <option value="1.5 시간">1.5 시간</option>
    <option value="2 시간">2 시간</option>
    <option value="2.5 시간">2.5 시간</option>
    <option value="3 시간">3 시간</option>
    <option value="3.5 시간">3.5 시간</option>
    <option value="4 시간">4 시간</option>
    <option value="4.5 시간">4.5 시간</option>
    <option value="5.5 시간">5.5 시간</option>
    <option value="6 시간">6 시간</option>
    <option value="6.5 시간">6.5 시간</option>
    <option value="7 시간">7 시간</option>
    <option value="7.5 시간">7.5 시간</option>
    <option value="8 시간">8 시간</option>
  </select>
</div>
	  			</td>
  			</tr>
  			
  				<tr>
	  			<td style="font-size:25px; color:black; font-weight:bold;">수업인원</td>
	  			<td style="font-size:25px; color:black; font-weight:bold;">
	  			<input type="number" min=1 value="1" style="width:80px;" name="full_num" ref="full_num">
	  			</td>
  			</tr>
  			
  				
  			
  				<tr>
	  			<td style="font-size:25px; color:black; font-weight:bold;">카테고리</td>
	  			<td style="font-size:25px; color:black; font-weight:bold;">
	  			<select name="category" ref="category">
	  			<option value="공예">공예</option>
	  			<option value="요리">요리</option>
	  			<option value="미술">미술</option>
	  			<option value="뷰티">뷰티</option>
	  			<option value="체험 및 기타">체험 및 기타</option>
	  			</select>
	  			
	  			</td>
  			</tr>	
  				<tr>
	  			<td style="font-size:25px; color:black; font-weight:bold;">이름</td>
	  			<td style=" color:black; font-weight:bold;">
	  			<input type="text" name="name" ref="name" placeholder="클래스명을 입력해주세요">
	  			</td>
  			</tr>
  			</table>
  			
  			<table class="table">
  					<tr>
  				
	  			<td  style=" color:black; font-weight:bold;">파트타임1 시작시간</td>
	  			<td  style=" color:black; font-weight:bold;">파트타임1 종료시간</td>
	  		
	  		</tr>
  				<tr>
  					<td style="; color:blue; font-weight:bold;">
	  			<select name="partTime1">
				    <option value="09:00" selected="selected">09:00</option>
				    <option value="09:30">09:30</option>
				    <option value="10:00">10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00">11:00</option>
				    <option value="11:30">11:30</option>
				    <option value="12:00">12:00</option>
				    <option value="12:30">12:30</option>
				    <option value="13:00">13:00</option>
				    <option value="13:30">13:30</option>
				    <option value="14:00">14:00</option>
				    <option value="14:30">14:30</option>
				    <option value="15:00">15:00</option>
				    <option value="15:30">15:30</option>
				    <option value="16:00">16:00</option>
				    <option value="16:30">16:30</option>
				    <option value="17:00">17:00</option>
				    <option value="17:30">17:30</option>
				    <option value="18:00">18:00</option>
				    <option value="18:30">18:30</option>
				    <option value="19:00">19:00</option>
				    <option value="19:30">19:30</option>
				    <option value="20:00">20:00</option>
				</select>

	  			</td>
	  			
	  				<td style="; color:blue; font-weight:bold;">
	  			<select name="partTime1">
				    <option value="09:00">09:00</option>
				    <option value="09:30">09:30</option>
				    <option value="10:00" selected="selected">10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00">11:00</option>
				    <option value="11:30">11:30</option>
				    <option value="12:00">12:00</option>
				    <option value="12:30">12:30</option>
				    <option value="13:00">13:00</option>
				    <option value="13:30">13:30</option>
				    <option value="14:00">14:00</option>
				    <option value="14:30">14:30</option>
				    <option value="15:00">15:00</option>
				    <option value="15:30">15:30</option>
				    <option value="16:00">16:00</option>
				    <option value="16:30">16:30</option>
				    <option value="17:00">17:00</option>
				    <option value="17:30">17:30</option>
				    <option value="18:00">18:00</option>
				    <option value="18:30">18:30</option>
				    <option value="19:00">19:00</option>
				    <option value="19:30">19:30</option>
				    <option value="20:00">20:00</option>
				</select>

	  			</td>
  				
  				</tr>	
  				
  					<tr>
  				
	  			<td  style=" color:black; font-weight:bold;">파트타임2 시작시간</td>
	  			<td  style=" color:black; font-weight:bold;">파트타임2 종료시간</td>
	  		
	  		</tr>
  				<tr>
  					<td style="; color:blue; font-weight:bold;">
	  			<select name="partTime2">
				    <option value="09:00">09:00</option>
				    <option value="09:30">09:30</option>
				    <option value="10:00" >10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00" selected="selected">11:00</option>
				    <option value="11:30">11:30</option>
				    <option value="12:00">12:00</option>
				    <option value="12:30">12:30</option>
				    <option value="13:00">13:00</option>
				    <option value="13:30">13:30</option>
				    <option value="14:00">14:00</option>
				    <option value="14:30">14:30</option>
				    <option value="15:00">15:00</option>
				    <option value="15:30">15:30</option>
				    <option value="16:00">16:00</option>
				    <option value="16:30">16:30</option>
				    <option value="17:00">17:00</option>
				    <option value="17:30">17:30</option>
				    <option value="18:00">18:00</option>
				    <option value="18:30">18:30</option>
				    <option value="19:00">19:00</option>
				    <option value="19:30">19:30</option>
				    <option value="20:00">20:00</option>
				</select>

	  			</td>
	  			
	  				<td style="; color:blue; font-weight:bold;">
	  			<select name="partTime2">
				    <option value="09:00">09:00</option>
				    <option value="09:30">09:30</option>
				    <option value="10:00">10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00">11:00</option>
				    <option value="11:30">11:30</option>
				    <option value="12:00" selected="selected">12:00</option>
				    <option value="12:30">12:30</option>
				    <option value="13:00">13:00</option>
				    <option value="13:30">13:30</option>
				    <option value="14:00">14:00</option>
				    <option value="14:30">14:30</option>
				    <option value="15:00">15:00</option>
				    <option value="15:30">15:30</option>
				    <option value="16:00">16:00</option>
				    <option value="16:30">16:30</option>
				    <option value="17:00">17:00</option>
				    <option value="17:30">17:30</option>
				    <option value="18:00">18:00</option>
				    <option value="18:30">18:30</option>
				    <option value="19:00">19:00</option>
				    <option value="19:30">19:30</option>
				    <option value="20:00">20:00</option>
				</select>

	  			</td>
  				
  				</tr>	
  				
  					<tr>
  				
	  			<td  style=" color:black; font-weight:bold;">파트타임3 시작시간</td>
	  			<td  style=" color:black; font-weight:bold;">파트타임3 종료시간</td>
	  		
	  		</tr>
  				<tr>
  					<td style="; color:blue; font-weight:bold;">
	  			<select name="partTime3">
				    <option value="09:00">09:00</option>
				    <option value="09:30">09:30</option>
				    <option value="10:00">10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00">11:00</option>
				    <option value="11:30">11:30</option>
				    <option value="12:00">12:00</option>
				    <option value="12:30">12:30</option>
				    <option value="13:00">13:00</option>
				    <option value="13:30">13:30</option>
				    <option value="14:00" selected="selected">14:00</option>
				    <option value="14:30">14:30</option>
				    <option value="15:00">15:00</option>
				    <option value="15:30">15:30</option>
				    <option value="16:00">16:00</option>
				    <option value="16:30">16:30</option>
				    <option value="17:00">17:00</option>
				    <option value="17:30">17:30</option>
				    <option value="18:00">18:00</option>
				    <option value="18:30">18:30</option>
				    <option value="19:00">19:00</option>
				    <option value="19:30">19:30</option>
				    <option value="20:00">20:00</option>
				</select>

	  			</td>
	  			
	  				<td style="; color:blue; font-weight:bold;">
	  			<select name="partTime3">
				    <option value="09:00">09:00</option>
				    <option value="09:30">09:30</option>
				    <option value="10:00">10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00">11:00</option>
				    <option value="11:30">11:30</option>
				    <option value="12:00">12:00</option>
				    <option value="12:30">12:30</option>
				    <option value="13:00">13:00</option>
				    <option value="13:30">13:30</option>
				    <option value="14:00">14:00</option>
				    <option value="14:30">14:30</option>
				    <option value="15:00" selected="selected">15:00</option>
				    <option value="15:30">15:30</option>
				    <option value="16:00">16:00</option>
				    <option value="16:30">16:30</option>
				    <option value="17:00">17:00</option>
				    <option value="17:30">17:30</option>
				    <option value="18:00">18:00</option>
				    <option value="18:30">18:30</option>
				    <option value="19:00">19:00</option>
				    <option value="19:30">19:30</option>
				    <option value="20:00">20:00</option>
				</select>

	  			</td>
  				
  				</tr>	
  			
  			</table>
  			
  			</div>
  			</div>
  			
  			
  			<div class="reserveAndZzim" style="margin-top:15px;">
  			
  					<div class="" style="float:right;">
					<input type="submit" class="btn btn-large btn-danger" value="등록하기" >			
								
					</div>
			
  			</div>
             
          </div>

 </form>

        </div>
       
        <script>
        let newprogramApp=Vue.createApp({
        	data(){
        		return{
        			imageUrl:'../Projectimages/noImg.png'
        		}
        	},
        	methods:{
        		showImage(event) {
        		      const file = event.target.files[0];
        		      if (file) {
        		        const reader = new FileReader();
        		        reader.onload = (e) => {
        		          this.imageUrl = e.target.result;
        		        };
        		        reader.readAsDataURL(file);
        		      }
        		    },
        		    
        		    insertNewProgram(){
        		    	  if (!this.$refs.mainimage.files.length) {
        		              alert('주 이미지를 선택하세요.');
        		              return false;
        		            }
        		    	
        		    	  if(this.$refs.address.value===''){
        		    		  alert('위치를 입력해주세요')
        		    		  return false;
        		    	  }
        		    	  
        		    	
        		    	
        		    	  
        		    	  if(this.$refs.name.value===''){
        		    		  alert('이름을 입력해주세요')
        		    		  return false;
        		    	  }
        		    	  
        		    	  const form = document.getElementById('form');
        		    	  form.submit()
        		    	 
        		    }
        	}
        }).mount('#newprogrmaApp')
        </script>
        </body>
        
        
 