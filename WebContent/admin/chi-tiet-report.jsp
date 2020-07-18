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
	<title>A+ Music - Chi tiết report</title>

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
			
			<c:set var="report" value="${requestScope.report }" />
			<c:set var="songReport" value="${requestScope.songReport }" />
			<c:set var="profileReport" value="${requestScope.profileReport }" />
			
			<div class="adm-profile-chi-tiet-report mt-2">
				<div class="adm-profile-chi-tiet-report-container">
					<div class="mb-3 mt-3 text-primary">
						Thông tin phiếu report.
					</div>
					<div class="report_info mr-4 mb-2">
						<div class="mb-3">
							<span>Report id: </span>
							<span> ${report.report_id } </span>
						</div>
						<div class="mb-3">
							<span>Tài khoản </span>
							<span style="font-weight: bold;"> ${profileReport.username } </span>
							<span> bị report về bài hát </span>
							<a href="${pageContext.request.contextPath}/bai-hat?id=${songReport.song_id}" target="_blank">${songReport.song_name}</a>
							
						</div>
						<div class="mb-3">
							<span>ID tài khoản đăng tải: </span>
							<span> ${profileReport.user_id } </span>
						</div>
						<div class="mb-3">
							<span>ID bài hát: </span>
							<span> ${songReport.song_id} </span>
						</div>
						
						<div class="mb-3">
							<span>Lý do: </span>
							<span> ${report.report_reason }</span>
						</div>
						<div class="mb-3">
							<span>Thông tin thêm: </span>
							<c:if test="${empty report.report_reason_more }">
								Không có.
							</c:if>
							<c:if test="${not empty report.report_reason_more }">
								${report.report_reason_more }
							</c:if>
						</div>
						
						<div class="mb-3 text-primary">
							Thông tin người gửi report.
						</div>
						
						<div class="mb-3">
							<span>ID tài khoản gửi report: </span>
							<span>${report.user_id_request }</span>
						</div>

						<div class="mb-3">
							<span>Email gửi report: </span>
							<span>${report.email_request }</span> <br/>
							<small class="text-danger">
								Gửi thư thông báo tới email này bằng tay.
							</small>
						</div>
						
					</div>	
					
					<div class="alert-danger mt-3 mb-2">
						${requestScope.errorVerifyDelete }
					</div>
					<div class="alert-danger mt-3 mb-2">
						${requestScope.errorDelete}
					</div>
					
					<div class="da-xu-ly mt-3 mb-5">
						<form action="${pageContext.request.contextPath}/admin/handle-report" method="post" class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation" novalidate>
							<span style="font-size: 1.5rem; border-bottom: 1px solid #e1e4e8">Xóa tài khoản và toàn bộ bài hát của người dùng.</span>
							<div class="form-row">
								<div class="col mb-2">
									<input type="text" name="verifyDelete" class="form-control" id="validationCustom03" placeholder="delete" required>
									<small id="" class="form-text text-muted">
										Nhập "delete" và ô trên để xác nhận.
										<br/>Lưu ý: bạn cần gửi email bằng tay tới email gửi report để thông báo về kết quả report.
										<br/>
										kết quả: bài hát có vi phạm và tài khoản đăng đã bị xóa khỏi hệ thống.
									</small>
									<div class="invalid-feedback">
										Vui lòng xác nhận.
									</div>
									
									<input type="hidden" name="handle_report_type" value="delete">
									
									<input type="hidden" name="report_id" value="${report.report_id }">
									<input type="hidden" name="song_id_report" value="${songReport.song_id }">
									<input type="hidden" name="user_id_report" value="${profileReport.user_id}">
								</div>
							</div>
							<button class="btn btn-primary" type="submit">Xóa người dùng, tất cả bài hát của người dùng và đóng report</button>
						</form>
					</div>
					
					<div class="alert-danger mt-3 mb-2">
						${requestScope.errorVerifyCloseOnly}
					</div>

					<div class="da-xu-ly">
						<form action="${pageContext.request.contextPath}/admin/handle-report" method="post" class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation" novalidate>
							<span style="font-size: 1.5rem; border-bottom: 1px solid #e1e4e8">Đóng report</span>
							<div class="form-row">
								<div class="col mb-2">
									<input type="text" name="verifyCloseOnly" class="form-control" id="validationCustom03" placeholder="close only" required>
									<small id="" class="form-text text-muted">
										Nhập "close only" và ô trên để xác nhận.
										<br/>bạn cần gửi email bằng tay tới email gửi report để thông báo về kết quả report.
										<br/>
										kết quả: bài hát không vi phạm.
									</small>
									<div class="invalid-feedback">
										Vui lòng xác nhận.
									</div>
									
									<input type="hidden" name="handle_report_type" value="close-only">
									
									<input type="hidden" name="report_id" value="${report.report_id }">
									<input type="hidden" name="song_id_report" value="${songReport.song_id }">
									<input type="hidden" name="user_id_report" value="${profileReport.user_id}">
								
								</div>
							</div>
							<button class="btn btn-primary" type="submit">Đóng report.</button>
						</form>
					</div>

					
					
				</div>


			</div>
		</div>
	</div>




	<!-- footter -->
	<div style="margin-top: 8.5rem;">
	</div>
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