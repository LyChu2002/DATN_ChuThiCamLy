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
					<form action="${classpath }/admin/product-list" method="get">
						<div class="card card-default">
							<div class="card-header">
								<h2>Danh sách sản phẩm</h2>

								<div class="row1">
									<input type="submit" value="Xóa" name="deleteProduct"
										class="btn btn-danger"
										onclick="return confirm ('Bạn có chắc chắn xóa?')" /> <a
										href="${classpath }/admin/product-add" role="button"
										class="btn btn-primary"> <i class="mdi mdi-database-plus"></i>
										Thêm
									</a>
								</div>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-4">
										<input type="hidden" id="page" name="page"
											class="form-control" value="${productSearch.currentPage }" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<div class="form-group mb-4">
											<label for="status">Trạng thái</label> <select
												class="form-control" id="status" name="status">
												<option value="2">Tất cả</option>
												<option value="1">Hoạt động</option>
												<option value="0">Không hoạt động</option>
											</select>
										</div>
									</div>
									<div class="col-md-3">
										<label for="code">Nhập code</label> <input
											class="form-control" type="text" id="code" name="code"
											placeholder="Tìm kiếm" />
									</div>
									<div class="col-md-3">
										<label for="name">Nhập tên</label> <input class="form-control"
											type="text" id="name" name="name" placeholder="Tìm kiếm" />
									</div>
									<div class="col-md-2">
										<label></label>
										<button type="submit" id="btnSearch" name="btnSearch"
											class="btn-searching">Tìm kiếm</button>
									</div>
								</div>

								<div class="table-responsive">


									<table
										class="table table-hover table-striped table-bordered no-wrap ">
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
													<td><input type="checkbox" class="checkBoxItem"
														name="productId" value="${product.id }" /></td>
													<td>${loop.index + 1 }</td>
													<td>${product.code }</td>
													<td><img width="90px" height="90px" class="light-logo"
														src="${classpath }/FileUpload/${product.avatar }"></td>
													<td>${product.name }</td>
													<td><fmt:formatDate value="${product.createDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><fmt:formatDate value="${product.updateDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><c:choose>
															<c:when test="${product.status }">
																<span>Hoạt động</span>
															</c:when>
															<c:otherwise>
																<span>Không hoạt động</span>
															</c:otherwise>
														</c:choose></td>
													<td style="min-width: 150px"><a
														href="${classpath }/admin/product-detail/${product.id }"
														role="button" class="btn btn-info"
														title="Chi tiết sản phẩm"><i
															class="fa-solid fa-circle-info"></i></a> <a
														href="${classpath }/admin/product-update/${product.id }"
														role="button" class="btn btn-success"
														title="Cập nhật sản phẩm"><i
															class="fa-solid fa-pen-to-square"></i></a> <a
														href="${classpath }/admin/product-delete/${product.id }"
														role="button" class="btn btn-danger" title="Xóa sản phẩm"><i
															class="fa-solid fa-trash"></i></a></td>

												</tr>
											</c:forEach>

										</tbody>
									</table>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4"></div>
										</div>

										<div class="col-md-6">
											<div class="pagination float-right">
												<div id="paging"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
	<!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			$("#status").val(${productSearch.status});
			$("#code").val("${productSearch.code}");
			$("#name").val("${productSearch.name}");
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, 
				items: ${productSearch.totalItems}, 
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>

</body>
</html>