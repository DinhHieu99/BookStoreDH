<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="nav-left-sidebar sidebar-dark">
    <div class="menu-list">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="d-xl-none d-lg-none" href="#">Bảng điều khiển</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarNav" aria-controls="navbarNav"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav flex-column">
                    <li class="nav-divider"><a class="nav-divider active" href="/admin">Trang quản trị</a></li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                           data-target="#submenu-3" aria-controls="submenu-3">
                            <i class="fa fa-fw fa-user-circle"></i>Tài khoản
                        </a>
                        <div id="submenu-3" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/data-table-user">Người dùng</a>
                                </li>

                                <c:if test="${admin.role == 'ADMIN'}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="/admin/data-table-employee">Nhân viên</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                           data-target="#submenu-4" aria-controls="submenu-4">
                            <i class="fab fa-fw fa-wpforms"></i>Thống kê & Kho hàng
                        </a>
                        <div id="submenu-4" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/data-table-warehouse">Kho hàng tồn</a></li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                                       data-target="#submenu-1-1" aria-controls="submenu-1-1">Thống kê
                                    </a>
                                    <div id="submenu-1-1" class="collapse submenu" style="">
                                        <ul class="nav flex-column">
                                            <li class="nav-item">
                                                <a class="nav-link" href="/admin/data-table-sales-statistics">Bán hàng</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="/admin/data-table-import-statistics">Nhập hàng</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                           data-target="#submenu-5" aria-controls="submenu-5">
                            <i class="fas fa-fw fa-table"></i>Quản lý
                        </a>
                        <div id="submenu-5" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                                       data-target="#submenu-1-3" aria-controls="submenu-1-3">Bảng dữ liệu
                                    </a>
                                    <div id="submenu-1-3" class="collapse submenu" style="">
                                        <ul class="nav flex-column">
                                            <li class="nav-item">
                                                <a class="nav-link" href="/admin/data-table-category">Danh mục thể loại
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="/admin/invoice">Danh sách đơn hàng</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="/admin/data-table-supplier">Nhà cung cấp</a>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                                                   data-target="#submenu-1-4" aria-controls="submenu-1-4">Sản phẩm
                                                </a>
                                                <div id="submenu-1-4" class="collapse submenu" style="">
                                                    <ul class="nav flex-column">
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/admin/add-new-product">Nhập hàng mới</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/admin/data-table-products">Quản lý sản phẩm</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="/admin/contacts">Phản hồi</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="/admin/post">Tin tức</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-divider">Features</li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                           data-target="#submenu-6" aria-controls="submenu-6">
                            <i class="fas fa-fw fa-file"></i> Các trang
                        </a>
                        <div id="submenu-6" class="collapse submenu" style="">
                            <ul class="nav flex-column">

                                <li class="nav-item">
                                    <a class="nav-link" href="pages/404-page.html">404 page</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/register">Tạo tài khoản</a>
                                </li>
                                <%--<li class="nav-item">
                                    <a class="nav-link" href="pages/forgot-password.html">Quên mật khẩu</a>
                                </li>--%>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>