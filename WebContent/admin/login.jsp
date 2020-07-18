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
	<title>A+ Music - Admin login</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">



	<style type="text/css">
	body#LoginForm{ background-image:url("${pageContext.request.contextPath}/img/admin-login.JPG"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}

	.form-heading { color:#fff; font-size:23px;}
	.panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
	.panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
	.login-form .form-control {
		background: #f7f7f7 none repeat scroll 0 0;
		border: 1px solid #d4d4d4;
		border-radius: 4px;
		font-size: 14px;
		height: 50px;
		line-height: 50px;
	}
	.main-div {
		background: #ffffff none repeat scroll 0 0;
		border-radius: 2px;
		margin: 10px auto 30px;
		max-width: 38%;
		padding: 50px 70px 70px 71px;
	}

	.login-form .form-group {
		margin-bottom:10px;
	}
	.login-form{ text-align:center;}
	.forgot a {
		color: #777777;
		font-size: 14px;
		text-decoration: underline;
	}
	.login-form  .btn.btn-primary {
		background: #f0ad4e none repeat scroll 0 0;
		border-color: #f0ad4e;
		color: #ffffff;
		font-size: 14px;
		width: 100%;
		height: 50px;
		line-height: 50px;
		padding: 0;
	}
	.forgot {
		text-align: left; margin-bottom:30px;
	}
	.botto-text {
		color: #ffffff;
		font-size: 14px;
		margin: auto;
	}
	.login-form .btn.btn-primary.reset {
		background: #ff9900 none repeat scroll 0 0;
	}
	.back { text-align: left; margin-top:10px;}
	.back a {color: #444444; font-size: 13px;text-decoration: none;}


</style>

</head>
<body id="LoginForm">
	<div class="container mt-5">
		<div class="login-form">
			<div class="main-div">
				<div class="panel">
					<h2>Admin Login</h2>
					<p>Please enter your email and password</p>
				</div>
				
				<div class="alert-danger mt-2 mb-2">
					${ sessionScope.message }				
				</div>
				

				<form action="${pageContext.request.contextPath}/admin-login" method="post" 
					id="Login" class="needs-validation" novalidate>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom01">Tên đăng nhập</label> <input
								type="text" name="adminNameOrEmail" class="form-control"
								id="validationCustom01" placeholder="Tên đăng nhập hoặc email" 
								id="inputEmail" required>
							<div class="invalid-feedback">Tên đăng nhập không được để
								trống.</div>
						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom02">Mật khẩu</label>
							<div class="input-group" id="show_hide_password">
								<input type="password" name="password" class="form-control"
									id="validationCustom02" placeholder="Mật khẩu" 
									id="inputPassword" required>
								<div class="input-group-addon">
									<a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
								</div>
								<div class="invalid-feedback">Mật khẩu không được để
									trống.</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="forget-password d-none">
							<a href="reset.jsp">Quên mật khẩu?</a>
						</div>
					</div>
					<button class="btn btn-primary float-right" type="submit">Đăng nhập</button>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	<script type="text/javascript">
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
		})();
	
	</script>




	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>