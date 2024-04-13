<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">
        <div class="headerMenuTop">
            <div class="container">
            <div class="headerMain">
                <div class="headerLeft">
                    <div class="headerLogo">
                        <a href="./index.html">
                            <img src="${classpath }/frontend/assets/images/logo/logo.png" alt="" class="img-fluid">
                        </a>
                    </div>
                </div>
                <div class="headerCenter">
                    <div class="headerSearch">
                        <form action="/search">
                            <div class="headerSearchMain">
                                <input required="" name="q" maxlength="40" autocomplete="off" class="headerSearchInput searchinput input-search search-input" type="text" size="20" placeholder="Ba mẹ muốn tìm gì cho bé?" aria-label="Search">
                            </div>
                            <button type="submit" class="btn-search btn headerSearchButton" aria-label="Tìm kiếm">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="headerRight">
                    <div class="headerUser">
                        <a href="">Đăng nhập</a>
                        <span>/</span>
                        <a href="">Đăng ký</a>
                    </div>
                    <div class="headerLikeList headerTool">
                        <a href="">
                            <i class="fa-regular fa-heart"></i>
                            <span class="span-count">1</span>
                        </a>
                    </div>
                    <div class="headerCart headerTool">
                        <a href="">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span class="span-count">1</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        
        <div class="headerMenu">
            <div class="container">
                <div class="headerMenuLeft">
                    <i class="fa-solid fa-bars"></i>
                    Danh mục sản phẩm
                    <nav class="mainNav">
                        <ul class="menuCategory">
                            <li>
                                <a href="">
                                    <span>
                                        <img src="${classpath }/frontend/assets/images/logo/logo_category/baby (1).png">
                                        <span>Combo Đồ Sơ Sinh</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Combo đồ sơ sinh</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Bình sữa sơ sinh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <span>
                                        <img src="../assets/images/logo/logo_category/machine-learning.png">
                                        <span>Máy móc thiết yếu</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Máy móc thiết yếu</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Máy hút sữa
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Máy hâm sữa
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Máy làm ấm khăn
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Máy pha sữa
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <span>
                                        <img src="../assets/images/logo/logo_category/milk-bottle.png">
                                        <span>Sữa & bình sữa</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Combo đồ sơ sinh</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Bình sữa sơ sinh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <span>
                                        <img src="../assets/images/logo/logo_category/baby-feeding.png">
                                        <span>Ăn dặm</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Combo đồ sơ sinh</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Bình sữa sơ sinh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <span>
                                        <img src="../assets/images/logo/logo_category/diaper.png">
                                        <span>Bỉm tã - Vệ sinh</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Combo đồ sơ sinh</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Bình sữa sơ sinh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <span>
                                        <img src="../assets/images/logo/logo_category/products.png">
                                        <span>Hóa mỹ phẩm</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Combo đồ sơ sinh</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Bình sữa sơ sinh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <span>
                                        <img src="../assets/images/logo/logo_category/toys.png">
                                        <span>Đồ chơi học tập</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Combo đồ sơ sinh</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Bình sữa sơ sinh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <span>
                                        <img src="../assets/images/logo/logo_category/cleaning.png">
                                        <span>Đồ dùng gia đình</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">Combo đồ sơ sinh</a>
                                    <ul>
                                        <li>
                                            <a href="">
                                                Bình sữa sơ sinh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                Sữa bột
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="headerMenuRight">
                    <div class="headerMenuRightNav">
                        <a href="">
                            <span>
                                <i class="fa-solid fa-house"></i>
                            </span>
                            Trang chủ
                        </a>
                        <a href="">
                            <span>
                                <i class="fa-solid fa-circle-info"></i>
                            </span>
                            
                            Giới thiệu thương hiệu
                        </a>
                        <a href="">
                            <span>
                               <i class="fa-solid fa-blog"></i> 
                            </span>
                            
                            Blog chia sẻ
                        </a>
                        <a href="">
                            <span>
                               <i class="fa-solid fa-address-book"></i> 
                            </span>
                            
                            Liên hệ
                        </a>
                        <a href="">
                            <span>
                                  <i class="fa-solid fa-phone-volume"></i>
                            </span>
                          
                            Hotline: 1900.0388
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>