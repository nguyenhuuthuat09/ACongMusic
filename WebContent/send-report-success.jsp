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
			<div class="text-success text-center mb-3" style="font-size:1.75rem">Gửi report thành công.</div>
			<div class="mb-3" style="font-size:1rem">Đội ngũ A+ Music sẽ xem xét phiếu report của bạn trong
			vòng24h. Khi có kết quả chúng tôi sẽ liên hệ với bạn qua email bạn điền trước đó. Nếu trường hợp nghiêm trọng,
			Bạn có thể liên hệ với chúng tôi theo thông tin tại trang <a href="lien-he.jsp">Liên Hệ</a></div>
			<div class="text-center" style="font-size:1rem">Cảm ơn bạn đã góp phần giúp A+ Music trở nên tốt hơn.</div>
			
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