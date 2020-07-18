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
	<title>A+ Music - Report</title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
	


</head>
<body>

	<!-- Menu bar -->
	<%@include file="/WEB-INF/navbar.jsp" %>


	<!-- body -->
	<div class="report">
		<div class="report-container">
			<h3 class="text-center">Hướng dẫn</h3>
			<div class="report-main col-11 row justify-content-lg-center mt-3">
				<div>
					<div class="d-flex">
						<div>
							<span>Hướng dẫn:&nbsp;</span>
						</div>
						<div>
							+ Vi phạm bản quyền: nếu bài hát vi phạm bản quyền của bạn hay một nghệ sĩ bạn liên quan hãy chọn lựa chọn này.<br/>
							+ Nội dung xấu: nếu lời bài hát xấu, có ý đồ phản động, hình đại diện cho bài hát có chứa ảnh phản cảm,... hãy chọn lựa chọn này.<br/>
							+ Khác: nếu lý do report của bạn không nằm trong 2 lý do trên.<br/>
							+ Ngoài ra, các bạn có thể thêm thông tin vi phạm của bài hát này vào ô Bổ sung thông tin.
						</div>
					</div>

					<div class="d-flex mt-3">
						<div>
							<span>Lưu ý:&nbsp;</span>
						</div>
						<div>
							+ Report sẽ được xem xét trong vòng 48h, sau đó chúng tôi sẽ gửi thông tin về email bạn điền bên dưới.<br/>
							+ Nếu vấn đề nghiêm trọng, bạn có thể liên lạc với chúng tôi qua thông tin liên hệ tại <a href="#" style="text-decoration: none;">trang Liên hệ</a>.
							
						</div>
					</div>

					<div class="d-flex mt-3">
						<div class="text-center">
							<span style="font-weight: bold;">Xin cảm ơn bạn đã góp phần giúp A+ Music trở nên tốt hơn.</span>
						</div>
					</div>
				</div>



				
			</div>

			<h4 class="mb-2 mt-4 text-center">Phiếu report</h4>
			
			<div class=""alert-danger mt-4>
				${requestScope.errorSendReport }
			</div>
						
			<div class="d-flex justify-content-center mt-2">
				
				<form action="${pageContext.request.contextPath}/sendReport" method="post" class="needs-validation col-6" novalidate>

					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom01">ID bài hát</label>
							<input class="form-control" name="song_id_report" value="${songReport.song_id }" type="text" placeholder="Readonly input here…" readonly>
							<small id="" class="form-text text-muted">
								
								
							</small>
						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom02">Tên bài hát</label>
							<input class="form-control" value="${songReport.song_name }" type="text" placeholder="Readonly input here…" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom03">Nghệ sĩ</label>
							<c:set var="singer_nick_name_list" value="${songReport.singer_nick_name }" />
							<c:set var="singer_nick_name_string" value="" />
							<c:forEach var="singer_nick_name" items="${singer_nick_name_list}" varStatus="status">
	
								<c:set var="singer_nick_name_string" value="${singer_nick_name_string}${singer_nick_name}" />
								<c:if test="${not status.last}">
									<c:set var="singer_nick_name_string" value="${singer_nick_name_string}, " />
								</c:if>
								
							</c:forEach>
							<input class="form-control" value="${singer_nick_name_string }" type="text" placeholder="Readonly input here…" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom03">Đường dẫn</label>
							<input class="form-control" value="${pageContext.request.contextPath}/bai-hat?id=${songReport.song_id}" type="text" placeholder="Readonly input here…" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom12303">User ID upload</label>
							<input class="form-control" value="${profileReport.user_id }" type="text" placeholder="Readonly input here…" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom03">Tên User Upload</label>
							<input class="form-control" value="${profileReport.username }" type="text" placeholder="Readonly input here…" readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email</label>
						<input type="email" name="email_request" value="${sessionScope.user.email }" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email" required>
						<small id="emailHelp" class="form-text text-muted">
							Chúng tôi sẽ liên hệ với bạn qua email này khi report được xử lý xong.
						</small>
					</div>
					<div class="form-row mb-3">
						<label class="mr-3" for="exampleFormControlSelect11">Lý do:</label>
						<div>
							<input type="radio" checked="true" name="report_reason_id" value="1">
							<label class="ml-1 mr-2">Vi phạm bản quyền</label> 
							
							<input type="radio" name="report_reason_id" value="2">
							<label class="ml-1 mr-2">Nội dung xấu</label> 
							
							<input type="radio" name="report_reason_id" value="3">
							<label class="ml-1 mr-2">Khác</label> 				
						</div>			
						
					</div>
					<div class="form-row">
						<div class="col mb-3">
							<label for="validationCustom04">Thêm thông tin</label>
							 <textarea class="form-control" rows="5" name="report_reason_more" placeholder="Lý do Report"></textarea>
						</div>
					</div>
					<button class="btn btn-primary btn-sm" type="submit">Report</button>
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







	<!-- jquery and js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript-style.js"></script>
</body>
</html>