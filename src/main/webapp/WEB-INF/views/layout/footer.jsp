<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="footer row">
    <div class="footer-left col-md-5 col-12">

        <div class="footer-content">
            <div class="logo-footer ">
                <a href="# ">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt=" " width="100px " height="auto " />
                </a>
            </div>
            <ul class="navbar-nav ">
                <li>Trường đại học Công nghiệp Hà Nội</li>
                <li>Điện thoại: <a href="tel:0123456789 " style="color: black; text-decoration: none;">0123 456 789</a></li>
                <li>Website:
                    <a href="# "></a>
                </li>

                <li>Email: <a href="/contact" style="color: black; text-decoration: none;">BookstoreDinhHieu@gmail.com</a>
                </li>
            </ul>
            <div class="navbar-brand ">
                <ul class="menu-icons ">
                    <li class="facebook ">
                        <a href="https://www.facebook.com/FacebookVietnam/ " target="_blank "><i
                                class="fa fa-facebook "></i></a>
                    </li>
                    <li class="twitter ">
                        <a href="# " target="_blank "><i class="fa fa-twitter "></i></a>
                    </li>
                    <li class="youtube ">
                        <a href="# " target="_blank "><i class="fa fa-youtube "></i></a>
                    </li>
                    <li class="instagram ">
                        <a href="# " target="_blank "><i class="fa fa-instagram "></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-right col-md-5 col-12">
        <h4 class="footer-title">
            <a>Thông tin </a>
        </h4>
        <div class="navbar-brand">
            <ul class="menu">
                <li class="li_menu">
                    <a href="# ">
                        Về chúng tôi </a>
                </li>
                <li class="li_menu">
                    <a href="# ">
                        Chính sách bảo mật </a>
                </li>
                <li class="li_menu">
                    <a href="# ">
                        Quy định sử dụng </a>
                </li>
                <li class="li_menu">
                    <a href="# ">
                        Thông tin giao hàng </a>
                </li>
                <li class="li_menu">
                    <a href="/contact">
                        Liên hệ </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <h3>Nhận bản tin</h3>
        <div class="footer-title">
                <span>Đăng ký email để nhanh chóng nhận được các thông báo về khuyến mại, chương trình giảm giá của
                        chúng tôi</span>
        </div>
        <div>
            <input type="email" name="email" placeholder="Nhập email tại đây">
            <button title="Đăng ký">Đăng ký</button>
        </div>
    </div>
</div>