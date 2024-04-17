<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<footer id="footer">
        <div class="container">
            <div class="footer-wrap">
                <div class="footer-wrap-item">
                    <h4>Thông tin liên hệ</h4>
                    <div class="footer-wrap-item-content">
                        <div class="footer-wrap-item-content-logo">
                            <a href="">
                                <img src="../assets/images/logo/logo.png" alt="">
                            </a>
                        </div>
                        <div class="footer-wrap-item-content-info">
                            CÔNG TY TNHH BABYCARE - 296 Cầu Diễn, Phường Minh Khai, Quận Bắc Từ Liêm, Thành phố Hà Nội,
                            Việt Nam
                        </div>
                    </div>
                </div>
                <div class="footer-wrap-item">
                    <h4>Sản phẩm</h4>
                    <div class="footer-wrap-item-content">
                        <ul>
                        	<c:forEach var="category" items="${categories }">
                        		<li>
	                                <a href="">${category.name }</a>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="footer-wrap-item">
                    <h4>Chính sách</h4>
                    <div class="footer-wrap-item-content">
                        <ul>
                            <li>
                                <a href="">Chính sách thanh toán</a>
                            </li>
                            <li>
                                <a href="">Chính sách đổi trả</a>
                            </li>
                            <li>
                                <a href="">Chính sách bảo mật</a>
                            </li>
                            <li>
                                <a href="">Điều khoản sử dụng</a>
                            </li>
                        </ul>
                       
                    </div>
                </div>
                <div class="footer-wrap-item">
                    <h4>Hệ thống cửa hàng</h4>
                    <div class="footer-wrap-item-content">
                        <ul>
                            <li>
                                <a href="">
                                    <i class="fa-solid fa-location-dot"></i>
                                    Cơ sở 1: BabyCare 296 Cầu Diễn, Quận Bắc Từ Liêm, Thành phố Hà Nội
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-solid fa-location-dot"></i>
                                    Cơ sở 1: BabyCare 296 Cầu Diễn, Quận Bắc Từ Liêm, Thành phố Hà Nội
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-solid fa-location-dot"></i>
                                    Cơ sở 1: BabyCare 296 Cầu Diễn, Quận Bắc Từ Liêm, Thành phố Hà Nội
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-solid fa-location-dot"></i>
                                    Cơ sở 1: BabyCare 296 Cầu Diễn, Quận Bắc Từ Liêm, Thành phố Hà Nội
                                </a>
                            </li>
                        </ul>
                        <div>
                            <form action="">
                                <input type="email" placeholder="Địa chỉ email..." class="form-control">
                                <button type="submit">Đăng ký</button>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>