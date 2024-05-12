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
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
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
							<h2>Thêm bài viết</h2>
						</div>
						<div class="card-body">
							<c:if test="${not empty messageResponse }">
								<div class="alert alert-${alert }" style="width: 30%">
									${messageResponse }</div>
							</c:if>
							<sf:form class="form" action="${classpath }/admin/blog-add-save"
								method="post" modelAttribute="blog"
								enctype="multipart/form-data">
								<div class="form-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="title">Tên bài viết</label>
												<sf:input id="title" path="title" type="text"
													class="form-control" placeholder="Tên bài viết"
													required="required"
													oninvalid="this.setCustomValidity('Nhập tên bài viết')"
													oninput="setCustomValidity('')"></sf:input>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="avatarFile">Chọn ảnh bài viết</label> <input
													id="avatarFile" name="avatarFile" class="form-control-file"
													type="file" multiple="multiple">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="user">Tác giả</label>
												<sf:select path="user.id" class="form-control" id="user">
													<sf:options itemValue="id" items="${users }"
														itemLabel="username" class="form-control"></sf:options>
												</sf:select>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group mb-4">
												<label for="summary">Tóm tắt bài viết</label>
												<sf:textarea id="summary" path="summary" rows="4"
													class="form-control"></sf:textarea>

											</div>
										</div>

									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group mb-4">
												<label for="detail">Chi tiết bài viết</label>
												<sf:textarea id="detail" path="detail" rows="4"
													class="form-control"></sf:textarea>
											</div>
										</div>

									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="createDate">Ngày tạo</label>
												<sf:input id="createDate" path="createDate" type="date"
													class="form-control" placeholder="Mã danh mục"></sf:input>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label for="updateDate">Ngày cập nhật</label>
												<sf:input id="updateDate" path="updateDate" type="date"
													class="form-control" placeholder="Tên danh mục"></sf:input>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-8">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group mb-4">
														<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<sf:checkbox path="status" class="form-check-input"
															id="status" name="status"></sf:checkbox>
														<label>&nbsp;</label> <label for="status">Hoạt
															động</label>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-4"></div>

									</div>
									
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-4">
                                               <a href="${classpath }/admin/blog-list" class="btn btn-light active" role="button">Về danh sách</a>
                                               <button type="submit" class="btn btn-primary">Lưu bài viết</button>
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

	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</body>

<script>
	$(document).ready(function() {

		$('#detail').summernote({
	        placeholder: 'Chi tiết bài viết',
	        tabsize: 2,
	        height: 300
	      });
	});
</script>

</html>