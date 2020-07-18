<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="15;url=${pageContext.request.contextPath}/home" />
<title>Insert title here</title>


	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">

</head>
<body>
	<div class="d-flex justify-content-center " style="margin-top: 5rem;">
		<div class="col-9">
			<div class="text-success text-center mb-3" style="font-size:1.75rem">Upload thành công.</div>
			<div class="mb-3" style="font-size:1rem">Để đảm bảo bài hát của bạn không vi phạm <a href="dieu-khoan-dich-vu.jsp">Điều khoản dịch vụ</a> như không chưa ngôn từ xấu,... 
			Đội ngũ A+ Music sẽ xem xét bài hát của bạn trước khi đăng tải lên. Quá trình này thường mất
			tối đa 48h.  </div>
			<div style="font-size:1rem">Khi có kết quả đội ngũ của chúng tôi sẽ thông báo cho bạn qua email mà bạn dùng để đăng kí tài khoản.</div>
			
			<div class="text-center mt-3 mb-3" style="font-size:1rem">Bạn sẽ được tự động chuyển hướng về <a href="home">trang chủ</a> sau 15s.</div>
		</div>
	</div>





	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>