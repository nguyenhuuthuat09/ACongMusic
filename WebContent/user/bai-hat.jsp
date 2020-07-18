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
	<title>A+ Music - Bài hát</title>

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



	<!-- body -->
	<div class="profile d-flex justify-content-center">
		<div class="profile-container d-flex col-lg-10">
			<div class="profile-menu mr-5 col-2" style="border: 1px solid #d1d5da; height: 7.5rem; width: 11.5rem; padding: 0.5rem 1rem">
				<div class="profile-menu-thong-tin-tai-khoan mb-3">
					<a href="${pageContext.request.contextPath}/user/profile.jsp" style="color: #353535; text-decoration: none;  ">Thông tin tài khoản</a>
				</div>
				<div class="profile-menu-quan-ly-tai-khoan mb-3">
					<a href="${pageContext.request.contextPath}/user/account.jsp" style="color: #353535; text-decoration: none; ">Quản lý tài khoản</a>
				</div>
				<div class="profile-menu-bai-hat">
					<a href="${pageContext.request.contextPath}/user-bai-hat" style="color: #353535; text-decoration: none; font-weight: 600;">Bài hát</a>
				</div>
			</div>
			<div class="profile-bai-hat">
				<div class="profile-bai-hat-container">
					<div class="alert-success">
						${messageDelete }
					</div>
					
					<div class="profile-bai-hat-list row">
					
					
					
					
					<c:set var="list" value="${requestScope.songList }" />
					<c:forEach var="song" items="${list}">
							
						<div class="profile-bai-hat-item ml-2 mr-2 mt-3">
							<div class="profile-bai-hat-item-cap-nhat mb-2">
								<a href="${pageContext.request.contextPath}/edit-song-info?id=${song.song_id}" style="color: #5e799e; text-decoration: none;">Chỉnh sửa</a>
							</div>
							<div class="profile-bai-hat-item-img mb-1">
								<a href="${pageContext.request.contextPath}/bai-hat?id=${song.song_id}">
									<img src="${pageContext.request.contextPath}/img/bai-hat/${song.song_img_path}" width="150rem" height="150rem" alt="">
								</a>
							</div>
							<div class="profile-bai-hat-item-info">
								<div class="profile-bai-hat-item-name" style="white-space: nowrap;width: 9.5rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${song.song_id}" style="color: #2d3034; text-decoration: none;">
										${song.song_name}
									</a>
								</div>
								<div>
								
									<c:set var="singer_nick_name_list" value="${song.singer_nick_name }"  />
									<c:forEach var="singer_nick_name" items="${singer_nick_name_list}" varStatus="status">
									
										<span class="profile-bai-hat-item-singer">
											<a href="#" style="color: #666666; text-decoration: none;">${singer_nick_name}</a>
										</span>
										<c:if test="${not status.last}">
											<span style="color: #666666">,</span> 		
										</c:if>
										
									</c:forEach>
									

								</div>
								
							</div>
						</div>
					
					
					</c:forEach>
					
					
						
						
						
						
					</div>
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