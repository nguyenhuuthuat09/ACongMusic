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
	<title>A+ Music - Phê duyệt bài hát</title>

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
			
			<div class="adm-profile-phe-duyet-bai-hat mt-2">
				
				
			
				<div class="adm-profile-phe-duyet-bai-hat-list">
				
					<c:set var="list" value="${requestScope.list }" />
					
					<c:if test="${empty list }">
						Không có bài hát nào cần phê duyệt.
					</c:if>
					
					<c:if test="${not empty list }">
						<c:forEach var="item" items="${list }" varStatus="loop">
						
							<div class="adm-profile-phe-duyet-bai-hat-item d-flex justify-content-between mb-4" style="border-bottom: 1px solid #d1d5da ">
								<div class="report_info mr-4 mb-2">
									<div>
										<span>ID bài hát trên hệ thống chờ: </span>
										<span> ${item.song_id } </span>
									</div>
									<div>
										<span>Tên bài hát: </span>
										<span> ${item.song_name} </span>
									</div>
									<div>
										<span>Ca sĩ: </span>
										<c:set var="singer_id_string" value="${item.singer_id }" />
										<c:set var="singer_id_list"
											value="${fn:split(singer_id_string, ',')}" />

										<c:set var="singer_nick_name_string" value="" />
										<c:set var="singer_nick_name_list"
											value="${item.singer_nick_name}" />
										<c:forEach var="singer_nick_name"
											items="${singer_nick_name_list}" varStatus="status">

											<span> <a
												href="${pageContext.request.contextPath}/nghe-si?id=${singer_id_list[status.index]}"
												style="color: #666666; text-decoration: none;">
													${singer_nick_name} </a>
											</span>
											<c:set var="singer_nick_name_string"
												value="${singer_nick_name_string}${singer_nick_name}" />
											<c:if test="${not status.last}">
												<span style="color: #666666">,</span>
												<c:set var="singer_nick_name_string"
													value="${singer_nick_name_string}, " />
											</c:if>

										</c:forEach>
									</div>
								</div>
								<div class="da-xu-ly">
									<form action="${pageContext.request.contextPath}/admin/thong-tin-bai-hat-dang-cho" method="post">
										<input type="hidden" name="song_id" value="${item.song_id }">
										<button class="btn btn-sm btn-primary" type="submit">Chi tiết</button>
									</form>
								
								</div>
								
							</div>
						
						</c:forEach>


					</c:if>
					
					

					
					
				</div>

				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center mt-xl-5 mt-4">
						<c:if test="${currentPage != 1}">
							<li class="page-item">
								
									<a class="page-link" href="${pageContext.request.contextPath}/admin/phe-duyet-bai-hat?page=${currentPage - 1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
							</li>
						</c:if>
						
						<c:forEach begin="1" end="${amountOfPages}" var="i">
							<c:choose>
								<c:when test="${currentPage eq i}">
									<li class="page-item"><a class="page-link" href="#">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/phe-duyet-bai-hat?page=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						
						</c:forEach>
						
						<c:if test="${currentPage lt amountOfPages}">
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/admin/phe-duyet-bai-hat?page=${currentPage + 1}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
						
					</ul>
				</nav>


			</div>
		</div>
	</div>




	<!-- footter -->
	<div style="margin-top: 18rem;"></div>
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