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
	<title>A+ Music - Home</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	


</head>
<body>

	<%@include file="/WEB-INF/navbar.jsp" %>

	<!-- body -->
	<div class="content">
		<ul class="nav nav-tabs justify-content-center body-tab-name" id="myTab" role="tablist">
			<li class="nav-item tab-name-bhm">
				<a class="nav-link active" id="bai-hat-moi-tab" data-toggle="tab" href="#bai-hat-moi" role="tab" aria-controls="bai-hat-moi" aria-selected="true">Bài hát mới</a>
			</li>
			<li class="nav-item tab-name-ngan-cach">
				<a class="nav-link disabled d-none d-sm-block">/</a>
			</li>
			<li class="nav-item tab-name-bxh">
				<a class="nav-link" id="bang-xep-hang-tab" data-toggle="tab" href="#bang-xep-hang" role="tab" aria-controls="bang-xep-hang" aria-selected="false">Bảng xếp hạng</a>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="bai-hat-moi" role="tabpanel" aria-labelledby="bai-hat-moi-tab">

				<!-- child tab -->
				<ul class="nav nav-tabs justify-content-center body-tab-child-name" id="myChildTab" role="tablist">
					<li class="nav-item child-tab-name-vn">
						<a class="nav-link active" id="viet-nam-tab" data-toggle="tab" href="#viet-nam" role="tab" aria-controls="viet-nam" aria-selected="true">Việt Nam</a>
					</li>
					<li class="nav-item child-tab-name-ngan-cach">
						<a class="nav-link disabled d-none d-sm-block">/</a>
					</li>
					<li class="nav-item child-tab-name-am">
						<a class="nav-link" id="au-my-tab" data-toggle="tab" href="#au-my" role="tab" aria-controls="au-my" aria-selected="false">Âu Mỹ</a>
					</li>
					<li class="nav-item child-tab-name-ngan-cach">
						<a class="nav-link disabled d-none d-sm-block">/</a>
					</li>
					<li class="nav-item child-tab-name-hq">
						<a class="nav-link" id="han-quoc-tab" data-toggle="tab" href="#han-quoc" role="tab" aria-controls="han-quoc" aria-selected="false">Hàn Quốc</a>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<!-- Việt Nam -->
					<div class="tab-pane fade show active" id="viet-nam" role="tabpanel" aria-labelledby="viet-nam-tab">
						<div class="bhm-list-container">
							<div class="row justify-content-around col-lg-12 mx-auto bhm-list">
							
								<c:set var="listVietNam" value="${requestScope.listVietNam }" />
								<c:choose>
									<c:when test="${empty listVietNam}">
										<div class="text-center mt-5" style="margin-bottom: 19.1rem;">Xin lỗi hệ thống chưa có
											bài hát Việt Nam nào.</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="songVietNam" items="${listVietNam}">

											<div class="bhm-item mt-lg-3 mt-2">
												<div class="bhm-item-img">
													<a
														href="${pageContext.request.contextPath}/bai-hat?id=${songVietNam.song_id}">
														<img
														src="${pageContext.request.contextPath}/img/bai-hat/${songVietNam.song_img_path}"
														width="150rem" height="150rem" alt="">
													</a>
												</div>
												<div class="bhm-item-info">
													<div class="bhm-item-name mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
														<a
															href="${pageContext.request.contextPath}/bai-hat?id=${songVietNam.song_id}"
															style="color: #2d3034; text-decoration: none;">
															${songVietNam.song_name} </a>
													</div>
													<div class="bhm-item-singer">
														<c:set var="VietNam_singer_id_string" value="${songVietNam.singer_id }" />
														<c:set var="VietNam_singer_id_list"
															value="${fn:split(VietNam_singer_id_string, ',')}" />

														<c:set var="VietNam_singer_nick_name_string" value="" />
														<c:set var="VietNam_singer_nick_name_list"
															value="${songVietNam.singer_nick_name}" />
														<c:forEach var="VietNam_singer_nick_name"
															items="${VietNam_singer_nick_name_list}" varStatus="status">

															<span> <a
																href="${pageContext.request.contextPath}/nghe-si?id=${VietNam_singer_id_list[status.index]}"
																style="color: #666666; text-decoration: none;">
																	${VietNam_singer_nick_name} </a>
															</span>
															<c:set var="VietNam_singer_nick_name_string"
																value="${VietNam_singer_nick_name_string}${VietNam_singer_nick_name}" />
															<c:if test="${not status.last}">
																<span style="color: #666666">,</span>
																<c:set var="VietNam_singer_nick_name_string"
																	value="${VietNam_singer_nick_name_string}, " />
															</c:if>

														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>


							</div>

						</div>
					</div>


					<div class="tab-pane fade" id="au-my" role="tabpanel" aria-labelledby="au-my-tab">
						<div class="bhm-list-container">
							<div class="row justify-content-around col-lg-12 mx-auto bhm-list">
							
								<c:set var="listAuMy" value="${requestScope.listAuMy }" />
								<c:choose>
									<c:when test="${empty listAuMy}">
										<div class="text-center mt-5" style="margin-bottom: 19.1rem;">Xin lỗi hệ thống chưa có
											bài hát Âu Mỹ nào.</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="songAuMy" items="${listAuMy}">

											<div class="bhm-item mt-lg-3 mt-2">
												<div class="bhm-item-img">
													<a
														href="${pageContext.request.contextPath}/bai-hat?id=${songAuMy.song_id}">
														<img
														src="${pageContext.request.contextPath}/img/bai-hat/${songAuMy.song_img_path}"
														width="150rem" height="150rem" alt="">
													</a>
												</div>
												<div class="bhm-item-info">
													<div class="bhm-item-name mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
														<a
															href="${pageContext.request.contextPath}/bai-hat?id=${songAuMy.song_id}"
															style="color: #2d3034; text-decoration: none;">
															${songAuMy.song_name} </a>
													</div>
													<div class="bhm-item-singer">
														<c:set var="AuMy_singer_id_string" value="${songAuMy.singer_id }" />
														<c:set var="AuMy_singer_id_list"
															value="${fn:split(AuMy_singer_id_string, ',')}" />

														<c:set var="AuMy_singer_nick_name_string" value="" />
														<c:set var="AuMy_singer_nick_name_list"
															value="${songAuMy.singer_nick_name}" />
														<c:forEach var="AuMy_singer_nick_name"
															items="${AuMy_singer_nick_name_list}" varStatus="status">

															<span> <a
																href="${pageContext.request.contextPath}/nghe-si?id=${AuMy_singer_id_list[status.index]}"
																style="color: #666666; text-decoration: none;">
																	${AuMy_singer_nick_name} </a>
															</span>
															<c:set var="AuMy_singer_nick_name_string"
																value="${AuMy_singer_nick_name_string}${AuMy_singer_nick_name}" />
															<c:if test="${not status.last}">
																<span style="color: #666666">,</span>
																<c:set var="AuMy_singer_nick_name_string"
																	value="${AuMy_singer_nick_name_string}, " />
															</c:if>

														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>


							</div>

						</div>
					</div>
					
					
					<div class="tab-pane fade" id="han-quoc" role="tabpanel" aria-labelledby="han-quoc-tab">
						<div class="bhm-list-container">
							<div class="row justify-content-around col-lg-12 mx-auto bhm-list">
							
								<c:set var="listHanQuoc" value="${requestScope.listHanQuoc }" />
								<c:choose>
									<c:when test="${empty listHanQuoc}">
										<div class="text-center mt-5" style="margin-bottom: 19.1rem;">Xin lỗi hệ thống chưa có
											bài hát Hàn Quốc nào.</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="songHanQuoc" items="${listHanQuoc}">

											<div class="bhm-item mt-lg-3 mt-2">
												<div class="bhm-item-img">
													<a
														href="${pageContext.request.contextPath}/bai-hat?id=${songHanQuoc.song_id}">
														<img
														src="${pageContext.request.contextPath}/img/bai-hat/${songHanQuoc.song_img_path}"
														width="150rem" height="150rem" alt="">
													</a>
												</div>
												<div class="bhm-item-info">
													<div class="bhm-item-name mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
														<a
															href="${pageContext.request.contextPath}/bai-hat?id=${songHanQuoc.song_id}"
															style="color: #2d3034; text-decoration: none;">
															${songHanQuoc.song_name} </a>
													</div>
													<div class="bhm-item-singer">
														<c:set var="HanQuoc_singer_id_string" value="${songHanQuoc.singer_id }" />
														<c:set var="HanQuoc_singer_id_list"
															value="${fn:split(HanQuoc_singer_id_string, ',')}" />

														<c:set var="HanQuoc_singer_nick_name_string" value="" />
														<c:set var="HanQuoc_singer_nick_name_list"
															value="${songHanQuoc.singer_nick_name}" />
														<c:forEach var="HanQuoc_singer_nick_name"
															items="${HanQuoc_singer_nick_name_list}" varStatus="status">

															<span> <a
																href="${pageContext.request.contextPath}/nghe-si?id=${HanQuoc_singer_id_list[status.index]}"
																style="color: #666666; text-decoration: none;">
																	${HanQuoc_singer_nick_name} </a>
															</span>
															<c:set var="HanQuoc_singer_nick_name_string"
																value="${HanQuoc_singer_nick_name_string}${HanQuoc_singer_nick_name}" />
															<c:if test="${not status.last}">
																<span style="color: #666666">,</span>
																<c:set var="HanQuoc_singer_nick_name_string"
																	value="${HanQuoc_singer_nick_name_string}, " />
															</c:if>

														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>


							</div>

						</div>
					</div>
				</div>

				
				
			</div>
			<div class="tab-pane fade" id="bang-xep-hang" role="tabpanel" aria-labelledby="bang-xep-hang-tab">
				<!-- child tab -->
				<ul class="nav nav-tabs justify-content-center body-tab-child-name" id="myChildTab" role="tablist">
					<li class="nav-item child-tab-name-vn">
						<a class="nav-link active" id="viet-nam-Top-tab" data-toggle="tab" href="#viet-nam-Top" role="tab" aria-controls="viet-nam-Top" aria-selected="true">Việt Nam</a>
					</li>
					<li class="nav-item child-tab-name-ngan-cach">
						<a class="nav-link disabled d-none d-sm-block">/</a>
					</li>
					<li class="nav-item child-tab-name-am">
						<a class="nav-link" id="au-my-Top-tab" data-toggle="tab" href="#au-my-Top" role="tab" aria-controls="au-my-Top" aria-selected="false">Âu Mỹ</a>
					</li>
					<li class="nav-item child-tab-name-ngan-cach">
						<a class="nav-link disabled d-none d-sm-block">/</a>
					</li>
					<li class="nav-item child-tab-name-hq">
						<a class="nav-link" id="han-quoc-Top-tab" data-toggle="tab" href="#han-quoc-Top" role="tab" aria-controls="han-quoc-Top" aria-selected="false">Hàn Quốc</a>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<!-- Việt Nam -->
					<div class="tab-pane fade show active" id="viet-nam-Top" role="tabpanel" aria-labelledby="viet-nam-Top-tab">
						<div class="bhm-list-container">
							<div class="row justify-content-around col-lg-12 mx-auto bhm-list">
							
								<c:set var="listVietNamTop" value="${requestScope.listVietNamTop }" />
								<c:choose>
									<c:when test="${empty listVietNamTop}">
										<div class="text-center mt-5" style="margin-bottom: 19.1rem;">Xin lỗi hệ thống chưa có
											bài hát Việt Nam nào.</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="songVietNamTop" items="${listVietNamTop}">

											<div class="bhm-item mt-lg-3 mt-2">
												<div class="bhm-item-img">
													<a
														href="${pageContext.request.contextPath}/bai-hat?id=${songVietNamTop.song_id}">
														<img
														src="${pageContext.request.contextPath}/img/bai-hat/${songVietNamTop.song_img_path}"
														width="150rem" height="150rem" alt="">
													</a>
												</div>
												<div class="bhm-item-info">
													<div class="bhm-item-name mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
														<a
															href="${pageContext.request.contextPath}/bai-hat?id=${songVietNamTop.song_id}"
															style="color: #2d3034; text-decoration: none;">
															${songVietNamTop.song_name} </a>
													</div>
													<div class="bhm-item-singer">
														<c:set var="VietNamTop_singer_id_string" value="${songVietNamTop.singer_id }" />
														<c:set var="VietNamTop_singer_id_list"
															value="${fn:split(VietNamTop_singer_id_string, ',')}" />

														<c:set var="VietNamTop_singer_nick_name_string" value="" />
														<c:set var="VietNamTop_singer_nick_name_list"
															value="${songVietNamTop.singer_nick_name}" />
														<c:forEach var="VietNamTop_singer_nick_name"
															items="${VietNamTop_singer_nick_name_list}" varStatus="status">

															<span> <a
																href="${pageContext.request.contextPath}/nghe-si?id=${VietNamTop_singer_id_list[status.index]}"
																style="color: #666666; text-decoration: none;">
																	${VietNamTop_singer_nick_name} </a>
															</span>
															<c:set var="VietNamTop_singer_nick_name_string"
																value="${VietNamTop_singer_nick_name_string}${VietNamTop_singer_nick_name}" />
															<c:if test="${not status.last}">
																<span style="color: #666666">,</span>
																<c:set var="VietNamTop_singer_nick_name_string"
																	value="${VietNamTop_singer_nick_name_string}, " />
															</c:if>

														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>


							</div>

						</div>
					</div>
					<!-- End List Việt Nam -->

					<div class="tab-pane fade" id="au-my-Top" role="tabpanel" aria-labelledby="au-my-Top-tab">
						<div class="bhm-list-container">
							<div class="row justify-content-around col-lg-12 mx-auto bhm-list">
							
								<c:set var="listAuMyTop" value="${requestScope.listAuMyTop }" />
								<c:choose>
									<c:when test="${empty listAuMyTop}">
										<div class="text-center mt-5" style="margin-bottom: 19.1rem;">Xin lỗi hệ thống chưa có
											bài hát Âu Mỹ nào.</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="songAuMyTop" items="${listAuMyTop}">

											<div class="bhm-item mt-lg-3 mt-2">
												<div class="bhm-item-img">
													<a
														href="${pageContext.request.contextPath}/bai-hat?id=${songAuMyTop.song_id}">
														<img
														src="${pageContext.request.contextPath}/img/bai-hat/${songAuMyTop.song_img_path}"
														width="150rem" height="150rem" alt="">
													</a>
												</div>
												<div class="bhm-item-info">
													<div class="bhm-item-name mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
														<a
															href="${pageContext.request.contextPath}/bai-hat?id=${songAuMyTop.song_id}"
															style="color: #2d3034; text-decoration: none;">
															${songAuMyTop.song_name} </a>
													</div>
													<div class="bhm-item-singer">
														<c:set var="AuMyTop_singer_id_string" value="${songAuMyTop.singer_id }" />
														<c:set var="AuMyTop_singer_id_list"
															value="${fn:split(AuMyTop_singer_id_string, ',')}" />

														<c:set var="AuMyTop_singer_nick_name_string" value="" />
														<c:set var="AuMyTop_singer_nick_name_list"
															value="${songAuMyTop.singer_nick_name}" />
														<c:forEach var="AuMyTop_singer_nick_name"
															items="${AuMyTop_singer_nick_name_list}" varStatus="status">

															<span> <a
																href="${pageContext.request.contextPath}/nghe-si?id=${AuMyTop_singer_id_list[status.index]}"
																style="color: #666666; text-decoration: none;">
																	${AuMyTop_singer_nick_name} </a>
															</span>
															<c:set var="AuMyTop_singer_nick_name_string"
																value="${AuMyTop_singer_nick_name_string}${AuMyTop_singer_nick_name}" />
															<c:if test="${not status.last}">
																<span style="color: #666666">,</span>
																<c:set var="AuMyTop_singer_nick_name_string"
																	value="${AuMyTop_singer_nick_name_string}, " />
															</c:if>

														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>


							</div>

						</div>
					</div>
					
					
					<div class="tab-pane fade" id="han-quoc-Top" role="tabpanel" aria-labelledby="han-quoc-Top-tab">
						<div class="bhm-list-container">
							<div class="row justify-content-around col-lg-12 mx-auto bhm-list">
							
								<c:set var="listHanQuocTop" value="${requestScope.listHanQuocTop }" />
								<c:choose>
									<c:when test="${empty listHanQuocTop}">
										<div class="text-center mt-5" style="margin-bottom: 19.1rem;">Xin lỗi hệ thống chưa có
											bài hát Hàn Quốc nào.</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="songHanQuocTop" items="${listHanQuocTop}">

											<div class="bhm-item mt-lg-3 mt-2">
												<div class="bhm-item-img">
													<a
														href="${pageContext.request.contextPath}/bai-hat?id=${songHanQuocTop.song_id}">
														<img
														src="${pageContext.request.contextPath}/img/bai-hat/${songHanQuocTop.song_img_path}"
														width="150rem" height="150rem" alt="">
													</a>
												</div>
												<div class="bhm-item-info">
													<div class="bhm-item-name mt-1" style="white-space: nowrap;width: 11.15rem;overflow: hidden;text-overflow: ellipsis;">
														<a
															href="${pageContext.request.contextPath}/bai-hat?id=${songHanQuocTop.song_id}"
															style="color: #2d3034; text-decoration: none;">
															${songHanQuocTop.song_name} </a>
													</div>
													<div class="bhm-item-singer">
														<c:set var="HanQuocTop_singer_id_string" value="${songHanQuocTop.singer_id }" />
														<c:set var="HanQuocTop_singer_id_list"
															value="${fn:split(HanQuocTop_singer_id_string, ',')}" />

														<c:set var="HanQuocTop_singer_nick_name_string" value="" />
														<c:set var="HanQuocTop_singer_nick_name_list"
															value="${songHanQuocTop.singer_nick_name}" />
														<c:forEach var="HanQuocTop_singer_nick_name"
															items="${HanQuocTop_singer_nick_name_list}" varStatus="status">

															<span> <a
																href="${pageContext.request.contextPath}/nghe-si?id=${HanQuocTop_singer_id_list[status.index]}"
																style="color: #666666; text-decoration: none;">
																	${HanQuocTop_singer_nick_name} </a>
															</span>
															<c:set var="HanQuocTop_singer_nick_name_string"
																value="${HanQuocTop_singer_nick_name_string}${HanQuocTop_singer_nick_name}" />
															<c:if test="${not status.last}">
																<span style="color: #666666">,</span>
																<c:set var="HanQuocTop_singer_nick_name_string"
																	value="${HanQuocTop_singer_nick_name_string}, " />
															</c:if>

														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>


							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>




	<!-- footter -->
	<%@include file="/WEB-INF/footer.jsp" %>







	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>