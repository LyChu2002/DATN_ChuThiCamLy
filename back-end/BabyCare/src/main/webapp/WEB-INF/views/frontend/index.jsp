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
<title>BabyCare</title>
</head>
<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!--Main layout-->
	<div class="main-layout">
		<section id="slider">
			<div class="container">
				<div class="slider-category"></div>
				<div class="slider-group">
					<c:forEach items="${banners }" var="banner">
						<div class="banner-brand-item">
							<img src="${classpath }/FileUpload/${banner.image}" alt=""
								width="100%" height="580px">
						</div>
					</c:forEach>
				</div>

			</div>
		</section>
		<div class="home-brand">
			<div class="container">
				<div class="home-brand-slider">
					<c:forEach items="${vendors }" var="vendor">
						<div class="home-brand-item">
							<img src="${classpath }/FileUpload/${vendor.image}" alt="">
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<section id="group-product-slider">
			<div class="container">
				<div class="section-title">
					<h2>Sản phẩm nổi bật</h2>
				</div>
				<div class="group-product-slider">

					<div class="productLoop">
						<c:forEach var="product" items="${hotProducts }">
							<div class="proLoop">
								<div class="proWrap">
									<div class="product-img">
										<div class="product-tag-new">
											<img
												src="${classpath }/frontend/assets/images/tag/tag_hot.webp"
												alt="Tag new">
										</div>

										<a href="${classpath }/product-detail/${product.id}"
											class="product-img-link"> <img
											src="${classpath }/FileUpload/${product.avatar}" alt="">
										</a>
										<div class="productAction">
											<a onclick="addToCart(${product.id}, 1, '${product.name }')"> <i class="fa-solid fa-cart-shopping"></i>
											</a> <a href=""> <i class="fa-solid fa-heart"></i>
											</a>
										</div>
									</div>
									<div class="product-info">
										<h3 class="product-name">
											<a href="${classpath }/product-detail/${product.id}">
												${product.name } </a>
										</h3>
										<p class="product-price">
											<fmt:formatNumber value="${product.saleSellPrice }"
												minFractionDigits="0"></fmt:formatNumber>
											đ
											<c:if test="${product.voucher > 0}">
												<del class="productPriceDelete">
													<fmt:formatNumber value="${product.sellPrice }"
														minFractionDigits="0"></fmt:formatNumber>
													đ
												</del>
											</c:if>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</section>

		<c:forEach var="category" items="${categories }">
			<section class="group-product">
				<div class="container">
					<div
						class="group-product-top d-flex align-items-center justify-content-between">
						<div class="col-lg-3 group-product-heading">
							<h2>${category.name }</h2>
						</div>

						<ul class="nav-product nav-tabs-product col-lg-6" id="myTab1"
							role="tabList">
							<c:forEach var="typeProduct" items="${category.typeProducts}">
								<c:if test="${typeProduct.status }">
									<li class="nav-item"><a
										class="nav-type-link cate-${category.id }"
										href="#product-type-group-${typeProduct.id }">${typeProduct.name }</a></li>
								</c:if>

							</c:forEach>
						</ul>
						<div class="view-more col-lg-3 d-flex justify-content-end pr-0">
							<a href="">Xem thêm</a>
						</div>
					</div>
					<div class="product-group-content">
						<div class="row row-15">
							<div class="banner-group col-md-3 col-12 d-none d-md-block">
								<div class="group-product-banner">
									<a href=" "> <img
										src="${classpath }/FileUpload/${category.image}" alt="">
									</a>
								</div>
							</div>
							<div class="col-md-9 col-12">
								<c:forEach var="typeProduct" items="${category.typeProducts }">
									<c:if test="${typeProduct.status }">
										<div id="product-type-group-${typeProduct.id }"
											class="group-product-main-${category.id }">
											<div class="row">
												<c:forEach var="product" items="${typeProduct.products}">
													<c:if test="${product.status }">
														<div class="proLoop col-lg-3 col-md-3 col-sm-6">
															<div class="proWrap">
																<div class="product-img">
																	<c:if test="${product.isHot }">
																		<div class="product-tag-new">
																			<img
																				src="${classpath }/frontend/assets/images/tag/tag_hot.webp"
																				alt="Tag hot">
																		</div>
																	</c:if>
																	<c:if test="${product.isNew }">
																		<div class="product-tag-new">
																			<img
																				src="${classpath }/frontend/assets/images/tag/tag_new.webp"
																				alt="Tag new">
																		</div>
																	</c:if>
																	<c:if test="${product.voucher > 0 }">
																		<span class="productSale"> -${product.voucher}%
																		</span>
																	</c:if>
																	<a href="${classpath }/product-detail/${product.id}"
																		class="product-img-link"> <img
																		src="${classpath }/FileUpload/${product.avatar}"
																		alt="">
																	</a>
																	<div class="productAction">
																		<a onclick="addToCart(${product.id}, 1, '${product.name }')"> <i class="fa-solid fa-cart-shopping"></i>
																		</a> <a href=""> <i class="fa-solid fa-heart"></i>
																		</a>
																	</div>
																</div>
																<div class="product-info">
																	<h3 class="product-name">
																		<a href="${classpath }/product-detail/${product.id}">${product.name }</a>
																	</h3>
																	<p class="product-price">
																		<fmt:formatNumber value="${product.saleSellPrice }"
																			minFractionDigits="0"></fmt:formatNumber>
																		đ
																		<c:if test="${product.voucher > 0}">
																			<del class="productPriceDelete">
																				<fmt:formatNumber value="${product.sellPrice }"
																					minFractionDigits="0"></fmt:formatNumber>
																				đ
																			</del>
																		</c:if>
																	</p>
																</div>
															</div>
														</div>
													</c:if>

												</c:forEach>
											</div>
										</div>
									</c:if>

								</c:forEach>

							</div>
						</div>
					</div>
				</div>
			</section>
		</c:forEach>
	</div>

	<!--Footer-->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
</body>

<!-- JS -->
<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

<script>
	$(window).scroll(function() {
		var sticky = $('.mainNav'), scroll = $(window).scrollTop();

		if (scroll >= 100)
			sticky.addClass('unActiveNav');
		else
			sticky.removeClass('unActiveNav');

	});
</script>
<script type="text/javascript">
	addToCart = function(_productId, _quantity, _productName) {
		let data = {
			productId : _productId,
			quantity : _quantity,

		};

		//$ === jQuery
		jQuery.ajax({
			url : "/add-to-cart",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(data),
			dataType : "json", //Kieu du lieu tra ve tu controller la json

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
<script>
	$(document).ready(function() {
		<c:forEach var="category" items="${categories}">
		$('.group-product-main-${category.id}').hide();
		</c:forEach>

		<c:forEach var="category" items="${categories}">
		$('.group-product-main-${category.id}:first-child').fadeIn();
		</c:forEach>

		$('.nav-tabs-product li a').click(function() {
			$('.nav-tabs-product li a').removeClass('active');
			$(this).addClass('active');

			var id_tab_content = $(this).attr('href');
			var class_name = $(this).attr('class');
			console.log(class_name);
			<c:forEach var="category" items="${categories}">
			if (class_name == 'nav-type-link cate-${category.id} active') {
				$('.group-product-main-${category.id}').hide();
				$(id_tab_content).fadeIn();
			}
			</c:forEach>

			return false;
		})
	})
</script>
</html>