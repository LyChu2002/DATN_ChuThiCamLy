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
   	<script src="${classpath }/libraries/ckeditor/ckeditor.js"></script>
   	 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
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
                            <h2>Thêm sản phẩm</h2>
                        </div>
                        <div class="card-body">
                        <c:if test="${not empty messageResponse }">
                        	<div class="alert alert-${alert }" style="width: 30%">
                        		${messageResponse }
                        	</div>
                        </c:if>
                            <sf:form class="form" action="${classpath }/admin/product-add-save" method="post" modelAttribute="product" enctype="multipart/form-data">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="code">Code</label>
                                                <sf:input id="code" path="code" type="text" class="form-control" placeholder="Mã sản phẩm" required="required" oninvalid="this.setCustomValidity('Nhập mã sản phẩm')" oninput="setCustomValidity('')"></sf:input>
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="name">Tên sản phẩm</label>
                                                <sf:input id="name" path="name" type="text" class="form-control" placeholder="Tên sản phẩm" required="required" oninvalid="this.setCustomValidity('Nhập tên sản phẩm')" oninput="setCustomValidity('')"></sf:input>
                                              
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="warehouseQuantity">Số lượng kho</label>
                                                <sf:input id="warehouseQuantity" path="warehouseQuantity" type="number" class="form-control" placeholder="Số lượng sản phẩm"></sf:input>
                                              
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="vendor">Nhà sản xuất</label>
                                                <sf:select path="vendor.id" class="form-control" id="vendor">
                                                	<sf:options itemValue="id" items="${vendors }" itemLabel="name" class="form-control"></sf:options>
                                                </sf:select>
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                             <div class="form-group mb-4">
                                                <label for="typeProduct">Loại sản phẩm</label>
                                                <sf:select path="typeProduct.id" class="form-control" id="typeProduct">
                                                	<sf:options itemValue="id" items="${typeProducts }" itemLabel="name" class="form-control"></sf:options>
                                                </sf:select>
                                                
                                            </div>
                                        </div>
                                         <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="weight">Trọng lượng</label>
                                                <sf:input id="weight" path="weight" type="text" class="form-control" placeholder=""></sf:input>
                                              
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="importPrice">Giá nhập</label>
                                                <sf:input id="importPrice" path="importPrice" type="text" class="form-control" placeholder="" ></sf:input>
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="voucher">Voucher</label>
                                                <sf:input name="voucher" id="voucher" path="voucher" type="text" class="form-control" placeholder=""></sf:input>
                                              
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="sellPrice">Giá bán</label>
                                                <sf:input id="sellPrice" path="sellPrice" type="text" class="form-control" placeholder=""></sf:input>
                                              
                                            </div>
                                        </div>
                                    </div>
                                    
                                     <div class="row">
										<div class="col-md-12">
											<div class="form-group mb-4">
												<label for="spec">Thông số sản phẩm</label>
												<sf:textarea id="spec" path="spec" rows="3"
													class="form-control" placeholder="Thông số sản phẩm..."></sf:textarea>

											</div>
										</div>
									</div>
                                    
                                    <div class="row">
										<div class="col-md-12">
											<div class="form-group mb-4">
												<label for="detailDescription">Mô tả sản phẩm</label>
												<sf:textarea id="detailDescription" path="detailDescription" rows="4"
													class="form-control" placeholder="Mô tả sản phẩm..."></sf:textarea>

											</div>
										</div>
										
									</div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="createDate">Ngày tạo</label>
                                                <sf:input id="createDate" path="createDate" type="date" class="form-control" placeholder="Mã danh mục"></sf:input>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-4">
                                                <label for="updateDate">Ngày cập nhật</label>
                                                <sf:input id="updateDate" path="updateDate" type="date" class="form-control" placeholder="Tên danh mục"></sf:input>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                    	<div class="col-md-8">
                                    		<div class="row">
                                    			<div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                <sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
                                                <label>&nbsp;</label>
                                                <label for="status">Hoạt động</label>		
                                            </div>
                                        </div>
                                         <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="isNew">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                <sf:checkbox path="isNew" class="form-check-input" id="isNew" name="isNew"></sf:checkbox>
                                                <label>&nbsp;</label>
                                                <label for="status">Sản phẩm mới</label>		
                                            </div>
                                        </div>
                                         <div class="col-md-4">
                                            <div class="form-group mb-4">
                                                <label for="isHot">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                <sf:checkbox path="isHot" class="form-check-input" id="isHot" name="isHot"></sf:checkbox>
                                                <label>&nbsp;</label>
                                                <label for="status">Sản phẩm hot</label>		
                                            </div>
                                        </div>
                                    		</div>
                                    	</div>
                                    	<div class="col-md-4">
                                    		
                                    	</div>
                                        
                                        
                                    </div>
                                    
                                    <div class = "row">
                                   		<div class = "col-md-12">
                                   			<div class = "form-group mb-4">
                                   				<label for="avatarFile">Chọn avatar sản phẩm</label>
                                   				<input id="avatarFile" name="avatarFile" class="form-control-file" type="file" multiple="multiple">
                                   			</div>
                                   		</div> 	
                                    </div>
                                    
                                     <div class = "row">
                                   		<div class = "col-md-12">
                                   			<div class = "form-group mb-4">
                                   				<label for="imageFile">Chọn ảnh sản phẩm</label>
                                   				<input id="imageFile" name="imageFiles" class="form-control-file" type="file" multiple="multiple">
                                   			</div>
                                   		</div> 	
                                    </div>
                                    
                                    <div class = "row">
                                   		<div class = "col-md-12">
                                   			<div class = "form-group mb-4">
                                   				<label for="imageFile">Chọn ảnh sản phẩm</label>
                                   				<input id="imageFile" name="imageFiles" class="form-control-file" type="file" multiple="multiple">
                                   			</div>
                                   		</div> 	
                                    </div>
                                    
                                    <div class = "row">
                                   		<div class = "col-md-12">
                                   			<div class = "form-group mb-4">
                                   				<label for="imageFile">Chọn ảnh sản phẩm</label>
                                   				<input id="imageFile" name="imageFiles" class="form-control-file" type="file" multiple="multiple">
                                   			</div>
                                   		</div> 	
                                    </div>
                                    
                                    <div class = "row">
                                   		<div class = "col-md-12">
                                   			<div class = "form-group mb-4">
                                   				<label for="imageFile">Chọn ảnh sản phẩm</label>
                                   				<input id="imageFile" name="imageFiles" class="form-control-file" type="file" multiple="multiple">
                                   			</div>
                                   		</div> 	
                                    </div>
                                    

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-4">
                                               <a href="${classpath }/admin/product-list" class="btn btn-light active" role="button">Về danh sách</a>
                                               <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
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
   	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</body>
<script type="text/javascript">
	var editorDetail = "", editorSpec = "";
	$(document).ready(function(){
		//editorDetail = CKEDITOR.replace('detailDescription');
		editorSpec = CKEDITOR.replace('spec')
	})
</script>
<script>
    $(document).ready(function() {
        $('#detailDescription').summernote();
    });
  </script>

</html>