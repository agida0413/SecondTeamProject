<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["bar","corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['단어', '단어횟수'],
          <c:forEach var="vo" items="${siList}">
           ['<c:out value="${vo.si}"/>',    <c:out value="${vo.count}"/>],
          </c:forEach>
        ]);

        var options = {
          title: '봉사프로그램 지역별 분포',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
      
      function drawChart2(){
    	  var data2 = google.visualization.arrayToDataTable([
    	         ['월 정보', '봉사완료 수', { role: 'style' }],
    	         <c:forEach var="mvo" items="${monthList}">
    	     
    	           ['<c:out value="${mvo.month}"/>',<c:out value="${mvo.count}"/>,'#b87333'],
    	         
    	          </c:forEach>
    	         
    	       
    	      
    	      ]);
   
        var options2 = {
               
                  title: '월별 봉사완료 수',
                	  legend: {
                	        position: 'none'
                	    }
                      
               
              };

        
        var chart2 = new google.charts.Bar(document.getElementById('columnchart_material'));

          chart2.draw(data2, google.charts.Bar.convertOptions(options2));

        
      
      }
      
      
      function drawChart3(){
    	  var data3= google.visualization.arrayToDataTable([
    	         ['지역 정보', '봉사완료 수', { role: 'style' }],
    	         <c:forEach var="svo" items="${siCompleteList}">
    	     
    	           ['<c:out value="${svo.si}"/>',<c:out value="${svo.count}"/>,'#b87333'],
    	         
    	          </c:forEach>
    	         
    	       
    	      
    	      ]);
   
        var options3 = {
                
                  title: '지역별 봉사완료 수',
                  legend: {
          	        position: 'none'
          	    }
                
                	
                 
              
      
              };

        
        var chart3 = new google.charts.Bar(document.getElementById('columnchart_material_2'));

          chart3.draw(data3, google.charts.Bar.convertOptions(options3));

        
      
      }
      
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">

<div class="row">
 	<div id="columnchart_material_2" style="width:1000px; height: 500px;"></div>
 </div>
 
 <div class="row">
	 <div class="col-8">
	     <div id="columnchart_material" style="width: 500px; height: 500px;"></div>
	    </div>
	    <div class="col-4">
	     <div id="piechart_3d" style="width: 500px; height: 500px;"></div>
	     </div>
     </div>
     
     
     </div>
</body>
</html>