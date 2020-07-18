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
	<title>A+ Music - Quên mật khẩu?</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../font-awesome/css/font-awesome.min.css">

	<style>
		.form-control:focus {
			box-shadow: none;
		}
	</style>



</head>
<body>

	<div class="container" style="margin-top: 4rem">
		<div class="row justify-content-center">
			<div class="col-lg-5 col-md-6 col-sm-9 col-11 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3><i class="fa fa-lock fa-4x"></i></h3>
							<h2 class="text-center">Quên mật khẩu?</h2>
							<p>Vui lòng điền email tài khoản để cấp lại mật khẩu.</p>
							<div class="panel-body">

								<form id="register-form" role="form" autocomplete="off" class="form needs-validation" novalidate method="post">

									<div class="form-row">
										<div class="col mb-3">
											<div class="input-group">
												<div class="input-group-addon" style="border: 1px solid #ced4da; border-right: none">
													<i style="margin: 9px;" class="fa fa-envelope" aria-hidden="true"></i>
												</div>
												
												<input id="email" name="email" placeholder="email address" class="form-control"  type="email" required>



												<div class="invalid-feedback">
													Vui lòng nhập email đăng kí tài khoản.
												</div>
											</div>
										</div>
									</div>

									<button class="btn btn-primary text-center" type="submit">Reset password</button>
								</form>

							</div>
						</div>
					</div>
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
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/popper.min.js"></script>
	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/login.js"></script>
</body>
</html>