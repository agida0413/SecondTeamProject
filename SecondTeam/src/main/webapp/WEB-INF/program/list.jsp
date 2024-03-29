<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Latest compiled and minified CSS -->


<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style type="text/css">




/* 셀렉트 박스 스타일 */

  
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 조회</span></div>
  <hr>
  <div class="container" id="optionSelect">
  		<form @submit.prevent="findClick">
        <div class="row">
            <!-- 왼쪽에 programAside.jsp 포함 -->
           
            
            <!-- 나머지 영역 -->
          
            <div class="row selectOpt">
                <table class="table optionTable">
                    <thead>
                        <th colspan="2" class="text-center">봉사지역</th>
                        <th colspan="2" class="text-center">봉사분야</th>
                        <th class="text-center">활동구분</th>
                        <th class="text-center">봉사대상</th>
                        <th class="text-center">모집상태</th>
                        
                    </thead>
					
                    <tbody>
                    <tr>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.state" @change="stateChange()">
                    					<option value="" selected>전체</option>
                    		   <c:forEach var="svo" items="${sList}">
                    		   			
                      					<option value="${svo.state }" ${ovo.state eq svo.state ? 'selected' : ''}>${svo.state }</option>
                    		   </c:forEach>
                    			
                    		</select>
                    	</div>
                    </td>
                    
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.city">
                    						<option value="" ${ovo.major_option eq '' ? 'selected' : ''}>전체</option>
                    			
                      					<option :value="vo.city" v-for="vo in cityList">{{vo.city}}</option>
                    		  
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.major_option" @change="major_fieldChange()">
                    				<option value="" ${ovo.major_option eq '' ? 'selected' : ''}>전체</option>
                    			<c:forEach var="mjvo" items="${mjList}">
                      					<option value="${mjvo.major_option }" ${ovo.major_option eq mjvo.major_option ? 'selected' : ''}>${mjvo.major_option }</option>
                    		   </c:forEach>
                    			
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.minor_option">
                    					<option value="" ${ovo.minor_option eq '' ? 'selected' : ''}>전체</option>
                    					<option :value="vo.minor_option" v-for="vo in minor_fieldList">{{vo.minor_option}}</option>
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.active_type">
                    			<option value="">전체</option>
                    			<option value="온라인">온라인</option>
                    			<option value="오프라인">오프라인</option>
                    		</select>
                    	</div>
                    </td>
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.target_type">
                    			<option value="">전체</option>
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
                    
                    <td>
                    	<div>
                    		<select size="4" class="programSelectBar" v-model="Option.collect_state">
                    			<option value="">전체</option>
                    			<option value="모집중">모집중</option>
                    			<option value="모집완료">모집완료</option>
                    		</select>
                    	</div>
                    </td>
                    
                    </tr>
                    	
                    </tbody>
                    
                  
                </table>
               </div>
                
               <div class="row findOpt" style="margin-left:5px;">
    		<table class="table findTable">
    			<tr>
    				<td style="width:50%;" >
    				<img src="../Projectimages/calender.png" style="width:20px; float:left;">
    				<dl>
    					<dt style="float:left;margin-left:10px; margin-right:40px;">봉사기간</dt>
    						<dd>
    						
    						<input type="date" v-model="Option.v_start" style="margin-right:10px;">~<input type="date" v-model="Option.v_end" style="margin-left:10px;">
    						
    						</dd>
    				</dl>
    				</td>
    				
    				
    				<td style="width:50%">
    					<img src="../Projectimages/calender.png" style="width:20px; float:left;">
    					<dl>
    					<dt style="float:left;margin-left:10px; margin-right:30px;">모집기간</dt>
    						<dd>
    						
    						<input type="date" v-model="Option.collect_start" style="margin-right:10px;">~<input type="date" v-model="Option.collect_end" style="margin-left:10px;">
    						
    						</dd>
    				</dl>
    				</td>
    			</tr>
    			<tr>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					 <dl>
    					  <dt style="float:left;margin-left:10px; margin-right:30px;">봉사자유형</dt>
    						<dd>
    							
    						  <input type="checkbox" v-model="volunteerCondition.A" checked>&nbsp;성인&nbsp;
			                <input type="checkbox" v-model="volunteerCondition.C" >&nbsp;청소년&nbsp;
			               
    						</dd>
    				   </dl>
    				</td>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    					<dl>
    					  <dt style="float:left;margin-left:10px; margin-right:60px;">요일</dt>
    						<dd>
    							
			                <input type="checkbox" v-model="weekCondition.weekday">&nbsp;평일&nbsp;
			                <input type="checkbox" v-model="weekCondition.weekend">&nbsp;주말&nbsp;
			                
    						</dd>
    				   </dl>
    				
    				</td>
    			</tr>
    			<tr>
    				<td><img src="../Projectimages/searchIcon.png" style="width:20px; float:left;">
    					<dl>
    						 <dt style="float:left;margin-left:10px; margin-right:55px;">검색어</dt>
    						 
    						 <dd><input type="text" v-model="Option.ss" size=30></dd>
    					</dl>
    				</td>
    				<td><img src="../Projectimages/check.png" style="width:20px; float:left;">
    				<dl>
    					  <dt style="float:left;margin-left:10px; margin-right:20px;">키워드조건</dt>
    						<dd>
    							
    						  <input type="checkbox" v-model="ssCondition.N" checked>&nbsp;이름&nbsp;
			                <input type="checkbox" v-model="ssCondition.C" checked>&nbsp;봉사수요처&nbsp;
			                <input type="checkbox" v-model="ssCondition.L" checked>&nbsp;주소&nbsp;
			                <input type="checkbox" v-model="ssCondition.F" checked>&nbsp;봉사분야&nbsp;
    						</dd>
    				   </dl>
    				
    				</td>
    			</tr>
    			<tr class="text-center">
    			<td colspan=2>
    			<span style="margin-right:15px;"><input type="submit" class="btn btn-danger btn-lg" value="검색" style="width: 200px;"></span>
    				<span><input type="button" class="btn btn-primary btn-lg" value="초기화" style="width: 200px;" @click="optionReset()"></span>
    			</td>
    			</tr>
    		</table>
    		<div style="margin-bottom:20px;">
    	
    		<span style="font-weight:bold;">맞춤형 추천 검색어</span>
    			
    		<hr>
    		<c:if test="${sessionScope.id==null }">
    		<div><h6>로그인후 이용 가능합니다.</h6>
    		</div> 
    		</c:if>
    		<c:if test="${sessionScope.id!=null }">
    		<div v-if="recommandWordList.length===0"><h6>아직 추천데이터가 부족합니다.</h6></div>
    		</c:if>
    			<ul class="tags">
							<li v-for="revo in recommandWordList" :style="Option.ss===revo?'color:#fff; font-weight:bold;':''"><a :style="Option.ss===revo?'background-color: #214252;cursor:pointer;':'cursor:pointer;' "   @click="recList(revo)" >{{revo}}</a></li>
						
							
						</ul>
						</div>
    		</div>
    		
    	
					
						
					
    	
    	<!-- 검색결과갯수정보 -->	
    	<div class="row findNum" style="margin-left:5px;">	
				<!-- 검색 결과 숫자 카운트 -->
				<div class="" v-if="size!=0">
					<p>[전체 <em>{{size}}</em>건, 현재페이지 <em>{{curpage}}</em>/{{totalpage}}]</p>
				</div>
				<!-- 검색결과 없을시 -->
				<div class="" v-if="size==0">
					<p>[전체 <em>{{size}}</em>건]</p>
				</div>
				<!--// 검색 결과 숫자 카운트 -->
  		</div>
  	
  		<!-- 검색결과갯수정보 끝  -->	
  		
  		
  		<!-- 검색리스트 -->
  		<div class="row nextline" v-for="vo in programList" >
  			<a :href="'../program/detail.do?vno='+vo.vno" style="color:black">
  			<div class="row findList">
  				
	  			<div class="col-10">
	  				<div class="" style="margin-top:15px; margin-bottom:10px;">
	  				
	  				<div style="margin-bottom:10px;"><span><span style="font-weight:bold; color:blue;">획득가능한 보상&nbsp;</span><span style="font-weight:bold;">[&nbsp;{{vo.getwing}}&nbsp;<img src="../Projectimages/wing3.png" width="20px;">]</span></span></div>
						<!-- 봉사 분야 -->	
						<span class="">
						{{vo.active_type}} &nbsp;&nbsp;|&nbsp;&nbsp;<span style="font-weight:bold;">{{vo.major_field}}</span>&nbsp;&gt;&nbsp;{{vo.minor_field}}
						</span>
					</div>
					<!-- 봉사프로그램정보 -->
					<div class="">
						<div class="programName">
							<span style="font-size:20px; font-weight:bold;">{{vo.title}}</span>
						</div>
						
						<div style="margin-top:7px;">
						<span class="programSubinformAll"><span style="font-weight:bold;">[봉사기간]</span><span class="programSubinform">{{vo.dbV_start}}~{{vo.dbV_end}}</span></span>
						 <span class="programSubinformAll"><span style="font-weight:bold;">[모집기간]</span><span class="programSubinform">{{vo.dbCollect_start}} ~ {{vo.dbCollect_end}}</span></span> 
						  <span class="programSubinformAll"><span style="font-weight:bold;">[봉사시간]</span><span class="programSubinform">{{vo.runtime}}</span></span>
						</div>
						
						<div style="margin-top:7px;">
						<span class="programSubinformAll"><span style="font-weight:bold;">[지역]</span><span class="programSubinform">{{vo.si}}&nbsp;{{vo.gu}} </span></span> 
						<span class="programSubinformAll"><span style="font-weight:bold;">[모집기관]</span><span class="programSubinform">{{vo.centername}}</span></span>
						</div>
					</div>
				</div>
				
				<div class="col-2">
					<!-- 모집상태 -->
					<div style="margin:30px;">
						<div class="closeBox" :style="{ 
            height: '100px', 
            width: '100px', 
            border: '1px black solid', 
            borderRadius: '5px', 
            backgroundColor: vo.collect_state === '모집완료' ? '#FF6347' : '#ADD8E6' 
         }">
						<div style="margin-top:35px; font-weight:bold; color:white;" class="text-center" >{{vo.collect_state}}</div>
						</div>
							
					</div>
					
				</div>				
				
  		   </div>
  		</a>
  		</div>
  		<!-- 검색리스트 끝-->
  		
  		<!-- 검색결과없음 -->
  		<div class="row" v-if="size==0" style="margin-top:20px;">
  		<span style="font-size:25px; opacity:0.8;">검색 결과가 없습니다.</span>
  		</div>
  		
  		<div style="height:30px;"></div>
  		
  		<!-- 페이징 -->
  			<div class="row text-center">
  			 <ul class="pagination" v-if="totalpage!=0">
  			 		 <li @click="firstpage" class="page-item"><a v-if="curpage>1" class="link page-link">&lt;&lt;</a></li>
				  <li @click="prev()" class="page-item"><a v-if="start>1" class="link page-link">&lt;</a></li>
				  <li v-for="i in range(start,end)" @click="move(i)"  class="page-item" 
				  :class="{ 'active': curpage === i }" 
   				 :aria-current="curpage === i ? 'page' : null">
				  <a class="link page-link">{{i}}</a>
				  </li>
				 
				  <li @click="next()" class="page-item"><a v-if="end<totalpage" class="link page-link">&gt;</a></li>
				   <li @click="lastpage" class="page-item"><a v-if="curpage!==totalpage" class="link page-link">&gt;&gt;</a></li>
				   
				   
				</ul> 
  			</div>
  	
  
  		
            
        </div>
          
          </form>
          
          
    </div>
 
 
  
  
    
 
</body>
</html>