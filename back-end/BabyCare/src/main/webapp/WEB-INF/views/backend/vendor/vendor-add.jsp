<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Admin Baby Care</title>

<!-- Variables -->
<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<!-- CSS -->
<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
<script src="${classpath }/libraries/ckeditor/ckeditor.js"></script>

</head>

<body class="navbar-fixed sidebar-fixed" id="body">

	<div class="wrapper">
		<!-- Nav -->
		<jsp:include page="/WEB-INF/views/backend/layout/nav.jsp"></jsp:include>


		<div class="page-wrapper">
			<!-- Header -->
			<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>

			<div class="content-wrapper">
				<div class="content">
					<div class="card card-default">
						<div class="card-header">
							<h2>Thêm nhà cung cấp</h2>
						</div>
						<div class="card-body">
							<c:if test="${not empty messageResponse }">
								<div class="alert alert-${alert }" style="width: 30%">
									${messageResponse }</div>
							</c:if>
							<sf:form class="form"
								action="${classpath }/admin/vendor-add-save" method="post"
								modelAttribute="vendor" enctype="multipart/form-data">
								<div class="form-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group mb-4">
															<label for="code">Code</label>
															<sf:input id="code" path="code" type="text"
																class="form-control" placeholder="Mã nhà cung cấp" required="required" oninvalid="this.setCustomValidity('Nhập mã nhà cung cấp')" oninput="setCustomValidity('')"></sf:input>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group mb-4">
															<label for="name">Tên nhà cung cấp</label>
															<sf:input id="name" path="name" type="text"
																class="form-control" placeholder="Tên nhà cung cấp" required="required" oninvalid="this.setCustomValidity('Nhập tên nhà cung cấp')" oninput="setCustomValidity('')"></sf:input>

														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group mb-4">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group mb-4">
															<img style="width: 85px; height: 85px"
																src="${classspath }/FileUpload/${vendor.image}" />

														</div>
													</div>
													<div class="col-md-12">
														<div class="form-group mb-4">
															<label for="imageFile">Chọn ảnh</label> <input
																id="imageFile" name="imageFile"
																class="form-control-file" type="file"
																multiple="multiple" />
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="origin">Xuất xứ</label>
												<sf:input id="origin" path="origin" type="text"
													class="form-control" placeholder="Xuất xứ"></sf:input>

											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group mb-4">
												<label for="description">Mô tả</label>
												<sf:textarea id="description" path="description" rows="4"
													class="form-control" placeholder="Mô tả thương hiệu..."></sf:textarea>

											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="createDate">Ngày tạo</label>
												<sf:input id="createDate" path="createDate" type="date"
													class="form-control"></sf:input>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="updateDate">Ngày cập nhật</label>
												<sf:input id="updateDate" path="updateDate" type="date"
													class="form-control"></sf:input>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group mb-4">
												<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
												<sf:checkbox path="status" class="form-check-input"
													id="status" name="status"></sf:checkbox>
												<label>&nbsp;</label> <label for="status">Hoạt động</label>
											</div>
										</div>

									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group mb-4">
												<a href="${classpath }/admin/vendor-list"
													class="btn btn-light active" role="button">Về danh sách</a>
												<button type="submit" class="btn btn-primary">Lưu
													nhà cung cấp</button>
											</div>
										</div>

									</div>


								</div>
							</sf:form>

						</div>

					</div>
				</div>

			</div>

			<!-- Footer -->
			<footer class="footer mt-auto"> </footer>

		</div>
	</div>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

</body>
<script type="text/javascript">
	var editor = "";
	$(document).ready(function() {
		editor = CKEDITOR.replace('description');
	})
</script>

</html>