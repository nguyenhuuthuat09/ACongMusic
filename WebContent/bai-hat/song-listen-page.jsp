<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<!-- Thẻ meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
	<meta name="description" content="A+ Music - Share your love to the world">
	<meta name="author" content="NHT">
	<title>${song.song_name} - A+ Music</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/audio-player.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bai-hat.css">
	

</head>
<body>
	
	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>
	
	
	<c:set var="song" value="${requestScope.song }" />

	<!-- body -->
	<div class="content">
		<div class="song-player col-sm-12">
			<div class="song-player-container d-flex py-xl-4 pl-xl-4 py-lg-3 pl-lg-2 py-md-2 pl-md-2 py-sm-2 pr-sm-2">

				<div class="song-img song-img-1 pt-2 pt-sm-0 d-none d-md-flex" >
					<img src="${pageContext.request.contextPath}/img/bai-hat/${song.song_img_path}" alt="${song.song_name}" width="250rem" height="250rem">
				</div>
				

				<div class="song-player-info ml-xl-4 ml-lg-3 col-xl-9 col-lg-9">
					<div class="song-player-name ">
						<span><h2>${song.song_name}</h2></span>
					</div>
					
					<div class="song-player-singer">
						<span class="song-player-singer-casi">Ca sĩ: </span>
						
						<c:set var="singer_id_string" value="${song.singer_id }" />
						<c:set var="singer_id_list" value="${fn:split(singer_id_string, ',')}" />
		
						<c:set var="singer_nick_name_string" value="" />
						<c:set var="singer_nick_name_list" value="${song.singer_nick_name}" />
						<c:forEach var="singer_nick_name" items="${singer_nick_name_list}" varStatus="status">
							
							<span> 
								<a href="${pageContext.request.contextPath}/nghe-si?id=${singer_id_list[status.index]}" style="color: #666666; text-decoration: none;">
									${singer_nick_name}
								</a>
							</span>
							<c:set var="singer_nick_name_string" value="${singer_nick_name_string}${singer_nick_name}" />
							<c:if test="${not status.last}">
								<span style="color: #666666">,</span>
								<c:set var="singer_nick_name_string" value="${singer_nick_name_string}, " />
							</c:if>

						</c:forEach>					
					</div>

					<div class="song-player-container-row-1 mt-md-1 d-md-flex">
						<div class="song-player-kind">
							<span class="song-player-kind-theloai">Thể Loại: </span>
							<span class="song-player-kind-name">
								<c:set var="music_type_name_list" value="${song.music_type_name}"  />
								<c:forEach var="music_type_name" items="${music_type_name_list}" varStatus="loop">
									<span>${music_type_name}</span>
									<c:if test="${not loop.last}">
										<span style="color: #666666">,</span> 				
									</c:if>	
								</c:forEach>
							</span>
						</div>

						<div class="song-player-view">
							<span class="song-player-view-luotnghe">Lượt nghe: </span>
							<span class="song-player-view-number">
								${song.listen_count_sum} lượt
							</span>
						</div>
					</div>

					

					<div class="song-player-container-row-2 d-md-flex">
						


						<div class="social-share">
							<ul class="share-buttons">
								<span>Chia sẻ: </span>
								<li><a href="https://www.facebook.com/sharer/sharer.php?u=&quote=" target="_blank" title="Share on Facebook" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(document.URL) + '&quote=' + encodeURIComponent(document.URL)); return false;"><i class="fa fa-facebook-square" aria-hidden="true"></i><span class="sr-only">Share on Facebook</span></a></li>
								<li><a href="https://twitter.com/intent/tweet?source=&text=:%20" target="_blank" title="Tweet" onclick="window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(document.title) + ':%20' + encodeURIComponent(document.URL)); return false;"><i class="fa fa-twitter-square" aria-hidden="true"></i><span class="sr-only">Tweet</span></a></li>
								<li><a href="https://plus.google.com/share?url=" target="_blank" title="Share on Google+" onclick="window.open('https://plus.google.com/share?url=' + encodeURIComponent(document.URL)); return false;"><i class="fa fa-google-plus-square" aria-hidden="true"></i><span class="sr-only">Share on Google+</span></a></li>
								<li><a href="http://pinterest.com/pin/create/button/?url=&description=" target="_blank" title="Pin it" onclick="window.open('http://pinterest.com/pin/create/button/?url=' + encodeURIComponent(document.URL) + '&description=' +  encodeURIComponent(document.title)); return false;"><i class="fa fa-pinterest-square" aria-hidden="true"></i><span class="sr-only">Pin it</span></a></li>
								<li><a href="http://www.linkedin.com/shareArticle?mini=true&url=&title=&summary=&source=" target="_blank" title="Share on LinkedIn" onclick="window.open('http://www.linkedin.com/shareArticle?mini=true&url=' + encodeURIComponent(document.URL) + '&title=' +  encodeURIComponent(document.title)); return false;"><i class="fa fa-linkedin" aria-hidden="true"></i><span class="sr-only">Share on LinkedIn</span></a></li>
							</ul>
						</div>

					</div>

					<!-- hiển thị với màn hình trên 768px -->
					<div class="mediatec-cleanaudioplayer pb-2 pb-sm-0 mt-md-4 d-none d-md-block">
						<ul data-theme="default" >
							<li data-url="${pageContext.request.contextPath}/audio/${song.song_path}" data-type="mp3" data-title="${song.song_name} - ${singer_nick_name_string}"  data-free="true"></li>
						</ul>
					</div>

				</div>

				<!-- hiển thị với màn hình nhỏ hơn 768px -->
				<div class="song-img song-img-2 mr-3 d-none d-flex d-md-none" >
					<img src="${pageContext.request.contextPath}/img/bai-hat/${song.song_img_path}" alt="${song.song_name} - ${singer_nick_name_string}" width="250rem" height="250rem">
				</div>
		
			</div>

			<!-- hiển thị với màn hình nhỏ hơn 768px -->
			<div class="mediatec-cleanaudioplayer pb-sm-2 mt-md-4 d-none d-block d-md-none">
				<ul data-theme="default">
					<li data-url="${pageContext.request.contextPath}/audio/${song.song_path}" data-type="mp3" data-title="${song.song_name} - ${singer_nick_name_string}" data-free="true"></li>
				</ul>
			</div>

		</div>

		<!-- song related -->
		<div class="song-related mt-lg-3 mt-sm-3 d-lg-flex">
			<div class="next-recommend-song ml-xl-4 ml-lg-3 ml-md-3 ml-sm-0 ml-3">


				<div class="next-recommend-song-title ml-xl-2 d-inline-block">
					<h4 class="mb-3 d-lg-block d-none" style="border-bottom: 1px solid #cbcbcb;">
						Bài hát Mới
					</h4>
					<h5 class="mb-3 d-lg-none d-inline-block" style="border-bottom: 1px solid #cbcbcb; white-space: nowrap;">
						Bài hát Mới
					</h5>
				</div>

				<c:set var="listBaiHatMoiCungQuocGia" value="${requestScope.listBaiHatMoiCungQuocGia }" />

				
				<div class="next-recommend-song-list ml-xl-2 mr-xl-4 mr-lg-4 d-lg-block d-sm-flex justify-content-sm-around" style="">
					
					<c:if test="${not empty listBaiHatMoiCungQuocGia[0] }">
						<div class="next-recommend-song-item d-lg-flex d-block justify-content-between mb-1" style="border-bottom: 1px solid #efefef;">
							<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
								<div class="next-recommend-song-item-name" style="white-space: nowrap;width: 11rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${listBaiHatMoiCungQuocGia[0].song_id}">
										${listBaiHatMoiCungQuocGia[0].song_name }
									</a>
								</div>
								<div class="next-recommend-song-item-singer">
									<c:set var="singer_id_string"
										value="${listBaiHatMoiCungQuocGia[0].singer_id }" />
									<c:set var="singer_id_list"
										value="${fn:split(singer_id_string, ',')}" />
	
									<c:set var="singer_nick_name_string" value="" />
									<c:set var="singer_nick_name_list"
										value="${listBaiHatMoiCungQuocGia[0].singer_nick_name}" />
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
	
							<div class="next-recommend-song-item-view" style="color: #249e74">
								<i class="fa fa-headphones"></i>
								<span>${listBaiHatMoiCungQuocGia[0].listen_count_sum}</span>
							</div>
						</div>
					</c:if>
					
					<c:if test="${not empty listBaiHatMoiCungQuocGia[1] }">
						<div class="next-recommend-song-item d-lg-flex d-block justify-content-between mb-1" style="border-bottom: 1px solid #efefef;">
							<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
								<div class="next-recommend-song-item-name" style="white-space: nowrap;width: 11rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${listBaiHatMoiCungQuocGia[1].song_id}">
										${listBaiHatMoiCungQuocGia[1].song_name }
									</a>
								</div>
								<div class="next-recommend-song-item-singer">
									<c:set var="singer_id_string"
										value="${listBaiHatMoiCungQuocGia[1].singer_id }" />
									<c:set var="singer_id_list"
										value="${fn:split(singer_id_string, ',')}" />
	
									<c:set var="singer_nick_name_string" value="" />
									<c:set var="singer_nick_name_list"
										value="${listBaiHatMoiCungQuocGia[1].singer_nick_name}" />
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
	
							<div class="next-recommend-song-item-view" style="color: #1da0d9">
								<i class="fa fa-headphones"></i>
								<span>${listBaiHatMoiCungQuocGia[1].listen_count_sum}</span>
							</div>
						</div>
					</c:if>
					
					
					<c:if test="${not empty listBaiHatMoiCungQuocGia[2] }">
						<div class="next-recommend-song-item d-lg-flex d-block justify-content-between mb-1" style="border-bottom: 1px solid #efefef">
							<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
								<div class="next-recommend-song-item-name" style="white-space: nowrap;width: 11rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${listBaiHatMoiCungQuocGia[2].song_id}">
										${listBaiHatMoiCungQuocGia[2].song_name }
									</a>
								</div>
								<div class="next-recommend-song-item-singer">
									<c:set var="singer_id_string"
										value="${listBaiHatMoiCungQuocGia[2].singer_id }" />
									<c:set var="singer_id_list"
										value="${fn:split(singer_id_string, ',')}" />
	
									<c:set var="singer_nick_name_string" value="" />
									<c:set var="singer_nick_name_list"
										value="${listBaiHatMoiCungQuocGia[2].singer_nick_name}" />
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
	
							<div class="next-recommend-song-item-view" style="color: #e19d29">
								<i class="fa fa-headphones"></i>
								<span>${listBaiHatMoiCungQuocGia[2].listen_count_sum}</span>
							</div>
						</div>
					</c:if>
					
					<c:if test="${not empty listBaiHatMoiCungQuocGia[3] }">
						<div class="next-recommend-song-item d-lg-flex justify-content-lg-between d-md-block d-sm-none mb-1" style="border-bottom: 1px solid #efefef">
							<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
								<div class="next-recommend-song-item-name" style="white-space: nowrap;width: 11rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${listBaiHatMoiCungQuocGia[3].song_id}">
										${listBaiHatMoiCungQuocGia[3].song_name }
									</a>
								</div>
								<div class="next-recommend-song-item-singer">
									<c:set var="singer_id_string"
										value="${listBaiHatMoiCungQuocGia[3].singer_id }" />
									<c:set var="singer_id_list"
										value="${fn:split(singer_id_string, ',')}" />
	
									<c:set var="singer_nick_name_string" value="" />
									<c:set var="singer_nick_name_list"
										value="${listBaiHatMoiCungQuocGia[3].singer_nick_name}" />
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
	
							<div class="next-recommend-song-item-view" style="color: #5e799e">
								<i class="fa fa-headphones"></i>
								<span>${listBaiHatMoiCungQuocGia[3].listen_count_sum}</span>
							</div>
						</div>
					</c:if>
					
					<c:if test="${not empty listBaiHatMoiCungQuocGia[4] }">
						<div class="next-recommend-song-item d-lg-flex justify-content-lg-between d-sm-none mb-1" style="border-bottom: 1px solid #efefef">
							<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
								<div class="next-recommend-song-item-name" style="white-space: nowrap;width: 11rem;overflow: hidden;text-overflow: ellipsis;">
									<a href="${pageContext.request.contextPath}/bai-hat?id=${listBaiHatMoiCungQuocGia[4].song_id}">
										${listBaiHatMoiCungQuocGia[4].song_name }
									</a>
								</div>
								<div class="next-recommend-song-item-singer">
									<c:set var="singer_id_string"
										value="${listBaiHatMoiCungQuocGia[4].singer_id }" />
									<c:set var="singer_id_list"
										value="${fn:split(singer_id_string, ',')}" />
	
									<c:set var="singer_nick_name_string" value="" />
									<c:set var="singer_nick_name_list"
										value="${listBaiHatMoiCungQuocGia[4].singer_nick_name}" />
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
	
							<div class="next-recommend-song-item-view" style="color: #6d6d6d">
								<i class="fa fa-headphones"></i>
								<span>${listBaiHatMoiCungQuocGia[4].listen_count_sum}</span>
							</div>
						</div>
					</c:if>
					
					

					

					

						
				</div>

			</div>

			<div class="song-upload-info col-lg-9 mt-lg-0 mt-3">
				<div class="song-uploader d-sm-flex">
					<div class="song-uploader-info col-md-2 mr-xl-3 pr-xl-0 mr-lg-5 pr-lg-0 mr-md-5 d-sm-block d-flex">
						<div class="song-uploader-avatar">
							<a href="#"><img src="${pageContext.request.contextPath}/img/avatar/${requestScope.userUpload.user_img_path}" class="rounded-circle" width="100rem" height="100rem" alt=""></a>
						</div>
						<div class="d-md-block">
							<div class="song-uploader-info-detail">
								<div class="song-uploader-name mt-sm-2 p-0">
									<a style="text-decoration: none; color: #212529; white-space: nowrap;" href="#">${requestScope.userUpload.username}</a>
								</div>
								
								<!-- Chức năng bị ẩn do k kịp thời gian làm -->
								<div class="song-uploader-follow mt-2 d-none" style="white-space: nowrap;">
									<button class="btn" id="button-follow" data-text-swap="Following" data-text-original="Follow">Follow</button>
									<i class="fa fa-user">
									</i>
									<span class="song-uploader-follow-count">1296</span>
								</div>
							</div>

							<div class="song-upload-report"  style="margin-top: 5rem;">
							
								<form action="${pageContext.request.contextPath}/report" method="post">
									<input type="hidden" name="song_id_report" value="${song.song_id }">
									<input type="hidden" name="user_id_report" value="${userUpload.user_id}">									
									<button class="btn btn-sm" type="submit">report</button>
								</form>
								
							</div>
						</div>
					</div>

					<div class="song-uploader-more mt-xl-1 mt-lg-0 mt-sm-1">
						<div class="song-uploader-content shortent-text-song-about">
							<p class="collapse" id="collapse-song-uploader-more">
								${song.song_about}
							</p>
							<a class="collapsed" data-toggle="collapse" href="#collapse-song-uploader-more" aria-expanded="false" aria-controls="collapse-song-uploader-more"></a>
						</div>

						<div class="song-upload-lyrics shortent-text-song-lyrics mt-lg-5 mt-md-4 mt-sm-4 mt-3">
							<span><h4>Lời bài hát</h4></span>
							<p class="collapse" id="collapse-song-upload-lyrics">
								${song.song_lyrics}
							</p>
							<a class="collapsed" data-toggle="collapse" href="#collapse-song-upload-lyrics" aria-expanded="false" aria-controls="collapse-song-upload-lyrics">
							</a>	
						</div>

<!-- temp feature -->
						<div class="song-upload-copyright">
							<div class="song-upload-credit">
								<div class="song-credit-youtube">
										
								</div>
									
							</div>

							<div class="song-upload-by-singer">
							</div>
						</div>
<!-- end temp feature -->


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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.audioplayer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.baihat.js"></script>
	

	



</body>
</html>