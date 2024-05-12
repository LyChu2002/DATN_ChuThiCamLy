<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<form action="${classpath }/staff/warehouse" method="post">
						<div class="card card-default">
							<div class="card-header">
								<div class="row1">
									<h2>Thống kê kho</h2>
								</div>
								<div class="row1">
									<input type="submit" value="Cập nhật" name="updateQuantity"
										class="btn btn-success"
										onclick="return confirm ('Bạn có chắc chắn cập nhật?')" />
								</div>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-4">
										<input type="hidden" id="page" name="page"
											class="form-control" value="${warehouseSearch.currentPage }" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<label for="code">Code</label> 
										<input class="form-control" type="text"
											id="code" name="code" placeholder="Nhập code" />
									</div>
									<div class="col-md-3">
										<label for="name">Tên sản phẩm</label> 
										<input class="form-control"
											type="text" id="name" name="name"
											placeholder="Nhập tên sản phẩm" />
									</div>
									<div class="col-md-2">
										<div class="form-group mb-4">
											<label for="warehouseStatus">Trạng thái</label>
											 <select
												class="form-control" id="warehouseStatus"
												name="warehouseStatus">
												<option value="2">Tất cả</option>
												<option value="1">Còn hàng</option>
												<option value="0">Hết hàng</option>
											</select>
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group mb-4">
											<label for="sortQuantity">Số lượng kho</label> <select
												class="form-control" id="sortQuantity"
												name="sortQuantity">
												<option value="2">Mặc định</option>
												<option value="1">Tăng dần</option>
												<option value="0">Giảm dần</option>
											</select>
										</div>
									</div>

									<div class="col-md-2">
										<label></label>
										<button type="submit" id="btnSearch" name="btnSearch"
											class="btn-searching" style="margin-top: 8px">Tìm
											kiếm</button>
									</div>
								</div>

								<div class="table-responsive">
									<table
										class="table table-hover table-striped table-bordered no-wrap ">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Code</th>
												<th scope="col">Tên sản phẩm</th>
												<th scope="col">Số lượng kho</th>
												<th scope="col">Số lượng nhập</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${products }"
												varStatus="loop">
												<tr>
													
													<td>${loop.index + 1 }</td>
													<td>${product.code }</td>
													<td>${product.name }</td>
													<td>${product.warehouseQuantity }</td>
													<td><input type="number" name="updateQuantity_${product.id }"/></td>
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
			$("#sortQuantity").val(${warehouseSearch.sortQuantity});
			$("#warehouseStatus").val(${warehouseSearch.warehouseStatus});
			$("#code").val("${warehouseSearch.code}");
			$("#name").val("${warehouseSearch.name}");
			
			$("#paging").pagination({
				currentPage: ${warehouseSearch.currentPage}, 
				items: ${warehouseSearch.totalItems},
				itemsOnPage: ${warehouseSearch.sizeOfPage},
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