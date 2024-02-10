<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">
.title {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.page-link {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
	<div class="blog-entry">
	<div style="display: flex;">
	<i class="xi-profile"></i>
	<div>
	<span class="date">아이디명</span><br>
	<span class="date">Apr. 14th, 2022</span>
	</div>
	</div>
		<a href="single.html" class="img-link"> <img
			src="../images/img_2_sq.jpg" alt="Image" class="img-fluid">
		</a> 
		<h2>
			<a href="single.html">Startup vs corporate: What job suits you
				best?</a>
		</h2>
		<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde,
			nobis ea quis inventore vel voluptas.</p>
		<p>
			<a href="single.html" class="btn btn-sm btn-outline-primary">Read
				More</a>
		</p>
	</div>
  </div>
</body>
</html>