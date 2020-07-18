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
	<title>A+ Music - Tìm kiếm bài hát</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tim-kiem.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nghe-si.css">
	
	<style>
	
		.nghe-si-item-img a img {
			width: 12rem !important;
			height: 12rem !important;
		}
		
		.nghe-si-item-img a img {
			border-radius: 0% !important;
		}
	
	
	</style>
	


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->

	<div class="ket-qua-tim-kiem">

		<div class="ket-qua-tim-kiem-bai-hat ml-xl-4 ml-lg-3 ml-md-2 ml-sm-2 ml-2">
			<div class="ket-qua-tim-kiem-bai-hat-title">
				<span>Tìm kiếm theo bài hát: ${requestScope.q }</span>
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
			<c:set var="listSong" value="${requestScope.listSong }" />

			<div class="kqtk-bai-hat-list row justify-content-around mr-xl-1 ml-xl-1 mr-lg-3 ml-lg-3 mr-md-2 ml-md-2 mr-sm-2 ml-sm-2 mr-2 ml-2">
				
				
				
				<c:if test="${empty listSong }">
					
					<div class="mt-3">
						Không có bài hát nào có tên: ${requestScope.q }
					</div>
				
				</c:if>
				
				
				
				<c:if test="${not empty listSong }">

					
					<div class="nghe-si-list-container row justify-content-around mr-xl-4 ml-xl-4 mr-lg-3 ml-lg-3 mr-md-2 ml-md-2 mr-sm-2 ml-sm-2 mr-2 ml-2">
				
				
						<c:forEach var="item" items="${listSong}">
							<div class="nghe-si-item mt-4 ml-2 mr-2">
								<div class="nghe-si-item-img">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${item.song_id}">
										<img src="${pageContext.request.contextPath}/img/bai-hat/${item.song_img_path}" alt="">
									</a>
								</div>
								<div class="nghe-si-item-name mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${item.song_id}">
										${item.song_name}
									</a>
								</div>
								<div class="mt-1">
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
						</c:forEach>
						
		
					</div>
				
				</c:if>
				

			</div>
		</div>
		
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center mt-xl-5 mt-4">
				<c:if test="${currentPage != 1}">
					<li class="page-item">
						
							<a class="page-link" href="${pageContext.request.contextPath}/tim-kiem-bai-hat?q=${requestScope.q }&page=${currentPage - 1}" aria-label="Previous">
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
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/tim-kiem-bai-hat?q=${requestScope.q }&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				
				</c:forEach>
				
				<c:if test="${currentPage lt amountOfPages}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/tim-kiem-bai-hat?q=${requestScope.q }&page=${currentPage + 1}" aria-label="Next">
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