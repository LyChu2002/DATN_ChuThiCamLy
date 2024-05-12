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
							<h2>Chi tiết đơn hàng</h2>
						</div>
						<div class="card-body">
							<div class="user-info" style="margin-left: 10px">
								<div class="row" style="padding: 4px; font-size: 18px;">
									<label> <span style="color: #1c2d41">Mã đơn
											hàng:</span> ${order.id }
									</label>
								</div>

								<div class="row" style="padding: 4px; font-size: 18px;">
									<label> <span style="color: #1c2d41">Họ tên:</span>
										${order.customerName }
									</label>
								</div>

								<div class="row" style="padding: 4px; font-size: 18px;">
									<label><span style="color: #1c2d41">Số điện
											thoại: </span>${order.customerMobile }</label>
								</div>

								<div class="row" style="padding: 4px; font-size: 18px;">
									<label> <span style="color: #1c2d41">Địa chỉ: </span>
										${order.customerAddress }
									</label>
								</div>
							</div>

							<div class="table-responsive">
								<table
									class="table table-hover table-striped table-bordered no-wrap ">
									<thead>
										<tr>
											<th scope="col">No.</th>
											<th scope="col">Mã sản phẩm</th>
											<th scope="col">Tên sản phẩm</th>
											<th scope="col">Giá bán</th>
											<th scope="col">Số lượng</th>
											<th scope="col">Tổng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="productOrder" items="${listProducts }"
											varStatus="loop">
											<tr>
												<td>${loop.index + 1 }</td>
												<td>${productOrder.product.id}</td>
												<td>${productOrder.product.name }</td>
												<td><fmt:formatNumber
														value="${productOrder.product.saleSellPrice}"
														minFractionDigits="0"></fmt:formatNumber></td>
												<td>${productOrder.quantity }</td>
												<td><fmt:formatNumber
														value="${productOrder.product.saleSellPrice * productOrder.quantity}"
														minFractionDigits="0"></fmt:formatNumber></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="row" style="padding: 4px; font-size: 18px; margin-left: 11px">
									<label>Tổng thành tiền: <fmt:formatNumber
											value="${order.total }" minFractionDigits="0"></fmt:formatNumber>

									</label>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group mb-4">
											<a href="${classpath }/staff/order-list" role="button"
												class="btn btn-primary">Về danh sách</a>
										</div>
									</div>

								</div>
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