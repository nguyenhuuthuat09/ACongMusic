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
	<title>A+ Music - Đăng nhập</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">



	<style type="text/css">
		#show_hide_password .input-group-addon {
			border: 1px solid #ced4da;
		}

		#show_hide_password .input-group-addon a {
			color: #909090;
		}

		#show_hide_password .input-group-addon a i {
			margin-right: 9px;
			margin-left: 9px;
			margin-top: 9px;
		}
		
		.form-control:focus {
			box-shadow: none !important;
			border: 1px solid #ced4da;
		}

		.was-validated .form-check-input:valid ~ .form-check-label {
			color: #212529;
		}

		.nav-tabs .nav-link.active {
			border-bottom: none;
		}

		.nav-tabs .nav-link.active {
			background-color:#fbfbfb;
		}

		body {
			background-color:#fbfbfb;
		}

		label {
			color: #363b3f;
		}

		a {
			color: #495057;
		}

		.forget-password a {
			text-decoration: none;
		}

		.login-form {
			margin-bottom: 7rem;
		}

		.was-validated .form-control:valid {
			border-color: #ced4da;
		}

	</style>

</head>
<body>

	<div class="login-form row justify-content-center mt-5">
		<div class="login-form-container col-lg-5 col-md-6 col-sm-7 col-11">
			<ul class="nav nav-tabs d-flex justify-content-around mb-3" id="loginTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">
						Đăng Nhập
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="true">
						Đăng kí
					</a>
				</li>
			</ul>
			<div class="tab-content" id="loginTabContent">
				<div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
					<div class="alert-success mb-2">
						${requestScope.message}		
					</div>
					<div class="alert-danger mb-2">
						${sessionScope.message}
					</div>
					<div class="alert-danger mb-2">
						${sessionErrorScope.error}
					</div>
					<form action="${pageContext.request.contextPath}/dang-nhap" method="post" class="needs-validation" novalidate>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom01">Tên đăng nhập</label>
								<input type="text" name="usernameOrEmail" class="form-control" id="validationCustom01" placeholder="Tên đăng nhập hoặc email" required>
								<div class="invalid-feedback">
									Tên đăng nhập không được để trống.
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom02">Mật khẩu</label>
								<div class="input-group" id="show_hide_password">
									<input type="password" name="password" class="form-control" id="validationCustom02" placeholder="Mật khẩu" required>
									<div class="input-group-addon">
										<a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
									</div>
									<div class="invalid-feedback">
										Mật khẩu không được để trống.
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="forget-password d-none">
								<a href="forget-password.html">Quên mật khẩu?</a>
							</div>
						</div>
						<button class="btn btn-primary float-right" type="submit">Đăng nhập</button>
					</form>

				</div>

				<div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">

					<form class="needs-validation" novalidate action="${pageContext.request.contextPath}/dang-ky" method="post">
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom02">Tên đăng nhập</label>
								<input type="text" name="username" class="form-control" id="validationCustom02" placeholder="Tên đăng nhập hoặc email" required>
								<small id="passwordHelpBlock" class="form-text text-muted">
									Tên đăng nhập phải:<br/>
									+ có độ dài từ 3 đến 20 kí tự<br/>           
									+ chỉ được chứa các kí tự từ a-z, 0-9 và kí tự gạch ngang, gạch dưới.
								</small>
								<div class="invalid-feedback">
									Tên đăng nhập không được để trống.
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom01">Email</label>
								<input type="email" name="email" class="form-control" id="validationCustom01" placeholder="Email" required>
								<div class="invalid-feedback">
									Email đăng kí không được để trống.
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom03">Mật khẩu</label>
								<input type="password" name="password" class="form-control" id="validationCustom03" placeholder="Mật khẩu" required>
								<small id="passwordHelpBlock" class="form-text text-muted">
									Mật khẩu cần dài từ:<br/> 
									+ 6 đến 20 kí tự<br/> 
									+ chỉ được chứa các kí tự từ a-z, 0-9 và kí tự gạch ngang, gạch dưới.
								</small>
								<div class="invalid-feedback">
									Mật khẩu không được để trống.
								</div>
								
							</div>
						</div>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom04">Xác nhận mật khẩu</label>
								<input type="password" name="reEnterPassword" class="form-control" id="validationCustom04" placeholder="Mật khẩu" required>
								<small id="passwordHelpBlock" class="form-text text-muted">
									Vui lòng gõ lại mật khẩu phía trên.
								</small>
								<div class="invalid-feedback">
									Vui lòng gõ lại mật khẩu.
								</div>
								
							</div>
						</div>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom05">Ngày sinh</label>
								<input type="text" name="dateOfBirth" class="form-control" id="validationCustom05" placeholder="12" required>
								<div class="invalid-feedback">
									Vui lòng điền ngày sinh.
								</div>
								
							</div>

							<div class="col mb-3">
								<label for="validationCustom05">Tháng</label>
								<input type="text" name="monthOfBirth" class="form-control" id="validationCustom05" placeholder="10" required>
								<div class="invalid-feedback">
									Vui lòng điền tháng sinh.
								</div>
								
							</div>

							<div class="col mb-3">
								<label for="validationCustom05">Năm</label>
								<input type="text" name="yearOfBirth" class="form-control" id="validationCustom05" placeholder="1995" required>
								<div class="invalid-feedback">
									Vui lòng điền năm sinh.
								</div>
								
							</div>
						</div>

						<div class="form-group">
							<label class="mr-3" for="exampleFormControlSelect1">Giới tính:</label>
							<input checked="true" type="radio" name="sex" value="1"><label class="ml-1 mr-2">Nam</label>
                            <input type="radio" name="sex" value="0"><label class="ml-1 mr-2">Nữ</label>
                            <input type="radio" name="sex" value="2"><label class="ml-1 mr-2">Khác</label>
						</div>
						<div class="form-group">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
								<label class="form-check-label" for="invalidCheck">
									Tôi đã đọc và đồng ý với <a href="#" style="color: #007bff; text-decoration: none">Điều khoản dịch vụ</a>.
								</label>
								<div class="invalid-feedback">
									Vui lòng tích chọn đồng ý với Điều khoản dịch vụ.
								</div>
							</div>
						</div>
						<button class="btn btn-primary float-right" type="submit">Đăng kí</button>
					</form>
				</div>
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