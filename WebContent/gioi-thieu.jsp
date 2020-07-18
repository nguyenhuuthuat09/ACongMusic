<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<!-- Thẻ meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
	<meta name="description" content="A+ Music - Share your love to the world">
	<meta name="author" content="NHT">
	<title>A+ Music - Giới thiệu</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
	


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>

	<div class="gioi-thieu">
		<div class="gioi-thieu-container col-10">
			<h3>Giới thiệu</h3>
			<div class="mb-3">
				<span>
					<span>A+ Music</span> là một trang web chia sẻ nhạc hoàn toàn miễn phí. <br/>

					<span>Tại A+ Music, bạn có thể nghe, tải nhạc, theo dõi các nghệ sĩ yêu thích của bạn. Hay bạn có thể dễ dàng đem những sản phẩm âm nhạc của bản thân mình chia sẻ cho mọi người một cách cực kì dễ dàng.</span><br/>
					<span>Với giao diện thân thiện và tính năng tuyệt vời, A+ Music sẽ mang đến cho bạn những phút giây nghe nhạc tuyệt vời nhất.</span>

				</span>
			</div>
			<div class="mb-3">

				<span class="mr-2">Các bạn có thể theo dõi A+ Music tại: </span>
				<a href="#" class="mr-2" style="color: #3b5999">Facebook</a>
				<a href="#" class="mr-2" style="color: #55acee">Twitter</a>
				<a href="#" style="color: #e4405f">Instagram</a>

			</div>
			<div>
				<span>Chúc các bạn có những giây phút nghe nhạc vui vẻ trên A+ Music.</span>
			</div>
			
		</div>
		
		
	</div>

























	<!-- footter -->
	<div class="footer" style="margin-top: 17rem;">
		<div class="footer-container d-lg-flex justify-content-lg-between">
			<div class="copyright ml-lg-5 text-center">
				<span>&#169; 2018 A+ Music - share your ♥ to the world</span>
			</div>
			<div class="footer-link mr-lg-5 text-center">
				<a href="#">Trang chủ</a>
				<span>•</span>
				<a href="#">Chính sách</a>
				<span>•</span>
				<a href="#">Điều khoản dịch vụ</a>
				<span>•</span>
				<a href="#">Copyright</a>
				<span>•</span>
				<a href="#">Liên hệ</a>
			</div>

		</div>
	</div>

	<!-- back to top -->
	<div class="btt-class">
		<a id="back-to-top" href="#" class="btn back-to-top" role="button" title="Back to top" data-toggle="tooltip" data-placement="left">
			<i class="fa fa-angle-up"></i>
		</a>
	</div>







	<!-- jquery and js -->
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/popper.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/javascript-style.js"></script>
</body>
</html>