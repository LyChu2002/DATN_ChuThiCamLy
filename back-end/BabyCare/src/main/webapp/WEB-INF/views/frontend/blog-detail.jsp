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
<link rel="stylesheet"
	href="${classpath }/frontend/assets/css/blog-detail.css">
<title>Chi tiết bài viết</title>
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
						<li class="breadcrum-item"><a href="${classpath }/index">Trang
								chủ</a></li>
						<li class="breadcrum-item active"><a
							href="${classpath }/blog">Blog chia sẻ</a></li>
					</ol>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-9">
						<div class="articleMain">
							<div class="articleBody">
								<h1 class="article-name">${blog.title }</h1>
								<p class="article-info">
									Tác giả: ${blog.user.username } </br> Ngày đăng:
									<fmt:formatDate value="${blog.createDate }"
										pattern="dd-MM-yyyy" />
									&nbsp; &nbsp; Ngày cập nhật:
									<fmt:formatDate value="${blog.updateDate }"
										pattern="dd-MM-yyyy" />
								</p>
								<em class="article-desc"> ${blog.summary } </em>
								<p class="article-detail">${blog.detail }</p>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-3">
						<div class="sub-blog">
							<div class="sub-blog-title">Bài viết mới nhất</div>
							<div class="sub-blog-content">
								<c:forEach var="newBlog" items="${newBlogs }">
									<div class="article-mini-item">
										<div class="row">
											<div class="article-mini-item-img">
												<a href="${classpath }/blog-detail/${newBlog.id}"> <img
													src="${classpath }/FileUpload/${newBlog.avatar}" alt="">
												</a>
											</div>
											<div class="article-mini-item-info">
												<div class="article-mini-item-title">
													<a href="${classpath }/blog-detail/${newBlog.id}">${newBlog.title }</a>
												</div>
												<div class="article-mini-item-desc">
													<em> <fmt:formatDate value="${newBlog.createDate }"
															pattern="dd-MM-yyyy" />
													</em>
												</div>
											</div>
										</div>

									</div>
								</c:forEach>
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