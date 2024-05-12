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
<title>Tìm kiếm</title>
</head>
<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
	<!--Main layout-->
	<div class="main-layout">
		<div id="search-page">
			<div class="breadcrum-shop">
				<div class="breadcrum-container container container-xl">
					<ol class="breadcrum">
						<li class="breadcrum-item"><a href="${classpath }/index">Trang
								chủ</a></li>
						<li class="breadcrum-item active"><a href="">Tìm kiếm</a></li>
					</ol>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="searchPageHeader" style="text-align: center;">
							<h2>Tìm kiếm</h2>
							<span>Có ${totalSearchProducts } kết quả cho "${searchName }"</span>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<c:forEach var="product" items="${searchProducts }">
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
										<span class="productSale"> -${product.voucher}% </span>
									</c:if>
									<a href="${classpath }/product-detail/${product.id}"
										class="product-img-link"> <img
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
										<a href="">${product.name }</a>
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

</html>