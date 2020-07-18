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
	<title>A+ Music - Tìm kiếm</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tim-kiem.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->

	<div class="ket-qua-tim-kiem">

		<div class="ket-qua-tim-kiem-bai-hat ml-xl-4 ml-lg-3 ml-md-2 ml-sm-2 ml-2">
			<div class="ket-qua-tim-kiem-bai-hat-title">
				<span>Tìm kiếm: ${requestScope.q }</span>
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
			<div class="kqtk-bai-hat-title ml-xl-4 ml-lg-3 ml-md-2 ml-sm-2 ml-2">
				<span>Bài Hát</span>
				<c:if test="${not empty listSong }">
					<div class="" mt-2 mb-3>
						<span>${fn:length(listSong)} kết quả phổ biến.</span>
					</div>

				</c:if>
			</div>
			<div class="kqtk-bai-hat-list row justify-content-around mr-xl-4 ml-xl-4 mr-lg-3 ml-lg-3 mr-md-2 ml-md-2 mr-sm-2 ml-sm-2 mr-2 ml-2">
				
				
				
				<c:if test="${empty listSong }">
					
					<div class="mt-3">
						Không có bài hát nào có tên: ${requestScope.q }
					</div>
				
				</c:if>
				
				
				
				<c:if test="${not empty listSong }">

					
					<c:forEach var="itemSong" items="${listSong }">
						<div class="kqtk-bai-hat-item">
							<div class="kqtk-bai-hat-item-img">
								<a href="${pageContext.request.contextPath}/bai-hat?id=${itemSong.song_id}">
									<img src="${pageContext.request.contextPath}/img/bai-hat/${itemSong.song_img_path}" alt="">
								</a>
							</div>
							<div class="kqtk-bai-hat-item-song-name" style="white-space: nowrap;width: 11.1rem;overflow: hidden;text-overflow: ellipsis;">
								<a
									href="${pageContext.request.contextPath}/bai-hat?id=${itemSong.song_id}"
									style="color: #2d3034; text-decoration: none;">
									${itemSong.song_name} </a>
							</div>
							<div class="kqtk-bai-hat-item-singer-name">
								<c:set var="singer_id_string" value="${itemSong.singer_id }" />
								<c:set var="singer_id_list"
									value="${fn:split(singer_id_string, ',')}" />

								<c:set var="singer_nick_name_string" value="" />
								<c:set var="singer_nick_name_list"
									value="${itemSong.singer_nick_name}" />
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
				
				</c:if>
				

			</div>
		</div>

		<div class="kqtk-nghe-si mt-xl-3">
			<div class="kqtk-nghe-si-title ml-xl-4 ml-lg-3 ml-md-2 ml-sm-2 ml-2">
				<span>Nghệ Sĩ</span>
				<c:if test="${not empty listSinger }">
					<div class="" mt-2 mb-4>
						<span>${fn:length(listSinger)} kết quả phổ biến.</span>
					</div>

				</c:if>
			</div>
			
			

			<div class="kqtk-nghe-si-container">

				<div class="kqtk-nghe-si-list row justify-content-around mr-xl-4 ml-xl-4 mr-lg-3 ml-lg-3 mr-md-2 ml-md-2 mr-sm-2 ml-sm-2 mr-2 ml-2 ">
					
					<c:set var="listSinger" value="${requestScope.listSinger }" />
				
					<c:if test="${empty listSinger }">
						
						<div class="mt-3">
							Không có nghệ sĩ nào có tên: ${requestScope.q }
						</div>
					
					</c:if>
					
					
					
					<c:if test="${not empty listSinger }">
					
						
						
						<c:forEach var="itemSinger" items="${listSinger}">
							
							<div class="kqtk-nghe-si-item">
								<div class="kqtk-nghe-si-item-img">
									<a href="${pageContext.request.contextPath}/nghe-si?id=${itemSinger.singer_id}">
										<img src="${pageContext.request.contextPath}/img/nghe-si/${itemSinger.singer_img_path}" alt="">
									</a>
								</div>
								<div class="kqtk-nghe-si-item-name text-center">
									<a href="${pageContext.request.contextPath}/nghe-si?id=${itemSinger.singer_id}">
										${itemSinger.singer_nick_name}
									</a>
								</div>
							</div>
						
						
						</c:forEach>
					
					</c:if>
					
					

					
				</div>

				

				
			</div>
		</div>

		
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