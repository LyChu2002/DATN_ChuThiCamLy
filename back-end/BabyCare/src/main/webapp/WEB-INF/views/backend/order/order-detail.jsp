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
<link rel="stylesheet" href="${classpath }/backend/css/order-detail.css">
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
					<div class="row">
						<div class="col-12">
							<div class="order-detail-desc">
								<div class="row">
									<div class="col-7 align-self-center">
										<h2
											class="page-title text-truncate text-dark font-weight-medium mb-1">
											Chi tiết đơn hàng</h2>
											<a href="${classpath }/order-detail/export/pdf/${order.id}" class="btn btn-primary" style="margin-bottom: 15px">Xuất hóa đơn</a>
									</div>
									
								</div>
								<div class="card">
									<div class="card-body">
										<div class="order-detail-table">
											<div class="order-detail-header">
												<h3>HÓA ĐƠN BÁN HÀNG</h3>
												<p>Mã đơn hàng: ${order.id }</p>
											</div>
											<div class="row">
												<div class="col-md-8">
													<p>Tên khách hàng: ${order.customerName }</p>
												</div>
												<div class="col-md-4">
													<p>Số điện thoại: ${order.customerMobile }</p>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<p>Địa chỉ: ${order.customerAddress }</p>
												</div>
											</div>


											<table id="zero_config" border="1" style="width: 100%;">
												<thead>
													<tr>
														<th scope="col">STT</th>
														<th scope="col">Mã</th>
														<th scope="col">Tên sản phẩm</th>
														<th scope="col">Số lượng</th>
														<th scope="col">Đơn giá</th>
														<th scope="col">Thành tiền</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach var="productOrder" items="${listProducts }"
														varStatus="loop">
														<tr>
															<td>${loop.index + 1 }</td>
															<td>${productOrder.product.code}</td>
															<td>${productOrder.product.name }</td>
															<td>${productOrder.quantity }</td>
															<td><fmt:formatNumber
																	value="${productOrder.price}"
																	minFractionDigits="0"></fmt:formatNumber></td>
															<td><fmt:formatNumber
																	value="${productOrder.price * productOrder.quantity}"
																	minFractionDigits="0"></fmt:formatNumber></td>
														</tr>
													</c:forEach>

													<tr>
														<td colspan="5" style="text-align: center;">Tổng
															cộng: <fmt:formatNumber value="${order.total }"
																minFractionDigits="0"></fmt:formatNumber>
														</td>

													</tr>
												</tbody>

											</table>
											<div class="row">
												<div class="col-md-12">
													<p>Ghi chú: ${order.note }</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6"></div>
												<div class="col-md-6">
													<table border="0">
														<tr>
															<td>Tổng số lượng:</td>
															<td>${totalProducts }</td>
														</tr>
														<tr>
															<td>Tổng tiền hàng:</td>
															<td><fmt:formatNumber value="${order.total }"
																	minFractionDigits="0"></fmt:formatNumber></td>
														</tr>
														<tr>
															<td>Ngày đặt:</td>
															<td><fmt:formatDate value="${order.createDate}"
																	pattern="dd-MM-yyyy" /></td>
														</tr>
													</table>
												</div>
											</div>
										</div>

									</div>


								</div>
								<div class="row" style="margin-top: 24px;">
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