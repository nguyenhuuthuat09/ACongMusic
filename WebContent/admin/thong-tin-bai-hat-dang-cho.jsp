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
	<title>A+ Music - Thông tin bài hát đang chờ</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/audio-player.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bai-hat.css">
	
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
	<div class="adm-profile d-flex justify-content-center" style="background-color: #fcfcfc">
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
			
			<c:set var="song" value="${requestScope.song }" />
			
			<div class="adm-profile-chi-tiet-report mt-2">
				<div class="adm-profile-chi-tiet-report-container">
					<div class="mb-3 mt-3 text-primary">
						Thông tin bài hát
					</div>
					<div class="report_info mr-4 mb-2">
						<div class="mb-3">
							<span>ID người dùng upload: </span>
							<span>${song.user_id_upload }</span>
						</div>
						<div class="mb-3">
							<span>Tên người dùng upload: </span>
							<span>${profile.username }</span>
						</div>
						<div class="mb-3">
							<span>Email người dùng upload: </span>
							<span>${profile.email }</span>
						</div>
						<div class="mb-3">
							<span>ID bài hát trên hệ thống chờ: </span>
							<span> ${song.song_id } </span>
						</div>
						<div class="mb-3">
							<span>Tên bài hát: </span>
							<span> ${song.song_name } </span>
						</div>
						<div class="mb-3">
							<span>Thể loại nhạc: </span>
							<c:set var="music_type_name_list" value="${song.music_type_name}"  />
							<c:forEach var="music_type_name" items="${music_type_name_list}" varStatus="loop">
								<span>${music_type_name}</span>
								<c:if test="${not loop.last}">
									<span style="color: #666666">,</span> 				
								</c:if>	
							</c:forEach>
						</div>
						<div class="mb-3">
							<span>Danh sách nghệ sĩ: </span>
							<c:set var="singer_id_string"
								value="${song.singer_id }" />
							<c:set var="singer_id_list"
								value="${fn:split(singer_id_string, ',')}" />

							<c:set var="singer_nick_name_string" value="" />
							<c:set var="singer_nick_name_list"
								value="${song.singer_nick_name}" />
							<c:forEach var="singer_nick_name"
								items="${singer_nick_name_list}" varStatus="status">

								<span> <a
									href="${pageContext.request.contextPath}/nghe-si?id=${singer_id_list[status.index]}"
									style="color: #666666; text-decoration: none;" target="_blank">
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
						<div class="mb-3">
							<div class="mb-1">Ảnh bài hát: </div>
							<img src="${pageContext.request.contextPath}/img/bai-hat/${song.song_img_path}" alt="${song.song_name} - ${singer_nick_name_string}" width="200rem" height="200rem">
						</div>
						
						<div class="mb-2">
							Nghe thử:
						</div>
						<div class="mediatec-cleanaudioplayer pb-2 pb-sm-0 mt-md-4 mb-3">
							<ul data-theme="default" >
								<li data-url="${pageContext.request.contextPath}/audio/${song.song_path}" data-type="mp3" data-title="${song.song_name}"  data-free="true"></li>
							</ul>
						</div>
						
						
						

						<div class="mb-3">
							<div class="mb-2">Giới thiệu về bài hát: </div>
							<c:if test="${empty song.song_about }">
								 Hiện chưa có thông tin. 
							</c:if>
							<c:if test="${not empty song.song_about }">
								 <span>${song.song_about }</span> <br/>
							</c:if>
							
						</div>
						<div class="mb-3">
							<div class="mb-2">Lời bài hát: </div>
							<c:if test="${empty song.song_lyrics }">
								  Bài hát hiện chưa có lời. 
							</c:if>
							<c:if test="${not empty song.song_lyrics }">
								 <span>${song.song_lyrics }</span> <br/>
							</c:if>
							
						</div>
						
					</div>	
					
					<div class="alert-danger mt-3 mb-2">
						${requestScope.errorVerifyAccept }
					</div>
					<div class="alert-danger mt-3 mb-2">
						${requestScope.errorHandle}
					</div>
					
					<div class="da-xu-ly mt-3 mb-5">
						<form action="${pageContext.request.contextPath}/admin/handle_song_queue" method="post" class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation" novalidate>
							<span style="font-size: 1.5rem; border-bottom: 1px solid #e1e4e8">Phê duyệt bài hát.</span>
							<div class="form-row">
								<div class="col mb-2">
									<input type="text" name="verifyAccept" class="form-control" id="validationCustom03" placeholder="accept" required>
									<small id="" class="form-text text-muted">
										Nhập "accept" và ô trên để xác nhận.
										<br/>Lưu ý: bạn cần gửi email bằng tay tới email người dùng để thông báo.
										<br/>
										
									</small>
									<div class="invalid-feedback">
										Vui lòng xác nhận.
									</div>
									
									<input type="hidden" name="handle_song_queue_type" value="accept">
									
									<input type="hidden" name="song_id" value="${song.song_id }">
									
								</div>
							</div>
							<button class="btn btn-primary" type="submit">Phê duyệt bài hát.</button>
						</form>
					</div>
					
					<div class="alert-danger mt-3 mb-2">
						${requestScope.errorVerifyDeleteSong}
					</div>

					<div class="da-xu-ly mb-5">
						<form action="${pageContext.request.contextPath}/admin/handle_song_queue" method="post" class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation" novalidate>
							<span style="font-size: 1.5rem; border-bottom: 1px solid #e1e4e8">Xóa bài hát</span>
							<div class="form-row">
								<div class="col mb-2">
									<input type="text" name="verifyDeleteSong" class="form-control" id="validationCustom03" placeholder="delete song" required>
									<small id="" class="form-text text-muted">
										Nhập "delete song" và ô trên để xác nhận xóa bài hát này
										<br/>bạn cần gửi email bằng tay tới email người dùng để thông báo bài hát không được chấp nhận.
										<br/>
									
									</small>
									<div class="invalid-feedback">
										Vui lòng xác nhận.
									</div>
									
									<input type="hidden" name="handle_song_queue_type" value="delete-song">
									
									<input type="hidden" name="song_id" value="${song.song_id }">
								
								</div>
							</div>
							<button class="btn btn-primary" type="submit">Xóa bài hát.</button>
						</form>
					</div>
					
					<div class="alert-danger mt-3 mb-2">
						${requestScope.errorVerifyDeleteUser}
					</div>
					
					<div class="da-xu-ly">
						<form action="${pageContext.request.contextPath}/admin/handle_song_queue" method="post" class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation" novalidate>
							<span style="font-size: 1.5rem; border-bottom: 1px solid #e1e4e8">Xóa người dùng</span>
							<div class="form-row">
								<div class="col mb-2">
									<input type="text" name="verifyDeleteUser" class="form-control" id="validationCustom03" placeholder="delete user" required>
									<small id="" class="form-text text-muted">
										Nhập "delete user" và ô trên để xác nhận người dùng này.
										<br/>
										Điều này sẽ xóa toàn bộ bài hát từng được chấp thuận và đang chờ phê duyệt của người dùng trên hệ thống.
										<br/>bạn cần gửi email bằng tay tới email người dùng để thông báo bài hát không được chấp nhận.
										<br/>
									
									</small>
									<div class="invalid-feedback">
										Vui lòng xác nhận.
									</div>
									
									<input type="hidden" name="handle_song_queue_type" value="delete-user">
									
									<input type="hidden" name="song_id" value="${song.song_id }">
								
								</div>
							</div>
							<button class="btn btn-primary" type="submit">Xóa người dùng.</button>
						</form>
					</div>

					
					
				</div>


			</div>
		</div>
	</div>




	<!-- footter -->
	<div style="margin-top: 8.5rem;">
	</div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.audioplayer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.baihat.js"></script>
	

</body>
</html>