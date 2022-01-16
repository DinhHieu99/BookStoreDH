<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>


</style>
<!-- Menu mobile -->
<div id="mySidenav" class="navbar navbar-expand-sm container" onmouseleave="hienThi('collapsibleNavbar','none');">
    <div class="row">
        <div class="head_mob_menu col-2">
            <img src="${pageContext.request.contextPath}/img/icon-home.png" width="30px"
                 onclick="hienThi('collapsibleNavbar','block');">
        </div>
        <div class="header_mob col-7">
            <div class="logo">
                <a href="/">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"/>
                </a>
            </div>
        </div>
        <div class="mob_shop_cart col-3">
            <a class="showcart" href="/cart" title="Giỏ hàng">
                <i class="fa fa-shopping-cart"></i>
                <span class="cart-value" style="top:-20px">
                    <c:choose>
                        <c:when test="${soLuongHang > 0}">
                            <c:out value="${soLuongHang}"/>
                        </c:when>
                        <c:otherwise>0</c:otherwise>
                    </c:choose></span>
                <!-- <span class="text">Giỏ hàng</span>-->
                </span>
            </a>
        </div>
    </div>
    <div class="navbar-brand" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item logoMobile">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="Đình Hiếu" width="100px" height="40px"
                     style="padding: 5px;"/>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/gioi-thieu">Giới thiệu</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown">
                    Sản phẩm
                </a>
                <div class="dropdown-menu">
                    <c:forEach var="category" items="${category}">
                        <a class="dropdown-item" href="/category/${category.id}-${category.url}">${category.name}</a>
                    </c:forEach>

                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/post">Tin tức</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contact">Liên hệ</a>
            </li>
            <%
                if (session.getAttribute("emailUser") == null) {
            %>
            <li class="nav-item">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Tài khoản&nbsp;</a>
                <div class="dropdown-menu" id="account_mob">
                    <a class="dropdown-item" href="/ordered">Đơn hàng</a>
                    <a class=" dropdown-item" href="/user/login">Đăng nhập</a>
                    <a class="dropdown-item" href="/account/register">Đăng ký</a>
                </div>
            </li>
            <%
            } else {
            %>
            <li class="nav-item">
                <a class="nav-link dropdown-toggle" href="#"
                   data-toggle="dropdown"><%=session.getAttribute("nameUser")%>&nbsp;</a>
                <div class="dropdown-menu" style="margin: 5px; margin-left: -10px">
                    <a class=" dropdown-item" href="/account_information/user<%=session.getAttribute("idUser")%>">Thông tin
                        tài khoản</a>
                    <a class="dropdown-item" href="/ordered">Đơn hàng</a>
                    <a class="dropdown-item" href="/user/logout">Đăng xuất</a>
                </div>
            </li>
            <%
                }
            %>
        </ul>
    </div>

</div>
<!-- End -->

<header class="header">
    <div class="header__top hidden-xs">
        <div class="bg-banner"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 ">
                    <div class="welcome">
                        <i class="fas fa-globe-americas"></i> Chào mừng bạn đến với trang web
                    </div>
                </div>
                <div class="col-md-2 right" onmouseenter="hienThi('TaiKhoan','block');"
                     onmouseleave="hienThi('TaiKhoan','none');">
                    <%
                        if (session.getAttribute("emailUser") == null) {
                    %>
                    <div class="account">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">Tài
                            khoản&nbsp;</a>
                    </div>
                    <div class="menu_lv2" id='TaiKhoan'>
                        <a class="dropdown-item" href="/ordered">Đơn hàng</a>
                        <a class=" dropdown-item" href="/user/login">Đăng nhập</a>
                        <a class="dropdown-item" href="/account/register">Đăng ký</a>
                        <%
                        } else {
                        %>
                        <div class="account">
                            <a class="dropdown-toggle" href="#"
                             data-toggle="dropdown"><%=session.getAttribute("nameUser")%>

                            </a>
                        </div>
                        <div class="menu_lv2" id='TaiKhoan'>
                            <a class=" dropdown-item"
                               href="/account_information/user<%=session.getAttribute("idUser")%>">Thông
                                tin tài khoản</a>
                            <a class="dropdown-item" href="/ordered">Đơn hàng</a>
                            <a class="dropdown-item" href="/user/logout">Đăng xuất</a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-main">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="logo">
                        <a href="/">
                            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo "/>
                        </a>
                    </div>
                </div>
                <div class="col-md-7" id="search">
                    <nav class="navbar navbar-expand-sm ">
                        <form class="form-inline" action="/products/search">
                            <input type="text" name="search_query" id="searchProduct"
                                   placeholder="Tìm kiếm sách" class="search-text" autocomplete="off">
                            <span class="input-group-btn ">
								<button class="btn icon-fallback-text ">
									<i class="fa fa-search "></i>
								</button>
							</span>
                        </form>
                    </nav>
                </div>
                <div class="autocomplete-suggestions" id="resultLivingSearch" style="border:0; max-height: 300px">

                </div>
                <div class="col-sm-2 right " id="cart">
                    <div class="col-md-12 ">
                        <a class="showcart" href="/cart" title="Giỏ hàng">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="cart-value ">
                                <c:choose>
                                    <c:when test="${soLuongHang > 0}">
                                        <c:out value="${soLuongHang}"/>
                                    </c:when>
                                    <c:otherwise>0</c:otherwise>
                                </c:choose>
                            </span>
                            <span class="text">Giỏ hàng</span>
                            </span>
                        </a>

                    </div>
                    <div class="top-cart">
                        <ul id="cart-sidebar" >
                            <c:choose>
                                <c:when test="${soLuongHang>0}">
                                    <ul class="list-item-cart" style="display: block">
                                        <c:forEach var="cart" items="${sessionScope.cart}">
                                            <li class="item productid-${cart.id}">
                                                <div class="border_list">
                                                    <a class="product-image"
                                                       href="/product/${cart.id}-${cart.name}"
                                                       title="${cart.name}">
                                                        <img alt="${cart.name}"
                                                             src="${pageContext.request.contextPath}/img/${cart.img}"
                                                             width="100" height="130px">
                                                    </a>
                                                    <div class="detail-item ">
                                                        <div class="product-details">
                                                            <p class="product-name">
                                                                <a class="text2line" style="margin-right: 10px;padding-right: 0; text-align: justify;"
                                                                   href="/product/${cart.id}-${cart.name}">${cart.name}</a>
                                                            </p>
                                                        </div>
                                                        <div class="product-bottom">
                                                            <span class="price"><fmt:formatNumber value="${cart.discount}"/> đ</span>
                                                            <div class="quantity">x ${cart.quantity}</div>
                                                            <a href="javascript:void(0)" title="Xóa" onclick="removeCart(${cart.id})"
                                                               class="remove-item-cart fa fa-times">&nbsp;</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>

                                    <div class="pd">
                                        <div class="top-subtotal">Thành tiền: <span class="price"><fmt:formatNumber value="${ThanhTien}"/>đ</span>
                                        </div>
                                        <div class="top-subtotal">Tổng số: <span class="price"><fmt:formatNumber value="${ThanhTien}"/>đ</span>
                                        </div>
                                    </div>
                                    <div class="pd right_ct">
                                        <a href="/cart" class="btn btn-primary"><span>Giỏ hàng</span></a>
                                        <a href="/pay" class="btn btn-white"><span>Thanh toán</span></a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="no-item" style="height: 40px;">
                                        <p style="margin: 0; line-height: 40px">Giỏ hàng trống của
                                            bạn trống!</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar navbar-expand-sm" id="menu_header">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link " href="/">Trang chủ</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="/gioi-thieu">Giới thiệu</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu">
                                    <c:forEach var="category" items="${category}">
                                        <a class="dropdown-item"
                                           href="/category/${category.id}-${category.url}">${category.name}</a>
                                    </c:forEach>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="/post">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="/contact">Liên hệ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
