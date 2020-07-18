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
	<title>${singer.singer_nick_name } - A+ Music</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nghe-si-profile.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>

	<c:set var="singer" value="${requestScope.singer }" />

	<!-- body -->
	<div class="nghe-si-profile">
		<div class="nghe-si-profile-thong-tin d-sm-flex mx-lg-3 mx-sm-2 mx-1" style="">
			<div class="nghe-si-profile-thong-tin-img">
				<img src="${pageContext.request.contextPath}/img/nghe-si/${singer.singer_img_path}" alt="">
			</div>
			<div class="nghe-si-profile-thong-tin-main ml-md-4 ml-sm-3">
				<ul class="nav nav-tabs" id="ngheSitieu-suInfoTab" role="tabdivst">
					<li class="nav-item mr-3">
						<a class="nav-divnk active" id="thong-tin-tab" data-toggle="tab" href="#thong-tin" role="tab" aria-controls="thong-tin" aria-selected="true">Thông tin</a>
					</li>
					<li class="nav-item">
						<a class="nav-divnk" id="tieu-su-tab" data-toggle="tab" href="#tieu-su" role="tab" aria-controls="tieu-su" aria-selected="false">Tiểu sử</a>
					</li>
				</ul>
				<div class="tab-content" id="ngheSitieu-suInfoTabContent">
					<div class="tab-pane fade show active mt-3" id="thong-tin" role="tabpanel" aria-labelledby="thong-tin-tab">
						<div class="nghe-si-profile-biet-danh">
							<span style="color: #354458">Nghệ danh: </span>
							<span style="color: #3b5998">${singer.singer_nick_name }</span>
						</div>
						<div class="nghe-si-profile-name">
							<span style="color: #354458">Tên thật: </span>
							<span style="color: #3b5998">${singer.singer_name }</span>
						</div>
						<div class="nghe-si-profile-tuoi">
							<span style="color: #354458">Ngày sinh: </span>
							<span style="color: #3b5998">
								<c:if test="${not empty singer.dateOfBirth}">${singer.dateOfBirth} - </c:if>
								<c:if test="${not empty singer.monthOfBirth}">${singer.monthOfBirth} - </c:if>
								<c:if test="${not empty singer.yearOfBirth}">${singer.yearOfBirth}</c:if>
								
								<c:if test="${(empty singer.dateOfBirth) && (empty singer.monthOfBirth) && (empty singer.yearOfBirth) }">
									Không có thông tin.
								</c:if>
								
							
							</span>
						</div>
						<div class="nghe-si-profile-gioi-tinh">
							<span style="color: #354458">Giới tính: </span>
							<span style="color: #3b5998">
								<c:choose>
									<c:when test="${singer.sex == '0'}">
										Nữ
									</c:when>
									<c:when test="${singer.sex == '1'}">
										Nam
									</c:when>
									<c:when test="${singer.sex == '2'}">
										thứ 3
									</c:when>
									<c:otherwise>
										chưa rõ
									</c:otherwise>
								</c:choose> 
							</span>
						</div>
						<div class="nghe-si-profile-que-quan">
							<span style="color: #354458">Quê Quán: </span>
							
							<span style="color: #3b5998">
								<c:if test="${empty singer.singer_hometown}">
									Không có thông tin.
								</c:if>
								<c:if test="${not empty singer.singer_hometown}">
									${singer.singer_hometown }
								</c:if>
							</span>
						</div>
					</div>
					<div class="tab-pane fade shortent-text mt-3" id="tieu-su" role="tabpanel" aria-labelledby="tieu-su-tab">
						<p class="collapse" id="collapse-tieu-su">
							<c:if test="${empty singer.singer_story}">
								Hiện chưa có thông tin.
							</c:if>
							<c:if test="${not empty singer.singer_story}">
								${singer.singer_story }
							</c:if>
						</p>
						<a class="collapsed" data-toggle="collapse" href="#collapse-tieu-su" aria-expanded="false" aria-controls="collapse-tieu-su">
						</a>
					</div>
				</div>
	
			</div>
		</div>

		<div class="nghe-si-profile-bai-hat d-lg-flex mt-xl-4 mt-3">
			<div class="nghe-si-profile-bai-hat-top ml-lg-2 ml-sm-2 ml-3">

				<div class="nghe-si-profile-bai-hat-top-title mb-3 ml-lg-0 ml-sm-3">
					<span style="font-size: 1.25rem">Top nghe nhiều</span>
				</div>
				
				<c:set var="listTopSongSinger" value="${requestScope.listTopSongSinger }" />

				<div class="nghe-si-profile-bai-hat-top-list d-lg-block d-sm-flex justify-content-around">
					
					<c:if test="${empty listTopSongSinger }">
						<div class="mt-5">
							Nghệ sĩ chưa có bài hát nào trên hệ thống.
						</div>
					</c:if>
					
					
					<c:if test="${not empty listTopSongSinger }">
						
						<c:forEach var="itemTopSongSinger" items="${listTopSongSinger }" varStatus="loop">
							<div class="nghe-si-profile-bai-hat-top-item d-lg-flex d-block justify-content-between mb-1">
								<div class="nghe-si-profile-bai-hat-top-item-container">
									<div class="nghe-si-profile-bai-hat-top-item-name" style="white-space: nowrap;width: 13rem;overflow: hidden;text-overflow: ellipsis;">
										<a href="${pageContext.request.contextPath}/bai-hat?id=${itemTopSongSinger.song_id}">
											${itemTopSongSinger.song_name }
										</a>
									</div>
									<div class="nghe-si-profile-bai-hat-top-item-singer">
										<c:set var="singer_id_string" value="${itemTopSongSinger.singer_id }" />
										<c:set var="singer_id_list"
											value="${fn:split(singer_id_string, ',')}" />

										<c:set var="singer_nick_name_string" value="" />
										<c:set var="singer_nick_name_list"
											value="${itemTopSongSinger.singer_nick_name}" />
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
								<c:choose>
									<c:when test="${loop.index == 0}">
										<div class="nghe-si-profile-bai-hat-top-item-view" style="color: #208c67">
											<i class="fa fa-headphones"></i>
											<span>${itemTopSongSinger.listen_count_week }</span>
										</div>
									</c:when>
									<c:when test="${loop.index == 1}">
										<div class="nghe-si-profile-bai-hat-top-item-view" style="color: #1da0d9">
											<i class="fa fa-headphones"></i>
											<span>${itemTopSongSinger.listen_count_week }</span>
										</div>
									</c:when>
									<c:when test="${loop.index == 2}">
										<div class="nghe-si-profile-bai-hat-top-item-view" style="color: #e19d29">
											<i class="fa fa-headphones"></i>
											<span>${itemTopSongSinger.listen_count_week }</span>
										</div>
									</c:when>
									<c:when test="${loop.index == 3}">
										<div class="nghe-si-profile-bai-hat-top-item-view" style="color: #5e799e">
											<i class="fa fa-headphones"></i>
											<span>${itemTopSongSinger.listen_count_week }</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="nghe-si-profile-bai-hat-top-item-view" style="color: #6d6d6d">
											<i class="fa fa-headphones"></i>
											<span>${itemTopSongSinger.listen_count_week }</span>
										</div>
									</c:otherwise>
								
								</c:choose>
								
							</div>
						
						</c:forEach>
						
						
						
					</c:if>
					

				</div>
			</div>

			<div class="nghe-si-profile-bai-hat-new col-lg-9 ml-lg-0 ml-md-2 mt-lg-0 mt-3">

				<div class="nghe-si-profile-bai-hat-new-title mb-3">
					<span style="font-size: 1.25rem">Bài hát mới</span>
				</div>
				
				<c:set var="list" value="${requestScope.list }"/>
				
				

				<div class="nghe-si-profile-bai-hat-new-container row justify-content-around">
					<c:if test="${empty list }">
						<div class="text-centert mt-5">
							Nghệ sĩ chưa có bài hát nào được đăng trên hệ thống
						</div>
					</c:if>
					
					
					<c:if test="${not empty list }">
						<c:forEach var="item" items="${list }">
						
							 <div class="nghe-si-profile-bai-hat-new-item mb-3">
								<div class="nghe-si-profile-bai-hat-new-item-img">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${item.song_id}">
										<img src="${pageContext.request.contextPath}/img/bai-hat/${item.song_img_path}" alt="">
									</a>
								</div>
								<div class="nghe-si-profile-bai-hat-new-info">
									<div class="nghe-si-profile-bai-hat-new-name mt-1">
										<a href="${pageContext.request.contextPath}/bai-hat?id=${item.song_id}">
											<span>${item.song_name }</span>
										</a>
									</div>
									<div class="nghe-si-profile-bai-hat-new-singer">
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
							</div>
						
						
						</c:forEach>
					
						
					
					</c:if>
					
				</div>
				
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center mt-xl-5 mt-4">
						<c:if test="${currentPage != 1}">
							<li class="page-item">
								
									<a class="page-link" href="${pageContext.request.contextPath}/nghe-si?id=${singer.singer_id }&page=${currentPage - 1}" aria-label="Previous">
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
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/nghe-si?id=${singer.singer_id }&page=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						
						</c:forEach>
						
						<c:if test="${currentPage lt amountOfPages}">
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/nghe-si?id=${singer.singer_id }&page=${currentPage + 1}" aria-label="Next">
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
	<div style="margin-top: 8.5rem;"></div>
	<%@include file="/WEB-INF/footer.jsp" %>


	


	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/nghe-si-profile.js"></script>
</body>
</html>