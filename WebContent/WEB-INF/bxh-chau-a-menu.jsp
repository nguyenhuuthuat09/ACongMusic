<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="bang-xep-hang-the-loai ml-md-3 ml-2">
			<div class="bang-xep-hang-quoc-gia-list d-sm-flex d-none ml-xl-4 ml-md-2 ml-1 mb-md-3 mb-2">
				<div class="bang-xep-hang-quoc-gia-item mr-md-3 mr-2" id="bang-xep-hang-quoc-gia-vn">
					<a href="${pageContext.request.contextPath}/bang-xep-hang?music_id=1">
						<button class="btn">
							Việt Nam
						</button>
					</a>
				</div>
				<div class="bang-xep-hang-quoc-gia-item mr-md-3 mr-2" id="bang-xep-hang-quoc-gia-am">
					<a href="${pageContext.request.contextPath}/bang-xep-hang?music_id=6">
						<button class="btn">
							Âu Mỹ
						</button>
					</a>
				</div>
				<div class="bang-xep-hang-quoc-gia-item" id="bang-xep-hang-quoc-gia-ca">
					<a href="${pageContext.request.contextPath}/bang-xep-hang?music_id=10">
						<button class="btn">
							Châu Á
						</button>
					</a>
				</div>
			</div>

			<div class="bang-xep-hang-the-loai-list d-sm-flex ml-xl-4 ml-md-2 mb-md-3 ml-1 mb-3">
				<div class="bang-xep-hang-the-loai-list-row-1 d-flex">
					<div class="bang-xep-hang-the-loai-item mr-md-3 mr-2">
						<a href="${pageContext.request.contextPath}/bang-xep-hang?music_id=10">
							<button class="btn" ${active10}>
								Nhạc Hàn
							</button>
						</a>
					</div>

					<div class="bang-xep-hang-the-loai-item mr-md-3 mr-2">
						<a href="${pageContext.request.contextPath}/bang-xep-hang?music_id=11">
							<button class="btn" ${active11}>
								Nhạc Hoa
							</button>
						</a>
					</div>
				</div>

				<div class="bang-xep-hang-the-loai-list-row-2 d-flex">
					<div class="bang-xep-hang-the-loai-item mr-md-3 mr-2">
						<a href="${pageContext.request.contextPath}/bang-xep-hang?music_id=12">
							<button class="btn" ${active12}>
								Nhạc Nhật
							</button>
						</a>
					</div>
				</div>
			</div>
		</div>