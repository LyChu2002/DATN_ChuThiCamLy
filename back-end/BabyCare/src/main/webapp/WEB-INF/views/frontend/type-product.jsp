<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Variable -->
	<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
	<!-- CSS -->
	<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <title>Danh mục sản phẩm</title>
</head>
<body>
    <!--Header-->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    
    <!--Main-layout-->
    <div class="main-layout">
        <div id="collection">
            <div class="breadcrum-shop">
                <div class="breadcrum-container container container-xl">
                    <ol class="breadcrum">
                        <li class="breadcrum-item">
                            <a href="">Trang chủ</a>
                        </li>
                        <li class="breadcrum-item active">
                            <a href="">Bỉm tã-Vệ sinh</a>
                        </li>
                    </ol>
                </div>
            </div>
            <div class="collection-wrapper">
                <div class="container">
                    <div class="collection-wrapper-main">
                        <div class="collection-wrapper-banner">
                            <img src="../assets/images/banner/20240403-dai-hoi-an-dam-1170-150.jpg" style="width: 100%;" alt="">
                        </div>
                        <div class="collection-wrapper-main-item">
                            <div class="row">
                                <div class="col-12 col-md-4 col-lg-3">
                                    <div class="collection-filter">
                                        <div class="cFilter">
                                            <div class="cFilter-block active cFilter-category">
                                                <h4>
                                                    Danh mục
                                                    <i class="fa-solid fa-chevron-down"></i>
                                                </h4>
                                                <ul class="cFilter-block-list menucate-list">
                                                    <li>
                                                        <a href="">Combo Đồ sơ sinh</a>
                                                    </li>
                                                    <li>
                                                        <a href="">Bình sữa</a>
                                                    </li>
                                                    <li>
                                                        <a href="">Đồ chơi - Học tập</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="cFilter-block">
                                                <h4>
                                                    Thương hiệu
                                                    <i class="fa-solid fa-chevron-down"></i>
                                                    
                                                </h4>
                                                <ul class="cFilter-block-list">
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-1" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-1">A2</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="Abott Grow" name="vendorFilter" id="data-brand-2" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-2">Abott Grow</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="Đà lạt milk" name="vendorFilter" id="data-brand-3" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-3">Đà lạt milk</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-4" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-4">A2</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-5" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-5">A2</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-6" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-6">A2</label>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="cFilter-block">
                                                <h4>
                                                    Phù hợp với bé
                                                    <i class="fa-solid fa-chevron-down"></i>
                                                </h4>
                                                <ul class="cFilter-block-list">
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-1" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-1">A2</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="Abott Grow" name="vendorFilter" id="data-brand-2" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-2">Abott Grow</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="Đà lạt milk" name="vendorFilter" id="data-brand-3" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-3">Đà lạt milk</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-4" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-4">A2</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-5" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-5">A2</label>
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" value="A2" name="vendorFilter" id="data-brand-6" class="cFilter-block-list-checkbox">
                                                        <label for="data-brand-6">A2</label>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-8 col-lg-9">
                                    <div class="collection-wrapper-main-item-header">
                                        <div class="d-flex justify-content-between flex-wrap align-items-center">
                                            <h1 class="title">Sữa bột</h1>
                                            <div class="cFilter-block sortby-custom">
                                                <h4>
                                                    Sắp xếp
                                                    <i class="fa-solid fa-chevron-down"></i>
                                                </h4>
                                                <ul class="cFilter-block-list" id="sort-by">
                                                    <li>
                                                        <input type="radio" id="data-sort-p0" class="cFilter-block-list-radio" name="sortFilter">
                                                        <label for="data-sort-p0">Mặc định</label>
                                                    </li>
                                                    <li>
                                                        <input type="radio" id="data-sort-p1" class="cFilter-block-list-radio" name="sortFilter">
                                                        <label for="data-sort-p1">Giá tăng dần</label>
                                                    </li>
                                                    <li>
                                                        <input type="radio" id="data-sort-p2" class="cFilter-block-list-radio" name="sortFilter">
                                                        <label for="data-sort-p2">Giá giảm dần</label>
                                                    </li>
                                                    <li>
                                                        <input type="radio" id="data-sort-p3" class="cFilter-block-list-radio" name="sortFilter">
                                                        <label for="data-sort-p3">Bán chạy nhất</label>
                                                    </li>
                                                  
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="collection-wrapper-main-item-body">
                                        <div class="collection-wrapper-main-item-body-product">
                                            <div class="row">
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="proLoop col-lg-3 col-md-3 col-sm-6">
                                                    <div class="proWrap">
                                                        <div class="product-img">
                                                            <div class="product-tag-new">
                                                                <img src="../assets/images/tag/tag_new.webp" alt="Tag new">
                                                            </div>
                                                            <a href="" class="product-img-link">
                                                                <img src="../assets/images/product/choang-be-bang-long-minizone-gau-trang.jpg" alt="">
                                                            </a>
                                                            <div class="productAction">
                                                                <a href="">
                                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                                </a>
                                                                <a href="">
                                                                    <i class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name">
                                                                <a href="">
                                                                    Sữa Nan Optipro Plus 5-HMO số 1 800g (0-6M) ơabdfdgfgfh
                                                                </a>
                                                            </h3>
                                                             <p class="product-price">
                                                                525,000đ <span class="item-price-unit">đ</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
<script>
    $(document).ready(function (){
        $('.cFilter-block h4').click(function(){
           $(this).parent().toggleClass('active');
           $(this).parent().children('.cFilter-block-list').slideToggle();

        })
    })
   
</script>
</html>