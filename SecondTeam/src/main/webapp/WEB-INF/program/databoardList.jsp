<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <div class="container" id="vDataboard">
     <div class=""><span style="font-weight:bold; font-size:30px; color:black;">자료실(양식다운)</span></div>
     
     
  <hr>
 
   
  
   
    <div class="row">
    <c:if test="${sessionScope.admin==1 }">
    <table>
    <tr>
    <td colspan="5" class="align-right">
     <a href="../program/databoardInsert.do" class="btn btn-small btn-danger" style="margin-left:860px;  float: right; margin-bottom:5px;">새글</a>
    </td>
    </tr>
      
       </table>
       </c:if>
      <table class="table">
        <tr class="success"  style="background-color:#cccccc;">
         <th class="text-center" width=10%>번호</th>
         <th class="text-center" width=45%>제목</th>
         <th class="text-center" width=15%>이름</th>
         <th class="text-center" width=20%>작성일</th>
         <th class="text-center" width=10%>조회수</th>
        </tr>
        <tr v-for="vo in board_list" :style="vo.v_check===1?'background-color:#f2f2f2':''">
        
         <td class="text-center" width=10%>{{vo.dno}}</td>
         <td width=45%><a :href="'../program/databoardDetail.do?dno='+vo.dno"><span :style="vo.v_check===1?'font-weight:bold;':''">{{vo.subject}}</span><span v-if="vo.v_check===1" style="color:red; margin-left:5px;">( 중요 )</span></a></td>
         <td class="text-center" width=15%>{{vo.name}}</td>
         <td class="text-center" width=20%>{{vo.dbday}}</td>
         <td class="text-center" width=10%>{{vo.hit}}</td>
         
        </tr>
       
        <tr>
          <td colspan="5" class="text-center">
            <input type=button class="btn btn-medium btn-primary" value="이전" @click="prev()">
             {{curpage}} page / {{totalpage}} pages
            <input type=button class="btn btn-medium btn-primary" value="다음" @click="next()">
          </td>
        </tr>
      </table>
    </div>	
  </div>
  <!--  제어 -->
  <script>
  
  </script>
</body>
</html>


