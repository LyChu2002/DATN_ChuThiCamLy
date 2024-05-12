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
<link rel="stylesheet" href="${classpath }/frontend/assets/css/blog.css">
<title>Blog chia sẻ</title>
</head>
<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!--Main layout-->
	<div class="main-layout">
		<div id="blog">
			<div class="breadcrum-shop">
				<div class="breadcrum-container container container-xl">
					<ol class="breadcrum">
						<li class="breadcrum-item"><a href="${classpath }/index">Trang chủ</a></li>
						<li class="breadcrum-item active"><a href="${classpath }/blog">Blog chia sẻ</a>
						</li>
					</ol>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="blogMainContent">
							<div class="blogBody">
								<div class="blogListArticle">
									<c:forEach var="blog" items="${blogs }">
										<article class="article-item">
											<div class="article-item-top">
												<a href="${classpath }/blog-detail/${blog.id}"> <img
													style="width: 100%;" class="img-fluid"
													src="${classpath }/FileUpload/${blog.avatar}" alt="">
												</a>
											</div>
											<div class="article-item-bottom">
												<h3 class="article-item-bottom-name">
													<a href="${classpath }/blog-detail/${blog.id}">${blog.title }</a>
												</h3>
												<p class="article-item-bottom-author">
													<i class="fa-regular fa-user"></i> ${blog.user.username }
												</p>

												<p class="article-item-bottom-desc">${blog.summary }</p>

												<a class="article-item-bottom-more" href=""> Đọc thêm <i
													class="fa-solid fa-chevron-right"></i>
												</a>
											</div>
										</article>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>

	</div>
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
</body>

<!-- JS -->
<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

<script>
	var sticky = $('.mainNav');
	scroll = $(window).scrollTop();

	sticky.addClass('unActiveNav');
</script>

</html>