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
							<h2>Danh sách sản phẩm</h2>
							<a href="${classpath }/admin/product-add" role="button"
								class="btn btn-primary"> <i class="mdi mdi-database-plus"></i>
								Thêm sản phẩm
							</a>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form method="post" action="${classpath }/admin/product-delete" >
									<input type="submit" value="Xóa" class="btn btn-danger" style="margin-bottom: 10px" title="Xóa những mục đã chọn" onclick="return confirm ('Bạn có chắc chắn xóa?')"/> 
									<table class="table table-hover table-striped table-bordered no-wrap ">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkBoxAll"></th>
												<th scope="col">No.</th>
												<th scope="col">Code</th>
												<th scope="col">Ảnh</th>
												<th scope="col">Tên sản phẩm</th>
												<th scope="col">Ngày tạo</th>
												<th scope="col">Ngày cập nhật</th>
												<th scope="col">Trạng thái</th>
												<th scope="col">Tác vụ</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${products }"
												varStatus="loop">
												<tr>
													<td><input type="checkbox" class="checkBoxItem" name="productId" value="${product.id }"/></td>
													<td>${loop.index + 1 }</td>
													<td>${product.code }</td>
													<td>
														<img width="90px" height="90px" class="light-logo" src="${classpath }/FileUpload/${product.avatar }">												
													</td>
													<td>${product.name }</td>
													<td>
														<fmt:formatDate value="${product.createDate }" pattern="dd-MM-yyyy"/>
													</td>
													<td>
														<fmt:formatDate value="${product.updateDate }" pattern="dd-MM-yyyy"/>
													</td>
													<td>
														<c:choose>
															<c:when test="${product.status }">
																<span>Hoạt động</span>
															</c:when>
															<c:otherwise>
																<span>Không hoạt động</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td style="min-width: 150px">
														<a href="${classpath }/admin/product-detail/${product.id }"
														role="button" class="btn btn-info" title="Chi tiết sản phẩm"><i class="fa-solid fa-circle-info"></i></a>
														 <a href="${classpath }/admin/product-update/${product.id }"
														role="button" class="btn btn-success" title="Cập nhật sản phẩm"><i class="fa-solid fa-pen-to-square"></i></a>
														 <a href="${classpath }/admin/product-delete/${product.id }"
														role="button" class="btn btn-danger" title="Xóa sản phẩm"><i class="fa-solid fa-trash"></i></a>
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