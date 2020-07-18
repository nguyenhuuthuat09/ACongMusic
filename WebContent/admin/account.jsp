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
	<title>A+ Music - Admin account</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">

	<style>
		.adm-profile-menu a:hover {
			font-weight: bold;
		}
	</style>


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->
	<div class="adm-profile d-flex justify-content-center" style="background-color: #fcfcfc">
		<div class="adm-profile-container d-flex col-lg-8">
			<div class="adm-profile-menu mr-5" style="border: 1px solid #d1d5da; height: 16rem; width: 11.5rem; padding: 0.5rem 1rem">
				<div class="adm-profile-menu-thong-tin-tai-khoan mb-3">
					<a href="profile.jsp" style="color: #353535; text-decoration: none; ">Thông tin tài khoản</a>
				</div>
				<div class="adm-profile-menu-quan-ly-tai-khoan mb-3">
					<a href="account.jsp" style="color: #353535; text-decoration: none; font-weight: 600; ">Quản lý tài khoản</a>
				</div>

				<span style="font-weight: bold; color: #007bff">Quản trị</span>

				<div class="adm-profile-menu-phe-duyet-bai-hat mt-2">
					<a href="${pageContext.request.contextPath}/admin/phe-duyet-bai-hat" style="color: #353535; text-decoration: none; ">Phê duyệt bài hát</a>
				</div>
				<div class="adm-profile-menu-thong-bao-report mt-3">
					<a href="${pageContext.request.contextPath}/admin/thong-bao-report" style="color: #353535; text-decoration: none">Thông báo report</a>
				</div>
				<div class="adm-profile-menu-quan-ly-thanh-vien mt-3">
					<a href="tim-kiem-thanh-vien.jsp" style="color: #353535; text-decoration: none">Tìm kiếm thành viên</a>
				</div>
				<div class="adm-profile-menu-quan-ly-bai-hat mt-3">
					<a href="tim-kiem-bai-hat.jsp" style="color: #353535; text-decoration: none">Tìm kiếm bài hát</a>
				</div>
			</div>
			<div class="profile-quan-ly-tai-khoan">
				<div class="alert-danger mb-3">
					${sessionScope.error}
				</div>
				<div class="alert-danger mb-3">
					${requestScope.error}
				</div>
				<div class="alert-success mb-3">
					${requestScope.message}
				</div>
				<form action="${pageContext.request.contextPath}/updateAdminPassword" method="post" class="profile-quan-ly-tai-khoan-doi-mat-khau needs-validation" novalidate>
					<span style="font-size: 1.5rem; border-bottom: 1px solid #e1e4e8">Đổi mật khẩu</span>
					<div class="form-row mt-3">
						<div class="col mb-3">
							<label for="validationCustom01">Mật khẩu cũ</label>
							<input type="password" name="oldPassword" class="form-control" id="validationCustom01" placeholder="Mật khẩu cũ" required>
							<div class="invalid-feedback">
								Mật khẩu cũ không được để trống.
							</div>

						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom02">Mật khẩu mới</label>
							<input type="password" name="newPassword" class="form-control" id="validationCustom02" placeholder="Mật khẩu mới" required>
							<div class="invalid-feedback">
								Mật khẩu mới không được để trống.
							</div>

						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom03">Xác nhận mật khẩu</label>
							<input type="password" name="reEnterNewPassword" class="form-control" id="validationCustom03" placeholder="Xác nhận mật khẩu" required>
							<small id="passwordHelpBlock" class="form-text text-muted">
								Vui lòng gõ lại mật khẩu phía trên.
							</small>
							<div class="invalid-feedback">
								Vui lòng gõ lại mật khẩu.
							</div>
						</div>
					</div>
					<button class="btn btn-primary" type="submit">Cập nhật thông tin</button>
				</form>
				
				
				
				
				

			</div>
		</div>
	</div>












	<!-- footter -->
	<div style="margin-top: 8.5rem;"></div>
	<%@include file="/WEB-INF/footer.jsp" %>
	

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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>