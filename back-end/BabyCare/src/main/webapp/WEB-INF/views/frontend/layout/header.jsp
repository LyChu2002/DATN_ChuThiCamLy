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
                        	<c:forEach var="category" items="${categories }" varStatus="loop">
                        		<li>
                                <a href="">
                                    <span>
                                        <img src="${classpath }/frontend/assets/images/logo/logo_category/baby (1).png">
                                        <span>${category.name }</span>
                                    </span>
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <div class="subMenuTwo">
                                    <a href="">${category.name }</a>
                                    <ul>
                                    	<c:forEach var="typeProduct" items="${category.typeProducts }" varStatus="loop">
                                    		<c:if test="${typeProduct.status }">
                                    			<li>
		                                            <a href="">
		                                                ${typeProduct.name }
		                                            </a>
	                                       		 </li>
                                    		</c:if> 		 
                                    	</c:forEach>
                                    </ul>
                                </div>
                            </li>
                        	</c:forEach>
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