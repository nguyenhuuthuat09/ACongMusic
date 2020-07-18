<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<!-- Thẻ meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
	<meta name="description" content="A+ Music - Share your love to the world">
	<meta name="author" content="NHT">
	<title>Hành tinh song song - Thái Vũ</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/audio-player.css">
	<link rel="stylesheet" type="text/css" href="css/bai-hat.css">


</head>
<body>
	
	<!-- menu bar -->
		<nav class="navbar navbar-expand-lg navbar-light bg-white justify-content-start header-bar">

		<!-- Toggler/collapsibe Button -->
		<!-- Màn hình nhỏ thì menu tự thu vào một nút collapse-->
        <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

		<!-- logo -->
		<a class="navbar-brand ml-xl-1 order-2 order-lg-1" href="home.html">
			<img src="img/logo.png" alt="A+ Music - Share youre love to the world" title="A+ Music - Share youre love to the world" width="125rem" height="50rem">
		</a>

        <!-- Menu - Navbar-link -->
        <div class="collapse navbar-collapse ml-xl-3 order-4 order-sm-5 order-lg-2" id="navbarResponsive">

        	<!-- Dropdown Menu -->
         	<ul class="navbar-nav">
         		<li class="nav-item">
         			<a href="#" class="nav-link">Bài hát mới</a>
         		</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle disable-click-show-dropdown-menu" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Bảng xếp hạng
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="bang-xep-hang/nhac-tre.html">Việt Nam</a>
						<a class="dropdown-item" href="bang-xep-hang/pop.html">Âu Mỹ</a>
						<a class="dropdown-item" href="bang-xep-hang/nhac-han.html">Châu Á</a>
					</div>
				</li>
         		<li class="nav-item dropdown dropdown-menu-table">
					<a class="nav-link dropdown-toggle disable-click-show-dropdown-table" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Thể loại
					</a>
					<div class="dropdown-menu" id="the-loai" aria-labelledby="navbarDropdownMenuLink">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<th>VIỆT NAM</th>
									<th>ÂU MỸ</th>
									<th>CHÂU Á</th>
									<th>KHÁC</th>
								</tr>
								<tr>
									<td><a href="the-loai/nhac-tre.html">Nhạc trẻ</a></td>
									<td><a href="the-loai/pop.html">Pop</a></td>
									<td><a href="the-loai/nhac-han.html">Nhạc Hàn</a></td>
									<td><a href="the-loai/khong-loi.html">Không lời</a></td>
								</tr>
								<tr>
									<td><a href="the-loai/nhac-trinh.html">Nhạc trịnh</a></td>
									<td><a href="the-loai/rock.html">Rock</a></td>
									<td><a href="the-loai/nhac-nhat.html">Nhạc Nhật</a></td>
									<td><a href="the-loai/nhac-phim.html">Nhạc Phim</a></td>
								</tr>
								<tr>
									<td><a href="the-loai/tien-chien.html">Tiền chiến</a></td>
									<td><a href="the-loai/electronica-dance.html">Electronica/Dance</a></td>
									<td><a href="Ethe-loai/nhac-hoa.html">Nhạc Hoa</a></td>
									<td><a href="the-loai/beat.html">Beat</a></td>
								</tr>
								<tr>
									<td><a href="the-loai/thieu-nhi.html">Thiếu Nhi</a></td>
									<td><a href="the-loai/rb-hip-hop-rap.html">R&B/Hip Hop/Rap</a></td>
									<td><a href="#"></a></td>
									<td><a href="the-loai/the-loai-khac.html">Thể loại khác</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
         		<li class="nav-item">
         			<a href="nghe-si.html" class="nav-link">Nghệ sĩ</a>
         		</li>
         		<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle disable-click-show-dropdown-menu" href="gioi-thieu.html" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Giới thiệu
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="gioi-thieu.html">Giới thiệu</a>
						<a class="dropdown-item" href="chinh-sach.html">Chính sách</a>
						<a class="dropdown-item" href="dieu-khoan-dich-vu.html">Điều khoản dịch vụ</a>
						<a class="dropdown-item" href="copyroght.html">Copyright</a>
						<a class="dropdown-item" href="lien-he.html">Liên hệ</a>
					</div>
				</li>
         		<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle disable-click-show-dropdown-menu" href="yeu-cau.html" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-ellipsis-h d-none d-lg-inline"></i>
						<span class="d-inline d-lg-none">Mục khác</span>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="yeu-cau.html">Yêu cầu</a>
						<a class="dropdown-item" href="ung-ho.html">Ủng hộ</a>						
					</div>
				</li>    		
        	</ul>
        </div>
        <!-- End Menu - Navbar-link -->

        <!-- search box -->
        <form class="form-inline pl-0 mr-xl-1 col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 search-box order-5 order-sm-3">
			<input class="myform-control" type="search" placeholder="Tìm kiếm: tên bài hát, ca sĩ,..." aria-label="Search">
			<button class="btn btn-light pr-0" id="search-button"><i class="fa fa-search"></i></button>
		</form>

		<!-- menu account -->
		<div class="dropdown account-menu order-3 order-sm-4">
			<a class="btn dropdown-toggle account-menu-button mr-xl-5 mr-lg-1 pr-sm-0" href="dang-nhap.html" role="button" id="dropdownMenuAccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-user-circle"></i>
				<span class="d-none d-sm-inline d-md-inline d-lg-none d-xl-inline">Account</span>
			</a>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuAccount">
				<a class="dropdown-item" href="dang-nhap.html">Đăng Nhập</a>
				<a class="dropdown-item" href="dang-ki.html">Đăng kí</a>
			</div>
		</div>
	</nav>

	<!-- body -->
	<div class="content">
		<div class="song-player col-sm-12">
			<div class="song-player-container d-flex py-xl-4 pl-xl-4 py-lg-3 pl-lg-2 py-md-2 pl-md-2 py-sm-2 pr-sm-2">

				<div class="song-img song-img-1 pt-2 pt-sm-0 d-none d-md-flex" >
					<img src="img/Hanh-tinh-song-song.jpg" alt="Hành tinh song song - Thái Vũ" width="250rem" height="250rem">
				</div>
				

				<div class="song-player-info ml-xl-4 ml-lg-3 col-xl-9 col-lg-9">
					<div class="song-player-name ">
						<span><h2>Hành tinh song song</h2></span>
					</div>
					
					<div class="song-player-singer">
						<span class="song-player-singer-casi">Ca sĩ: </span>
						<span class="song-player-singer-name">
							<a href="#">Thái Vũ</a>
						</span>						
					</div>

					<div class="song-player-container-row-1 mt-md-1 d-md-flex">
						<div class="song-player-kind">
							<span class="song-player-kind-theloai">Thể Loại: </span>
							<span class="song-player-kind-name">
								<a href="#">Nhạc trẻ</a>
							</span>
						</div>

						<div class="song-player-view">
							<span class="song-player-view-luotnghe">Lượt nghe: </span>
							<span class="song-player-view-number">
								295.910 lượt
							</span>
						</div>
					</div>

					

					<div class="song-player-container-row-2 d-md-flex">
						<div class="song-player-love mt-md-1">
							<span>Yêu thích: </span>
							<button class="btn p-md-0 m-md-0" id="song-player-love-button" style="background-color: transparent;"><i class="fa fa-heart"></i></button>
						</div>


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
						<ul data-theme="default">
							<li data-url="audio/Hanh-tinh-song-song-Thai-Vu.mp3" data-type="mp3" data-title="Hành tinh song song - Thái Vũ" data-free="true"></li>
						</ul>
					</div>

				</div>

				<!-- hiển thị với màn hình nhỏ hơn 768px -->
				<div class="song-img song-img-2 mr-3 d-none d-flex d-md-none" >
					<img src="img/Hanh-tinh-song-song.jpg" alt="Hành tinh song song - Thái Vũ" width="250rem" height="250rem">
				</div>
		
			</div>

			<!-- hiển thị với màn hình nhỏ hơn 768px -->
			<div class="mediatec-cleanaudioplayer pb-sm-2 mt-md-4 d-none d-block d-md-none">
				<ul data-theme="default">
					<li data-url="audio/Hanh-tinh-song-song-Thai-Vu.mp3" data-type="mp3" data-title="Hành tinh song song - Thái Vũ" data-free="true"></li>
				</ul>
			</div>

		</div>

		<!-- song related -->
		<div class="song-related mt-lg-3 mt-sm-3 d-lg-flex">
			<div class="next-recommend-song ml-xl-4 ml-lg-3 ml-md-3 ml-sm-0 ml-3">
				<div class="next-recommend-song-list mr-xl-5 mr-lg-4 d-lg-block d-sm-flex justify-content-sm-around" style="">
					<span class="next-recommend-song-title d-inline-block">
						<h4 class="mb-3 d-lg-block d-none" style="border-bottom: 1px solid #cbcbcb;">
							Bài hát tiếp theo
						</h4>
						<h5 class="mb-3 d-lg-none d-inline-block" style="border-bottom: 1px solid #cbcbcb; white-space: nowrap;">
							Tiếp theo
						</h5>
					</span>
					<div class="next-recommend-song-item d-lg-flex mb-1" style="border-bottom: 1px solid #efefef;">
						<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
							<div class="next-recommend-song-item-name">
								<a href="#">Một ngày như hôm nay</a>
							</div>
							<div class="next-recommend-song-item-singer">
								<a href="#">Hải Sâm</a>
							</div>
						</div>

						<div class="next-recommend-song-item-view" style="color: #249e74">
							<i class="fa fa-headphones"></i>
							<span>65690</span>
						</div>
					</div>

					<div class="next-recommend-song-item d-lg-flex mb-1" style="border-bottom: 1px solid #efefef;">
						<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
							<div class="next-recommend-song-item-name">
								<a href="#">Một ngày như hôm nay</a>
							</div>
							<div class="next-recommend-song-item-singer">
								<a href="#">Hải Sâm</a>
							</div>
						</div>

						<div class="next-recommend-song-item-view" style="color: #1da0d9">
							<i class="fa fa-headphones"></i>
							<span>65690</span>
						</div>
					</div>

					<div class="next-recommend-song-item d-lg-flex mb-1" style="border-bottom: 1px solid #efefef">
						<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
							<div class="next-recommend-song-item-name">
								<a href="#">Một ngày như hôm nay</a>
							</div>
							<div class="next-recommend-song-item-singer">
								<a href="#">Hải Sâm</a>
							</div>
						</div>

						<div class="next-recommend-song-item-view" style="color: #e19d29">
							<i class="fa fa-headphones"></i>
							<span>65690</span>
						</div>
					</div>

					<div class="next-recommend-song-item d-lg-flex d-md-block d-sm-none mb-1" style="border-bottom: 1px solid #efefef">
						<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
							<div class="next-recommend-song-item-name">
								<a href="#">Một ngày như hôm nay</a>
							</div>
							<div class="next-recommend-song-item-singer">
								<a href="#">Hải Sâm</a>
							</div>
						</div>

						<div class="next-recommend-song-item-view" style="color: #5e799e">
							<i class="fa fa-headphones"></i>
							<span>65690</span>
						</div>
					</div>

					<div class="next-recommend-song-item d-lg-flex d-sm-none mb-1" style="border-bottom: 1px solid #efefef">
						<div class="next-recommend-song-item-info mr-xl-3 mr-lg-3">
							<div class="next-recommend-song-item-name">
								<a href="#">Một ngày như hôm nay</a>
							</div>
							<div class="next-recommend-song-item-singer">
								<a href="#">Hải Sâm</a>
							</div>
						</div>

						<div class="next-recommend-song-item-view" style="color: #6d6d6d">
							<i class="fa fa-headphones"></i>
							<span>65690</span>
						</div>
					</div>	
				</div>

			</div>

			<div class="song-upload-info col-lg-9 mt-lg-0 mt-3">
				<div class="song-uploader d-sm-flex">
					<div class="song-uploader-info col-md-2 mr-xl-3 pr-xl-0 mr-lg-5 pr-lg-0 mr-md-5 d-sm-block d-flex">
						<div class="song-uploader-avatar">
							<a href="#"><img src="img/avatar.jpg" class="rounded-circle" width="100rem" height="100rem" alt=""></a>
						</div>
						<div class="d-md-block">
							<div class="song-uploader-info-detail">
								<div class="song-uploader-name mt-sm-2 p-0">
									<a style="text-decoration: none; color: #212529; white-space: nowrap;" href="#">Thuật Hữu Nguyễn</a>
								</div>
								<div class="song-uploader-follow mt-2" style="white-space: nowrap;">
									<button class="btn" id="button-follow" data-text-swap="Following" data-text-original="Follow">Follow</button>
									<i class="fa fa-user">
									</i>
									<span class="song-uploader-follow-count">1296</span>
								</div>
							</div>

							<div class="song-upload-report dropdown mt-md-5 mt-sm-4 text-center">
								<a href="../report.html" style="text-decoration: none;">Report</a>
							</div>
						</div>
					</div>

					<div class="song-uploader-more mt-xl-1 mt-lg-0 mt-sm-1">
						<div class="song-uploader-content shortent-text">
							<p class="collapse" id="collapse-song-uploader-more">
								"Hành tinh song song" - Là bài hát cùng tên với Album gồm 8 bài mới của Vũ sẽ được ra mắt vào đầu tháng 10 tới. “Hành tinh song song”, tên Album cũng như tên Liveshow sau 1 năm vắng bóng của mình, Vũ đã trở lại với một “khuôn hình” khác. Với một tập thể các hành tinh đối nghịch nhau, một “Vũ” trụ mới mở ra trước mắt các khán giả nghe nhạc, cũng như một Vũ mới sẽ xuất hiện.
							</p>
							<a class="collapsed" data-toggle="collapse" href="#collapse-song-uploader-more" aria-expanded="false" aria-controls="collapse-song-uploader-more"></a>
						</div>

						<div class="song-upload-lyrics shortent-text mt-lg-5 mt-md-4 mt-sm-4 mt-3">
							<span><h4>Lời bài hát</h4></span>
							<p class="collapse" id="collapse-song-upload-lyrics">
								Một giấc mơ không dài, sao vẫn phải nhung nhớ<br />
								Sao vẫn phải mong ngóng ai quay về với anh<br />
								Em đã từng nghe, lời yêu thương nào buồn đến thế<br />
								Em có từng nghe, lời dặn dò nào đau đến thế<br />
								<br />
								Bởi vì anh, giấu em đi khỏi tâm trí<br />
								Xin cho em về, về một nơi rất xa loài người<br />
								Về một nơi phía sau mặt trời có anh đi cạnh em<br />
								<br />
								Xin cho em về, về một nơi rất xa cuộc đời<br />
								Về một nơi phía sau bộn bề<br />
								Có anh đi cạnh em.
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

		
			<div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="1200px" data-numposts="5"></div>
		



	</div>





















	<!-- footter -->
	<div class="footer" style="margin-top: 6rem">
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




	<!-- fb app -->
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2&appId=792706111078001&autoLogAppEvents=1';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>


	<!-- jquery and js -->
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/popper.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/javascript-style.js"></script>
	<script type="text/javascript" src="js/jquery.audioplayer.js"></script>
	<script type="text/javascript" src="js/jquery.baihat.js"></script>
	

	



</body>
</html>