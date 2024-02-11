<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
  				<div class="programName" style="margin-bottom:15px;">
							<span style="font-size:25px; font-weight:bold;  color:black;">${vo.pvo.title }</span>
						</div>
	  			<table class="table">
	  				<tr  style="background-color:#f0f0f0">
	  					<th width="30%">센터이름</th>
	  					<th width="30%">봉사기간</th>
	  					
	  					<th width="20%">신청일시</th>
	  					<th width="20%"></th>
	  				</tr>
	  				
	  				<tr style="height:70px; vertical-align:middle;">
	  				<td >${vo.pvo.centername }</td>
	  					<td>${vo.pvo.dbV_start }&nbsp;~&nbsp;${vo.pvo.dbV_end }</td>
	  					
	  					<td>${vo.getVDbStateTime()}</td>
	  					<td style="font-weight:bold; font-size:20px; color:blue;"><a href="../myAndAdpage/certifyPage.do?vno=${vo.pvo.vno }" class="btn btn-large btn-success">인증하러가기</a></td>
	  				</tr>
	  			</table>
				
				
			
				
  		   </div>
</body>
</html>