<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Map"%>
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
					<form method="get" action="${classpath }/staff/product-statistic">
						<div class="card card-default">
							<div class="card-header">
								<h2>Thống kê sản phẩm</h2>

							</div>
							<div class="card-body">
								<div class="row" style="margin-bottom: 15px;">
									<div
										class="col-md-2 statistic-number bg-primary justify-content-between text-white align-items">
										<p class="statictis-header">Số lượng đã nhập</p>
										<p style="font-weight: 700;">${totalImportQuantity } sản
											phẩm</p>
									</div>
									<div
										class="col-md-2 statistic-number bg-success justify-content-between text-white align-items">
										<p class="statictis-header">Số lượng đã bán</p>
										<p style="font-weight: 700;">${totalSoldQuantity } sản phẩm</p>
									</div>
									<div style="background-color: #6493fa;"
										class="col-md-2 statistic-number justify-content-between text-white align-items">
										<p class="statictis-header">Tổng tiền nhập</p>
										<p style="font-weight: 700;">
											<fmt:formatNumber value="${totalImportPrice }"
												minFractionDigits="0"></fmt:formatNumber>
											VND
										</p>
									</div>

									<div style="background-color: #ffc107;"
										class="col-md-2 statistic-number justify-content-between text-white align-items">
										<p class="statictis-header">Tổng doanh thu</p>
										<p style="font-weight: 700;">
											<fmt:formatNumber value="${totalRevenue }"
												minFractionDigits="0"></fmt:formatNumber>
											VND
										</p>
									</div>
									<div
										class="col-md-2 statistic-number bg-danger justify-content-between text-white align-items">
										<p class="statictis-header">Tổng Lợi nhuận</p>
										<p style="font-weight: 700;">
											<fmt:formatNumber value="${totalProfit }"
												minFractionDigits="0"></fmt:formatNumber>
											VND
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<input type="hidden" id="page" name="page"
											class="form-control" value="${productSearch.currentPage }" />
									</div>
								</div>
								<div class="row" style="margin-bottom: 20px">
									<div class="col-md-3">
										<label for="code">Code</label> <input class="form-control"
											type="text" id="code" name="code" />
									</div>
									<div class="col-md-6">
										<label for="name">Tên sản phẩm</label> <input
											class="form-control" type="name" id="name" name="name" />
									</div>

								</div>
								<div class="row" style="margin-bottom: 20px">
									<div class="col-md-3">
										<div class="form-group mb-4">
											<label for="criteriaSort">Tiêu chí sắp xếp</label> <select
												class="form-control" id="criteriaSort" name="criteriaSort">
												<option value="4">Không sắp xếp</option>
												<option value="3">Số lượng đã bán</option>
												<option value="2">Số lượng nhập</option>
												<option value="1">Tổng giá nhập</option>
												<option value="0">Doanh thu</option>
											</select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group mb-4">
											<label for="sortBy">Sắp xếp theo</label> <select
												class="form-control" id="sortBy" name="sortBy">
												<option value="2">Mặc định</option>
												<option value="1">Tăng dần</option>
												<option value="0">Giảm dần</option>
											</select>
										</div>
									</div>
									<div class="col-md-3">
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
												<th scope="col">No</th>
												<th scope="col">Mã</th>
												<th scope="col">Tên sản phẩm</th>
												<th scope="col">Số lượng nhập</th>
												<th scope="col">Số lượng đã bán</th>
												<th scope="col">Tổng giá nhập</th>
												<th scope="col">Doanh thu</th>
												<th scope="col">Lợi nhuận</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${product_statistics }"
												varStatus="loop">
												<tr>
													<td>${loop.index + 1 }</td>
													<td>${product.code }</td>
													<td>${product.name }</td>
													<td>${product.soldQuantity + product.warehouseQuantity}</td>
													<td>${product.soldQuantity }</td>
													<td><fmt:formatNumber
															value="${(product.soldQuantity + product.warehouseQuantity) * product.importPrice }"
															minFractionDigits="0"></fmt:formatNumber></td>
													<td><fmt:formatNumber value="${revenue[product.id]}"
																	minFractionDigits="0"></fmt:formatNumber></td>		
													<td><fmt:formatNumber value="${profit[product.id]}"
																	minFractionDigits="0"></fmt:formatNumber></td>

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
			$("#criteriaSort").val(${productSearch.criteriaSort});
			$("#sortBy").val(${productSearch.sortBy});
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