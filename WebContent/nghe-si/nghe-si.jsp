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
	<title>A+ Music - Nghệ sĩ</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nghe-si.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->
	<div class="nghe-si mt-sm-4 mt-3">
		
		<div class="nghe-si-header  text-center">

			<div class="nghe-si-title">
				<span>Danh sách Nghệ Sĩ</span>
			</div>
			
			<!-- dont have enough time to do -->
			<div class="d-none bang-chu-cai mt-2 ml-sm-0 mr-sm-0 ml-3 mr-3">
				<a class="" href="#">A</a>
				<a class="" href="#">B</a>
				<a class="" href="#">C</a>
				<a class="" href="#">D</a>
				<a class="" href="#">E</a>
				<a class="" href="#">F</a>
				<a class="" href="#">G</a>
				<a class="" href="#">H</a>
				<a class="" href="#">I</a>
				<a class="" href="#">J</a>
				<a class="" href="#">K</a>
				<a class="" href="#">L</a>
				<a class="" href="#">M</a>
				<a class="" href="#">N</a>
				<a class="" href="#">O</a>
				<a class="" href="#">P</a>
				<a class="" href="#">Q</a>
				<a class="" href="#">R</a>
				<a class="" href="#">S</a>
				<a class="" href="#">T</a>
				<a class="" href="#">U</a>
				<a class="" href="#">V</a>
				<a class="" href="#">W</a>
				<a class="" href="#">X</a>
				<a class="" href="#">Y</a>
				<a class="" href="#">Z</a>
			</div>
			
		</div>
		


		<div class="nghe-si-list mt-sm-3 mt-3">

			<div class="nghe-si-list-container row justify-content-around mr-xl-4 ml-xl-4 mr-lg-3 ml-lg-3 mr-md-2 ml-md-2 mr-sm-2 ml-sm-2 mr-2 ml-2">
				
				
				<c:forEach var="singer" items="${list}">
					<div class="nghe-si-item mt-4">
						<div class="nghe-si-item-img">
							<a href="${pageContext.request.contextPath}/nghe-si?id=${singer.singer_id}">
								<img src="${pageContext.request.contextPath}/img/nghe-si/${singer.singer_img_path}" alt="">
							</a>
						</div>
						<div class="nghe-si-item-name text-center">
							<a href="${pageContext.request.contextPath}/nghe-si?id=${singer.singer_id}">
								${singer.singer_nick_name}
							</a>
						</div>
					</div>
				</c:forEach>
				

			</div>

		</div>

		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center mt-xl-5 mt-4">
				<c:if test="${currentPage != 1}">
					<li class="page-item">
						
							<a class="page-link" href="${pageContext.request.contextPath}/nghe-si-page?page=${currentPage - 1}" aria-label="Previous">
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
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/nghe-si-page?page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				
				</c:forEach>
				
				<c:if test="${currentPage lt amountOfPages}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/nghe-si-page?page=${currentPage + 1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</c:if>
				
			</ul>
		</nav>


	</div>





	
	<!-- footter -->
	<div style="margin-top: 8.5rem;"></div>
	<%@include file="/WEB-INF/footer.jsp" %>








	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>