<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            <h2>Cập nhật tài khoản</h2>
                        </div>
                        <div class="card-body">
                        <c:if test="${not empty messageResponse }">
                        	<div class="alert alert-${alert }" style="width: 30%">
                        		${messageResponse }
                        	</div>
                        </c:if>
                            <sf:form class="form" action="${classpath }/admin/user-update-save" method="post" modelAttribute="user" enctype="multipart/form-data">
                                <sf:hidden path="id"/>
                                <div class="form-body">
                                	<div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="username">Username</label>
                                                <sf:input id="username" path="username" type="text" class="form-control" placeholder="Tên tài khoản"></sf:input>  
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="password">Password</label>
                                                <sf:input id="password" path="password" type="text" class="form-control" placeholder="Mật khẩu"></sf:input>
                                              
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="email">Email</label>
                                                <sf:input id="email" path="email" type="text" class="form-control" placeholder="Email" required="required" oninvalid="this.setCustomValidity('Please Enter valid email')" oninput="setCustomValidity('')"></sf:input>  
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="mobile">Điện thoại</label>
                                                <sf:input id="mobile" path="mobile" type="text" class="form-control" placeholder="Điện thoại"></sf:input>
                                              
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">         
                                        <div class="col-md-12">
                                            <div class="form-group mb-4">
                                                <label for="address">Địa chỉ</label>
                                                <sf:textarea id="address" path="address" rows="4" class="form-control" placeholder="Địa chỉ..."></sf:textarea>
                                              
                                            </div>
                                        </div>
                                    </div>
	
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="createDate">Ngày tạo</label>
                                                <sf:input id="createDate" path="createDate" type="date" class="form-control"></sf:input>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="updateDate">Ngày cập nhật</label>
                                                <sf:input id="updateDate" path="updateDate" type="date" class="form-control"></sf:input>
                                            </div>
                                        </div>
                                    </div>
                                    
                                     <div class="row">         
                                        <div class="col-md-12">
                                            <div class="form-group mb-4">
                                                <label for="">Chọn quyền</label></br>
                                                <c:forEach var="role" items="${roles }">
                                                	<input type="checkbox" name="role" value="${role.id }" id="${role.id }">
                                                	<label for="${role.id }">${role.name }</label>&nbsp;&nbsp;&nbsp;
                                                </c:forEach>
                                              
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-4">
                                                <label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                <sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
                                                <label>&nbsp;</label>
                                                <label for="status">Hoạt động</label>		
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-4">
                                               <a href="${classpath }/admin/user-list" class="btn btn-light active" role="button">Về danh sách</a>
                                               <button type="submit" class="btn btn-primary">Lưu tài khoản</button>
                                            </div>
                                        </div>
                                        
                                    </div>

                                    
                                </div>
                            </sf:form>
                           
                        </div>
                        
                    </div>
                </div>

            </div>

            <!-- Footer -->
            <footer class="footer mt-auto">
               
            </footer>

        </div>
    </div>

  	<!-- JS -->
   	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

</body>


</html>