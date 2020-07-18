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
	<title>A+ Music - Upload</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">

	

</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->

	<div class="upload">
		<div class="upload-container">
			<h3 class="text-center">Hướng dẫn</h3>
			<div class="upload-main col-11 row justify-content-lg-center mt-3">
				<div>
					<div class="d-flex">
						<div>
							<span>Lưu ý:&nbsp;</span>
						</div>
						<div>
							+ Định dạng file upload: .mp3, .wma, .mp2, .asf, .wav, .wmv, .mp4, .flv, .mpg, .mpe, .avi, .3gp, .dat, .flac.<br/>
							+ Bài hát sẽ được kiểm duyệt theo <span class="text-danger">Quy định</span> trong 48h trước khi được chính thức đăng lên.		
						</div>
					</div>

					<div class="d-flex mt-3">
						<div>
							<span>Quy định:&nbsp;</span>
						</div>
						<div>
							+ Bài hát không vi phạm các nội dung ở Điều khoản dịch vụ sẽ bị xóa ngay lập tức.
							<br/>
							+ Người dùng cố tình đăng tải nhạc vi phạm Điều khoản dịch vụ quá 5 lần sẽ bị xóa tài khoản.
						</div>
					</div>
				</div>



				
			</div>

			<h3 class="mb-2 mt-3 text-center">Upload bài hát</h3>
			<div class="d-flex justify-content-center mt-4">

				<form action="${pageContext.request.contextPath}/upload-song" method="post" name="uploadForm" class="needs-validation col-6" enctype="multipart/form-data" novalidate>
					<div>
						<span style="font-size:1.1rem">Chọn file nhạc để upload:</span>
					</div>
					<div class="text-danger mt-2 mb-3">
						${errorAudio }
					</div>
					<div class="form-row mb-3">
						<input type="file" name="audioFile" accept=".mp3,audio/*" class="form-control-file d-inline-block" id="exampleFormControlFile18" required>
						<small id="" class="form-text text-muted">
							<span class="text-danger">Lưu ý:</span><br/>
							- Chỉ chấp nhận file có định dạng .mp3.<br/>
						</small>
						<div class="invalid-feedback">
							Vui lòng chọn file nhạc.
						</div>
					</div>

					<div>		
						<span style="font-size:1.1rem">Chọn file ảnh đại diện cho bài hát để upload:</span>
					</div>
					<div class="text-danger mt-2 mb-3">
						${errorImage }
					</div>
					<div class="form-row mb-3">
						<input type="file" name="image" accept="image/x-png,image/jpeg" class="form-control-file d-inline-block" id="exampleFormControlFile1" required>
						<small id="" class="form-text text-muted">
							<span class="text-danger">Lưu ý:</span><br/>
							- Ảnh nên có kích thước 500x500 px.<br/>
							- Chỉ chấp nhận ảnh có định dang .png và .jpg.
						</small>
						<div class="invalid-feedback">
							Vui lòng chọn ảnh.
						</div>
					</div>

					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom01">Tên bài hát</label>
							<input type="text" name="song_name" class="form-control" id="validationCustom01" placeholder="Tên bài hát" required>
							<div class="invalid-feedback">
								Tên bài hát không được để trống.
							</div>
						</div>
					</div>
					
					<div class="alert-danger mt-3 mb-3">${requestScope.errorSingerID}</div>
					
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom101">ID ca sĩ:</label>
							<input type="text" name="singer_id" class="form-control" id="validationCustom101" placeholder="ID ca sĩ" required>
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
					<div class="form-row mb-3">
						<label class="" for="exampleFormControlSelect11">Thể loại</label>
						<div>
							<span class="d-inline-block" style="width:5rem">Việt Nam:</span>
							<input type="checkbox" name="music_type" value="1">
							<label class="ml-1 mr-2">Nhạc trẻ</label> 
							
							<input type="checkbox" name="music_type" value="2">
							<label class="ml-1 mr-2">Nhạc Trịnh</label> 
							
							<input type="checkbox" name="music_type" value="3">
							<label class="ml-1 mr-2">Tiền chiến</label> 
							
							<input type="checkbox" name="music_type" value="4">
							<label class="ml-1 mr-2">Thiếu nhi</label>
							
							<input type="checkbox" name="music_type" value="5">
							<label class="ml-1 mr-2">Hip Hop/Rap</label>
							
						
						</div>
						<div>		
							<span class="d-inline-block" style="width:5rem">Âu Mỹ:</span>
							<input type="checkbox" name="music_type" value="6">
							<label class="ml-1 mr-2">Pop</label> 
							
							<input type="checkbox" name="music_type" value="7">
							<label class="ml-1 mr-2">Rock</label> 
							
							<input type="checkbox" name="music_type" value="8">
							<label class="ml-1 mr-2">Electronica/Dance</label> 
							
							<input type="checkbox" name="music_type" value="9">
							<label class="ml-1 mr-2">R&B/Hip Hop/Rap</label>							
						
						</div>
						<div>
							<span class="d-inline-block" style="width:5rem">Châu á:</span>
							<input type="checkbox" name="music_type" value="10">
							<label class="ml-1 mr-2">Nhạc Hàn</label> 
							
							<input type="checkbox" name="music_type" value="11">
							<label class="ml-1 mr-2">Nhạc Hoa</label> 
							
							<input type="checkbox" name="music_type" value="12">
							<label class="ml-1 mr-2">Nhạc Nhật</label> 
						</div>
						<div>
							<span class="d-inline-block" style="width:5rem">Khác:</span>
							<input type="checkbox" name="music_type" value="13">
							<label class="ml-1 mr-2">Không lời</label> 
							
							<input type="checkbox" name="music_type" value="14">
							<label class="ml-1 mr-2">Nhạc Phim</label> 
							
							<input type="checkbox" name="music_type" value="15">
							<label class="ml-1 mr-2">Beat</label> 
							
							<input type="checkbox" name="music_type" value="16">
							<label class="ml-1 mr-2">Thể loại khác</label> 
						</div>
						
					</div>
					
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom102">Giới thiệu về bài hát</label>
							<textarea rows="3" type="text" name="song_about" class="form-control" id="validationCustom102" placeholder="Hoàn cảnh sáng tác,..."></textarea>
							
						</div>
					</div>
					
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom5">Lời bài hát</label>
							<textarea rows="10" type="text" name="song_lyrics" class="form-control" id="validationCustom5" placeholder="Lời bài hát"></textarea>
						</div>
					</div>
					
					<button class="btn btn-primary btn-sm" type="submit">Upload</button>
				</form>
			</div>



		</div>
	</div>



































	<!-- footter -->
	<div style="margin-top: 8.5rem;"></div>
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