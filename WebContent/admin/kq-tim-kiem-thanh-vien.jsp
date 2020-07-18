<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<!-- Thẻ meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
	<meta name="description" content="A+ Music - Share your love to the world">
	<meta name="author" content="NHT">
	<title>A+ Music - Kết quả tìm kiếm thành viên</title>

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
	<div class="adm-profile d-flex justify-content-center">
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
			<div class="adm-profile-thanh-vien col-6 mt-2">
				<div class="form-tim-kiem d-block mb-5">
					<form action="${pageContext.request.contextPath}/admin/kq-tim-kiem-thanh-vien" method="get" class="needs-validation" novalidate>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom01">Tìm kiếm thành viên</label>
								<input type="text" name="username" class="form-control" id="validationCustom01" placeholder="Nhập username để tìm kiếm" required>
								<div class="invalid-feedback">
									Tên username không được để trống.
								</div>
							</div>
						</div>
						
						<button class="btn btn-primary float-right" type="submit">Tìm kiếm</button>
					</form>
					
				</div>
				
				<c:set var="user" value="${requestScope.user }" />
				
				<c:if test="${empty user }">
					Không tìm thấy tên người dùng: ${requestScope.usernameParam }.
				</c:if>
				
				<c:if test="${not empty user }">
					<div class="kq-tim-kiem-thanh-vien" style="margin-top:6rem">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">user ID</th>
									<th scope="col">username</th>
									<th scope="col">email</th>
									<th scope="col">Giới tính</th>
									<th scope="col">Ngày sinh</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">${user.user_id }</th>
									<td>${user.username }</td>
									<td>${user.email }</td>
									<c:if test="${user.sex == 0}">
										<td>Nữ</td>
									</c:if>
									<c:if test="${user.sex == 1}">
										<td>Nam</td>
									</c:if>
									<c:if test="${user.sex > 1}">
										<td>Khác</td>
									</c:if>
									<td>${user.dateOfBirth } - ${user.monthOfBirth } - ${user.yearOfBirth }</td>
									
								</tr>
								
							</tbody>
						</table>
						
						<div class="alert-danger mt-3 mb-2">
							${sessionScope.erorrVerifyDeleteUser }
						</div>
						
						<div class="">
							<form action="${pageContext.request.contextPath}/admin/delete-user" method="post" class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation" novalidate>
								<span style="font-size: 1.5rem; border-bottom: 1px solid #e1e4e8">Xóa tài khoản và toàn bộ bài hát của người dùng.</span>
								<div class="form-row">
									<div class="col mb-2">
										<input type="text" name="verifyDelete" class="form-control" id="validationCustom03" placeholder="delete" required>
										<small id="" class="form-text text-muted">
											Nhập "delete" và ô trên để xác nhận.
											<br/>Lưu ý: <br/>
											Xóa người dùng sẽ xóa toàn bộ bài hát đã được phê duyệt và toàn bộ bài hát đang chờ của người dùng.
											<br/>Sẽ đóng toàn bộ report liên quan đến các bài hát đã được phê duyệt của người dùng này.
																						<br/>
											Bạn cần gửi email bằng tay tới email user để thông báo.
										</small>
										<div class="invalid-feedback">
											Vui lòng xác nhận.
										</div>
										
										<input type="hidden" name="handle_report_type" value="delete">
										
										<input type="hidden" name="user_id" value="${user.user_id }">
										
									</div>
								</div>
								<button class="btn btn-primary" type="submit">Xóa người dùng</button>
							</form>
						</div>
					</div>
				</c:if>
				
				


			</div>
		</div>
	</div>




	<!-- footter -->
	<div style="margin-top: 13.75rem;"></div>
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