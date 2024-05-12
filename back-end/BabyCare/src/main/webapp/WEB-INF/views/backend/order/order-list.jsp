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
					<form action="">
						<div class="card card-default">
							<div class="card-header">
								<h2>Danh sách đơn đặt hàng</h2>

							</div>
							<div class="card-body">
								<div class="table-responsive">
									<form method="get" action="${classpath }/staff/order-list">
										<input type="submit" value="Xóa" name="deleteOrder" class="btn btn-danger"
											style="margin-bottom: 10px" title="Xóa những mục đã chọn"
											onclick="return confirm ('Bạn có chắc chắn xóa?')" />
											<input type="submit" name="updateStatus" value="Cập nhật" onclick="return confirm ('Cập nhật trạng thái đơn hàng?')"/>
										<table
											class="table table-hover table-striped table-bordered no-wrap ">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkBoxAll"></th>
													<th scope="col">No</th>
													<th scope="col">Code</th>
													<th scope="col">Tên</th>
													<th scope="col">Số điện thoại</th>
													<th scope="col">Địa chỉ</th>
													<th scope="col">Ngày đặt</th>
													<th scope="col">Ngày cập nhật</th>
													<th scope="col">Theo dõi đơn hàng</th>
													<th scope="col">Trạng thái</th>
													<th scope="col">Tác vụ</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="order" items="${orders }" varStatus="loop">
													<tr>
														<td><input type="checkbox" class="checkBoxItem"
															name="orderId" value="${order.id }" /></td>
														<td>${loop.index + 1 }</td>
														<td>${order.id }</td>
														<td>${order.customerName }</td>
														<td>${order.customerMobile }</td>
														<td>${order.customerAddress }</td>
														<td><fmt:formatDate value="${order.createDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><fmt:formatDate value="${order.updateDate }"
																pattern="dd-MM-yyyy" /></td>
														<td>
															<div class="form-group mb-4">
																<div class="form-group mb-4">

																	<select class="form-order" id="orderStatus"
																		name="orderStatus_${order.id }">
																		<c:choose>
																			<c:when test="${order.orderStatus == 0 }">
																				<option value="0">Chờ xác nhận</option>
																			</c:when>
																			<c:when test="${order.orderStatus == 1 }">
																				<option value="1">Đã xác nhận</option>
																			</c:when>
																			<c:when test="${order.orderStatus == 2 }">
																				<option value="2">Đang giao hàng</option>
																			</c:when>
																			<c:when test="${order.orderStatus == 3 }">
																				<option value="3">Đã giao hàng</option>
																			</c:when>
																			<c:otherwise>
																				<option value="4">Hủy đơn hàng</option>
																			</c:otherwise>
																		</c:choose>
																		<option value="0">Chờ xác nhận</option>
																		<option value="1">Đã xác nhận</option>
																		<option value="2">Đang giao hàng</option>
																		<option value="3">Đã giao hàng</option>
																		<option value="4">Hủy đơn hàng</option>
																	</select>
																</div>

															</div>
														</td>
														<td><c:choose>
																<c:when test="${order.status }">
																	<span>Hoạt động</span>
																</c:when>
																<c:otherwise>
																	<span>Không hoạt động</span>
																</c:otherwise>
															</c:choose></td>
														<td style="min-width: 150px"><a
															href="${classpath }/staff/order-detail/${order.id }"
															role="button" class="btn btn-info"
															title="Chi tiết sản phẩm"><i
																class="fa-solid fa-circle-info"></i></a> 
																
																<button name="updateOrderStatus_${order.id }">
																	<i
																		class="fa-solid fa-pen-to-square"></i>
																</button>
																 <a
															href="${classpath }/staff/order-delete/${order.id }"
															role="button" class="btn btn-danger" title="Xóa sản phẩm"><i
																class="fa-solid fa-trash"></i></a></td>

													</tr>
												</c:forEach>

											</tbody>
										</table>
									</form>
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

</body>
</html>