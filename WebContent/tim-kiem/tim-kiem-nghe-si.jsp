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
	<title>A+ Music - Tìm kiếm nghệ sĩ</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tim-kiem.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nghe-si.css">
	
	<style>
	
	
	
	</style>
	


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->

	<div class="ket-qua-tim-kiem">

		<div class="ket-qua-tim-kiem-bai-hat ml-xl-4 ml-lg-3 ml-md-2 ml-sm-2 ml-2">
			<div class="ket-qua-tim-kiem-bai-hat-title">
				<span>Tìm kiếm theo nghệ sĩ: ${requestScope.q }</span>
			</div>
		</div>

		<div class="kqtk-loc-ket-qua d-flex ml-xl-4 ml-lg-3 ml-md-2 ml-sm-2 ml-2">
			<div class="kqtk-loc-ket-qua-title">
				<span>Tìm kiếm theo:</span> 
			</div>
			<div class="kqtk-loc-ket-qua-list d-flex">
				<div class="kqtk-loc-ket-qua-item">
					<!-- thẻ span trống để cho bài hát nằm cùng đáy với Tìm kiếm theo dù khác font-size-->
					<span id="kqtk-lkt-title-style"></span> 
					<a href="${pageContext.request.contextPath}/tim-kiem-bai-hat?q=${requestScope.q }"><span>Bài hát</span></a>
				</div>
				<div class="kqtk-loc-ket-qua-item">
					<!-- thẻ span trống để cho bài hát nằm cùng đáy với Tìm kiếm theo dù khác font-size-->
					<span id="kqtk-lkt-title-style"></span> 
					<a href="${pageContext.request.contextPath}/tim-kiem-nghe-si?q=${requestScope.q }"><span>Ca sĩ</span></a>
				</div>
			</div>
			
		</div>

		<div class="kqtk-bai-hat mt-xl-3">
			<c:set var="listSinger" value="${requestScope.listSinger }" />

			<div class="kqtk-bai-hat-list row justify-content-around mr-xl-1 ml-xl-1 mr-lg-3 ml-lg-3 mr-md-2 ml-md-2 mr-sm-2 ml-sm-2 mr-2 ml-2">
				
				
				
				<c:if test="${empty listSinger }">
					
					<div class="mt-3">
						Không có nghệ sĩ nào có tên: ${requestScope.q }
					</div>
				
				</c:if>
				
				
				
				<c:if test="${not empty listSinger }">

					
					<div class="nghe-si-list-container row justify-content-around mr-xl-2 ml-xl-2 mr-lg-3 ml-lg-3 mr-md-2 ml-md-2 mr-sm-2 ml-sm-2 mr-2 ml-2">
				
				
						<c:forEach var="item" items="${listSinger}">
							<div class="nghe-si-item mt-4 ml-2 mr-2">
								<div class="nghe-si-item-img">
									<a href="${pageContext.request.contextPath}/nghe-si?id=${item.singer_id}">
										<img src="${pageContext.request.contextPath}/img/nghe-si/${item.singer_img_path}" alt="">
									</a>
								</div>
								<div class="nghe-si-item-name text-center mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/nghe-si?id=${item.singer_id}">
										${item.singer_nick_name}
									</a>
								</div>
								
							</div>
						</c:forEach>
						
		
					</div>
				
				</c:if>
				

			</div>
		</div>
		
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center mt-xl-5 mt-4">
				<c:if test="${currentPage != 1}">
					<li class="page-item">
						
							<a class="page-link" href="${pageContext.request.contextPath}/tim-kiem-nghe-si?q=${requestScope.q }&page=${currentPage - 1}" aria-label="Previous">
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
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/tim-kiem-nghe-si?q=${requestScope.q }&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				
				</c:forEach>
				
				<c:if test="${currentPage lt amountOfPages}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/tim-kiem-nghe-si?q=${requestScope.q }&page=${currentPage + 1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</c:if>
				
			</ul>
		</nav>

		

		
	</div>
























	<!-- footter -->
	<div style="margin-top: 13.75rem;"></div>
	<%@include file="/WEB-INF/footer.jsp" %>







	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>