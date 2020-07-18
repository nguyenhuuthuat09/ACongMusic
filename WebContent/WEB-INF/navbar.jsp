<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Menu bar -->
<nav
	class="navbar navbar-expand-lg navbar-light bg-white justify-content-start header-bar">

	<!-- Toggler/collapsibe Button -->
	<!-- Màn hình nhỏ thì menu tự thu vào một nút collapse-->
	<button class="navbar-toggler order-1" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- logo -->
	<a class="navbar-brand ml-xl-1 order-2 order-lg-1" href="${pageContext.request.contextPath}">
		<img src="${pageContext.request.contextPath}/img/logo.png" alt="A+ Music - Share youre love to the world"
		title="A+ Music - Share youre love to the world" width="125rem"
		height="50rem">
	</a>

	<!-- Menu - Navbar-link -->
	<div
		class="collapse navbar-collapse ml-xl-3 order-4 order-sm-5 order-lg-2"
		id="navbarResponsive">

		<!-- Dropdown Menu -->
		<ul class="navbar-nav">
			<li class="nav-item"><a href="${pageContext.request.contextPath}" class="nav-link">Bài hát
					mới</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle disable-click-show-dropdown-menu"
				href="${pageContext.request.contextPath}/bang-xep-hang" id="navbarDropdownMenuLink"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Bảng xếp hạng </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/bang-xep-hang?music_id=1">Việt
						Nam</a> <a class="dropdown-item" href="${pageContext.request.contextPath}/bang-xep-hang?music_id=6">Âu
						Mỹ</a> <a class="dropdown-item" href="${pageContext.request.contextPath}/bang-xep-hang?music_id=10">Châu
						Á</a>
				</div></li>
			<li class="nav-item dropdown dropdown-menu-table"><a
				class="nav-link dropdown-toggle disable-click-show-dropdown-table"
				href="${pageContext.request.contextPath}/the-loai" id="navbarDropdownMenuLink" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Thể loại </a>
				<div class="dropdown-menu" id="the-loai"
					aria-labelledby="navbarDropdownMenuLink">
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th>VIỆT NAM</th>
								<th>ÂU MỸ</th>
								<th>CHÂU Á</th>
								<th>KHÁC</th>
							</tr>
							<tr>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=1">Nhạc trẻ</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=6">Pop</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=10">Nhạc Hàn</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=13">Không lời</a></td>
							</tr>
							<tr>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=2">Nhạc trịnh</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=7">Rock</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=12">Nhạc Nhật</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=14">Nhạc Phim</a></td>
							</tr>
							<tr>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=3">Tiền chiến</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=8">Electronica/Dance</a></td>
								<td><a href="${pageContext.request.contextPath}/Ethe-loai?music_id=11">Nhạc Trung</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=15">Beat</a></td>
							</tr>
							<tr>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=4">Thiếu Nhi</a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=9">R&B/Hip
										Hop/Rap</a></td>
								<td><a href="#"></a></td>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=16">Thể loại khác</a></td>
							</tr>
							<tr>
								<td><a href="${pageContext.request.contextPath}/the-loai?music_id=5">Hip Hop/Rap</a></td>
								<td><a href="#"></a></td>
								<td><a href="#"></a></td>
								<td><a href="#"></a></td>
							</tr>
						</tbody>
					</table>
				</div></li>
			<li class="nav-item"><a href="${pageContext.request.contextPath}/nghe-si-page" class="nav-link">Nghệ
					sĩ</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle disable-click-show-dropdown-menu"
				href="${pageContext.request.contextPath}/gioi-thieu.jsp" id="navbarDropdownMenuLink" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Giới thiệu </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/gioi-thieu.jsp">Giới thiệu</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/chinh-sach.jsp">Chính sách</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/dieu-khoan-dich-vu.jsp">Điều
						khoản dịch vụ</a> <a class="dropdown-item" href="${pageContext.request.contextPath}/copyright.jsp">Copyright</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/lien-he.jsp">Liên hệ</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle disable-click-show-dropdown-menu"
				href="${pageContext.request.contextPath}/yeu-cau.jsp" id="navbarDropdownMenuLink" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-ellipsis-h d-none d-lg-inline"></i> <span
					class="d-inline d-lg-none">Mục khác</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/author-info.jsp">Thông tin tác giả</a> 
				</div></li>
		</ul>
	</div>
	<!-- End Menu - Navbar-link -->

	<!-- search box -->
	<form action="${pageContext.request.contextPath}/tim-kiem" method="get" class="form-inline pl-0 mr-xl-1 col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 search-box order-5 order-sm-3">
		<input name="q" class="myform-control" type="search"
			placeholder="Tìm kiếm: tên bài hát, ca sĩ,..." aria-label="Search">
		<button class="btn btn-light pr-0" id="search-button">
			<i class="fa fa-search"></i>
		</button>
	</form>

	<!-- menu account -->
	
	
	<div class="dropdown account-menu order-3 order-sm-4">
		<%if (session.getAttribute("user") == null && session.getAttribute("admin") == null) { %>
			<a
				class="btn dropdown-toggle account-menu-button mr-xl-5 mr-lg-1 pr-sm-0"
				href="${pageContext.request.contextPath}/login.jsp" role="button" id="dropdownMenuAccount"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-user-circle"></i> <span
				class="d-none d-sm-inline d-md-inline d-lg-none d-xl-inline">Account</span>
			</a>
		<% } %>
		
		<%if (session.getAttribute("user") != null) { %>
			<a
				class="btn dropdown-toggle account-menu-button mr-xl-5 mr-lg-1 pr-sm-0"
				href="${pageContext.request.contextPath}/user/profile.jsp" role="button" id="dropdownMenuAccount"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-user-circle"></i> <span
				class="d-none d-sm-inline d-md-inline d-lg-none d-xl-inline">Account</span>
			</a>
		<% } %>
		
		<%if (session.getAttribute("admin") != null) { %>
			<a
				class="btn dropdown-toggle account-menu-button mr-xl-5 mr-lg-1 pr-sm-0"
				href="${pageContext.request.contextPath}/admin/profile.jsp" role="button" id="dropdownMenuAccount"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-user-circle"></i> <span
				class="d-none d-sm-inline d-md-inline d-lg-none d-xl-inline">Account</span>
			</a>
		<% } %>
		
		<div class="dropdown-menu" aria-labelledby="dropdownMenuAccount">
			<!--  chua dang nhap -->
			<%if (session.getAttribute("user") == null && session.getAttribute("admin") == null) { %>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/login.jsp">
					Đăng Nhập
				</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/register.jsp">
					Đăng kí
				</a>
			<% } %>
			
			
			<!--  da dang nhap -->
			<%if (session.getAttribute("user") != null) { %>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile.jsp">
					Trang cá nhân
				</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/user/account.jsp">
					Quản lý tài khoản
				</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/user/upload.jsp">
					Upload bài hát
				</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/dang-xuat">
					Đăng xuất
				</a>
			<% } %>
			
			<%if (session.getAttribute("admin") != null) { %>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/profile.jsp">
					Trang cá nhân
				</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account.jsp">
					Quản lý tài khoản
				</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/admin-logout">
					Đăng xuất
				</a>
			<% } %>
		</div>
	</div>
	
	
	
</nav>
