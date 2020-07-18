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
	<title>A+ Music - Thông báo report</title>

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
			
			<div class="adm-profile-thong-bao-report mt-2">
				
				
			
				<div class="adm-profile-thong-bao-report-list">
				
					<c:set var="listReport" value="${requestScope.listReport }" />
					<c:set var="listSong" value="${requestScope.listSong }" />
					<c:set var="listUser" value="${requestScope.listUser }" />
					
					<c:if test="${empty listReport }">
						Không có report nào cần xử lý.
					</c:if>
					
					<c:if test="${not empty listReport }">
						<c:forEach var="item" items="${listReport }" varStatus="loop">
						
							<div class="adm-profile-thong-bao-report-item d-flex justify-content-between mb-4" style="border-bottom: 1px solid #d1d5da ">
								<div class="report_info mr-4 mb-2">
									<div>
										<span>report id: </span>
										<span> ${item.report_id } </span>
									</div>
									<div>
										<span>Tài khoản </span>
										<span> ${listUser[loop.index].username} </span>
										<span> bị report về bài hát </span>
										<span> ${listSong[loop.index].song_name }</span>
									</div>
								</div>
								<div class="da-xu-ly">
									<form action="${pageContext.request.contextPath}/admin/chi-tiet-report" method="post">
										<input type="hidden" name="report_id" value="${item.report_id }">
										<input type="hidden" name="song_id_report" value="${listSong[loop.index].song_id }">
										<input type="hidden" name="user_id_report" value="${listUser[loop.index].user_id}">									
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
								
									<a class="page-link" href="${pageContext.request.contextPath}/admin/thong-bao-report?page=${currentPage - 1}" aria-label="Previous">
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
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/thong-bao-report?page=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						
						</c:forEach>
						
						<c:if test="${currentPage lt amountOfPages}">
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/admin/thong-bao-report?page=${currentPage + 1}" aria-label="Next">
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