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
<title>Chi tiết sản phẩm</title>
</head>
<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!--Main-layout-->
	<div class="main-layout">
		<div id="product-page">
			<div class="breadcrum-shop">
				<div class="breadcrum-container container container-xl">
					<ol class="breadcrum">
						<li class="breadcrum-item"><a href="${classpath }/index">Trang chủ</a></li>
						<li class="breadcrum-item active"><a href="${classpath }/type-product/${typeProduct.id}">${product.typeProduct.name }</a>
						<li class="breadcrum-item"><a href="">${product.name }</a></li>
					</ol>
				</div>
			</div>
			<div class="container">
				<form action="${classpath }/product-detail" method="get">
					<div class="productWrap">
						<div class="productWrapAll">
							<div class="productWrapLeft">
								<div class="thumbImage">
									<c:forEach items="${productImages }" var="productImage">
										<div class="thumbImage-item">
											<img src="${classpath }/FileUpload/${productImage.path}"
												alt="">
										</div>
									</c:forEach>
								</div>
								<div class="featureImage">
									<c:forEach items="${productImages }" var="productImage">
										<div class="thumbImage-item">
											<img src="${classpath }/FileUpload/${productImage.path}"
												alt="">
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="productWrapRight">
								<div class="productWrapDetail">
									<div class="productWrapDetailTitle">
										<h1 class="product-title">${product.name }</h1>
									</div>
									<div class="productInfoMain">
										<div class="checkProduct productAvailable">
											<strong>Tình trạng: </strong>
											<c:choose>
												<c:when test="${product.warehouseQuantity > 0 }">
                                        		Còn hàng
                                        	</c:when>
												<c:otherwise>
                                        		Hết hàng
                                        	</c:otherwise>
											</c:choose>

										</div>
										<div class="productSku">
											<strong>Mã sản phẩm: </strong> ${product.code }
										</div>
										<div class="productVendor">
											<strong>Thương hiệu: </strong> ${product.vendor.name }
										</div>
										<div class="productType">
											<strong>Loại sản phẩm: </strong> ${product.typeProduct.name }
										</div>
									</div>
									<div class="productPrice">
										<div class="productPriceBox">
											<c:if test="${product.voucher>0 }">
												<del class="productPriceCompare">
													<fmt:formatNumber value="${product.sellPrice }"
														minFractionDigits="0"></fmt:formatNumber>
													đ
												</del>
											</c:if>

											<span class="productPriceMain"> <fmt:formatNumber
													value="${product.saleSellPrice }" minFractionDigits="0"></fmt:formatNumber>đ
											</span>
											<c:if test="${product.voucher>0 }">
												<span class="productDiscount">Tiết kiệm
													${product.voucher }%</span>
											</c:if>

										</div>
									</div>
									<div
										class="productActionMain d-flex align-items-center flex-wrap">
										<div class="groupAdd">
											<div class="itemQuantity">
												<button class="qtyBtn minusBtn" data-type="minus">-</button>
												<input type="number" id="quantity" name="quantity" value="1"
													min="1" class="quantiySelector" />
												<button class="qtyBtn addBtn" data-type="plus">+</button>
											</div>
										</div>
										<div class="productAction">
											<button type="button" class="hoverOpacity" id="addToCart"
												onclick="addProductToCart(${product.id })">Thêm vào
												giỏ</button>
											<button type="button" class="hoverOpacity" id="addToList">Yêu
												thích</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="productTabsContent">
							<ul class="nav nav-tabs" id="myTab" role="tabList">
								<li class="nav-item"><a class="nav-link active"
									href="#product-desc-tab">Mô tả sản phẩm</a></li>
								<li class="nav-item"><a class="nav-link"
									href="#product-detail-tab">Thông tin chi tiết</a></li>
							</ul>
							<div class="row">
								<div class="col-12 col-md-9">
									<div class="tab-content" id="myTabContent">

										<div id="product-desc-tab" class="tab-content-item">
											<p>${product.detailDescription }</p>
										</div>
										<div id="product-detail-tab" class="tab-content-item">
											<div class="table-responsive">
												<table cellpadding="0"
													style="border-collapse: collapse; width: 100%;"
													class="table table-striped table-bordered">
													<tbody>
														<tr>
															<td><strong>Tên sản phẩm</strong></td>
															<td>${product.name }</td>
														</tr>
														<tr>
															<td><strong>Thương hiệu</strong></td>
															<td>${product.vendor.name }</td>
														</tr>
														<tr>
															<td><strong>Xuất xứ</strong></td>
															<td>${product.vendor.origin }</td>
														</tr>
														<tr>
															<td style="width: 30%;"><strong>Thông tin
																	thương hiệu</strong></td>
															<td>${product.vendor.description }</td>
														</tr>
														<tr>
															<td><strong>Thông số sản phẩm</strong></td>
															<td>${product.spec }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-md-3">
									<div class="side-bar-product">
										<div class="side-bar-title">Khuyến mãi hot</div>
										<div class="side-bar-product-list">
											<div class="product-mini-item">
												<div class="product-img">
													<a href=""> <img src="" alt="">
													</a>
												</div>
												<div class="product-info">
													<div class="product-title">
														<a href="" title="Bỉm quần Merries">Bỉm quần Merries</a>
													</div>
													<div class="product-price">
														<span class="current-price">370,000đ</span>
													</div>
												</div>
											</div>
											<div class="product-mini-item">
												<div class="product-img">
													<a href=""> <img src="" alt="">
													</a>
												</div>
												<div class="product-info">
													<div class="product-title">
														<a href="" title="Bỉm quần Merries">Bỉm quần Merries</a>
													</div>
													<div class="product-price">
														<span class="current-price">370,000đ</span>
													</div>
												</div>
											</div>
											<div class="product-mini-item">
												<div class="product-img">
													<a href=""> <img src="" alt="">
													</a>
												</div>
												<div class="product-info">
													<div class="product-title">
														<a href="" title="Bỉm quần Merries">Bỉm quần Merries</a>
													</div>
													<div class="product-price">
														<span class="current-price">370,000đ</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="productRelate">
							<div class="section-title-all">
								<h2>Sản phẩm liên quan</h2>
							</div>
							<div class="product-relate-main">
								<c:forEach items="${relativeProducts }" var="product">
									<div class="proLoop">
										<div class="proWrap">
											<div class="product-img">
												<a href="" class="product-img-link"> <img
													src="${classpath }/FileUpload/${product.avatar}" alt="">
												</a>
												<div class="productAction">
													<a href=""> <i class="fa-solid fa-cart-shopping"></i>
													</a> <a href=""> <i class="fa-solid fa-heart"></i>
													</a>
												</div>
											</div>
											<div class="product-info">
												<h3 class="product-name">
													<a href="${classpath }/product-detail/${product.id}">
														${product.name } </a>
												</h3>
												<p class="product-price">525,000đ</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</form>
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
<script>
	$(document).ready(function() {
		$('.tab-content-item').hide();
		//Show the first child
		$('.tab-content-item:first-child').fadeIn();
		$('.nav-tabs li a').click(function() {
			$('.nav-tabs li a').removeClass('active');
			$(this).addClass('active');

			var id_tab_content = $(this).attr('href');
			$('.tab-content-item').hide();
			$(id_tab_content).fadeIn();
			return false;
		})
	})
</script>
<script type="text/javascript">
	addProductToCart = function(_productId) {		
		let data = {
			productId: _productId, //lay theo id
			quantity: jQuery("#quantity").val(),
			
		};
	
		jQuery.ajax({
			url : "/add-to-cart",
			type : "POST",
			contentType: "application/json",
			data : JSON.stringify(data),
			dataType : "json", 
			
			success : function(jsonResult) {
				alert(jsonResult.code + ": " + jsonResult.message);
				let totalProducts = jsonResult.totalCartProducts;
				$("#totalCartProductsId").html(totalProducts);
			},
			
			error : function(jqXhr, textStatus, errorMessage) {
				alert(jsonResult.code + ': Đã có lỗi xay ra...!')
			},
		});
	}
</script>

</html>