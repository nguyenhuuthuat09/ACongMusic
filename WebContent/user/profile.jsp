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
	<title>A+ Music - Profile</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">

	<style>
		.profile-menu a:hover {
			font-weight: bold;
		}
	</style>


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>

	<%@page import="model.userProfile" %>
	<% userProfile profile = (userProfile) session.getAttribute("user"); %>

	<!-- body -->
	<div class="profile d-flex justify-content-center" style="background-color: #fcfcfc">
		<div class="profile-container d-flex col-lg-8">
			<div class="profile-menu mr-5" style="border: 1px solid #d1d5da; height: 7.5rem; width: 11.5rem; padding: 0.5rem 1rem">
				<div class="profile-menu-thong-tin-tai-khoan mb-3">
					<a href="profile.jsp" style="color: #353535; text-decoration: none; font-weight: 600; ">Thông tin tài khoản</a>
				</div>
				<div class="profile-menu-quan-ly-tai-khoan mb-3">
					<a href="account.jsp" style="color: #353535; text-decoration: none">Quản lý tài khoản</a>
				</div>
				<div class="profile-menu-bai-hat">
					<a href="${pageContext.request.contextPath}/user-bai-hat" style="color: #353535; text-decoration: none">Bài hát</a>
				</div>
			</div>
			<div class="profile-thong-tin-tai-khoan">
				<div class="profile-avatar mb-3">
					<div class="profile-avatar-img">
						<span class="d-block">Avatar</span>

						<img src="${pageContext.request.contextPath}/img/avatar/${sessionScope.user.user_img_path}" width="150rem" height="150rem" alt="">
					</div>
					<div class="alert-danger mb-1 mt-2">
						${requestScope.error}
					</div>
					<div class="profile-change-avatar mt-2">
						<form action="${pageContext.request.contextPath}/uploadUserAvatar" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
							<div class="form-group">
								<small class="form-text text-muted">
									Chọn avatar
								</small>
								<input type="file" name="avatarImage" accept="image/x-png,image/jpeg" class="form-control-file d-inline-block" id="exampleFormControlFile1" required>
								<small id="" class="form-text text-muted">
									<span class="text-danger">Lưu ý:</span><br/>
									- Ảnh nên có kích thước 500x500 px.<br/>
									- Chỉ chấp nhận ảnh có định dang .png và .jpg.
								</small>
								<div class="invalid-feedback">
									Vui lòng chọn ảnh.
								</div>
							</div>
							<button class="btn btn-sm btn-primary" type="submit">Đổi avatar</button>
						</form>
					</div>
				</div>
				
				<div class="alert-danger mb-3">
					${sessionScope.errorUpdateProfile}
				</div>
				<div class="alert-success mb-3">
					${requestScope.message}
				</div>
				<div class="alert-danger mb-1 mt-2">
					${requestScope.errorUpdateProfile}
				</div>
				
				<form action="${pageContext.request.contextPath}/updateUserProfile" method="post" class="needs-validation" novalidate>
					
					
					<fieldset disabled>
						<div class="form-group mb-3">
							<label for="disabledTextInput">Tên đăng nhập:</label>
							<input type="text" id="disabledTextInput" 
							name ="username"
							value="${sessionScope.user.username}" class="form-control" placeholder="Username">
						</div>
					</fieldset>
					
					<div class="form-row mb-3">
						<div class="col-5">
							<label for="validationCustom01">Email</label>
							<input type="email" name="email" class="form-control" id="validationCustom01" placeholder="Email" 
												value="${sessionScope.user.email}" required>
							<div class="invalid-feedback">
								Email không được để trống.
							</div>
						</div>
					</div>

					<div class="form-row mb-3">
						<div class="col-2">
							<label for="validationCustom02">Ngày sinh</label> 
							<input type="text" name="dateOfBirth" class="form-control" id="validationCustom02"
								placeholder="12" value="${sessionScope.user.dateOfBirth}"
								required>
							<div class="invalid-feedback">Vui lòng điền ngày sinh.</div>

						</div>

						<div class="col-2">
							<label for="validationCustom03">Tháng</label> 
							<input type="text" name="monthOfBirth"
								class="form-control" id="validationCustom03" placeholder="10"
								value="${sessionScope.user.monthOfBirth}" required>
							<div class="invalid-feedback">Vui lòng điền tháng sinh.</div>

						</div>

						<div class="col-2">
							<label for="validationCustom04">Năm</label> 
							<input type="text" name="yearOfBirth"
								class="form-control" id="validationCustom04" placeholder="1995"
								value="${sessionScope.user.yearOfBirth}" required>
							<div class="invalid-feedback">Vui lòng điền năm sinh.</div>

						</div>
					</div>

					<div class="form-group mb-3">
						<label class="mr-3" for="exampleFormControlSelect1">Giới
							tính:</label>
						

						<!-- gioi tinh nu -->
						<%
							if (Integer.valueOf(profile.getSex()) == 0) {
						%>
						<input type="radio" name="sex" value="1"><label
							class="ml-1 mr-2">Nam</label> 
						<input checked="true" type="radio"
							name="sex" value="0"><label class="ml-1 mr-2">Nữ</label>
						<input type="radio" name="sex" value="2"><label
							class="ml-1 mr-2">Khác</label>
						<%
							}
						%>

						<!-- gioi tinh nam -->
						<%
							if (Integer.valueOf(profile.getSex()) == 1) {
						%>
						<input checked="true" type="radio" name="sex" value="1"><label
							class="ml-1 mr-2">Nam</label> <input type="radio" name="sex"
							value="0"><label class="ml-1 mr-2">Nữ</label> <input
							type="radio" name="sex" value="2"><label
							class="ml-1 mr-2">Khác</label>
						<%
							}
						%>

						<!-- gioi tinh khac -->
						<%
							if (Integer.valueOf(profile.getSex()) == 2) {
						%>
						<input checked="true" type="radio" name="sex" value="1"><label
							class="ml-1 mr-2">Nam</label> <input type="radio" name="sex"
							value="0"><label class="ml-1 mr-2">Nữ</label> <input
							checked="true" type="radio" name="sex" value="2"><label
							class="ml-1 mr-2">Khác</label>
						<%
							}
						%>

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