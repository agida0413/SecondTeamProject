<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
  	 <div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 조회</span></div>

            		<hr>
            <div class="col-sm-10">
	<div class="container" id="programDetail">
	
		<div class="row">
			
          
            	<div class="row">
            		<!-- 헤드 -->
            		
            		
            		<!-- 목록,신청,관심목록 -->
            		<div>
            		<span><input type="button" class="btn btn-primary" value="목록" onClick="javascript:history.back()"></span>
            		  <span style="float:right;">
            		  <span><input type="button" class="btn btn-danger" value="신청하기"></span>
            		  <span><input type="button" class="btn btn-info" value="관심목록담기" style="margin-left:15px;"></span>
            		  </span> 
            		  </div>
            		  
            		  <!-- 타이틀 -->
            		  <div class="pg_detail_title">
            		  <span style="font-weight:bold; color:black;">${vo.title }</span>&nbsp;
            		  <span style="color:red;opacity:0.7;">(${vo.collect_state})</span>
            		  </div>
            		  <!-- 상세정보 -->
            		<table class="table detailTable">
            			
            			
            			<tr>
            				<td style="width:15%; background-color:#f0f0f0;" class="informObj" >봉사기간</td>
            				<td style="width:35%">${vo.dbV_start}&nbsp;~&nbsp;${vo.dbV_end}</td>
            				<td style="width:15%; background-color:#f0f0f0;" class="informObj">봉사시간</td>
            				<td style="width:35%">${vo.runtime }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">모집기간</td>
            				<td>${vo.dbCollect_start }&nbsp;~&nbsp;${vo.dbCollect_end }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">활동요일</td>
            				<td>${vo.rundate }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">모집인원</td>
            				<td>${vo.collect_num }명</td>
            				<td class="informObj" style="background-color:#f0f0f0;">신청인원</td>
            				<td>${vo.apply_num }명</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">봉사분야</td>
            				<td>${vo.major_field}&nbsp;&gt;&nbsp;${vo.minor_field }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">봉사자유형</td>
            				<td>${vo.volunteer_type }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">모집센터</td>
            				<td>${vo.centername }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">위치구분</td>
            				<td>${vo.si }&nbsp;${vo.gu }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">상세위치</td>
            				<td>${vo.address }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">봉사대상</td>
            				<td>${vo.target }</td>
            			</tr>
            			
            			<tr>
            			<td class="informObj" style="background-color:#f0f0f0;">활동구분</td>
            			<td colspan="3">${vo.active_type }</td>
            			</tr>
            		</table>
            	</div>
            	
            	<!-- 지도 -->
            	<div class="row" style="margin-top:15px;">
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
				
				<!-- 댓글 -->
				<div class="row">
				
				
				</div>
          
		
			
		
		</div>
		
		
	</div>
	
	  </div>	
	
</body>
</html>