<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="10;url=${pageContext.request.contextPath}/user-bai-hat" />
<title>Insert title here</title>


	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">

</head>
<body>
	<div class="d-flex justify-content-center " style="margin-top: 5rem;">
		<div class="col-9">
			<div class="text-danger text-center mb-3" style="font-size:1.75rem">Bạn chỉ có quyền chỉnh sửa bài hát do bạn upload.</div>
			
			
			<div class="text-center mt-3 mb-3" style="font-size:1rem">Bạn sẽ được tự động chuyển hướng về trang <a href="${pageContext.request.contextPath}/user-bai-hat">bài hát</a> sau 10s.</div>
		</div>
	</div>





	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>