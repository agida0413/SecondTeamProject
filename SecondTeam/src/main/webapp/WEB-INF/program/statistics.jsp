<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.enterSectio{
margin-bottom:50px;
}
.fullSection{

padding:70px;
}


</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["bar","corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
      google.charts.setOnLoadCallback(drawChart4);
      google.charts.setOnLoadCallback(drawChart5);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['단어', '단어횟수'],
          <c:forEach var="vo" items="${siList}">
           ['<c:out value="${vo.si}"/>',    <c:out value="${vo.count}"/>],
          </c:forEach>
        ]);

        var options = {
          title: '봉사프로그램 지역별 분포\n(전체 ${sListTotal}건)',
          is3D: true,
          backgroundColor:'#f0f0f0'
        };

        var chart = new google.visualization.PieChart(document.getElementById('locAttributType'));
        chart.draw(data, options);
      }
      
      function drawChart2(){
    	  var data2 = google.visualization.arrayToDataTable([
    	         ['', '봉사완료 수', { role: 'style' }],
    	         <c:forEach var="mvo" items="${monthList}">
    	     
    	           ['<c:out value="${mvo.month}"/>',<c:out value="${mvo.count}"/>,'#b87333'],
    	         
    	          </c:forEach>
    	         
    	       
    	      
    	      ]);
   
        var options2 = {
               
                  title: '2024년 월별 봉사참여 수(전체 ${monthListTotal}건)',
                	  legend: {
                	        position: 'none'
                	    },
                	    backgroundColor:'#f0f0f0'
                      
               
              };

        
        var chart2 = new google.charts.Bar(document.getElementById('monthtype'));

          chart2.draw(data2, google.charts.Bar.convertOptions(options2));

        
      
      }
      
      
      function drawChart3(){
    	  var data3= google.visualization.arrayToDataTable([
    	         ['', '봉사참여 수', { role: 'style' }],
    	         <c:forEach var="svo" items="${siCompleteList}">
    	     
    	           ['<c:out value="${svo.si}"/>',<c:out value="${svo.count}"/>,'#b87333'],
    	         
    	          </c:forEach>
    	         
    	       
    	      
    	      ]);
   
        var options3 = {
                
                  title: '2024년 지역별 봉사참여 수(전체 ${siCompleteListTotal}건)',
                  legend: {
          	        position: 'none'
          	    },  backgroundColor:'#f0f0f0'
                
                	
                 
              
      
              };

        
        var chart3 = new google.charts.Bar(document.getElementById('loctype'));

          chart3.draw(data3, google.charts.Bar.convertOptions(options3));

        
      
      }
      
      
      function drawChart4() {
          var data4 = google.visualization.arrayToDataTable([
            ['단어', '단어횟수'],
            <c:forEach var="vo" items="${stateList}">
             ['<c:out value="${vo.state}"/>',    <c:out value="${vo.count}"/>],
            </c:forEach>
          ]);

          var options4 = {
            title: '봉사 진행상태별 분포도(전체 ${stateTotal}건)',
            pieHole: 0.4,
            backgroundColor:'#f0f0f0'

            
          };

          var chart4 = new google.visualization.PieChart(document.getElementById('statetype'));
          chart4.draw(data4, options4);
        }
      
      function drawChart5() {
          var data5 = google.visualization.arrayToDataTable([
            ['단어', '단어횟수'],
            <c:forEach var="vo" items="${ageTypeList}">
             ['<c:out value="${vo.ageType}"/>',    <c:out value="${vo.count}"/>],
            </c:forEach>
          ]);

          var options5 = {
            title: '연령별 봉사참여 분포도(전체 ${ageTypeTotal}명)',
      
            is3D: true,
            backgroundColor:'#f0f0f0'
            
          };

          var chart5 = new google.visualization.PieChart(document.getElementById('agetype'));
          chart5.draw(data5, options5);
        }
      
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="container"  id="statisticsApp">
<div class=""><span style="font-weight:bold; font-size:30px; color:black;">통계정보</span></div>
  <hr>
<div style="margin-bottom:15px;">

<span><a href="../program/statistics.do?type=A" class="btn btn-large ${type=='A'?'btn-danger':'btn-primary' }" >참여 통계</a></span>


<span><a href="../program/statistics.do?type=B" class="btn btn-large ${type=='B'?'btn-danger':'btn-primary' }" >기타 통계</a></span>

</div>


<div class="container" style="background-color: #f0f0f0;">


<div class="fullSection">
<c:if test="${type=='A' }">
<div class="text-center" style="margin-bottom:70px; font-weight:bold; color:black; font-size:40px;"><h1>참여 통계</h1></div>
</c:if>
<c:if test="${type=='B' }">
<div class="text-center" style="margin-bottom:70px; font-weight:bold; color:black; font-size:40px;"><h1>기타 통계</h1></div>
</c:if>
<c:if test="${type=='A' }">
<div class="enterSection">
<div class="row" style="margin-bottom:40px; font-weight:bold; color:black;">
 	<div id="loctype" style="width:1000px; height: 500px; font-weight:bold; color:black;"></div>
 </div>
 
 <div class="row">
	 <div class="col-7">
	     <div id="monthtype" style=" width:450px; height:500px; font-weight:bold; color:black;"></div>
	    </div>
	    <div class="col-4">
	    <div id="agetype" style=" width:350px; height:500px;  font-weight:bold; color:black;"></div>
	     
	     </div>
     </div>
     
  </div>   
  </c:if>
  
  
  <c:if test="${type=='B' }">
     <div class="row">
     	
     	 <div id="statetype" style="width: 1000px; height: 500px; font-weight:bold; color:black;"></div>
     	
     	
     	
     	<div id="locAttributType" style="width: 1000px; height: 500px; font-weight:bold; color:black;"></div>
     	
     </div>
    </c:if>  
     </div>  
     
     
     
     </div>
     </div>
  
</body>
 
</html>