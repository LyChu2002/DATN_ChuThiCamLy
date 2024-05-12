<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
					<form action="${classpath }/admin/vendor-list" method="get">
						<div class="card card-default">
							<div class="card-header">
								<div class="row1">
									<h2>Danh sách nhà cung cấp</h2>
								</div>
								<div class="row1">
									<input type="submit" value="Xóa" name="deleteVendor"
										class="btn btn-danger"
										onclick="return confirm ('Bạn có chắc chắn xóa?')" /> <a
										href="${classpath }/admin/vendor-add" role="button"
										class="btn btn-primary"> <i class="mdi mdi-database-plus"></i>
										Thêm
									</a>
								</div>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-4">
										<input type="hidden" id="page" name="page"
											class="form-control" value="${vendorSearch.currentPage }" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<div class="form-group mb-4">
											<label for="status">Trạng thái</label>
											<select class="form-control" id="status" name="status">
												<option value="2">Tất cả</option>
												<option value="1">Hoạt động</option>
												<option value="0">Không hoạt động</option>
											</select>
										</div>
									</div>
									<div class="col-md-3">
										<label for="status">Nhập tên</label>
										<input class="form-control" type="text" id="keyword"
											name="keyword" placeholder="Tìm kiếm" />
									</div>
									<div class="col-md-2">
										<label></label>
										<button type="submit" id="btnSearch" name="btnSearch"
											class="btn-searching">Tìm kiếm</button>
									</div>
								</div>

								<div class="table-responsive">
									<table
										class="table table-hover table-striped table-bordered no-wrap ">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkBoxAll"></th>
												<th scope="col">No.</th>
												<th scope="col">Code</th>
												<th scope="col">Hình ảnh</th>
												<th scope="col">Tên</th>
												<th scope="col">Ngày tạo</th>
												<th scope="col">Ngày cập nhật</th>
												<th scope="col">Trạng thái</th>
												<th scope="col">Tác vụ</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="vendor" items="${vendors }" varStatus="loop">
												<tr>
													<td><input type="checkbox" class="checkBoxItem"
														name="vendorId" value="${vendor.id }" /></td>
													<td>${loop.index + 1 }</td>
													<td>${vendor.code }</td>
													<td><img width="60px" height="60px" class="light-logo"
														src="${classpath }/FileUpload/${vendor.image }">
													<td>${vendor.name }</td>
													<td><fmt:formatDate value="${vendor.createDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><fmt:formatDate value="${vendor.updateDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><c:choose>
															<c:when test="${vendor.status }">
																<span>Hoạt động</span>
															</c:when>
															<c:otherwise>
																<span>Không hoạt động</span>
															</c:otherwise>
														</c:choose></td>
													<td><a
														href="${classpath }/admin/vendor-update/${vendor.id }"
														role="button" class="btn btn-success"
														title="Cập nhật nhà cung cấp"><i
															class="fa-solid fa-pen-to-square"></i></a> <a
														href="${classpath }/admin/vendor-delete/${vendor.id }"
														role="button" class="btn btn-danger"
														title="Xóa nhà cung cấp"><i class="fa-solid fa-trash"></i></a>
													</td>

												</tr>
											</c:forEach>

										</tbody>
									</table>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4"></div>
										</div>

										<div class="col-md-6">
											<div class="pagination float-right">
												<div id="paging"></div>
											</div>
										</div>
									</div>
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
	<!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			$("#status").val(${vendorSearch.status});
			$("#keyword").val("${vendorSearch.keyword}");
			
			$("#paging").pagination({
				currentPage: ${vendorSearch.currentPage}, 
				items: ${vendorSearch.totalItems}, 
				itemsOnPage: ${vendorSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
	</body>
</html>