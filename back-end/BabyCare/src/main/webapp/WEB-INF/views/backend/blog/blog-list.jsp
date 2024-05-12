<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
							<h2>Danh sách bài viết</h2>
							<a href="${classpath }/admin/blog-add" role="button"
								class="btn btn-primary"> <i class="mdi mdi-database-plus"></i>
								Thêm bài viết
							</a>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form method="post" action="${classpath }/admin/blog-delete" >
									<input type="submit" value="Xóa" class="btn btn-danger" style="margin-bottom: 10px" title="Xóa những mục đã chọn" onclick="return confirm ('Bạn có chắc chắn xóa?')"/> 
									<table class="table table-hover table-striped table-bordered no-wrap ">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkBoxAll"></th>
												<th scope="col">No.</th>
												<th scope="col">Ảnh</th>
												<th scope="col">Tiêu đề</th>
												<th scope="col">Tên tác giả</th>
												<th scope="col">Ngày tạo</th>
												<th scope="col">Ngày cập nhật</th>
												<th scope="col">Trạng thái</th>
												<th scope="col">Tác vụ</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="blog" items="${blogs }"
												varStatus="loop">
												<tr>
													<td><input type="checkbox" class="checkBoxItem" name="blogId" value="${blog.id }"/></td>
													<td>${loop.index + 1 }</td>
													<td>
														<img width="90px" height="90px" class="light-logo" src="${classpath }/FileUpload/${blog.avatar }">												
													</td>
													<td>${blog.title }</td>
													<td>${blog.user.username }</td>
													<td>
														<fmt:formatDate value="${blog.createDate }" pattern="dd-MM-yyyy"/>
													</td>
													<td>
														<fmt:formatDate value="${blog.updateDate }" pattern="dd-MM-yyyy"/>
													</td>
													<td>
														<c:choose>
															<c:when test="${blog.status }">
																<span>Hoạt động</span>
															</c:when>
															<c:otherwise>
																<span>Không hoạt động</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td style="min-width: 150px">
														<a href="${classpath }/admin/blog-detail/${blog.id }"
														role="button" class="btn btn-info" title="Chi tiết bài viết"><i class="fa-solid fa-circle-info"></i></a>
														 <a href="${classpath }/admin/blog-update/${blog.id }"
														role="button" class="btn btn-success" title="Cập nhật bài viết"><i class="fa-solid fa-pen-to-square"></i></a>
														 <a href="${classpath }/admin/blog-delete/${blog.id }"
														role="button" class="btn btn-danger" title="Xóa bài viết"><i class="fa-solid fa-trash"></i></a>
														</td>
											
												</tr>
											</c:forEach>
	
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

</body>
</html>