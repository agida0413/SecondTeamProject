<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
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
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    
     <div id="piechart_3d" style="width: 960px; height: 500px;"></div>
</body>
</html>