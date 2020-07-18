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
	<title>A+ Music - Nhạc trẻ</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bang-xep-hang.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	

	<!-- css bang xep hang theo Quoc gia -->
	<c:if test="${(music_type.music_id >= 1) && (music_type.music_id <= 5)}">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bang-xep-hang-vn.css">
	</c:if>
		
	<c:if test="${(music_type.music_id >= 6) && (music_type.music_id <= 9)}">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bang-xep-hang-am.css">
	</c:if>
		
	<c:if test="${(music_type.music_id >= 10) && (music_type.music_id <= 12)}">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bang-xep-hang-ca.css">
	</c:if>

</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>





	<div class="bang-xep-hang">

		<div class="bang-xep-hang-gioi-thieu col-xl-8 col-lg-9 col-md-9 col-sm-9 ml-xl-4 ml-lg-3 ml-md-3 ml-sm-2 mb-xl-3 mb-sm-4">
			<div class="bang-xep-hang-title">
				<span><h4 style="color: #33363a">Bảng xếp hạng</h4></span>
			</div>
			<div class="bang-xep-hang-content">
				<p style="color: #5d5b5b">
					Tổng hợp các bài hát thuộc các thể loại nhạc đang hot nhất trên A+ Music.<br/>
					Các bài hát được xếp hạng bằng cách tính tổng lượt nghe, comments, share,... trên website. Các bạn có thể dễ dàng giúp bài hát yêu thích của mình lên top 1 bằng cách cày view và chia sẻ cho bạn bè cùng nghe nhé.
					Danh sách bảng xếp hạng sẽ được cập nhật trực tiếp ngày trong tuần.
				</p>
			</div>
		</div>
		
		
		<c:set var="bxh-tl-item-active" value="" />

		<c:choose>
		
			<c:when test="${music_type.music_id == '1'}">
		         <c:set var="active1" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 2}">
		         <c:set var="active2" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 3}">
		         <c:set var="active3" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 4}">
		         <c:set var="active4" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 5}">
		         <c:set var="active5" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 6}">
		         <c:set var="active6" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 7}">
		         <c:set var="active7" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 8}">
		         <c:set var="active8" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 9}">
		         <c:set var="active9" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 10}">
		         <c:set var="active10" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
		     <c:when test="${music_type.music_id == 11}">
		         <c:set var="active11" value="id=&quot;bxh-tl-item-active&quot;" />
		     </c:when>
			<c:otherwise>
		        <c:set var="active12" value="id=&quot;bxh-tl-item-active&quot;" />
		    </c:otherwise>
		</c:choose>
		
		<c:set var="music_type" value="${requestScope.music_type }" />
		
		<c:if test="${(music_type.music_id >= 1) && (music_type.music_id <= 5)}">
			<%@include file="/WEB-INF/bxh-viet-nam-menu.jsp" %>
		</c:if>
		
		<c:if test="${(music_type.music_id >= 6) && (music_type.music_id <= 9)}">
			<%@include file="/WEB-INF/bxh-au-my-menu.jsp" %>
		</c:if>
		
		<c:if test="${(music_type.music_id >= 10) && (music_type.music_id <= 12)}">
			<%@include file="/WEB-INF/bxh-chau-a-menu.jsp" %>
		</c:if>

		
		
		

		<div class="bang-xep-hang-content d-sm-flex">
			<div class="bang-xep-hang-danh-sach col-lg-9 col-md-8 col-sm-8 ml-xl-4 ml-md-2 ml-sm-0">
				<div class="bang-xep-hang-danh-sach-tieu-de" style="background-color: #dc3934; border-radius: 3px; padding: 0.5rem 0 0.5rem 1rem; color: white;">
					<span >Top ${fn:length(list)} ca khúc <span style="font-weight: bold;">${music_type.music_type_name }</span> hot nhất trong tuần.
					</span>
				</div>
				
				<c:set var="list" value="${requestScope.list }" />
				
				<c:if test="${empty list }">
					<div class="mt-5">
						Xin lỗi! Hiện tại hệ thống chưa có bài hát nào thuộc thể loại ${music_type.music_type_name }.
					</div>				
				</c:if>
				
				<c:if test="${not empty list }">
				
					<c:forEach var="item" items="${list }" varStatus="loop">
						<div class="bang-xep-hang-bai-hat d-flex ml-xl-4 ml-3 justify-content-between mt-md-3 mt-sm-4">
							<div class="bang-xep-hang-bai-hat-detail d-flex">
								<div class="bang-xep-hang-bai-hat-thu-hang mr-lg-4 mr-md-3 mr-2">
								
									<c:choose>
										<c:when test="${loop.index < 5}">
											<span><h5 id="bxh-bh-th-${loop.index + 1 }">${loop.index + 1 }</h5></span>
										</c:when>
										<c:otherwise>
											<span><h5 style="color: #6d6d6d">${loop.index + 1 }</h5></span>
										</c:otherwise>
									
									</c:choose>
									
									
								</div>
								<div class="bang-xep-hang-bai-hat-img mr-2">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${item.song_id}">
										<img src="${pageContext.request.contextPath}/img/bai-hat/${item.song_img_path}" alt="" width="75rem" height="75rem">
									</a>
								</div>
								<div class="bang-xep-hang-bai-hat-info">
									<div class="bang-xep-hang-bai-hat-name">
										<a href="${pageContext.request.contextPath}/bai-hat?id=${item.song_id}">
											${item.song_name }
										</a>				
									</div>
									<div class="bang-xep-hang-bai-hat-singer">
										<c:set var="singer_id_string"
											value="${item.singer_id }" />
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
									<div class="view mt-1" style="color: #5e799e ">
										${item.listen_count_week } lượt nghe tuần này.
									</div>
								</div>
							</div>
							<div class="bang-xep-hang-bai-hat-icon-play mr-lg-4 mr-3">
								<a href="${pageContext.request.contextPath}/bai-hat?id=${item.song_id}"><i class="fa fa-play"></i></a>
							</div>
						</div>	
					
					
					</c:forEach>
				
				</c:if>
				
				


			</div>

			<div class="bang-xep-hang-related-bhm mt-lg-5 mt-sm-5 mt-3 ml-xl-2 ml-lg-3 ml-md-3 ml-xl-2 ml-sm-2 ml-4">
				<div class="bang-xep-hang-related-bhm-list">
					<span class="bang-xep-hang-related-bhm-title d-inline-block ml-sm-1">
						<h4 class="mb-3" style="border-bottom: 1px solid #cbcbcb; 
						color: #2D8AE8;">
							Bài hát mới
						</h4>
					</span>
						
						
					<c:set var="listBaiHatMoiCungTheLoai" value="${requestScope.listBaiHatMoiCungTheLoai }" />
					
					<c:if test="${empty listBaiHatMoiCungTheLoai }">
							
						<div class="mt-5">
							Xin lỗi. Hiện tại hệ thống chưa có bài hát thuộc thể loại ${music_type.music_type_name }.							
						</div>

					</c:if>
						
						
					<c:if test="${not empty listBaiHatMoiCungTheLoai }">
					
						<c:forEach var="itemBHM" items="${listBaiHatMoiCungTheLoai }" varStatus="loop">
							<div class="bang-xep-hang-related-bhm-item d-flex mb-1 mt-2 pb-2">
								<div class="bang-xep-hang-related-bhm-item-icon-music">
									<i id="icon-music-${loop.index + 1 }" class="fa fa-music"></i>
								</div>
								<div class="bang-xep-hang-related-bhm-item-info">
									<div class="bang-xep-hang-related-bhm-item-name">
										<a href="${pageContext.request.contextPath}/bai-hat?id=${itemBHM.song_id }">
											${itemBHM.song_name}
										</a>
									</div>
									<div class="bang-xep-hang-related-bhm-item-singer">
										<c:set var="singer_id_string"
											value="${itemBHM.singer_id }" />
										<c:set var="singer_id_list"
											value="${fn:split(singer_id_string, ',')}" />

										<c:set var="singer_nick_name_string" value="" />
										<c:set var="singer_nick_name_list"
											value="${itemBHM.singer_nick_name}" />
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