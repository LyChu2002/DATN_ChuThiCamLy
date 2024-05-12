<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Variable -->
<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<!-- CSS -->
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
<title>Giỏ hàng</title>
</head>
<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
	<!--Main layout-->
	<div class="main-layout">
		<div id="cart-page">
			<div class="breadcrum-shop">
				<div class="breadcrum-container container container-xl">
					<ol class="breadcrum">
						<li class="breadcrum-item"><a href="${classpath }/index">Trang chủ</a></li>
						<li class="breadcrum-item active"><a href="">Giỏ hàng</a></li>
					</ol>
				</div>
			</div>
			<div class="container">
				<c:choose>
					<c:when test="${totalCartProducts > 0 }">
						<form action="${classpath }/cart-view" method="get">
							<div class="cart-page-wrap">
								<div class="cart-page-left">
									<div class="cart-page-list">
										<c:forEach var="item" items="${cart.cartProducts }"
											varStatus="loop">
											<div class="cart-page-list-item">
												<div class="cart-page-list-item-image">
													<img class="img-fluid"
														src="${classpath }/FileUpload/${item.avatar}" alt="">
												</div>
												<div class="cart-page-list-item-detail">
													
													<h3 class="item-name">
														<a href="">${item.productName }</a>
													</h3>
													<span class="item-desc">SKU: ${item.productCode }</span>
												</div>
												<div class="cart-page-list-item-price">
													<span class="item-price"> <span> <fmt:formatNumber
																value="${item.price }" minFractionDigits="0"></fmt:formatNumber>đ
													</span>
													</span>
													<c:if test="${item.voucher > 0}">
														<del>
															<fmt:formatNumber value="${item.prevPrice}"
																minFractionDigits="0"></fmt:formatNumber>
															đ
														</del>
													</c:if>

												</div>
												<div class="cart-page-list-item-actions">
													<div class="cart-product-quantity-wrap">
														<button class="cart-product-quantity-button-minus"
															onclick="updateProductQuantity(${item.productId}, -1)"
															value="-">-</button>
														<input id="productQuantity_${item.productId }"
															type="number" class="cart-product-quantity-number"
															value="${item.quantity }">
														<button class="cart-product-quantity-button-plus"
															onclick="updateProductQuantity(${item.productId}, 1)"
															value="-">+</button>
													</div>
												</div>
												<div class="cart-page-list-item-remove">
													<a
														href="${classpath }/product-cart-delete/${item.productId }"
														role="button" class="btn-delete"> <i
														class="fa-solid fa-trash-can"></i>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="cart-page-right">
									<div class="cart-page-info">
										<h1>Thông tin đơn hàng</h1>
										<div class="cart-page-subtotal">
											<span>Tạm tính (${totalCartProducts } sản phẩm)</span> <span>
												<span class="item-price-unit"><fmt:formatNumber value="${totalCartPrice }"
														minFractionDigits="0"></fmt:formatNumber>đ</span>
											</span>
										</div>
										<div class="cart-page-total">
											<span>Tổng cộng</span>
											<div class="cart-page-total-price">
												<span> <fmt:formatNumber value="${totalCartPrice }"
														minFractionDigits="0"></fmt:formatNumber>đ
												</span>
											</div>
										</div>
										<div class="cart-page-checkout">
											<a onclick="_placeOrder()">Đặt hàng</a>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="place-order-infor">
							<h3>THÔNG TIN KHÁCH HÀNG</h3>
							<form action="${classpath }/cart-view" method="get">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-body">
												<div class="form-body">
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Họ tên <span>*</span></label></br> <input
																	class="form-control" type="text" name="txtName"
																	id="txtName" placeholder="VD: Cẩm Ly"
																	value="${user.username }" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Số điện thoại <span>*</span></label></br> <input
																	class="form-control" type="text" name="txtMobile"
																	id="txtMobile" placeholder="VD: 098765432"
																	value="${user.mobile }" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Email</label></br> <input class="form-control"
																	type="text" name="txtEmail" id="txtEmail"
																	placeholder="VD: camly@gmail.com"
																	value="${user.email }" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Địa chỉ <span>*</span></label></br> <input
																	class="form-control" type="text" name="txtAddress"
																	id="txtAddress" placeholder="VD: Hà Nội"
																	value="${user.address }" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Ghi chú </label></br> <input class="form-control"
																	type="text" name="note" id="note" />
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>

							</form>
						</div>
					</c:when>
					<c:otherwise>
						<h3 align="center"
							class="page-title text-truncate text-dark font-weight-medium mb-1">
							<span>${errorMessage }</span>
						</h3>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
	<!-- JS -->
	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

</body>

<script>
	var sticky = $('.mainNav');
	scroll = $(window).scrollTop();

	sticky.addClass('unActiveNav');
</script>
<script type="text/javascript">
	updateProductQuantity = function(_productId, _quantity) {
		let data = {
			productId : _productId, 
			quantity : _quantity,
		};

		jQuery.ajax({
			url : "/update-product-quantity",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(data),
			dataType : "json", 

			success : function(jsonResult) {
				let totalProducts = jsonResult.totalCartProducts; 
				$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 
			},

			error : function(jqXhr, textStatus, errorMessage) {
				alert("Có lỗi xảy ra");
			}
		});
	}
</script>
<script type="text/javascript">
	function _placeOrder() {
		//javascript object
		let data = {				
			txtName : jQuery("#txtName").val(),
			txtEmail : jQuery("#txtEmail").val(), 
			txtMobile : jQuery("#txtMobile").val(),
			txtAddress : jQuery("#txtAddress").val(),
			note: jQuery('#note').val(),
		};
		
		//$ === jQuery
		jQuery.ajax({
			url : "/place-order",
			type : "POST",
			contentType: "application/json",
			data : JSON.stringify(data),
			dataType : "json", 
			
			success : function(jsonResult) {
				alert(jsonResult.code + ": " + jsonResult.message);
				$("#placeOrderSuccess").html(jsonResult.message);
			},
			
			error : function(jqXhr, textStatus, errorMessage) {
				alert("Có lỗi xảy ra");
			}
		});
	}
</script>


</html>