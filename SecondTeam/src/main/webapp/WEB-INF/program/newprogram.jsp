<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container" id="newProgram">
	<div class="sendFrm">
	<form  @submit.prevent="submitForm">
   		<div class="row selectOpt" style="margin-left:20px;">
                <div class="row selectOpt">
                <table class="table optionTable">
                    <thead>
                        <th colspan="2" class="text-center">봉사지역</th>
                        <th colspan="2" class="text-center">봉사분야</th>
                        <th class="text-center">활동구분</th>
                        <th class="text-center">봉사대상</th>
                      
                        
                    </thead>
					
                    <tbody>
                    <tr>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.state" @change="stateChange()" name="si" ref="si">
                    					
                    		   <c:forEach var="svo" items="${sList}">
                    		   			
                      					<option value="${svo.state }" ${ovo.state eq svo.state ? 'selected' : ''}>${svo.state }</option>
                    		   </c:forEach>
                    			
                    		</select>
                    	</div>
                    </td>
                    
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.city" name="gu" ref="gu">
                    						
                    			
                      					<option :value="vo.city" v-for="vo in cityList">{{vo.city}}</option>
                    		  
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.major_option" @change="major_fieldChange()" name="major_field" ref="mjo">
                    				
                    			<c:forEach var="mjvo" items="${mjList}">
                      					<option value="${mjvo.major_option }" ${ovo.major_option eq mjvo.major_option ? 'selected' : ''}>${mjvo.major_option }</option>
                    		   </c:forEach>
                    			
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.minor_option" name="minor_field" ref="mno">
                    					
                    					<option :value="vo.minor_option" v-for="vo in minor_fieldList">{{vo.minor_option}}</option>
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.active_type" name="active_type" ref="activeType">
                    			
                    			<option value="온라인">온라인</option>
                    			<option value="오프라인">오프라인</option>
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.target_type" name="target" ref="target">
                    			
                    			<option value="아동ㆍ청소년">아동ㆍ청소년</option>
                    			<option value="장애인">장애인</option>
                    			<option value="노인">노인</option>
                    			<option value="쪽방촌">쪽방촌</option>
                    			<option value="다문화가정">다문화가정</option>
                    			<option value="여성">여성</option>
                    			<option value="환경">환경</option>
                    			<option value="사회적기업">사회적기업</option>
                    			<option value="고향봉사">고향봉사</option>
                    			<option value="기타">기타</option>
                    		</select>
                    	</div>
                    </td>
                    
                   
                    
                    </tr>
                    	
                    </tbody>
                    
                  
                </table>
               </div>
               </div>
               
                  <div class="row findOpt" style="margin-left:5px;">
    		<table class="table findTable">
    			<tr>
    				<td style="width:50%;" >
    				<img src="../Projectimages/calender.png" style="width:20px; float:left;">
    				<dl>
    					<dt style="float:left;margin-left:10px; margin-right:40px;">봉사기간</dt>
    						<dd>
    						
    						<input type="date"  style="margin-right:10px;" name="v_start" ref="v_start">~<input type="date"  style="margin-left:10px;"  name="v_end" ref="v_end">
    						
    						</dd>
    				</dl>
    				</td>
    				
    				
    				<td style="width:50%">
    					<img src="../Projectimages/calender.png" style="width:20px; float:left;">
    					<dl>
    					<dt style="float:left;margin-left:10px; margin-right:30px;">모집기간</dt>
    						<dd>
    						
    						<input type="date" style="margin-right:10px;" name="collect_start" ref="collect_start">~<input type="date"  style="margin-left:10px;" name="collect_end" ref="collect_end">
    						
    						</dd>
    				</dl>
    				</td>
    			</tr>
    			<tr>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					 <dl>
    					  <dt style="float:left;margin-left:10px; margin-right:30px;">봉사자유형</dt>
    						<dd>
    							
    						  <input type="checkbox" name="ageType" value="성인">&nbsp;성인&nbsp;
			                <input type="checkbox" name="ageType" value="청소년">&nbsp;청소년&nbsp;
			               
    						</dd>
    				   </dl>
    				</td>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					<dl>
    					  <dt style="float:left;margin-left:10px; margin-right:60px;">요일</dt>
    						<dd>
    							
			                <input type="checkbox" value="월" name="day">&nbsp;월&nbsp;
			                <input type="checkbox" value="화" name="day">&nbsp;화&nbsp;
			                <input type="checkbox" value="수" name="day">&nbsp;수&nbsp;
			                <input type="checkbox" value="목" name="day">&nbsp;목&nbsp;
			                <input type="checkbox" value="금" name="day">&nbsp;금&nbsp;
			                <input type="checkbox" value="토" name="day">&nbsp;토&nbsp;
			                <input type="checkbox" value="일" name="day">&nbsp;일&nbsp;
			              
			                
			                
    						</dd>
    				   </dl>
    				
    				</td>
    			</tr>
    			
    			
    				<tr>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					 <dl>
    					  <dt style="float:left;margin-left:10px; margin-right:15px;">프로그램이름</dt>
    						<dd>
    							
    						  <input type="text" size=30 name="title" ref="title">
			               
			               
    						</dd>
    				   </dl>
    				</td>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					<dl>
    					  <dt style="float:left;margin-left:10px; margin-right:40px;">윙 책정</dt>
    						<dd>
    							
			                <input type="number" size=15 style="width:50px;" min=1 name="getwing" ref="getwing">
			               
			              
			                
			                
    						</dd>
    				   </dl>
    				
    				</td>
    			</tr>
    			
    			<tr>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					 <dl>
    					  <dt style="float:left;margin-left:10px; margin-right:45px;">상세주소</dt>
    						<dd>
    							
    						  <input type="text" size=30 name="address" ref="address">
			               
			               
    						</dd>
    				   </dl>
    				</td>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					<dl>
    					  <dt style="float:left;margin-left:10px; margin-right:30px;">모집인원</dt>
    						<dd>
    							
			                <input type="number" style="width:50px;" min=1 name="collect_num" ref="collect_num">
			               
			              
			                
			                
    						</dd>
    				   </dl>
    				
    				</td>
    			</tr>
    			
    			
    				<tr>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					 <dl>
    					  <dt style="float:left;margin-left:10px; margin-right:45px;">봉사시간</dt>
    						<dd>
    							
    						  <input type="text" placeholder="EX) 13시30분 ~ 15시 40분" size=30 name="runtime" ref="runtime">
			               
			               
    						</dd>
    				   </dl>
    				</td>
    				<td>
    				
    				
    				</td>
    			</tr>
    			
    		</table>
    		
    		
    		</div>
    		<div style="float:right; margin-top:20px;"><span ><button class="btn btn-xlarge btn-danger" style="width:200px;">등록</button></span></div>
    		 </form>   
          </div>  
         
             </div>  
             <script src="../js/newprogram.js"></script>
</body>
</html>