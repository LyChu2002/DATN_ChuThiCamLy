<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<header id="header">
	<div class="headerMenuTop">
		<div class="container">
			<div class="headerMain">
				<div class="headerLeft">
					<div class="headerLogo">
						<a href="${classpath }/index"> <img
							src="${classpath }/frontend/assets/images/logo/logo.png" alt=""
							class="img-fluid">
						</a>
					</div>
				</div>
				<div class="headerCenter">
					<div class="headerSearch">
						<form action="/search" method="get">
							<div class="headerSearchMain">
								<input required="" name="name" id="name" maxlength="40" autocomplete="off"
									class="headerSearchInput searchinput input-search search-input"
									type="text" size="20" placeholder="Ba mẹ muốn tìm gì cho bé?"
									aria-label="Search">
							</div>
							<button type="submit" class="btn-search btn headerSearchButton"
								aria-label="Tìm kiếm">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</form>
					</div>
				</div>
				<div class="headerRight">
					<div class="headerUser">
						<c:choose>
							<c:when test="${isLogined }">
								<a href="${classpath }/account" style="color: #37a1a5">
									${loginedUser.username }</i>
								</a>
								 <span>/</span>
                       			 <a href="${classpath }/logout">Đăng xuất</a>
							</c:when>
							<c:otherwise>
								<a href="${classpath }/register"><i class="fa-solid fa-user" style="font-size: 20px"></i></a>
							</c:otherwise>

						</c:choose>
					</div>
					<div class="headerLikeList headerTool">
						<a href=""> <i class="fa-regular fa-heart"></i> <span
							class="span-count">0</span>
						</a>
					</div>
					<div class="headerCart headerTool">
						<a href="${classpath }/cart-view"> <i
							class="fa-solid fa-cart-shopping"></i> <span
							id="totalCartProductsId" class="span-count">${totalCartProducts }</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="headerMenu">
		<div class="container">
			<div class="headerMenuLeft">
				<i class="fa-solid fa-bars"></i> Danh mục sản phẩm
				<nav class="mainNav">
					<ul class="menuCategory">
						<c:forEach var="category" items="${menuCategories }"
							varStatus="loop">
							<li><a href=""> <span> <img
										src="${classpath }/FileUpload/${category.avatar}"> <span>${category.name }</span>
								</span> <i class="fa-solid fa-chevron-right"></i>
							</a>
								<div class="subMenuTwo">
									<a href="">${category.name }</a>
									<ul>
										<c:forEach var="typeProduct" items="${category.typeProducts }"
											varStatus="loop">
											<c:if test="${typeProduct.status }">
												<li><a href=""> ${typeProduct.name } </a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div></li>
						</c:forEach>
					</ul>
				</nav>
			</div>
			<div class="headerMenuRight">
				<div class="headerMenuRightNav">
					<a href="${classpath }/index"> <span> <i
							class="fa-solid fa-house"></i>
					</span> Trang chủ
					</a> <a href=""> <span> <i class="fa-solid fa-circle-info"></i>
					</span> Giới thiệu thương hiệu
					</a> <a href="${classpath }/blog"> <span> <i
							class="fa-solid fa-blog"></i>
					</span> Blog chia sẻ
					</a> <a href=""> <span> <i class="fa-solid fa-address-book"></i>
					</span> Liên hệ
					</a> <a href=""> <span> <i class="fa-solid fa-phone-volume"></i>
					</span> Hotline: 0869.279.885
					</a>
				</div>
			</div>
		</div>
	</div>
</header>