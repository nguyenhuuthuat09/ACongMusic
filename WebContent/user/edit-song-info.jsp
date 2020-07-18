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
	<title>A+ Music - Sửa thông tin bài hát</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">

	<style>
		.profile-menu a:hover {
			font-weight: bold;
		}
	</style>


	<style>
		.form-control:focus {
			box-shadow: none;
		}
	</style>

</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->
	<div class="edit-song-info row justify-content-center">
		<div class="edit-song-info-container col-6">
			<h3 class="mb-3">Chỉnh sửa thông tin bài hát</h3>
			
			<div class="alert-success mt-3 mb-3">${messageUpdate }</div>
			<div class="alert-danger mt-3 mb-3">${errorUpdate }</div>
			<div class="alert-danger mt-3 mb-3">${errorSingerID }</div>
			
			<div class="edit-song-info-form" style="border-bottom: 1px solid #ced4da; padding-bottom: 2rem;">
				<form action="${pageContext.request.contextPath}/updateSongInfo" method="post" class="needs-validation" novalidate>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom01">Tên bài hát</label>
							<input type="text" name="song_name" value="${song.song_name }" class="form-control" id="validationCustom01" placeholder="Tên bài hát" required>
							<input type="hidden" name="song_id" value="${song.song_id }">
							<div class="invalid-feedback">
								Tên bài hát không được để trống.
							</div>
						</div>
					</div>
					<div class="mb-3">
						<span>Danh sách nghệ sĩ hiện tại: </span>
						<c:set var="singer_nick_name_list" value="${song.singer_nick_name }" />
						<c:forEach var="singer_nick_name" items="${singer_nick_name_list}" varStatus="status">

							<span class="profile-bai-hat-item-singer"> 
								<a href="#" style="color: #666666; text-decoration: none;">${singer_nick_name}</a>
							</span>
							<c:if test="${not status.last}">
								<span style="color: #666666">,</span>
							</c:if>

						</c:forEach>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom101">ID ca sĩ:</label>
							<input type="text" name="singer_id" value="${song.singer_id }" class="form-control" id="validationCustom101" placeholder="ID ca sĩ" required>
							<small id="" class="form-text text-muted">
								<span class="text-danger">Hướng dẫn:</span><br/>
								- Nhập tên ca sĩ vào ô Tìm kiếm ca sĩ bên dưới<br/>
								- Thông tin về ca sĩ bao gồm: Tên ca sĩ, tên thật và ID của ca sĩ sẽ hiện ra.
								- Copy ID của ca sĩ hiện ra và nhập vào ô ID ca sĩ ở bên trên.
								- Hai ID ca sĩ cạnh nhau phải được ngăn cách nhau bởi dấu phẩy.
								- Ví dụ:
								+ Nếu chỉ có 1 ca sĩ: thì chỉ cần nhập ID ca sĩ đó vào ô bên trên.
								+ Nếu có 3 ID ca sĩ: 1,2,3 (Hai ID ca sĩ cạnh nhau phải được ngăn cách nhau bởi dấu phẩy).
							</small>
							<div class="invalid-feedback">
								ID ca sĩ không được để trống.
							</div>
						</div>
					</div>

					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom02">Tìm kiếm ca sĩ</label>
							<input type="text" name="singer_name" id="singer_name" class="form-control" id="validationCustom02" placeholder="Nhập tên ca sĩ để tìm kiếm" onkeyup="searchInfo()">	
						</div>
					</div>
					
					<span id="ajaxSearchResult"></span>  
					
					<div class="text-danger mt-2 mb-3">
						${errorMusicType }
					</div>
					
					<!-- Để giá trị check box music type được tích sẵn và đúng với bài hát -->
					<!-- &quot; là kí tự " dùng để escape html -->
					<!-- chỉ cần có checked="" là ô sẽ được tích dù là fasle hay true -->
					<!-- vì thế thay vì set các biết có value là true hay false, -->
					<!-- chúng ta cần set thành cả cụm luôn -->
					
					<c:set var="music_id" value="${song.music_id}"  />
					<c:set var="music_id_list" value="${fn:split(music_id, ',')}"  />
					<c:forEach var="music_id_item" items="${music_id_list}" varStatus="loop">
						<c:choose>
						   <c:when test="${music_id_item eq '1' }"><c:set var="Checked1" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '2' }"><c:set var="Checked2" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '3' }"><c:set var="Checked3" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '4' }"><c:set var="Checked4" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '5' }"><c:set var="Checked5" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '6' }"><c:set var="Checked6" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '7' }"><c:set var="Checked7" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '8' }"><c:set var="Checked8" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '9' }"><c:set var="Checked9" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '10' }"><c:set var="Checked10" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '11' }"><c:set var="Checked11" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '12' }"><c:set var="Checked12" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '13' }"><c:set var="Checked13" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '14' }"><c:set var="Checked14" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '15' }"><c:set var="Checked15" value="checked=&quot;true&quot;"/></c:when>
						   <c:when test="${music_id_item eq '16' }"><c:set var="Checked16" value="checked=&quot;true&quot;"/></c:when>
						   <c:otherwise><c:set var="Checked16" value="checked=&quot;true&quot;"/></c:otherwise>
						</c:choose>
						
					</c:forEach>
					
					<div class="form-row mb-3">
						<label class="" for="exampleFormControlSelect11">Thể loại</label>
						<div>
							<span class="d-inline-block" style="width:5rem">Việt Nam:</span>
							<input type="checkbox" ${Checked1} name="music_type" value="1">
							<label class="ml-1 mr-2">Nhạc trẻ</label> 
							
							<input type="checkbox" ${Checked2} name="music_type" value="2">
							<label class="ml-1 mr-2">Nhạc Trịnh</label> 
							
							<input type="checkbox" ${Checked3} name="music_type" value="3">
							<label class="ml-1 mr-2">Tiền chiến</label> 
							
							<input type="checkbox" ${Checked4} name="music_type" value="4">
							<label class="ml-1 mr-2">Thiếu nhi</label>
							
							<input type="checkbox" ${Checked5} name="music_type" value="5">
							<label class="ml-1 mr-2">Hip Hop/Rap</label>
							
						
						</div>
						<div>		
							<span class="d-inline-block" style="width:5rem">Âu Mỹ:</span>
							<input type="checkbox" ${Checked6} name="music_type" value="6">
							<label class="ml-1 mr-2">Pop</label> 
							
							<input type="checkbox" ${Checked7} name="music_type" value="7">
							<label class="ml-1 mr-2">Rock</label> 
							
							<input type="checkbox" ${Checked8} name="music_type" value="8">
							<label class="ml-1 mr-2">Electronica/Dance</label> 
							
							<input type="checkbox" ${Checked9} name="music_type" value="9">
							<label class="ml-1 mr-2">R&B/Hip Hop/Rap</label>							
						
						</div>
						<div>
							<span class="d-inline-block" style="width:5rem">Châu á:</span>
							<input type="checkbox" ${Checked10} name="music_type" value="10">
							<label class="ml-1 mr-2">Nhạc Hàn</label> 
							
							<input type="checkbox" ${Checked11} name="music_type" value="11">
							<label class="ml-1 mr-2">Nhạc Hoa</label> 
							
							<input type="checkbox" ${Checked12} name="music_type" value="12">
							<label class="ml-1 mr-2">Nhạc Nhật</label> 
						</div>
						<div>
							<span class="d-inline-block" style="width:5rem">Khác:</span>
							<input type="checkbox" ${Checked13} name="music_type" value="13">
							<label class="ml-1 mr-2">Không lời</label> 
							
							<input type="checkbox" ${Checked14} name="music_type" value="14">
							<label class="ml-1 mr-2">Nhạc Phim</label> 
							
							<input type="checkbox" ${Checked15} name="music_type" value="15">
							<label class="ml-1 mr-2">Beat</label> 
							
							<input type="checkbox" ${Checked16} name="music_type" value="16">
							<label class="ml-1 mr-2">Thể loại khác</label> 
						</div>
						
					</div>
					
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom102">Giới thiệu về bài hát</label>
							<textarea rows="3" type="text" name="song_about" class="form-control" id="validationCustom102" placeholder="Hoàn cảnh sáng tác,...">${song.song_about}</textarea>
							
						</div>
					</div>
					
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom5">Lời bài hát</label>
							<textarea rows="10" type="text" name="song_lyrics" class="form-control" id="validationCustom5" placeholder="Lời bài hát">${song.song_lyrics}</textarea>
						</div>
					</div>
					<button class="btn btn-primary" type="submit">Cập nhật</button>
				</form>

			</div>



			<form action="${pageContext.request.contextPath}/deleteSong"
				method="post"
				class="profile-quan-ly-tai-khoan-xoa-tai-khoan mt-2 needs-validation"
				novalidate>
				<input type="hidden" name="song_id" value="${song.song_id }">
				<h4 class="mt-5">Xóa bài hát</h4>
				<p class="text-danger">Sau khi được xóa, mọi dữ liệu bài hát sẽ
					không thể khôi phục lại được.</p>
				<p class="text-danger">Nếu bạn có ý định đăng lại sau khi xóa
					thì bài hát cũng sẽ không thể khôi phục lại được thứ hạng, lượt
					nghe,... có được trước đó.</p>
				<button class="btn btn-primary" type="submit">Xóa bài hát</button>
			</form>
		</div>
	</div>



































	<!-- footter -->
	<div class="footer" style="margin-top: 6rem;">
		<div class="footer-container d-lg-flex justify-content-lg-between">
			<div class="copyright ml-lg-5 text-center">
				<span>&#169; 2018 A+ Music - share your ♥ to the world</span>
			</div>
			<div class="footer-link mr-lg-5 text-center">
				<a href="#">Trang chủ</a>
				<span>•</span>
				<a href="#">Chính sách</a>
				<span>•</span>
				<a href="#">Điều khoản dịch vụ</a>
				<span>•</span>
				<a href="#">Copyright</a>
				<span>•</span>
				<a href="#">Liên hệ</a>
			</div>

		</div>
	</div>

	<!-- back to top -->
	<div class="btt-class">
		<a id="back-to-top" href="#" class="btn back-to-top" role="button" title="Back to top" data-toggle="tooltip" data-placement="left">
			<i class="fa fa-angle-up"></i>
		</a>
	</div>


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
	
	<!-- ajax search singer -->
	<script type="text/javascript">  
		var request=new XMLHttpRequest();  
		function searchInfo(){  
		var singer_name = document.getElementById("singer_name").value;  
		var url="${pageContext.request.contextPath}/ajaxSearchSinger?name="+singer_name;  
		  
		try{  
			request.onreadystatechange=function(){  
				if(request.readyState==4){  
				var name=request.responseText;  
				document.getElementById('ajaxSearchResult').innerHTML=name;  
			}  
		}//end of function  
			request.open("GET",url,true);  
			request.send();  
		} catch(e){
			alert("Unable to connect to server");
			}  
		}  
	</script>  




	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>