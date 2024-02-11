<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <div class="container" id="databoardInsert">
    <div class=""><span style="font-weight:bold; font-size:30px; color:black;">자료실(양식다운)</span></div>
  <hr>
    <div class="row">
     <%--
           form => 기본 기능 (서버로 데이터 전송)
                => 화면 reset
                => 기능을 동작하지 못하게 만든다 @submit.prevent
      --%>
     <form @submit.prevent="submitForm">
      <table class="table">
       <tr>
        <th width=15% class="text-center">이름</th>
        <td width=85%>
         <input type=text size=15 class="input-sm" v-model="name" ref="name">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">제목</th>
        <td width=85%>
         <input type=text size=40 class="input-sm" v-model="subject" ref="subject">
         <span style="margin-left:30px;"><input type="checkbox" v-model="Jcheck">&nbsp;&nbsp;중요글</span>
        </td>

        
       </tr>
       <tr>
        <th width=15% class="text-center">내용</th>
        <td width=85%>
         <textarea rows="10" cols="52" v-model="content" ref="content"></textarea>
        </td>
       </tr>
       <tr>
         <th width=15% class="text-center">첨부파일</th>
         <td width=85%>
           <input type=file ref="upfiles" class="input-sm" multiple="multiple" accept="image/*" 
            v-model="upfiles">
         </td>
       </tr>
     
       <tr>
         <td colspan="2" class="text-center">
           <input type="submit" value="글쓰기" class="btn-success btn-sm">
           <input type="button" value="취소" onclick="javascript:history.back()"
            class="btn-info btn-sm"
           >
         </td>
       </tr>
      </table>
     </form>
    </div>
  </div>
  
</body>
</html>