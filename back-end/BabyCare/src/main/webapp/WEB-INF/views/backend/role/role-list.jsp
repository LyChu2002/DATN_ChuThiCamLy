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

					<div class="card card-default">
						<div class="card-header">
							<h2>Danh sách quyền</h2>
							<a href="${classpath }/admin/role-add" role="button"
								class="btn btn-primary"> <i class="mdi mdi-database-plus"></i>
								Thêm quyền
							</a>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form method="post" action="${classpath }/admin/role-delete">
									<input type="submit" value="Xóa" class="btn btn-danger"
										style="margin-bottom: 10px"
										onclick="return confirm ('Bạn có chắc chắn xóa?')" />
									<table
										class="table table-hover table-striped table-bordered no-wrap ">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkBoxAll"></th>
												<th scope="col">No.</th>
												<th scope="col">Tên</th>
												<th scope="col">Mô tả</th>
												<th scope="col">Ngày tạo</th>
												<th scope="col">Ngày cập nhật</th>
												<th scope="col">Trạng thái</th>
												<th scope="col">Tác vụ</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="role" items="${roles }" varStatus="loop">
												<tr>
													<td><input type="checkbox" class="checkBoxRoleId"
														name="roleId" value="${role.id }" /></td>
													<td>${loop.index + 1 }</td>
													<td>${role.name }</td>													
													<td>${role.description }</td>
													<td><fmt:formatDate value="${role.createDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><fmt:formatDate value="${role.updateDate }"
															pattern="dd-MM-yyyy" /></td>
													<td><c:choose>
															<c:when test="${role.status }">
																<span>Hoạt động</span>
															</c:when>
															<c:otherwise>
																<span>Không hoạt động</span>
															</c:otherwise>
														</c:choose></td>
													<td><a
														href="${classpath }/admin/role-update/${role.id }"
														role="button" class="btn btn-success">Sửa</a> <a
														href="${classpath }/admin/role-delete/${role.id }"
														role="button" class="btn btn-danger">Xóa</a></td>

												</tr>
											</c:forEach>

										</tbody>
									</table>
								</form>
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#checkBoxAll').click(function() {
			if ($(this).is(":checked")) {
				$('.checkBoxRoleId').prop('checked', true);
			} else {
				$('.checkBoxRoleId').prop('checked', false);
			}
		})
	})
</script>

</html>