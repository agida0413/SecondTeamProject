<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
    
<!DOCTYPE html>
<html>
<head>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="../favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap5" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;600;700&display=swap" rel="stylesheet">
	
	
	<link rel="stylesheet" href="../fonts/icomoon/style.css">
	<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="../css/tiny-slider.css">
	<link rel="stylesheet" href="../css/aos.css">
	<link rel="stylesheet" href="../css/glightbox.min.css">
	<link rel="stylesheet" href="../css/style.css">

	<link rel="stylesheet" href="css/flatpickr.min.css">
	<link rel="stylesheet" href="../css/button.css">
	<link rel="stylesheet" href="../css/Program.css">
	<link rel="stylesheet" href="../css/star.css">
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<tiles:insertAttribute name="header"/>
<div class="container" style="">

   <div class="row">
 
		<div class="section search-result-wrap">
		
			<div class="container">
			<div class=""><span style="font-weight:bold; font-size:40px;">재능기부 원데이 클래스</span></div>

            		<hr>
            		<div style="height:20px;"></div>
				<div class="row posts-entry">
				<tiles:insertAttribute name="dcContent"/>
				<tiles:insertAttribute name="dcAside"/>
				
				</div>
			</div>
		</div>
	</div>
</div>	
 

  <tiles:insertAttribute name="footer"/>
 
  <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/tiny-slider.js"></script>

    <script src="../js/flatpickr.min.js"></script>


    <script src="../js/aos.js"></script>
    <script src="../js/glightbox.min.js"></script>
    <script src="../js/navbar.js"></script>
    <script src="../js/counter.js"></script>
    <script src="../js/custom.js"></script>
    <script src="../js/programList_vue.js"></script>
      <script src="../js/programDataboard_vue.js"></script>
      
</body>
</html>