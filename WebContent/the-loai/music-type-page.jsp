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
	<title>A+ Music - ${music_type.music_type_name}</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/the-loai.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>
	
	

	<!-- body content -->
	<div class="bai-hat-moi mt-lg-5 mt-md-4 d-md-flex">

		<div class="bai-hat-moi-main-container">
			<div class="bai-hat-moi-the-loai">
				<div class="bai-hat-moi-the-loai-container d-sm-flex justify-content-between">
					
					<section class="bai-hat-moi-the-loai-hien-tai" style="font-size: 0.95rem;">
						<span class="mr-lg-3 d-none d-lg-inline-block" style="font-size: 1.25rem; color: #354458">
							Bài Hát Mới
						</span>
						
						<c:set var="bhm-tl-ht-active" value="" />

						<c:choose>

							<c:when test="${music_type.music_id == '1'}">
					            <c:set var="active1" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 2}">
					            <c:set var="active2" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 3}">
					            <c:set var="active3" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 4}">
					            <c:set var="active4" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 5}">
					            <c:set var="active5" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 6}">
					            <c:set var="active6" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 7}">
					            <c:set var="active7" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 8}">
					            <c:set var="active8" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 9}">
					            <c:set var="active9" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 10}">
					            <c:set var="active10" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 11}">
					            <c:set var="active11" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 12}">
					            <c:set var="active12" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 13}">
					            <c:set var="active13" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 14}">
					            <c:set var="active14" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
					        <c:when test="${music_type.music_id == 15}">
					            <c:set var="active15" value="id=&quot;bhm-tl-ht-active&quot;" />
					        </c:when>
							<c:otherwise>
					            <c:set var="active16" value="id=&quot;bhm-tl-ht-active&quot;" />
					         </c:otherwise>
						</c:choose>

						<c:if test="${(music_type.music_id >= 1) && (music_type.music_id <= 5)}">
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active1} href="${pageContext.request.contextPath}/the-loai?music_id=1&page=1">Nhạc trẻ</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active2} href="${pageContext.request.contextPath}/the-loai?music_id=2&page=1">Nhạc Trịnh</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active3} href="${pageContext.request.contextPath}/the-loai?music_id=3&page=1">Tiền chiến</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active4} href="${pageContext.request.contextPath}/the-loai?music_id=4&page=1">Thiếu nhi</a>
							<a style="color: #de593a" ${active5} href="${pageContext.request.contextPath}/the-loai?music_id=5&page=1">Hip Hop/Rap</a>
						</c:if>
						
						<c:if test="${(music_type.music_id >= 6) && (music_type.music_id <= 9)}">
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active6} href="${pageContext.request.contextPath}/the-loai?music_id=6&page=1">Pop</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active7} href="${pageContext.request.contextPath}/the-loai?music_id=7&page=1">Rock</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active8} href="${pageContext.request.contextPath}/the-loai?music_id=8&page=1">Electronica/Dance</a>
							<a style="color: #de593a" ${active9} href="${pageContext.request.contextPath}/the-loai?music_id=9&page=1">R&B/Hip Hop/Rap</a>
						</c:if>
						
						<c:if test="${(music_type.music_id >= 10) && (music_type.music_id <= 12)}">
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active10} href="${pageContext.request.contextPath}/the-loai?music_id=10&page=1">Nhạc Hàn</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active11} href="${pageContext.request.contextPath}/the-loai?music_id=11&page=1">Nhạc Trung</a>
							<a style="color: #de593a" ${active12} href="${pageContext.request.contextPath}/the-loai?music_id=12&page=1">Nhạc Nhật</a>
						</c:if>
						
						<c:if test="${(music_type.music_id >= 13) && (music_type.music_id <= 16)}">
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active13} href="${pageContext.request.contextPath}/the-loai?music_id=13&page=1">Không lời</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active14} href="${pageContext.request.contextPath}/the-loai?music_id=14&page=1">Nhạc Phim</a>
							<a class="mr-lg-2 mr-md-2" style="color: #de593a" ${active15} href="${pageContext.request.contextPath}/the-loai?music_id=15&page=1">Beat</a>
							<a style="color: #de593a" ${active16} href="${pageContext.request.contextPath}/the-loai?music_id=16&page=1">Thể loại khác</a>
						</c:if>
								
					</section>
					<section>
						<span class="d-none d-sm-none d-lg-inline" style="font-size: 1.25rem"></span>
						<a class="d-inline-block" id="bhm-the-loai-khac-collapese" data-toggle="collapse" href="#collapseBhmTheLoaiKhac" role="button" aria-expanded="false" aria-controls="collapseBhmTheLoaiKhac" style="color: #464646">
				    		Thể loại khác <i class="fa fa-angle-down"></i>
						</a>
					</section>
				</div>
				<div class="collapse mt-lg-3"  id="collapseBhmTheLoaiKhac">
					<div class="bai-hat-moi-the-loai-khac-list">
						
						<div class="bhm-tl-khac-item d-lg-flex mb-lg-3" id="bhm-tl-qg-vn" style="white-space: nowrap">
							<div class="bhm-tl-khac-quoc-gia" style="width: 5rem">
								<span style="font-weight: bold;">Việt Nam</span>
							</div>
							<div class="bhm-tl-khac-quoc-gia-list d-lg-flex">
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=1&page=1">Nhạc trẻ</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=2&page=1">Nhạc Trịnh</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 8rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=3&page=1">Tiền chiến</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=4&page=1">Thiếu Nhi</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=5&page=1">Hip Hop/Rap</a></span>
								</div>
							</div>
						</div>

						<div class="bhm-tl-khac-item d-lg-flex mb-lg-3" id="bhm-tl-qg-ca">
							<div class="bhm-tl-khac-quoc-gia"  style="width: 5rem">
								<span style="font-weight: bold;">Châu Á</span>
							</div>
							<div class="bhm-tl-khac-quoc-gia-list d-lg-flex">
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=10&page=1">Nhạc Hàn</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=11&page=1">Nhạc Hoa</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=12&page=1">Nhạc Nhật</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 8rem">
								</div>
							</div>
						</div>

						<div class="bhm-tl-khac-item d-lg-flex mb-lg-3" id="bhm-tl-qg-am">
							<div class="bhm-tl-khac-quoc-gia"  style="width: 5rem">
								<span style="font-weight: bold;">Âu Mỹ</span>
							</div>
							<div class="bhm-tl-khac-quoc-gia-list d-lg-flex">
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=6&page=1">Pop</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=7&page=1">Rock</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 8rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=8&page=1">Electronica/Dance</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=9&page=1">R&B/Hip Hop/Rap</a></span>
								</div>
							</div>
						</div>

						<div class="bhm-tl-khac-item d-lg-flex" id="bhm-tl-qg-khac">
							<div class="bhm-tl-khac-quoc-gia"  style="width: 5rem">
								<span style="font-weight: bold;">Khác</span>
							</div>
							<div class="bhm-tl-khac-quoc-gia-list d-lg-flex">
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=13&page=1">Không lời</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 5rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=14&page=1">Nhạc phim</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2" style="width: 8rem">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=15&page=1">Beat</a></span>
								</div>
								<div class="bhm-tl-khac-quoc-gia-item mr-xl-2">
									<span><a href="${pageContext.request.contextPath}/the-loai?music_id=16&page=1">Thể loại khác</a></span>
								</div>
							</div>
						</div>



					</div>
				</div>

			</div>

			<div class="bai-hat-moi-list mt-xl-2 mt-lg-0">
				
				<c:if test="${empty requestScope.list}">
					<div class="mt-5 text-center">
						Xin lỗi. Hiện tại hệ thống chưa có bài hát nào thuộc thể loại <span>${music_type.music_type_name }</span>.			
					</div>
									
				</c:if>
				
				<c:if test="${not empty requestScope.list}">
					<c:forEach var="song" items="${requestScope.list}">
						<div class="bai-hat-moi-item d-inline-block mr-xl-3 mt-xl-3 mr-lg-2 mt-lg-3 mt-md-3 mt-sm-3">
							<div class="bai-hat-moi-item-img">
								<a href="${pageContext.request.contextPath}/bai-hat?id=${song.song_id}">
									<img src="${pageContext.request.contextPath}/img/bai-hat/${song.song_img_path}" alt="" width="195rem" height="195rem">
								</a>
							</div>
		
							<div class="bai-hat-moi-item-info mt-md-2">
								<div class="bai-hat-moi-item-name" style="white-space: nowrap;width: 12rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${song.song_id}">
										${song.song_name }
									</a>
								</div>
								<div class="bai-hat-moi-item-singer" >
									<c:set var="singer_id_string" value="${song.singer_id }" />
									<c:set var="singer_id_list"
										value="${fn:split(singer_id_string, ',')}" />

									<c:set var="singer_nick_name_string" value="" />
									<c:set var="singer_nick_name_list"
										value="${song.singer_nick_name}" />
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
							
								<a class="page-link" href="${pageContext.request.contextPath}/the-loai?music_id=${music_type.music_id }&page=${currentPage - 1}" aria-label="Previous">
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
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/the-loai?music_id=${music_type.music_id }&page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					
					</c:forEach>
					
					<c:if test="${currentPage lt amountOfPages}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/the-loai?music_id=${music_type.music_id }&page=${currentPage + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
							</a>
						</li>
					</c:if>
					
				</ul>
			</nav>


		</div>


		<div class="bai-hai-moi-related">
			<div class="bhm-related-bxh-container ml-xl-3">
				<div class="bhm-related-bxh-title mb-xl-4 mb-lg-3 mb-md-3" style="border-bottom: 1px solid #cbcbcb">
					<span class="d-none d-md-inline-block" style="font-size: 1.25rem;">BXH Nhạc Trẻ</span>
					<span class="d-inline-block d-md-none" style="font-size: 1.25rem;">Bảng xếp hạng Nhạc Trẻ</span>
				</div>
				
				
				<c:set var="listTopWeek" value="${requestScope.listTopWeek}" />
				
				<c:if test="${empty listTopWeek }">
					<div class="mt-5">
						Xin lỗi. Hệ thống chưa có bài hát nào thuộc thể loại ${music_type.music_type_name }.
					</div>
				</c:if>
				
				<c:if test="${not empty listTopWeek[0] }">
					<div class="bhm-related-bxh-top-1 mb-1 pb-2 d-none d-md-flex">
						<div class="bhm-related-bxh-top-1-img">
							<a href="${pageContext.request.contextPath}/bai-hat?id=${listTopWeek[0].song_id}">
								<img src="${pageContext.request.contextPath}/img/bai-hat/${listTopWeek[0].song_img_path}" alt="" width="110rem" height="110rem">
							</a>
						</div>
						<div class="bhm-related-bxh-top-1-info ml-xl-2 ml-lg-1">
							<div class="bhm-related-bxh-top-1-rank">
								<span class="mt-0 pt-0">Top 1</span>
							</div>
							<div class="bhm-related-bxh-top-1-name mt-1" style="white-space: nowrap;width: 10.5rem;overflow: hidden;text-overflow: ellipsis;">
								<a href="${pageContext.request.contextPath}/bai-hat?id=${listTopWeek[0].song_id}">
									${listTopWeek[0].song_name }
								</a>
							</div>
							<div class="bhm-related-bxh-top-1-singer mt-1">
								<c:set var="singer_id_string"
									value="${listTopWeek[0].singer_id }" />
								<c:set var="singer_id_list"
									value="${fn:split(singer_id_string, ',')}" />
	
								<c:set var="singer_nick_name_string" value="" />
								<c:set var="singer_nick_name_list"
									value="${listTopWeek[0].singer_nick_name}" />
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
							<div class="bhm-related-bxh-top-1-view mt-1">
								Lượt Nghe: ${listTopWeek[0].listen_count_week }
							</div>
						</div>
					</div>
					
					<!-- Top 1 cho màn hình sm trở xuống -->
					<div class="bhm-related-bxh-item mb-1 pb-2 d-flex d-md-none justify-content-between">
						<div class="bhm-related-bxh-container ml-lg-1 d-flex d-inline-flex">
							<div class="bhm-related-bxh-item-rank">
								<span style="color: #dc403b; padding-left: 0.35rem;">1</span>
							</div>
							<div class="bhm-related-bxh-item-detail ml-lg-3">
								<div class="bhm-related-bxh-item-name" style="white-space: nowrap;width: 10.5rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${listTopWeek[0].song_id}">
										${listTopWeek[0].song_name }
									</a>
								</div>
								<div class="bhm-related-bxh-item-singer">
									<c:set var="singer_id_string"
										value="${listTopWeek[0].singer_id }" />
									<c:set var="singer_id_list"
										value="${fn:split(singer_id_string, ',')}" />
	
									<c:set var="singer_nick_name_string" value="" />
									<c:set var="singer_nick_name_list"
										value="${listTopWeek[0].singer_nick_name}" />
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
						<div class="bhm-related-bxh-item-view">
							<i class="fa fa-headphones"></i>
							<span>Lượt Nghe: ${listTopWeek[0].listen_count_week }</span>
						</div>
					</div>
					<!-- -->
				
				
				</c:if>
				

				
				
				<c:forEach var="itemTopWeek" items="${listTopWeek }" varStatus="loop">
				
					<c:if test="${loop.index > 0}">  
					
						<div class="bhm-related-bxh-item mb-1 pb-2 d-flex justify-content-between">
							<div class="bhm-related-bxh-container ml-lg-1 d-flex d-inline-flex">
								<div class="bhm-related-bxh-item-rank">
									<c:choose>
										<c:when test="${loop.index == 1}">
											<span style="color: #249e74; padding-left: 0.35rem;">2</span>
										</c:when>
										<c:when test="${loop.index == 2}">
											<span style="color: #1da0d9; padding-left: 0.35rem;">3</span>
										</c:when>
										<c:when test="${loop.index == 3}">
											<span style="color: #e19d29; padding-left: 0.35rem;">4</span>
										</c:when>
										<c:when test="${loop.index == 4}">
											<span style="color: #5e799e; padding-left: 0.35rem;">5</span>
										</c:when>
										<c:otherwise>
											<span style="color: #6d6d6d; padding-left: 0.35rem;">${loop.index + 1 }</span>
										</c:otherwise>
									</c:choose>
								
									
									
								</div>
								<div class="bhm-related-bxh-item-detail ml-lg-3">
									<div class="bhm-related-bxh-item-name" style="white-space: nowrap;width: 10.5rem;overflow: hidden;text-overflow: ellipsis;">
										<a href="${pageContext.request.contextPath}/bai-hat?id=${itemTopWeek.song_id}">
											${itemTopWeek.song_name }
										</a>
									</div>
									<div class="bhm-related-bxh-item-singer">
										<c:set var="singer_id_string"
											value="${itemTopWeek.singer_id }" />
										<c:set var="singer_id_list"
											value="${fn:split(singer_id_string, ',')}" />

										<c:set var="singer_nick_name_string" value="" />
										<c:set var="singer_nick_name_list"
											value="${itemTopWeek.singer_nick_name}" />
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
							<div class="bhm-related-bxh-item-view">
								<i class="fa fa-headphones"></i>
								<span>${itemTopWeek.listen_count_week }</span>
							</div>
						</div>
					
					
					
					</c:if>
				
				
				
				
				</c:forEach>
				
				

				

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