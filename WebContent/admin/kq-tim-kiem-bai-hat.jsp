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
	<title>Admin - Kết quả tìm kiếm bài hát</title>

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
<body  style="background-color: #fcfcfc">

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
				<div class="form-tim-kiem">
					<form class="needs-validation" novalidate>
						<h4>Tìm kiếm bài hát</h4>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom01">Username đăng bài hát</label>
								<input type="text" class="form-control" id="validationCustom01" placeholder="Nhập username để tìm kiếm" required>
								<div class="invalid-feedback">
									Tên username không được để trống.
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col mb-3">
								<label for="validationCustom02">Tên bài hát</label>
								<input type="text" class="form-control" id="validationCustom02" placeholder="Nhập tên bài hát để tìm kiếm" required>
								<div class="invalid-feedback">
									Tên bài hát không được để trống.
								</div>
							</div>
						</div>

						<button class="btn btn-primary float-right" type="submit">Tìm kiếm</button>
					</form>
				</div>
				
				<div class="alert-danger mt-3 mb-3">
					${requestScope.errorDeleteSong }
				
				</div>
				
				<c:set var="list" value="${requestScope.list }" />
				
				<c:if test="${empty list }">
					<div style="margin-top:5rem">
						Người dùng ${requestScope.username } không có bài hát nào mang tên ${requestScope.song_name}.
					</div>
				</c:if>
				
				<c:if test="${not empty list }">
					
					<c:forEach var="item" items="${list }">
						<div class="kq-tim-kiem" style="margin-top: 6rem;">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">username upload:</th>
										<th scope="col">ID bài hát</th>
										<th scope="col">Tên bài hát</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">${requestScope.username }</th>
										<td>${item.song_id }</td>
										<td>${item.song_name }</td>
									</tr>
									
								</tbody>
							</table>
							<form action="${pageContext.request.contextPath}/admin/delete-song" method="post" class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation" novalidate>
								
								<div class="form-row">
									<div class="col mb-2">
										
										<input type="hidden" name="username" value="${requestScope.username }">
										<input type="hidden" name="song_name" value="${requestScope.username }">
										
										<input type="hidden" name="song_id" value="${item.song_id }">
										
									</div>
								</div>
								<button class="btn btn-primary" type="submit">Xóa bài hát</button>
							</form>
						</div>
					
					
					
					</c:forEach>
					
					
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